//
//  ChatView.swift
//  ChatBot
//
//  Created by Mohd Kashif on 24/05/24.
//

import Foundation
import SwiftUI

struct ChatView: View {
    @StateObject var vm=ChatViewModel()
    @State var message:String
    var body: some View {
        ScrollView{
            ForEach(vm.chatModel){item in
                LazyVStack{
                    chatBox(item)
                        .padding(5)
                }
            }
        }
        HStack{
            TextField("Enter Prompt", text: $message, axis: .vertical)
            Button(action: {
                vm.apikey()
            }, label: {
                Image(systemName: "paperplane.fill")
            })
        }
        .padding()
    }
    
    func chatBox(_ model:ChatModel)->some View{
        HStack{
            if model.owener == .user{
                Spacer()
                Text(model.message)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            } else {
                Text(model.message)
                    .padding()
                    .background(.green)
                    .cornerRadius(10)
                Spacer()
            }
        }
    }
}

#Preview {
    ChatView(message: "")
}
