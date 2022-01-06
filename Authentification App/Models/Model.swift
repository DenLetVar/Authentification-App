//
//  Model.swift
//  Authentification App
//
//  Created by Denis on 06.01.2022.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(
             login: "user",
             password: "password",
             person: Person.getPerson()
        )
    }
}

struct Person {
    let name: String
    let surname: String
    let image: String
    let about: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(
            name: "Denis",
            surname: "Bordunov",
            image: "scale_1200.jpeg",
            about: "Приветствую тебя на своей транице"
        )
    }
}
