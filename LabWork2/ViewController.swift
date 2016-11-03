//
//  ViewController.swift
//  LabWork2
//
//  Created by Mai Dao on 10/14/16.
//  Copyright © 2016 Mai Dao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var namesWebView: UIWebView!
    
    var timer:Timer! = nil
    
    func refresh () {
        submitToService(name: "")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool { print("textFieldShouldBeginEditing")
        textField.backgroundColor = UIColor.yellow
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) { print("textFieldDidBeginEditing")
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool { print("textFieldShouldEndEditing")
        textField.backgroundColor = UIColor.white
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing") }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("textField resignFirstResponder")
        if let text = textField.text {
            submitToService(name:text) }
        return true
    }
    
    func submitToService(name:String) {
        
        let stringUrl = "http://stephane.ayache.perso.luminy.univ-amu.fr/cgi-bin/service.py?name=\(name)"
        
        let encodedStringUrl = stringUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let myurl = URL(string: encodedStringUrl!)
        
        let request = URLRequest(url:myurl!)
        
        namesWebView.loadRequest(request)
        
        if (timer != nil) {timer.invalidate()}
        
        timer = Timer.scheduledTimer(timeInterval:10, target:self, selector:#selector(refresh), userInfo:nil, repeats:false)
        
        if (name != "") {
            
            nameTextField.text = ""
            nameTextField.isEnabled = true
            nameTextField.placeholder = "You already put your name"
        }
        
}
    
    
    
}

