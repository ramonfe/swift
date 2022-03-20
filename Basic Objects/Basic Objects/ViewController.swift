//
//  ViewController.swift
//  Basic Objects
//
//  Created by home on 17/03/22.
//

import UIKit

class ViewController: UIViewController {
//outlets
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myPickerView: UIPickerView!
    @IBOutlet weak var myPageControl: UIPageControl!
    
    // variables
    private let arrPicker = ["Uno","dos","tres","cuatro","cinco"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //button
        myButton.backgroundColor = .blue
        
        //pickers
        myPickerView.backgroundColor = .lightGray
        myPickerView.dataSource=self
        myPickerView.delegate = self
        
        //page control
        myPageControl.numberOfPages = arrPicker.count
        myPageControl.currentPageIndicatorTintColor = .blue
        myPageControl.pageIndicatorTintColor = .lightGray
    }
//actions
    @IBAction func myButtonAction(_ sender: Any) {
        if (myButton.backgroundColor == .blue){
            myButton.backgroundColor = .green
        }else{
            myButton.backgroundColor = .blue
        }
    }
    @IBOutlet var myPickerViewAction: [UIPickerView]!
    @IBAction func myPageControlAction(_ sender: Any) {
        myPickerView.selectRow(myPageControl.currentPage, inComponent: 0, animated: true)
        myButton.setTitle(arrPicker[myPageControl.currentPage], for: .normal)
    }
    
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrPicker.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrPicker[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        myButton.setTitle(arrPicker[row], for: .normal)
        
        myPageControl.currentPage = row
    }
}

