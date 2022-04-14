//
//  NetworkProvider.swift
//  PMx
//
//  Created by home on 12/04/22.
//

import Foundation

final class NetworkProvider{
    
    static let shared = NetworkProvider()
    
    private let jsonUrl = "https://ramonfe.github.io/film/indexEstrenos.html"

    func loadJson(success: @escaping ( _ estrenos:Estrenos) -> (),failure: @escaping (_ error: Error?) -> () ){
        
        guard let url = URL(string: jsonUrl) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            //check error
            //check response status 200
            
            guard let data = data else { return }
            
            let dataAsString = String(data: data, encoding: .utf8)
            //print(dataAsString)
            do{
                let json = try JSONDecoder().decode(Estrenos.self, from: data)
                 success(json)
            } catch let jsonError{
                failure(jsonError)
                //print("error serializing: ",jsonError)
            }
        }.resume()
    }
}
