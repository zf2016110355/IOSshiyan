/*
 （1）实现Person类：
 a)    要求具有firstName,  lastName，age，gender等存储属性,fullName计算属性；其中gender是枚举类型（male，female）；
 b)    具有指定构造函数和便利构造函数；
 c)    两个Person实例对象可以用==和!=进行比较；
 d)    Person实例可以直接用print输出；
 （2）    从Person分别派生Teacher类和Student类：
 a)    Teacher类增加属性title，实例可以直接用print输出；
 b)    Student类增加属性stuNo，实例可以直接用print输出；
 （3）    分别构造多个Person、Teacher和Student对象，并将这些对象存入同一个数组中；
 （4）    对数组执行以下要求：
 a)    分别统计Person、Teacher和Student对象的个数并放入一字典中，统计完后输出字典内容；
 b)    对数组按以下要求排序并输出：age、fullName、gender+age；
 */
   enum Gender: Int {
            case male
            case female
            case unknow
            static func >(lhs: Gender, rhs: Gender) -> Bool {
                    return lhs.rawValue < rhs.rawValue
                }
        }


    enum Department {
            case one, two, three
        }



    class Person: CustomStringConvertible  {
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
                    self.init(firstName: firstName, age: 0, gender: Gender.unknow)
                }
    
            required convenience init() {
                    self.init(firstName: "")
                }
    
            //重载==
            static func ==(lhs: Person, rhs: Person) -> Bool {
                    return lhs.fullName == rhs.fullName && lhs.age == rhs.age && lhs.gender == rhs.gender
                }
    
            //重载!=
            static func !=(lhs: Person, rhs: Person) -> Bool {
                    return !(lhs == rhs)
                }
    
            //实现CustomStringConvertible协议中的计算属性，可以使用print直接输出对象内容
            var description: String {
                    return "fullName: \(self.fullName), age: \(self.age), gender: \(self.gender)"
                }
    
    
        }

    var p1 = Person(firstName: "凡")
    var p2 = Person(firstName: "凡", age: 99, gender: .male)
    print(p1)
    print(p1 == p2)
    print(p1 != p2)
