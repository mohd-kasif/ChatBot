//
//  API.swift
//  ChatBot
//
//  Created by Mohd Kashif on 24/05/24.
//

import Foundation
enum API{
    
    static let apiKey=GetApi.loadKey(for: "API")
}

struct GetApi{
    static private var dictConfig : Dictionary<String, Any>=["":""]
    static private func getApiKey(){
        if let plist=Bundle.main.url(forResource: "GenerateKey", withExtension: "plist"){
            do {
                let plistData=try Data(contentsOf: plist)
                if let dict=try PropertyListSerialization.propertyList(from: plistData, options: [], format: nil) as? [String:Any]{
                    self.dictConfig=dict
                }
            } catch{
                print("error in feticin")
            }
        }
    }
    
    static func loadKey(for key:String)->String{
        getApiKey()
        return dictConfig[key] as! String
    }
}
