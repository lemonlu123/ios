//: Playground - noun: a place where people can play

import UIKit

//找出从1-10000的所有质数，将找出的质数存入可变数组，对数组进行正反排序并输出结果(采用5种以上的方法实现)
//1.....10000的质数
var primes = [Int]()
for i in 2...10000{
    var isPrime = true
    for j in 2..<i {
        if i % j == 0 {
            isPrime = false
        }
    }
    if isPrime {
        primes.append(i)
    }
}
primes.sort(by:{
    (x,y) in
    return x<y  //正序，若为反序则为：return x>y
})
print(primes)
//法二：
func compare(x:Int,y:Int) -> Bool {
    return x<y     // //正序，若为反序则为：return x>y
}
//法三：
primes.sort(by:{
    (x,y) in
    x<y  //正序，若为反序则为： x>y
})
//法四：
primes.sort(by:{ $0 < $1 })     //正序，若为反序则为： $0>$1
//法五：
primes.sort{ $0 < $1 }     //正序，若为反序则为： $0>$1
//法六：
primes.sort(by: <)    //正序，若为反序则为： >

//枚举、类、派生
enum Gender{
    case male,female
}
class Person{
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    var fullName:String{ return firstName + lastName }
    init(firstName:String,lastName:String,age:Int,gender:Gender){        //构造函数
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    convenience init(firstName:String){        //便利构造函数
        self.init(firstName:firstName,lastName:"",age:18,gender:Gender.female)
    }
    func description() -> String{
        return "name:\(fullName) age:\(age) gender:\(gender)"
    }
}
func == (left:Person,right:Person) -> Bool {        //==的重载
    if left.fullName == right.fullName && left.age == right.age {
        return true
    }
    else{ return false }
}
func != (left:Person,right:Person) -> Bool {    //!=的重载
    if left.fullName == right.fullName && left.age == right.age {
        return false
    }
    else{ return true }
}
class Teacher:Person{        //Teacher类
    var title:String
    init (firstName:String,lastName:String,age:Int,gender:Gender,title:String){
        self.title = title
        super.init(firstName:firstName,lastName:lastName,age:age,gender:gender)
    }
    override func description() -> String {
        return super.description() + "title:\(title)"
    }
}
class Student:Person{        //Student类
    var stuNo:String
    init (firstName:String,lastName:String,age:Int,gender:Gender,stuNo:String){
        self.stuNo = stuNo
        super.init(firstName:firstName,lastName:lastName,age:age,gender:gender)
    }
    override func description() -> String {
        return super.description() + "stuNo:\(stuNo)"
    }
}
//问题1测试
//实现Person类
var person1=Person(firstName:"lingo")
var person2=Person(firstName:"yuan",lastName:"linshuang",age:19,gender:Gender.male)
var person3=Person(firstName:"lingo")
print(person1.description())
print(person2.description())
print(person3.description())
if person1 == person3 {
    print("same people")
}
if person1 != person2 {
    print("different people")
}
//问题2测试
//从Person分别派生Teacher类和Student类
var stu=Student(firstName:"yuan",lastName:"lin",age:19,gender:Gender.male,stuNo:"001")
var t2=Teacher(firstName:"yuan",lastName:"lin",age:19,gender:Gender.male,title:"IOS")
print(stu.description())
print(t2.description())
//问题3测试
//分别构造多个Person、Teacher和Student对象，并将这些对象存入同一个数组中
var s1=Student(firstName:"yuan",lastName:"lin",age:19,gender:Gender.male,stuNo:"001")
var t1=Teacher(firstName:"yuan",lastName:"lin",age:19,gender:Gender.male,title:"IOS")
var p1=Person(firstName:"lingo")
var p2=Person(firstName:"bingo")
var persons = [s1,t1,p1,p2]
print(s1.description())
print(t1.description())
print(p1.description())
print(p2.description())
print(persons)
//问题4测试
//分别统计Person、Teacher和Student对象的个数并放入一字典中，统计完后输出字典内容
var s1=Student(firstName:"yuan",lastName:"lin",age:19,gender:Gender.male,stuNo:"001")
var t1=Teacher(firstName:"yuan",lastName:"lin",age:19,gender:Gender.male,title:"IOS")
var p1=Person(firstName:"lingo")
var p2=Person(firstName:"bingo")
var persons = [s1,t1,p1,p2]
var dic = Dictionary<String,Int>()
var countPerson = 0
var countStudent = 0
var countTeacher = 0
for x in persons{
    countPerson = countPerson+1
    if x is Student {
        countStudent = countStudent+1
    }
    if x is Teacher {
        countTeacher = countTeacher+1
    }
}
dic["person"] = countPerson
dic["student"] = countStudent
dic["teacher"] = countTeacher
print(dic)
//问题5测试
//按age排序：
var s1=Student(firstName:"yuan",lastName:"lin",age:19,gender:Gender.male,stuNo:"001")
var t1=Teacher(firstName:"yuan",lastName:"Bin",age:43,gender:Gender.male,title:"IOS")
var p1=Person(firstName:"lingo")
var p2=Person(firstName:"bingo")
var persons = [s1,t1,p1,p2]
persons.sort { $0.age > $1.age }
for p in persons {
    print(p.description())
}
//按fullName排序：
persons.sort { $0.fullName > $1.fullName }
for p in persons {
    print(p.description())
}
按gender+age排序：
//为了方便排序，需修改Gender
enum Gender:Int{
    case male,female
    static func >(lhs: Gender, rhs: Gender) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
var s1=Student(firstName:"yuan",lastName:"lin",age:19,gender:Gender.male,stuNo:"001")
var t1=Teacher(firstName:"yuan",lastName:"Bin",age:43,gender:Gender.male,title:"IOS")
var p1=Person(firstName:"lingo")
var p2=Person(firstName:"bingo")
var persons = [s1,t1,p1,p2]
persons.sort { return ($0.age > $1.age)&&($0.gender > $1.gender) }
for p in persons {
    print(p.description())
}
