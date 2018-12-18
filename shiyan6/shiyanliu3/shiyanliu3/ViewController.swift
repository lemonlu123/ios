//
//  ViewController.swift
//  shiyanliu3
//
//  Created by 客人用户 on 2018/12/13.
//  Copyright © 2018年 yanlu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let view1 = UIView()
        let view2 = UIView()
        let view3 = UIView()
        view2.backgroundColor = UIColor.green
        view1.backgroundColor = UIColor.blue
        view3.backgroundColor = UIColor.brown
        
        let stack = UIStackView(arrangedSubviews: [view1,view2,view3])
        stack.distribution = .fillEqually
        stack.spacing = 20
        stack.axis = .vertical
        stack.alignment = .fill
        
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        
        
}
}
