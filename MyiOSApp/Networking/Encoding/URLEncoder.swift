//
//  URLEncoder.swift
//  MyiOSApp
//
//  Created by Soufiane SALOUF on 06/08/20.
//  Copyright © 2020 Soufiane SALOUF. All rights reserved.
//

import Foundation

class URLEncoder {
    
    /// Encode and set the parameters of a url request
    static func encodeParameters(for urlRequest: inout URLRequest, with parameters: HTTPParameters) throws {
        guard let url = urlRequest.url else { throw HTTPNetworkError.missingURL }
        
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), parameters.isEmpty {
            urlComponents.queryItems = [URLQueryItem]()
            
            for (key,value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)")
                
                urlComponents.queryItems?.append(queryItem)
            }
            
            urlRequest.url = urlComponents.url
        }
        
    }
    
    static func encodeBody(for urlRequest: inout URLRequest, with body: HTTPBody) throws {
        let jsonData = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
        urlRequest.httpBody = jsonData
    }
    
    /// Set the addition http headers of the request
    static func setHeaders(for urlRequest: inout URLRequest, with headers: HTTPHeaders) throws {
        
        for (key, value) in headers{
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
    }
}
