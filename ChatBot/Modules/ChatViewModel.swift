//
//  ChatViewModel.swift
//  ChatBot
//
//  Created by Mohd Kashif on 24/05/24.
//

import Foundation

class ChatViewModel:ObservableObject{
    @Published var chatModel:[ChatModel]=[.init(message: "Hello There", owener: .user), .init(message: "My name is kashif", owener: .gpt)]
    
    func apikey(){
        print(API.apiKey,"API Key")
    }
}
