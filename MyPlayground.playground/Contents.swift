//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var name:String = "George"

print("Hello " + name + ".")

var int:Int = 9

int = int * 2

int /= 4

var anotherInt = 7

print(int * anotherInt)

print("The value of int is \(int)")


var bool:Bool = true;

var number:Double = 5

print(number * Double(5))

print("The product of \(number) and 5 is: \(number * Double(5))")

var array = [17, 25, 13, 47]

print(array[0])

print(array.count)

array.append(56)

array.removeAtIndex(3)

print(array)

array.sort()

var dictionary = ["computer":"something to play Call of Duty on","coffee":"best drink ever"]

print(dictionary["coffee"]!)

print(dictionary.count)

dictionary["pen"] = "definition"

dictionary.removeValueForKey("computer")

print(dictionary)


var age = 20

if age >= 18 {
    
    print("You can play!")
    
} else {
    
    print("Sorry, you're too young")
    
}

if name == "George" {
    
    print("Hi " + name + " you can play!")

} else {

    print("Sorry, " + name + " you can't play")

}


for var i = 20; i > 10; i -= 1 {
    print(i)
}


var arr = [8,3,9,91]

for (index,value) in arr.enumerate() {
    //print(value)
    arr[index] = value + 1
}




var numberVal = 47

var isPrime = true

if numberVal == 1 {
    isPrime = false
}

if(numberVal>2) {
    for var i=2; i < numberVal; i++ {
        if numberVal % i == 0 {
            isPrime = false;
        }
    }
}

print(isPrime)



