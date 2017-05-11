//: Playground - noun: a place where people can play

import UIKit
//: non generic style
struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}
var nonGeneric = IntStack()
nonGeneric.push(1)
nonGeneric.pop()

//: generic  style
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var generic = Stack<Int>();
generic.push(1)
generic.pop()

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
print(generic.topItem)
