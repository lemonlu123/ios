//
//  ViewController.swift
//  shiyanjiu2
//
//  Created by 客人用户 on 2018/12/18.
//  Copyright © 2018年 yanlu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func login(_ sender: Any) {
        let alert = UIAlertController(title: "Login", message: "Please input your personal information", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Login", style: .default, handler: { (action) in
            if let userNameTextField = alert.textFields?.first, let passWordTextField = alert.textFields?.last {
                print("username:\(userNameTextField.text!) password:\(passWordTextField.text!)")
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
        }))
        alert.addTextField { (textField) in
            textField.placeholder = "user name?"
        }
        alert.addTextField { (textField) in
            textField.isSecureTextEntry = true
            textField.placeholder = "password?"
        }
        present(alert, animated: true, completion: nil)
    }
    @IBAction func actionSheet(_ sender: Any) {
        let alert = UIAlertController(title: "action sheet", message: "this is an ation sheet", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Green", style: .destructive, handler: { (action) in
            print("destructive clicked")
            self.view.backgroundColor = UIColor.green
        }))
        alert.addAction(UIAlertAction(title: "RED", style: .default, handler: { (action) in
            print("ok clicked")
            self.view.backgroundColor = UIColor.red
        }))
        alert.addAction(UIAlertAction(title: "black", style: .cancel, handler: { (action) in
            print("cancel clicked")
            self.view.backgroundColor = UIColor.darkGray
        }))
        present(alert, animated: true, completion: nil)
    }
   
}



