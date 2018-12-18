//
//  ViewController.swift
//  HelloWorld
//
//  Created by apple on 2018/10/19.
//  Copyright © 2018年 yanlu All rights reserved.
//

import UIKit
class MyView: UIView {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        UIColor.red.setStroke()
        path.stroke()
        UIColor.red.setFill()
        path.fill()
    }
}

var label: UILabel!
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let manage = FileManager.default
        let document = manage.urls(for: .documentDirectory, in: .userDomainMask).first?.path
        let file = document?.appending("/image")
        
        if manage.fileExists(atPath: file!) {  //若该文件夹存在
            let image = file?.appending("/11.jpg")  //图片文件
            if manage.fileExists(atPath: image!) {  //若该文件存在，则显示到界面上
                do{
                    let data = try Data(contentsOf: URL(fileURLWithPath: image!))
                    let img = UIImage(data: data)
                    let imageView = UIImageView(image: img)
                    imageView.frame = CGRect(x: 0, y: 100, width: 400, height: 300)
                    self.view.addSubview(imageView)
                } catch {
                    print(error)
                }
            } else {  //若不存在，则从网络下载一个图片并保存为图片文件
                let url = URL(string: "https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png")
                do{
                    let data = try Data(contentsOf: url!)
                    try data.write(to: URL(fileURLWithPath: image!), options: .atomicWrite)
                    print("文件不存在，已成功创建文件")
                } catch {
                    print(error)
                }
            }
        } else {  //若该文件夹不存在，则创建该文件夹
            do {
                try manage.createDirectory(atPath: file!, withIntermediateDirectories: true, attributes: nil)
                print("文件夹不存在，已成功创建文件夹")
            } catch {
                print(error)
            }
        }
        
        
        let oval = MyView(frame: CGRect(x: 50, y: 100, width: 50, height: 120))
        oval.backgroundColor = UIColor.black
        self.view.addSubview(oval)
        let circle = MyView(frame: CGRect(x: 200, y: 100, width: 120, height: 80))
        circle.backgroundColor = UIColor.white
        self.view.addSubview(circle)
        
        label = UILabel(frame: CGRect(x: 80, y: 100, width: 200, height: 80))
        label.text = "hello ,yyqx" //设置显示文字
        label.textColor = UIColor.white
        label.textAlignment = .center
        self.view.addSubview(label)
        
        let imageView = UIImageView(frame: CGRect(x: 10, y:400, width:self.view.frame.width - 20, height: (self.view.frame.width - 20) * 0.618))
        //  图片路径
        let path = Bundle.main.path(forResource: "qx", ofType: "jpg")
        let image = UIImage(contentsOfFile: path!)
        imageView.image = image
        self.view.addSubview(imageView)
        
        //新建UIButton对象
        let btn = UIButton(frame: CGRect(x: 100, y: 250, width: 100, height: 40))
        btn.setTitle("click me", for: .normal) //  一般状态下
        btn.layer.borderWidth = 1
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitleColor(UIColor.yellow, for: .highlighted)//高亮 被点击没有释放状态下
        btn.addTarget(self, action: #selector(clicked), for: .touchUpInside)
        self.view.addSubview(btn)

    }
    @objc func clicked() {
        if label.text == "hello" {
            label.text = "go"
        }else {
            label.text = "hello"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

