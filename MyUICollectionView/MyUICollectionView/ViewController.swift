//
//  ViewController.swift
//  MyUICollectionView
//
//  Created by home on 29/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMenuBar()
    }
    
    let menuBar = MenuBar()
    //otra manera de instanciar el objecto que aun no entiendo por que asi
    let menBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    private func setupMenuBar(){
        view.addSubview(menuBar)
        //constraints para la menuBar
        menuBar.heightAnchor.constraint(equalToConstant: 100).isActive=true
        //menuBar.widthAnchor.constraint(equalToConstant: 50).isActive=true
        
        menuBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive=true
        
        menuBar.translatesAutoresizingMaskIntoConstraints=false
        
        view.addConstraint(NSLayoutConstraint(item: menuBar, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1000, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: menuBar, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1000, constant: 0))
       
        
    }

}

