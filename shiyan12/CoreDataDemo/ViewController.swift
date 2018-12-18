//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by student on 2018/12/12
//  Copyright © 2018年 yanlu All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var stuNo: UITextField!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(NSHomeDirectory())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func cancelBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func addBtn(_ sender: Any) {
        //已经封装了对象，CoreData将数据库中的数据封装成了一个Person对象
        let person = Person(context: context)
        person.name = name.text
        person.no = stuNo.text
//        appDelegate.saveContext()
        dismiss(animated: true, completion: nil)
    }
    //删除
    @IBAction func delBtn(_ sender: Any) {
        //请求
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        //断言
        fetch.predicate = NSPredicate(format: "name=%@", name.text!)
        //数据库的查询可能会出错
        let  persons = try? context.fetch(fetch)
        if let currentPerson = persons?.first {
            currentPerson.no = stuNo.text
        }
    }
    //更新
    @IBAction func updateBtn(_ sender: Any) {
        //请求
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        //断言
        fetch.predicate = NSPredicate(format: "name=%@", name.text!)
        //数据库的查询可能会出错，需要用try
        let  persons = try? context.fetch(fetch)
        if let currentPerson = persons?.first {
            currentPerson.no = stuNo.text
        }
    }
    //查询
    @IBAction func queryBtn(_ sender: Any) {
        //请求
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        //断言
        fetch.predicate = NSPredicate(format: "name=%@", name.text!)
        //数据库的查询可能会出错
        let  persons = try? context.fetch(fetch)
        if let currentPerson = persons?.first {
            stuNo.text = currentPerson.no
        }
    }
}

