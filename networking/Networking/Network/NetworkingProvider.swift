//
//  NetworkingProvider.swift
//  networking
//
//  Created by home on 19/03/22.
//

import Foundation
import Alamofire

final class NetworkingProvider{
    static let shared = NetworkingProvider()
    
//    private let kBaseUrl = "https://gorest.co.in/public/v2/"
    private let kBaseUrl = "https://gorest.co.in/public-api/"
    private let statusOk=200...299
    private let token = "9996879c7127257c5d951f9bc8b79ec86a31ab9c1a6e8a5e9c36dec5ddbad823"
    
    func getUser(id:Int, success: @escaping(_ user: User) -> (), failure: @escaping(_ error: Error?)->()) {
        
        let url = "\(kBaseUrl)users/\(id)"
        
        AF.request(url, method: .get).validate(statusCode: statusOk).responseDecodable (of:UserResponse.self, decoder: DateDecoder() ){ response in
            
            if let user = response.value?.data{
                success(user)
            }else{
                failure(response.error)
            }
        }
    }
    func addUser(user: NewUser, success: @escaping(_ user: User) -> (), failure: @escaping(_ error: Error?)->()) {
        
        let url = "\(kBaseUrl)users"
        
        let headers: HTTPHeaders = [.authorization(bearerToken: token) ]
        
        AF.request(url, method: .post, parameters: user, encoder: JSONParameterEncoder.default, headers: headers  ).validate(statusCode: statusOk).responseDecodable (of:UserResponse.self, decoder: DateDecoder() ){ response in
            
            if let user = response.value?.data, user.id != nil{
                success(user)
            }else{
                failure(response.error)
            }
        }
    }
}
