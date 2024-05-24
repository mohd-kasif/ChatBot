//
//  ChatModle.swift
//  ChatBot
//
//  Created by Mohd Kashif on 24/05/24.
//

import Foundation
import SwiftUI
enum ChatOwner{
    case user, gpt
}

struct ChatModel:Identifiable{
    var id: UUID = .init()
    var message:LocalizedStringKey
    var owener: ChatOwner
}

