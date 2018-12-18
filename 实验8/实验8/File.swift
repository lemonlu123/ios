//
//  File.swift
//  实验8
//
//  Created by student on 2018/12/18.
//  Copyright © 2018年 严璐. All rights reserved.
//

import Foundation

enum Gender: Int {
    case male    //男性
    case female  //女性
}


//人
class Person{
    var firstName: String  //姓
    var lastName: String  //名
    var age: Int  //年龄
    var gender: Gender  //性别
    
    var fullName: String {  //全名
        get {
            return firstName + lastName
        }
    }
    
    //构造方法
    init(firstName: String, lastName: String, age: Int, gender: Gender) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    
    convenience init(firstName: String, age: Int, gender: Gender) {
        self.init(firstName: firstName, lastName: "", age: age, gender: gender)
    }
    
    convenience init(firstName: String) {
        self.init(firstName: firstName, age: 0, gender: Gender.male)
    }
    
    var description: String {
        return "fullName: \(self.fullName), age: \(self.age), gender: \(self.gender)"
    }
    
}

//教师
class Teacher: Person {
    var teaNo: Int  //标题
    
    //构造方法
    init(teaNo: Int, firstName: String, lastName: String, age: Int, gender: Gender) {
        self.teaNo = teaNo
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    convenience init(teaNo: Int) {
        self.init(teaNo: 0,firstName: "123", lastName: "", age: 0, gender: Gender.female)
    }
    //重写父类属性
    override var description: String {
        return "teaNo: \(self.teaNo), fullName: \(self.fullName), age: \(self.age), gender: \(self.gender)"
    }
    
}

//学生
class Student: Person{
    var stuNo: Int  //学号
    
    //构造方法
    init(stuNo: Int, firstName: String, lastName: String, age: Int, gender: Gender) {
        self.stuNo = stuNo
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    
    convenience init(stuNo: Int) {
        self.init(stuNo: stuNo, firstName: "000", lastName: "", age: 18, gender: Gender.male)
    }
    
    //重写父类属性
    override var description: String {
        return "stuNo: \(self.stuNo), fullName: \(self.fullName), age: \(self.age), gender: \(self.gender)"
    }
}
