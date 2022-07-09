//
//  APIService.swift
//  Scrollo
//
//  Created by Erwin Marysiok on 09/07/2022.
//

import Foundation

class APIService {
    static let shared = APIService()

    func login(credentials: Credentials,
               completion: @escaping (Result<Bool,EventManager.AuthenticationError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if credentials.password == "password" {
                completion(.success(true))
            } else {
                completion(.failure(.invalidCredentials))
            }
        }
    }
}
