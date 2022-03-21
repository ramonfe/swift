//
//  ViewController.swift
//  networking
//
//  Created by home on 19/03/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var idUser: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = ""
        emailLabel.text = ""
        idUser.text = ""
        activityIndicator.hidesWhenStopped = true
        activityIndicator.stopAnimating()
    }

    @IBOutlet weak var btnGetUser: UIButton!
    @IBAction func btnGetUserAction(_ sender: Any) {
        
        activityIndicator.startAnimating()
        
        NetworkingProvider.shared.getUser(id: 13668) { (user) in
            self.activityIndicator.stopAnimating()
            
            self.nameLabel.text = user.name
            self.nameLabel.numberOfLines=0
            self.emailLabel.text = user.email
            self.emailLabel.numberOfLines=0
            self.idUser.text = user.id?.description
            
        } failure: { (error) in
            self.activityIndicator.stopAnimating()
            self.nameLabel.text = error.debugDescription
        }

    }
    @IBAction func btnAddUser(_ sender: Any) {
        
        let newUser = NewUser(name: "RamonFelix", email: "ramonfelix@gmail.com", gender: "Male", status: "Active")
        
        activityIndicator.startAnimating()
        
        NetworkingProvider.shared.addUser(user: newUser) { (user) in
            
            self.activityIndicator.stopAnimating()
            
            self.nameLabel.text = user.name
            self.nameLabel.numberOfLines=0
            self.emailLabel.text = user.email
            self.emailLabel.numberOfLines=0
            self.idUser.text = user.id?.description
            
        } failure: { (error) in
            self.activityIndicator.stopAnimating()
            self.nameLabel.text = error.debugDescription
        }

    }
}

