//
//  ViewController.swift
//  PMx
//
//  Created by home on 04/04/22.
//

import UIKit

let jsonUrl = "https://ramonfe.github.io/film/indexEstrenos.html"

//let urlRequest = URLRequest(

class ViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
    private let myRows=["Uno","Dos","Tres","Cuatro","Cinco","Seis"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource=self
        tableView.delegate=self
        tableView.tableFooterView = UIView()
        
        tableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "mycustomcell")
        loadJson()
    }
}

func loadJson(){
    guard let url = URL(string: jsonUrl) else {return}
    URLSession.shared.dataTask(with: url) { (data, response, err) in
        //check error
        //check response status 200
        
        guard let data = data else { return }
        
        let dataAsString = String(data: data, encoding: .utf8)
        print(dataAsString)
        do{
            let json = try JSONDecoder().decode(Estrenos.self, from: data)
            print(json)
        } catch let jsonError{
            print("error serializing: ",jsonError)
        }
    }.resume()
}
//MARK: UITableViewDataSource
extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myRows.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycustomcell", for: indexPath) as? MyTableViewCell
        cell?.actorsLabel.text="someone"
        return cell!
    }
}
//MARK: UITableViewDelegate
extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(myRows[indexPath.row])
        performSegue(withIdentifier: "SegueEstrenoDetail", sender: nil)
    }
}

