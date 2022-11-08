//
//  NetworkService.swift
//  Recipe Time
//
//  Created by M W on 04/11/2022.
//

import Foundation

enum Result<T>{
    case success(T)
    case failure(Error)
    case empty
}


enum APIMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol Service {
    var baseURL: String { get }
    var path: String { get }
    var parameters: [String: Any]? { get }
    var method: APIMethod { get }
}

extension Service {
    public var urlRequest: URLRequest {
        guard let url = url else {
            fatalError("URL could not be built")
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        return request
    }
    
    private var url: URL? {
        var urlComponents = URLComponents(string: baseURL)
        urlComponents?.path = path

        if method == .get {
            // add query items to url
            guard let parameters = parameters as? [String: String] else {
                fatalError("parameters for GET http method must conform to [String: String]")
            }
            urlComponents?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        
        if method == .post {
            
            
        }

        return urlComponents?.url
    }
    

    
}

class NetworkServiceProvider <T: Service> {
    var urlSession = URLSession.shared
    
    init(){}
    
    func load(service: T, completion: @escaping (Result<Data>) -> Void) {
        call(service.urlRequest, completion: completion)
    }
    
    func load<U>(service: T, decodeType: U.Type, completion: @escaping (Result<U>) -> Void) where U: Decodable {
        call(service.urlRequest) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let resp = try decoder.decode(decodeType, from: data)
                    completion(.success(resp))
                }
                catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            case .empty:
                completion(.empty)
            }
        }
    }
    
}

extension NetworkServiceProvider {
    private func call(_ request: URLRequest, deliverQueue: DispatchQueue = DispatchQueue.main, completion: @escaping (Result<Data>) -> Void) {
        urlSession.dataTask(with: request) { (data, _, error) in
            if let error = error {
                deliverQueue.async {
                    completion(.failure(error))
                }
            } else if let data = data {
                deliverQueue.async {
                    completion(.success(data))
                }
            } else {
                deliverQueue.async {
                    completion(.empty)
                }
            }
            }.resume()
    }

}
