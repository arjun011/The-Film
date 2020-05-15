//
//  ClientManager.swift
//  The Film
//
//  Created by Arjun C on 06/05/20.
//  Copyright © 2020 Arjun C. All rights reserved.
//

import Foundation
public typealias successResponse = (_ jasonData:Data?, _ ststusCode: Int) -> Void
public typealias failure = (_ error: Error?) -> Void
public enum ResponseManager<T> {
    case offline
    case success(T)
    case error(String)
}

extension URLRequest {
       mutating func addCommonHeaders() {
           self.setValue("application/json", forHTTPHeaderField: "Content-Type")
           self.setValue("application/json", forHTTPHeaderField: "Accept")
       }
}

final class ClientManager {
    
    private enum RequestType: String {
        case GET
        case POST
        case PUT
    }
    
    static func GET(_ url: String,
                    success: @escaping (successResponse),
                    failure: @escaping(failure)) {
        
        let requestUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        debugPrint(" debug Request URL =",requestUrl)
        guard let serviceUrl = URL(string: requestUrl) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = RequestType.GET.rawValue
        request.cachePolicy = .reloadIgnoringCacheData
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                var responseStatusCode = 0
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    responseStatusCode = statusCode
                }
                if let error = error as NSError?, error.domain == NSURLErrorDomain && error.code == NSURLErrorNotConnectedToInternet {
                    print("not connected")
                   // AlertManager.networkConnectionLoss()
                }
                guard error == nil else {
                    print(error?.localizedDescription ?? "UNKNOWN ERRO")
                    failure(error)
                    return
                }
                if let response = response {
                    debugPrint(response)
                }
                if let data = data {
                    let str = String(decoding: data, as: UTF8.self)
                    debugPrint("Response String=",str)
                    
                    success(data,responseStatusCode)
                }
            }
            
            }.resume()
    }
    
   /* static func PUT(_ url: String, param: [String: Any]?,
                    success: @escaping (successResponse),
                    failure: @escaping(failure)){
        
        
        let requestUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//        let username = CacheDataManager.shared.getMarchantName()
//        let password = CacheDataManager.shared.getMarachantPassword()
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        
        
        guard let serviceUrl = URL(string: requestUrl) else { return }
        var request = URLRequest(url: serviceUrl)
        
        debugPrint(" debug Request URL =",request)
        
        if let theJSONData = try? JSONSerialization.data(
                   withJSONObject: param,
                   options: []) {
                   let theJSONText = String(data: theJSONData,
                                            encoding: .ascii)
                   debugPrint("JSON string = \(theJSONText!)")
               }
        
        request.httpMethod = RequestType.PUT.rawValue
        request.cachePolicy = .reloadIgnoringCacheData
        request.addCommonHeaders()
        guard let httpBody = try? JSONSerialization.data(withJSONObject: param ?? [:], options: []) else {
            return
        }
        request.httpBody = httpBody
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                var responseStatusCode = 0
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    responseStatusCode = statusCode
                }
                if let error = error as NSError?, error.domain == NSURLErrorDomain && error.code == NSURLErrorNotConnectedToInternet {
                    print("not connected")
                    AlertManager.networkConnectionLoss()
                }
                guard error == nil else {
                    print(error?.localizedDescription ?? "UNKNOWN ERRO")
                    failure(error)
                    return
                }
                if let response = response {
                    debugPrint(response)
                }
                if let data = data {
                    let str = String(decoding: data, as: UTF8.self)
                    debugPrint(str)
                    success(data,responseStatusCode)
                }
            }
            }.resume()
    } */
    
    static func POST(_ url: String, param: [String: Any]?,
                     success: @escaping (successResponse),
                     failure: @escaping(failure)){
        
        
        let requestUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        debugPrint(" debug Request URL =",requestUrl)
        if let theJSONData = try? JSONSerialization.data(
            withJSONObject: param,
            options: []) {
            let theJSONText = String(data: theJSONData,
                                     encoding: .ascii)
            debugPrint("JSON string = \(theJSONText!)")
        }
        
        guard let serviceUrl = URL(string: requestUrl) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = RequestType.POST.rawValue
        request.addCommonHeaders()
        guard let httpBody = try? JSONSerialization.data(withJSONObject: param ?? [:], options: []) else {
            return
        }
        request.httpBody = httpBody
        request.cachePolicy = .reloadIgnoringCacheData
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                var responseStatusCode = 0
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    responseStatusCode = statusCode
                }
                if let error = error as NSError?, error.domain == NSURLErrorDomain && error.code == NSURLErrorNotConnectedToInternet {
                    print("not connected")
                   // AlertManager.networkConnectionLoss()
                }
                guard error == nil else {
                    print(error?.localizedDescription ?? "UNKNOWN ERRO")
                    failure(error)
                    return
                }
                if let response = response {
                    debugPrint(response)
                }
                if let data = data {
                    let str = String(decoding: data, as: UTF8.self)
                    debugPrint(str)
                    success(data,responseStatusCode)
                }
            }
            }.resume()
    }
}
