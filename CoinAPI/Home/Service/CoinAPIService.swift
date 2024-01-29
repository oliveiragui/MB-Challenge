//
//  CoinAPIService.swift
//  CoinAPI
//
//  Created by Guiherme de Oliveira Macedo on 24/01/24.
//

import Foundation

protocol HomeManagerProtocol {
    func fetchExchanges(completion: @escaping (Result<[ExchangeModel]>) -> Void)
}

class HomeManager: HomeManagerProtocol {
    func fetchExchanges(completion: @escaping (Result<[ExchangeModel]>) -> Void) {
        
        manager.dispatcher.request(.listExchanges) { (data, response, error) in
            DispatchQueue.main.async {
                
                if error != nil {
                    completion(Result.Failure(Errors.serviceError))
                }
                
                guard let response = response as? HTTPURLResponse else {
                    completion(Result.Failure(Errors.decodingFailed))
                    return
                }
                
                let result = self.manager.handleNetworkResponse(response)
                
                switch result {
                case .Success:
                    let jsonDecoder = JSONDecoder()
                    if let data = data,
                       let info = try? jsonDecoder.decode([ExchangeModel].self, from: data) {
                        if info.isEmpty {
                            completion(Result.Failure(Errors.resourceNotFound))
                        }

                        completion(Result.Success(info))
                    }
                case .Failure(let error):
                    print(error.localizedDescription)
                    if let _ = error as? NetworkManager<CoinAPIEndPoint>.NetworkResponse {
                        completion(Result.Failure(Errors.secureConnectionFailed))
                    }
                    completion(Result.Failure(error))
                }
            }
        }
    }
}

extension HomeManager: Service {
    typealias EndPoint = CoinAPIEndPoint
}

extension HomeManager: Gettable { }
