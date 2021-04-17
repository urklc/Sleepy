//
//  NetworkController.swift
//  Sleepy
//
//  Created by Ugur Kilic on 15.04.2021.
//

import Foundation

final class NetworkController {

    private enum Constant {

        static let successStatusCodes: Range<Int> = 200..<300
    }

    private let baseURL: URL

    private lazy var jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
            let interval = try decoder.singleValueContainer().decode(String.self)
            return Date(timeIntervalSince1970: Double(interval) ?? 0)
        })
        return jsonDecoder
    }()

    init(baseURL: URL) {
        self.baseURL = baseURL
    }

    func send<T: Decodable>(request: Request,
                            completion: @escaping (T?, SleepyError?) -> Void) {
        let urlRequest = createURLReqest(request: request)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(nil, .network(error))
                    return
                }

                guard let data = data else {
                    completion(nil, .noData)
                    return
                }

                if let code = (response as? HTTPURLResponse)?.statusCode,
                   !Constant.successStatusCodes.contains(code) {
                    let receivedMessage = String(data: data, encoding: .utf8)
                    let userInfo = [
                        NSLocalizedDescriptionKey:
                            receivedMessage ?? HTTPURLResponse.localizedString(forStatusCode: code)
                    ]
                    let httpError = NSError(domain: "com.sleepy",
                                            code: code,
                                            userInfo: userInfo)
                    completion(nil, .network(httpError))
                }

                do {
                    let model = try self.jsonDecoder.decode(T.self, from: data)
                    completion(model, nil)
                } catch {
                    completion(nil, .invalidResponse(error))
                }
            }
        }
        task.resume()
    }

    private func createURLReqest(request: Request) -> URLRequest {
        let url = baseURL.appendingPathComponent(request.endpoint.path)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.httpMethod
        return urlRequest
    }
}
