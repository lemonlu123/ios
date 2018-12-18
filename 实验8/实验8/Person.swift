//
//  Person.swift
//  实验8
//
//  Created by student on 2018/12/18.
//  Copyright © 2018年 严璐. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    //学生数组
    var students = [Student]()
    //教师数组
    var teachers = [Teacher]()
    //定义表头数组
    var tableTitle = ["Teacher", "Student"]
    //定义一个表视图
    var table: UITableView!
    //右边按钮
    var rightItem: UIBarButtonItem!
    //弹出框
    var alert: UIAlertController!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //生成3个教师对象
        self.title = "table"
        self.view.backgroundColor = UIColor.white
        for i in 1...3 {
            let temp = Teacher(teaNo: i, firstName: "\(i)", lastName: "tea", age: 21, gender: .female)
            teachers.append(temp)
        }
        //生成4个学生对象
        for i in 1..<5 {
            let temp = Student(stuNo: i, firstName: "\(i)", lastName: "stu", age: 10, gender: .male)
            students.append(temp)
        }
        
        //按全名排序
        teachers.sort { return $0.age < $1.age }
        students.sort { return $0.age < $1.age }
        
        //创建表视图，并设置代理和数据源
        table = UITableView(frame: self.view.bounds)
        table.delegate = self
        table.dataSource = self
        self.view.addSubview(table)
        //导航栏控制器右边的按钮
        rightItem = UIBarButtonItem(title: "编辑", style: .plain, target: self, action: #selector(edit))
        self.navigationItem.rightBarButtonItem = rightItem
        
        //导航栏控制器左边的按钮
        let leftItem = UIBarButtonItem(title: "添加", style: .plain, target: self, action: #selector(addStudent))
        self.navigationItem.leftBarButtonItem = leftItem
        
    }
    
    @objc func edit() {
        if table.isEditing {
            rightItem.title = "编辑"
            table.isEditing = false
        } else {
            rightItem.title = "完成"
            table.isEditing = true
        }
    }
    
    @objc func addStudent() {
        
        alert = UIAlertController(title: "hh", message: "ss", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "学号"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "姓"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "名"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "性别"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "年龄"
        }
        let OKBtn = UIAlertAction(title: "确定", style: .default) { (alert) in
            self.add()
        }
        let cancelBtn = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alert.addAction(OKBtn)
        alert.addAction(cancelBtn)
        self.present(alert, animated: true, completion: nil)
        
    }
    /// 添加学生
    func add() {
        let no = Int(alert.textFields![0].text!)
        let firstName = alert.textFields![1].text!
        let lastName = alert.textFields![2].text!
        let gender: Gender
        switch alert.textFields![3].text! {
        case "男":
            gender = .male
        case "女":
            gender = .female
        default:
            gender = .female
        }
        let age = Int(alert.textFields![4].text!)
        let student = Student(stuNo: no!, firstName: firstName, lastName: lastName, age: age!, gender: gender)
        students.append(student)
        
        table.reloadData()
    }
    // MARK: delegate
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = tableTitle[indexPath.section]
        
        let name: String
        if indexPath.section == 0 {
            name = teachers[indexPath.row].fullName
        } else {
            name = students[indexPath.row].fullName
        }
        
        let message = "you selected \(category), name: \(name)"
        
        let alert = UIAlertController(title: "系统提示", message: message, preferredStyle: .alert)
        let OKBtn = UIAlertAction(title: "确定", style: .default, handler: nil)
        alert.addAction(OKBtn)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: data source
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            if indexPath.section == 0 {
                teachers.remove(at: indexPath.row)
            } else {
                students.remove(at: indexPath.row)
            }
            
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if sourceIndexPath.section != destinationIndexPath.section {
            tableView.reloadData()
        } else {
            if sourceIndexPath.section == 0 {
                teachers.insert(teachers.remove(at: sourceIndexPath.row), at: destinationIndexPath.row)
            } else {
                students.insert(students.remove(at: sourceIndexPath.row), at: destinationIndexPath.row)
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableTitle.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableTitle[section]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

