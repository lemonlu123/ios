//
//  PersonsTableViewController.swift
//  CoreDataDemo
//
//  Created by student on 2018/12/12
//  Copyright © 2018年 yanlu All rights reserved.
//

import UIKit
import CoreData
class PersonsTableViewController: UITableViewController {

  
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    //学生列表
    var persons:[Person]?
    //获得上下文
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    fileprivate func reloadData() {
        //找到所有的记录
        let  fetch:NSFetchRequest<Person> = Person.fetchRequest()
        //按照姓名升序排序
        fetch.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        persons = try? context.fetch(fetch)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //??若为空，则给默认值0
        return persons?.count ?? 0
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDetail" {
            let showDetailVC = segue.destination as! DetailViewController
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) ,let person = persons?[indexPath.row]{
                print("indexPath:\(indexPath)")
                showDetailVC.person = person
            }
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        if let currentPerson = persons?[indexPath.row] {
            cell.textLabel?.text = currentPerson.name
            print("currentName:\(String(describing: currentPerson.name))")
        }
        return cell
    }
    
    
}
