//
//  NetworkManager.swift
//  MyiOSApp
//
//  Created by Soufiane SALOUF on 06/08/20.
//  Copyright © 2020 Soufiane SALOUF. All rights reserved.
//

import Foundation

class NetworkManager {
    
    
    static let shared = NetworkManager(loader: Loader.shared)
    private let session: URLSession
    
    let loader : LoaderProtocol
    
    // Initialization
    
    private init(loader: LoaderProtocol) {
        self.session = URLSession(configuration: .default)
        self.loader = loader
    }
    
    private func performRequest(method: HTTPMethod, endpoint: APIProtocol, parameters: HTTPParameters?, includes: HTTPHeaders, body: [Any] = [] , showLoader: Bool, loaderTitle: String, completion: @escaping (Result<Data>) -> () ){
        do{
            if showLoader { loader.show( onView: nil, withTitle: loaderTitle) }
            let urlString = endpoint.baseURL.appendingPathComponent(endpoint.path).absoluteString.removingPercentEncoding ?? ""
            var contains: HTTPParameters = [:]
//            if method != .get {
                contains = parameters ?? [:]
//            }
            var request = try HTTPNetworkRequest.configureHTTPRequest(from: urlString, with: parameters, includes: includes, contains: contains, and: method)
            
            if method == .put {
                if body.count > 0 {
                    let jsonData = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
                    request.httpBody = jsonData
                }
            }
            
            print("RQ: -->\n\(request.description)")
            session.dataTask(with: request) { (data, res, err) in
                
                if let response = res as? HTTPURLResponse, let unwrappedData = data {
                    print("RS: <--\n\(unwrappedData)")
                    let result = HTTPNetworkResponse.handleNetworkResponse(for: response)
                    switch result {
                    case .success:
                        self.loader.hide(onView: nil, withTitle: "")
                        completion(Result.success(unwrappedData))
                    case .failure:
                        self.loader.hide(onView: nil, withTitle: "")
                        completion(Result.failure(HTTPNetworkError.badRequest))
                    }
                }
            }.resume()
        } catch {
            self.loader.hide(onView: nil, withTitle: "")
            completion(Result.failure(HTTPNetworkError.failed))
        }
    }
    
    func get(endpoint: APIProtocol, parameters: HTTPParameters?, includes: HTTPHeaders, showLoader: Bool, loaderTitle: String,completion: @escaping (Result<Data>) -> () ) {
        
        var headers = ["Content-Type": "application/json"]
        headers.merge(includes){(current, _) in current}
        performRequest(method: .get, endpoint: endpoint, parameters: nil, includes: headers, showLoader: showLoader,  loaderTitle: loaderTitle) { (result) in
            completion(result)
        }
    }
    
    func post(endpoint: APIProtocol, parameters: HTTPParameters ,includes: HTTPHeaders, showLoader: Bool, loaderTitle: String, completion: @escaping (Result<Data>) -> () ) {
        
        var headers = ["Content-Type": "application/json", "Accept":"application/json"]
        headers.merge(includes){(current, _) in current}
        performRequest(method: .post, endpoint: endpoint, parameters: parameters, includes: headers, showLoader: showLoader, loaderTitle: loaderTitle) { (result) in
            completion(result)
        }
    }
    
    func put(endpoint: APIProtocol, parameters: HTTPParameters , includes: HTTPHeaders, body: [Any] = [],showLoader: Bool, loaderTitle: String, completion: @escaping (Result<Data>) -> () ) {
        
        var headers = ["Content-Type": "application/json"]
        headers.merge(includes){(current, _) in current}
        performRequest(method: .put, endpoint: endpoint, parameters: parameters, includes: headers, body: body, showLoader: showLoader, loaderTitle: loaderTitle) { (result) in
            completion(result)
        }
    }
}
