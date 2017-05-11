//: Playground - noun: a place where people can play

import UIKit

/*: 
 Generic Functions
 */

/*:
 non generic function
 */
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt: \(someInt), anotherInt: \(anotherInt)")


/*:
 generic function 
 */
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt2 = 3
var anotherInt2 = 107
swapTwoValues(&someInt2, &anotherInt2)
print("someInt2: \(someInt), anotherInt2: \(anotherInt)")
