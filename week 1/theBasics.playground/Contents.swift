import UIKit

//create constans
let name = "fernando"

//create variable
var car = "acura"
car = "honda"


print(car)

// string interpolation

let interpolation = "\(name) just bought an \(car)"

let multiLine = """
                this is a multi like string
                there is not many use for this but still good to know.
                """

print(multiLine)
// var will make it mutable let will keep the same size
let array = [1,2]
let array2: [Int] = []
let array3 = [Int]()
let array4 = Array<Int>()

var array5 = array
// if append to let the application will crash
array5.append(5)
print(array5)

//optionals is an enum what has two values type and no type also call nil

var userPassword: String?

userPassword = "password"

// force unwraping: do not use this in production the application will crash if userpassword is nil
print(userPassword!)
// optional binding
if let password = userPassword {
    print(password)
}

// optional chaning

let length = userPassword?.count

/*
 this is how we make a multi line comment
 
 also nextwe us
 nil coalecin operator is used to unwrap with a default value
 */

print(length ?? 0)

// guard and using a fuction with parameter us string which is an optional the return type is Void



printKey(userPassword)

//function with a return type tuple


func getlastAndposition(_ password: String?) -> (String, Int) {
    guard let valueUnwraped = password else { return ("you need a value", 0) }
    return (String(valueUnwraped.last!), valueUnwraped.count)
}

print(getlastAndposition(userPassword))

// iterate though array and if the value id greter than 3 multiply by 2 then print new array
var numbers = [1,4,3,8]

var newArray = numbers.map { number -> Int in
    if number > 3 {
        return number * 2
    }
    return number
}

print(newArray)
