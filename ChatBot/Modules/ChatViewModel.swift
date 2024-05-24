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
    
    let model=GenerativeModel(name: "gemini-pro", apiKey: API.apiKey)
    @Published var message:String=""
    
    func sendMessage() async {
        self.isLoading=true
        let cmodel=ChatModel(message: LocalizedStringKey(message), owener: .user)
        self.chatModel.append(cmodel)
        do{
            let response = try await model.generateContent(message)
            if let text = response.text{
                self.isLoading=false
                let localizedText=LocalizedStringKey(text)
                print(text,"text response")
                let model=ChatModel(message: localizedText, owener: .gpt)
                self.chatModel.append(model)
                message=""
            }
        }
        catch {
            print(error.localizedDescription,"error from api")
        }
 
    }
}
