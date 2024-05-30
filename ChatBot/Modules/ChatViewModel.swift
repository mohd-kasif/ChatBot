//
//  ChatViewModel.swift
//  ChatBot
//
//  Created by Mohd Kashif on 24/05/24.
//

import Foundation
import GoogleGenerativeAI
import SwiftUI
@MainActor
class ChatViewModel:ObservableObject{
    @Published var chatModel:[ChatModel]=[]
    @Published var isLoading=false
    @Published var errorMessage:String=""
    @Published var showingAlert:Bool=false
    
    let model=GenerativeModel(name: "gemini-pro", apiKey: API.apiKey)
    @Published var message:String=""
    
    func sendMessage() async {
        self.isLoading=true
        let cmodel=ChatModel(message: message, owener: .user)
        self.chatModel.append(cmodel)
        let assitantMessage=ChatModel(message: "", owener: .gpt)
        chatModel.append(assitantMessage)
        do{
            let result = model.generateContentStream(message)
            for try await line in result{
                if let lastMessage=chatModel.last{
                    let text=lastMessage.message
                    if let newMessage=line.text{
                        message=""
                        self.isLoading=false
                        let comingMessage=ChatModel(message: text+newMessage, owener: .gpt)
                        chatModel[chatModel.count-1]=comingMessage
                    }
                }
            }
            self.isLoading=false
        }
        catch {
            showingAlert=true
            self.isLoading=false
            self.errorMessage=error.localizedDescription
            print(error.localizedDescription,"error from api")
        }
 
    }
}

extension LocalizedStringKey {
    static func +(lhs: LocalizedStringKey, rhs: LocalizedStringKey) -> LocalizedStringKey {
        let lhsString = String(describing: lhs)
        let rhsString = String(describing: rhs)
        return LocalizedStringKey("\(lhsString) \(rhsString)")
    }
}
