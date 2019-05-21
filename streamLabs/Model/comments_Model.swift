//
//  comments_Model.swift
//  streamLabs
//
//  Created by Sajjad Sarkoobi on 5/20/19.
//  Copyright © 2019 sarkoobi. All rights reserved.
//

import Foundation

// MARK: - CommentsModel
struct Comments_Model: Codable {
    let comments: Comments
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.comments = try container.decodeIfPresent(Comments.self, forKey: .comments) ?? Comments()
    }
    
    init() {
        self.comments = Comments()
    }
}

// MARK: - Comments
struct Comments: Codable {
    let messages: [Message]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.messages = try container.decodeIfPresent([Message].self, forKey: .messages) ?? [Message]()
    }
    
    init() {
        self.messages = [Message()]
    }
    
}

// MARK: - Message
struct Message: Codable {
    let name, message: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.message = try container.decodeIfPresent(String.self, forKey: .message) ?? ""
    }
    
    init() {
        self.name = ""
        self.message = ""
    }
    
}
