//: Playground - noun: a place where people can play

import UIKit

protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
}

struct Stack<Element>: Container {
    // original Stack<Element> implementation
    var items = [Element]()

    // conformance to the Container protocol
    mutating func append(_ item: Element) {
        //... do somthing
    }
}


extension Array: Container {}


extension Stack where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}
