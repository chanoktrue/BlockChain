//: [Previous](@previous)

import Foundation
import UIKit

var greeting = "Hello, playground"

struct User: Decodable {
    let name: String
    let age: Int
}

let json = """
    {
        "name": John Doe",
        "age": 30
    }
"""

print("String: \(json) \n")

guard let jsonData = json.data(using: .utf8) else {
    throw fatalError("Unable to get data.")
}

print("Data: \(String(data: jsonData, encoding: .utf8)) \n")

let user = try? JSONDecoder().decode(User.self, from: jsonData)

print(user)

//: [Next](@next)
