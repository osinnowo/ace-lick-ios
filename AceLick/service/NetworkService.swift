//
//  NetworkService.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 14/05/2023.
//

import UIKit

struct Empty: Encodable { }

enum HttpError: Error {
    case encodingError
    case responseError
    case errorDecodingResponse
}

enum HttpMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
    case OPTIONS
}

protocol NetworkProtocol {
    associatedtype Request: Encodable
    associatedtype Response: Decodable
    
    func initiate(path: String, method: HttpMethod, body: Request?, debuggable: Bool, callback: @escaping ((Result<Response, HttpError>) -> Void))
}

final class NetworkService<T: Encodable, R: Decodable>: NetworkProtocol {
    typealias Request = T
    typealias Response = R
    
    static var shared: NetworkService {
        return NetworkService()
    }
    
    func initiate(path: String, method: HttpMethod = .GET, body: T? = nil, debuggable: Bool = false, callback: @escaping ((Result<R, HttpError>) -> Void)) {
        let url = URL(string: "http://192.168.0.164:8083\(path)")
        var request = URLRequest(url: url!)
        let session = URLSession(configuration: .default)
        
        if method != .GET, let body = body {
            do {
                request.httpBody = try JSONEncoder().encode(body)
                request.httpMethod = method.rawValue
            } catch {
                callback(.failure(.encodingError))
            }
        }
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                if debuggable {
                    print("Error Retrieving Response: \(error?.localizedDescription)")
                }
                callback(.failure(.responseError))
                return
            }
            
            if let raw = String(data: data, encoding: .utf8), debuggable {
                print("<====== Raw Response ======>")
                print(raw)
            }
            
            do {
                let res = try JSONDecoder().decode(R.self, from: data)
                callback(.success(res))
            } catch {
                callback(.failure(.errorDecodingResponse))
            }
        }
        
        dataTask.resume()
    }
}
