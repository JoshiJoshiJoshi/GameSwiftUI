//
//  RequestBuilder.swift
//  GameSwiftUI
//
//  Created by Joshi on 07.04.21.
//

// Resources:
// Device identifier: https://www.hackingwithswift.com/example-code/system/how-to-identify-an-ios-device-uniquely-with-identifierforvendor

import Foundation

protocol RequestBuilderProtocol {
    func setBaseUrl(_ url: RequestBaseUrl) -> RequestBuilderProtocol // finished
    func setEndpoint(_ string: String) -> RequestBuilderProtocol // finished
    func setQuery(_ query: Query) -> RequestBuilderProtocol // finished
    func setRequestMethod(_ method: RequestMethod) -> RequestBuilderProtocol // finished
    func addHeader(_ key: String, _ value: String) -> RequestBuilderProtocol // finished
    func build() -> URLRequest // Revisit: 'reset()' implemented for DI - right approach?
}

class RequestBuilder : RequestBuilderProtocol{
    private var https: Bool = RequestPreset.defaultHttps
    private var baseUrl: String = RequestPreset.defaultBaseUrl
    private var endpoint: String = RequestPreset.defaultEndpoint
    private var query: Query!
    private var requestMethod: RequestMethod = RequestPreset.defaultRequestMethod
    private var headers: [String : String] = [:]
    
    func useHTTPS(_ bool: Bool) -> RequestBuilderProtocol {
        self.https = bool
        return self
    }
    
    func setBaseUrl(_ url: RequestBaseUrl) -> RequestBuilderProtocol {
        self.baseUrl = url.rawValue
        return self
    }
    
    func setEndpoint(_ string: String) -> RequestBuilderProtocol {
        self.endpoint = string
        return self
    }
    
    func setQuery(_ query: Query) -> RequestBuilderProtocol {
        self.query = query
        return self
    }
    
    func setRequestMethod(_ method: RequestMethod) -> RequestBuilderProtocol {
        self.requestMethod = method
        return self
    }
    func addHeader(_ key: String, _ value: String) -> RequestBuilderProtocol {
        headers[key] = value
        return self
    }
    
    private func reset() {
        self.https = true
        self.baseUrl = ""
        self.endpoint = ""
        self.requestMethod = .GET
        self.headers = [:]
    }

    func build() -> URLRequest {
        var urlComponents = URLComponents()
        var urlRequest : URLRequest
        urlComponents.scheme = https ? "https" : "http"
        urlComponents.host = baseUrl
        urlComponents.path = endpoint

        switch requestMethod {
        case .GET:
            urlComponents.queryItems = query.queryForGET
            urlRequest = URLRequest(url: urlComponents.url!)
            print("GET " + String(decoding: urlRequest.httpBody!, as: UTF8.self))
            break;
        case .POST:
            urlRequest = URLRequest(url: urlComponents.url!)
            urlRequest.setValue("text/plain", forHTTPHeaderField: "Content-Type")
            // this code below is being stupid ok
            urlRequest.httpBody = query.queryForPOST.data(using: .ascii)
            print("POST " + String(decoding: urlRequest.httpBody!, as: UTF8.self))
            break;
        }
        urlRequest.httpMethod = requestMethod.rawValue
        
        // Meta Data
        urlRequest.setValue("iOS", forHTTPHeaderField: "OS-Name")
        urlRequest.setValue(getOSVersion(), forHTTPHeaderField: "OS-Version")
        urlRequest.setValue(getOSLanguage(), forHTTPHeaderField: "OS-Language")
        urlRequest.setValue(getAppName(), forHTTPHeaderField: "App-Name")
        urlRequest.setValue(getAppVersion(), forHTTPHeaderField: "App-Version")

        for header in headers {
            urlRequest.addValue(header.value, forHTTPHeaderField: header.key)
        }

        reset()
        return urlRequest
    }
 
}

