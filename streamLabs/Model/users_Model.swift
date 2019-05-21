//
//  users_Model.swift
//  streamLabs
//
//  Created by Sajjad Sarkoobi on 5/20/19.
//  Copyright © 2019 sarkoobi. All rights reserved.
//

import Foundation


// MARK: - Users
struct Users_Model: Codable {
    let items: Items
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.items = try container.decodeIfPresent(Items.self, forKey: .items) ?? Items()
    }
    
    init() {
        self.items = Items()
    }
}

// MARK: - Items
struct Items: Codable {
    let users: [User]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.users = try container.decodeIfPresent([User].self, forKey: .users) ?? [User]()
    }
    
    init() {
        self.users = [User]()
    }
}

// MARK: - User
struct User: Codable {
    let name: String
    let avatar: String
    let showCounter, showStar: Bool
    let counter: Int
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.avatar = try container.decodeIfPresent(String.self, forKey: .avatar) ?? ""
        self.showCounter = try container.decodeIfPresent(Bool.self, forKey: .showCounter) ?? false
        self.showStar = try container.decodeIfPresent(Bool.self, forKey: .showStar) ?? false
        self.counter = try container.decodeIfPresent(Int.self, forKey: .counter) ?? 0
    }
    
    init() {
        self.name = ""
        self.avatar = ""
        self.showCounter = false
        self.showStar = false
        self.counter = 0
    }
    
}


