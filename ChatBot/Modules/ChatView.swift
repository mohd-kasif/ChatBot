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
    init(){
//        for familyName in UIFont.familyNames{
//            print(familyName)
//            for fontName in UIFont.fontNames(forFamilyName: familyName){
//                print("-----\(fontName)")
//            }
//        }
    }
    var body: some View {
        VStack{
            Text("Ask me anything")
                .fontWeight(.bold)
                .font(.custom("Avenir-Medium", size: 24))
                
        }
        ScrollViewReader{proxy in
            ScrollView{
                LazyVStack{
                    ForEach(vm.chatModel){item in
                        chatBox(item)
                            .padding(5)
                    }
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
                        .foregroundColor(.white)
                        .frame(width:30, height: 30)
                }
                .frame(width: 50, height: 50)
                .background(vm.isLoading ? Color.assistantBackground : .blue)
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
                Text(model.localizedKey)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5, corners: [.topLeft,.topRight,.bottomLeft])
                    .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
            } else {
                if vm.isThinking{
                    
                }
                Text(model.localizedKey)
                    .padding()
                    .background(Color.assistantBackground)
                    .cornerRadius(5, corners: [.topRight, .bottomRight,.bottomLeft])
                    .shadow(color: Color.darkShadow, radius: 3, x: 2, y: 2)
                Spacer(minLength: 30)
            }
        }
    }
}
//
//#Preview {
//    ChatView()
//}





