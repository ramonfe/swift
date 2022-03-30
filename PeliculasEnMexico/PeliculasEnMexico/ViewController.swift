//
//  ViewController.swift
//  PeliculasEnMexico
//
//  Created by home on 19/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tabBar: UITabBar!
    
    private let myCountries = ["España","Mexico","Brasil","Colombia","Argentina"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        //cargar mycelda para tabla
        tableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "mycustomcell")
    }
}
//MARK: - UITableViewDataSource
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCountries.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0){
            return 50
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0)
        {
            var cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
            if (cell==nil){
                cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
                cell?.textLabel?.font = .systemFont(ofSize: 20)
            }
            cell!.textLabel?.text = myCountries[indexPath.row]
            return cell!
        }
            let cell = tableView.dequeueReusableCell(withIdentifier: "mycustomcell", for: indexPath) as? MyCustomTableViewCell
            
            cell!.fstLabel.text = String(indexPath.row + 1)
            cell!.sndLabel.text = myCountries[indexPath.row]
            
            return cell!
    }
}

extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
