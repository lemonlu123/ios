//
//  ViewController.swift
//  004.shiyan4
//
//  Created by 客人用户 on 2018/12/18.
//  Copyright © 2018年 yanlu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let oval = Circle(frame: CGRect(x: 100, y: 100, width: 150, height: 100))
        oval.backgroundColor = UIColor.clear
        self.view.addSubview(oval)
        let circle = Circle(frame: CGRect(x: 100, y: 300, width: 100, height: 100))
        circle.backgroundColor = UIColor.clear
        self.view.addSubview(circle)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

