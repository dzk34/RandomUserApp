//
//  User.swift
//  RandomUserApp
//
//  Created by Khaled on 08/04/2025.
//

import Foundation

struct UserList: Codable {
    let results: [User]
}

struct User: Codable {
    let name: Identity
    let gender: String
    let location: Location
    let email: String
    let loign: Login
    let dob: DateOfBirth
    let registered: Registration
    let phone: String
    let cell: String
    let id: ID
    let picture: Picture
    let nat: String
}

struct Identity: Codable {
    let title: String
    let first: String
    let last: String
}

struct Location: Codable {
    let street: Street
    let city: String
    let state: String
    let country: String
    let postcode: Int
    let coordinates: Coordinates
    let timezone: TimeZone

}

struct Street: Codable {
    let number: Int
    let name: String
}

struct Coordinates: Codable {
    let latitude: Double
    let longitude: Double
}

struct TimeZone: Codable {
    let offset: String
    let description: String
}

struct Login: Codable {
    let uuid: UUID
    let username: String
    let password: String
    let salt: String
    let md5: String
    let sha1: String
    let sha256: String
}

struct DateOfBirth: Codable {
    let date: Date
    let age: Int
}

struct Registration: Codable {
    let date: Date
    let age: Int
}

struct ID: Codable {
    let name: String
    let value: String?
}

struct Picture: Codable {
    let large: String
    let medium: String
    let thumbnail: String
}
