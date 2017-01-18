//
//  Shape.swift
//  swTest
//
//  Created by LIM on 11.11.2016.
//  Copyright © 2016 LIM. All rights reserved.
//

import Foundation

class Shape : Hashable {
    var numberOfSides: Int = 0
    var name: String
    
    var hashValue: Int {
        get {
        return numberOfSides ^ name.hashValue
        }
    }
    
    static func == (lhs: Shape, rhs: Shape) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    static func < (lhs: Shape, rhs: Shape) -> Bool {
        return lhs.hashValue < rhs.hashValue
    }
    
    init(name: String) {
        self.name = name
        self.numberOfSides = self.name.lengthOfBytes(using: String.Encoding.utf8)
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: Shape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        self.numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

class Circle: Shape {
    var radius: Double
    var other: String?
    init(radius: Double, name: String)
    {
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double {
      return  M_PI * pow(self.radius, 2)
    }
    
    override func simpleDescription() -> String {
        let r = self.area()
        if let o = other {
            print(o)
        }
      
        return "A Circle with radius \(radius) ad area \(r)"
    }
}

enum Suit:String {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    func color() -> String {
        switch self
        {
        case .clubs, .diamonds:
            return "black"
        case .hearts, .spades:
            return "with"
        }
    }
}
