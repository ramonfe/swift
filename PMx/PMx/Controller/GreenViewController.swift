//
//  ViewController.swift
//  PMx
//
//  Created by home on 04/04/22.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
    private let myRows=["Uno","Dos","Tres","Cuatro","Cinco"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource=self
        tableView.delegate=self
        tableView.tableFooterView = UIView()
        
        tableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "mycustomcell")
    }
}
//MARK: UITableViewDataSource
extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myRows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
//        if (cell==nil){
//            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
//        }
//        cell!.textLabel?.text = myRows[indexPath.row]
//        return cell!
        var cell = tableView.dequeueReusableCell(withIdentifier: "mycustomcell", for: indexPath) as? MyTableViewCell
        cell?.actorsLabel.text="someone"
        return cell!
    }
}
//MARK: UITableViewDelegate
extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(myRows[indexPath.row])
    }
}

