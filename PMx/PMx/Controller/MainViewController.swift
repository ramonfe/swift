//
//  ViewController.swift
//  PMx
//
//  Created by home on 04/04/22.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    private var peliculas = [Peliculas]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource=self
        tableView.delegate=self
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "mycustomcell")
        
        //carga json
        NetworkProvider.shared.loadJson { (estrenos) in
            self.peliculas = estrenos.Estrenos
            DispatchQueue.main.async
            {
                self.tableView.reloadData()
            }
        } failure: { (error) in
            print(error)
        }
    }
}

//MARK: UITableViewDataSource
extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peliculas.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycustomcell", for: indexPath) as? MyTableViewCell
        cell?.titleLabel.text=peliculas[indexPath.row].title
        cell?.actorsDescLabel.text = peliculas[indexPath.row].actor?.joined(separator: ",")
        cell?.dateFixLabel.text = "-"
        cell?.criticFixLabel.text = peliculas[indexPath.row].critics_score
        return cell!
    }
}
//MARK: UITableViewDelegate
extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "SegueEstrenoDetail", sender: nil)
    }
}

