//
//  ChatModle.swift
//  ChatBot
//
//  Created by Mohd Kashif on 24/05/24.
//

import Foundation

enum ChatOwner{
    case user, gpt
}

struct ChatModel:Identifiable{
    var id: UUID = .init()
    var message:String
    var owener: ChatOwner
}
