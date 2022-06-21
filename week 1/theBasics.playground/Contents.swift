import UIKit

//create constans
let name = "fernando"

//create variable
var car = "acura"
car = "honda"


print(car)

//
// Types
//
var condition: Bool = false

let number = Int()
let number2: Int = 0
let number3 = 3

let decimal: Double = 2
// notice that id we use a double even if youuse a 2 with no decimal point it will be added
print(decimal)
let decimal2 = 2.4

let smallValue: Float = 1.234
print(smallValue)

let word = String()
let word2: String = ""

// string interpolation

let interpolation = "\(name) just bought an \(car)"

// having multiple lines

let multiLine = """
                this is a multi like string
                there is not many use for this but still good to know.
                """

print(multiLine)

// char need to have at laest one value in "" or there is goping the be an error
let letter: Character = "a"
// oy can still optionals
let letter2: Character?

// var will make it mutable let will keep the same size
let array = [1,2]
let array2: [Int] = []
let array3 = [Int]()
let array4 = Array<Int>()

// for a dictionary we use
let dic = [1 : "3"]
//emty dictionary with a number for the key and a string for the value
let dic2 = [Int: String]()

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
 also next we us
 nil coalecin operator to unwrap with a default value
 */

print(length ?? 0)

// guard and using a fuction with parameter us string which is an optional the return type is Void

func printKey(_ userKey: String?) {
    guard let key = userKey else { return }
    print(key + " with guard")
}

printKey(userPassword)

//function with a return type tuple

func getlastAndposition(_ password: String?) -> (String, Int) {
    guard let valueUnwraped = password else { return ("you need a value", 0) }
    return (String(valueUnwraped.last!), valueUnwraped.count)
}

print(getlastAndposition(userPassword))


//conditionals

//condition = true

if condition {
    print("cpndition is true")
} else {
    print("condition is false")
}

// switch


var money = 200

switch money {
case 20:
    print("you have some money")
case 200:
    print("how did you multiply your earnings")
default:
    print("you have no money")
}

// iterate though array and if the value id greter than 3 multiply by 2 then print new array
var numbers = [1,4,3,8]

var newArray = numbers.map { number -> Int in
    if number > 3 {
        return number * 2
    }
    return number
}

print(newArray)

//loops
/*
 this is a normal for loop
 
for i in numbers {
    print(i)
}
 
*/

// this will only print the bimber in the loop that are greater that 2
print("this is a for loop")

for i in numbers where i > 2 {
    print(i)
}

// this a loop that will continuew  while a condition is true
print("this is a while loop")

var count = 0
while count < numbers.count {
    print(count)
    count += 1
}

// repeat is the same as the while but repeate will run at leat one time while might run no times
print("this is a repeat loop")

count = 0
repeat {
    print(count)
    count += 1
} while count < numbers.count

print("---------------------")

// pass by referance
func swapTwoInts(a: inout Int, b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}

var a = 20
var b = 10
swapTwoInts(a: &a, b: &b)

print(a)
