//
//  RequestBuilder.swift
//  GameSwiftUI
//
//  Created by Joshi on 07.04.21.
//

import Foundation

protocol RequestBuilderProtocol {
    func setBaseUrl(_ url: IGDBBaseUrl) -> RequestBuilderProtocol
    func setEndpoint(_ endpoint: IGDBEndpoint) -> RequestBuilderProtocol
    func setQuery(_ query: Query) -> RequestBuilderProtocol
    func setHTTPMethod(_ method: HTTPMethod) -> RequestBuilderProtocol
    func addHeader(_ key: String, _ value: String) -> RequestBuilderProtocol
    func build() -> URLRequest
}

class RequestBuilder : RequestBuilderProtocol{
    private var https: Bool = Config.Request.defaultHttps
    private var baseUrl: IGDBBaseUrl = Config.Request.defaultBaseUrl
    private var endpoint: IGDBEndpoint = Config.Request.defaultEndpoint
    private var httpMethod: HTTPMethod = Config.Request.defaultHTTPMethod
    private var query: Query!
    private var headers: [String : String] = [:]
    private var defaultAuth: [String : String] {
        get {
            switch Config.Auth.defaultAuthMethod {
            case .none:
                return [:]
            case .oAuth:
                return Config.Auth.OAuth.credentials
            }
        }
    }
    
    func useHTTPS(_ bool: Bool) -> RequestBuilderProtocol {
        self.https = bool
        return self
    }
    
    func setBaseUrl(_ url: IGDBBaseUrl) -> RequestBuilderProtocol {
        self.baseUrl = url
        return self
    }
    
    func setEndpoint(_ endpoint: IGDBEndpoint) -> RequestBuilderProtocol {
        self.endpoint = endpoint
        return self
    }
    
    func setQuery(_ query: Query) -> RequestBuilderProtocol {
        self.query = query
        return self
    }
    
    func setHTTPMethod(_ method: HTTPMethod) -> RequestBuilderProtocol {
        self.httpMethod = method
        return self
    }
    func addHeader(_ key: String, _ value: String) -> RequestBuilderProtocol {
        headers[key] = value
        return self
    }
    
    private func setDefault() {
        self.https = Config.Request.defaultHttps
        self.baseUrl = Config.Request.defaultBaseUrl
        self.endpoint = Config.Request.defaultEndpoint
        self.httpMethod = Config.Request.defaultHTTPMethod
        self.headers = [:]
    }

    func build() -> URLRequest {
        var urlComponents = URLComponents()
        var urlRequest : URLRequest
        urlComponents.scheme = https ? "https" : "http"
        urlComponents.host = baseUrl.rawValue
        urlComponents.path = endpoint.rawValue

        switch httpMethod {
        case .get:
            urlComponents.queryItems = query.queryForGET
            urlRequest = URLRequest(url: urlComponents.url!)
            break;
        case .post:
            urlRequest = URLRequest(url: urlComponents.url!)
            urlRequest.setValue("text/plain", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = query.queryForPOST.data(using: .utf8)
            break;
        }
        urlRequest.httpMethod = httpMethod.rawValue
        
        // Meta Data
        urlRequest.setValue("iOS", forHTTPHeaderField: "OS-Name")
        urlRequest.setValue(getOSVersion(), forHTTPHeaderField: "OS-Version")
        urlRequest.setValue(getOSLanguage(), forHTTPHeaderField: "OS-Language")
        urlRequest.setValue(getAppName(), forHTTPHeaderField: "App-Name")
        urlRequest.setValue(getAppVersion(), forHTTPHeaderField: "App-Version")

        for header in headers {
            urlRequest.addValue(header.value, forHTTPHeaderField: header.key)
        }
    
        for credential in defaultAuth {
            urlRequest.addValue(credential.value, forHTTPHeaderField: credential.key)
        }
        setDefault()
        return urlRequest
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum RequestAuthMethod {
    case none
    case oAuth
}
