
/*
 题目：输出1-10000之间的质数 将找出的质数存入可变数组，对数组进行正反排序并输出结果（使用5种以上方法）
 */

   var arrayTest : [Int] = [Int]()
   var isPreimNum = true
     for item in 2...10000 {
            for j in 2..<item {
                    if item % j == 0 {
                            isPreimNum = false
                            break
                       }
                }
            if isPreimNum {
                   arrayTest.append(item)
                }
            isPreimNum = true
        }
    print(arrayTest)

    arrayTest.sort(by: {(num1, num2) in
           return num1 > num2
        })
    print("1.降序输出:")
    print(arrayTest)

    arrayTest.sort(by: {
            return $0 > $1
        })
    print("2.降序输出:")
    print(arrayTest)

    arrayTest.sort(by: {
            $0 > $1
        })
    print("3.降序输出:")
    print(arrayTest)

    arrayTest.sort(){
            $0 > $1
        }
    print("4.降序输出:")
    print(arrayTest)

    func test(num1: Int, num2: Int) -> Bool {
            return num1 > num2
        }
    arrayTest.sort(by: test)
    print("5.降序输出:")
    print(arrayTest)
