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
    func setBaseUrl(_ url: RequestBaseUrl) -> RequestBuilderProtocol
    func setEndpoint(_ string: String) -> RequestBuilderProtocol
    func setQuery(_ query: Query) -> RequestBuilderProtocol
    func setRequestMethod(_ method: RequestMethod) -> RequestBuilderProtocol
    func addHeader(_ key: String, _ value: String) -> RequestBuilderProtocol
    func build() -> URLRequest
}

class RequestBuilder : RequestBuilderProtocol{
    private var https: Bool = Config.Request.defaultHttps
    private var baseUrl: String = Config.Request.defaultBaseUrl
    private var endpoint: String = Config.Request.defaultEndpoint
    private var query: Query!
    private var requestMethod: RequestMethod = Config.Request.defaultRequestMethod
    private var headers: [String : String] = [:]
    private var defaultAuth: [String : String] {
        get {
            switch Config.Auth.defaultAuthMethod {
            case .NONE:
                return [:]
            case .OAUTH:
                return Config.Auth.OAuth.credentials
            }
        }
    }
    
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
    
    private func setDefault() {
        self.https = Config.Request.defaultHttps
        self.baseUrl = Config.Request.defaultBaseUrl
        self.endpoint = Config.Request.defaultEndpoint
        self.requestMethod = Config.Request.defaultRequestMethod
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
            break;
        case .POST:
            urlRequest = URLRequest(url: urlComponents.url!)
            urlRequest.setValue("text/plain", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = query.queryForPOST.data(using: .utf8)
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
    
        for credential in defaultAuth {
            urlRequest.addValue(credential.value, forHTTPHeaderField: credential.key)
        }
        setDefault()
        return urlRequest
    }
}

enum RequestMethod: String {
    case GET = "GET"
    case POST = "POST"
}

enum RequestAuthMethod {
    case NONE
    case OAUTH
}
