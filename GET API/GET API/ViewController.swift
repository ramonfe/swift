//
//  ViewController.swift
//  GET API
//
//  Created by home on 10/03/22.
//  Copyright © 2022 RF. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://jsonplaceholder.typicode.com/todos"
        getData(url: url)
        
    }
    private func getData(url:String)
    {
        let task = URLSession.shared.dataTask(with: URL(string: url)!,
                                              completionHandler: { (data, response, error) in
                                                
                                                guard let data = data,error == nil else{
                                                    print("something went wrong")
                                                    return
                                                }
                                                //have data
                                                var results: [Response]?
                                                do{
                                                    //let results = try JSONDecoder().decode([Response].self, from: data)
                                                    results = try JSONDecoder().decode([Response].self, from: data)
                                                    
                                                    for result in results!{
                                                        print(result.title)
                                                        print(result.id)
                                                    }
                                                }
                                                catch{
                                                    print("failed to convert \(error.localizedDescription)")
                                                }
        })
        task.resume()
    }
}

struct Response:Codable {
    let userId:Int
    let id:Int
    let title:String
    let completed:Bool
}

