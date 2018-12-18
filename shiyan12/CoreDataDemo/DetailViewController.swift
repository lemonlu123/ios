//
//  DetailViewController.swift
//  CoreDataDemo
//
//  Created by student on 2018/12/12.
//  Copyright © 2018年 yanlu All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var person: Person?
    @IBOutlet weak var lbname: UILabel!
    @IBOutlet weak var lbno: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lbname.text = person?.name
        lbno.text = person?.no
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


