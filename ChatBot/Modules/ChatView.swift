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
    var body: some View {
        VStack{
            Text("Ask me anything")
                
        }
        ScrollViewReader{proxy in
            ScrollView{
                LazyVStack{
                    ForEach(vm.chatModel){item in
                        chatBox(item)
                            .padding(5)
                    }
//                    if vm.isLoading{
//                        ProgressView()
//                            .frame(width: 100,height: 50)
//                            .foregroundColor(.blue)
//                    }
                    Color.clear
                        .frame(height: 1)
                        .id("bottom")
                }
                .alert(vm.errorMessage,isPresented: $vm.showingAlert, actions: {})
            }
            .onReceive(vm.$chatModel.throttle(for: 0.5, scheduler: RunLoop.main, latest: true)){message in
                guard !message.isEmpty else {return}
                withAnimation{
                    proxy.scrollTo("bottom")
                }
            }
        }
        .padding([.leading,.trailing],15)

        HStack{
            NeumorphicStyleTextField(textField:TextField("Enter a prompt here", text: $vm.message, axis: .vertical))
            Button(action: {
                Task{
                    await vm.sendMessage()
                }
             
            }, label: {
                VStack{
                    Image(systemName: "paperplane.fill")
                        .resizable()
                        .foregroundColor(vm.isLoading ? .gray : .white)
                        .frame(width:30, height: 30)
                }
                .frame(width: 50, height: 50)
                .background(vm.isLoading ? .gray : .blue)
                .cornerRadius(6)
             
               
            })
            .disabled(vm.message.isEmpty ? true : false)
        }
        .disabled(vm.isLoading ? true : false)
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
//                    .cornerRadius(10)
                    .cornerRadius(5, corners: [.topLeft,.topRight,.bottomLeft])
            } else {
                Text(model.message)
                    .padding()
                    .background(.green)
                    .cornerRadius(5, corners: [.topRight, .bottomRight,.bottomLeft])
                Spacer(minLength: 30)
            }
        }
    }
}
//
//#Preview {
//    ChatView()
//}


struct NeumorphicStyleTextField: View {
    var textField: TextField<Text>
    var body: some View {
        HStack {
            textField
            }
            .padding()
            .foregroundColor(.black)
            .background(Color.background)
            .cornerRadius(4)
            .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
            .shadow(color: Color.lightShadow, radius: 3, x: -2, y: -2)

        }
}

extension Color {
    static let lightShadow = Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255)
    static let darkShadow = Color(red: 163 / 255, green: 177 / 255, blue: 198 / 255)
    static let background = Color(red: 224 / 255, green: 229 / 255, blue: 236 / 255)
    static let neumorphictextColor = Color(red: 132 / 255, green: 132 / 255, blue: 132 / 255)
}
