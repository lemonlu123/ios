//
//  ViewController.swift
//  shiyanshisan1
//
//  Created by 客人用户 on 2018/12/18.
//  Copyright © 2018年 yanlu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var test: UILabel!
    var i = 0
    @IBAction func calculate(_ sender: Any) {
        var sum = 0
        for _ in 1...100 {
            DispatchQueue.global().async {
                print("Run thread:\(Thread.current)")
                for i in 1...1000 {
                    sum += i
                    usleep(10000)
                }
                DispatchQueue.main.async {
                    self.test.text = "sum:\(sum)"
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (timer) in
            self.i += 1
            self.time.text = "\(self.i)"
            }.fire()
    }
}



