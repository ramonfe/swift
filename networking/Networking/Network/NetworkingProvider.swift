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
}
