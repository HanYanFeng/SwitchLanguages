//
//  LocalizationTool.swift
//  Language
//
//  Created by Apple on 2018/2/2.
//  Copyright © 2018年 NumMayScore. All rights reserved.
//

import UIKit

import UIKit

enum Language {
    case English
    case China
    case defout
}

class LocalizationTool {
    static let shareInstance = LocalizationTool()
    private var bundle : Bundle?

    var language: Language = .defout
    
    private init(){
        if let languege = (UserDefaults.standard.value(forKey: "langeuage")) as? String{
            if languege == "zh-Hans-CN" || languege == "zh-Hans" {
                self.setLanguage(langeuage: .China)
            }else{
                self.setLanguage(langeuage: .English)
            }
        }else{
            self.setLanguage(langeuage: .defout)
        }
    }
    
    func valueWithKey(key: String!) -> String {
        let bundle = LocalizationTool.shareInstance.bundle
        let str = bundle?.localizedString(forKey: key, value: nil, table: "Localizable")
        return str!
    }
    
    func setLanguage(langeuage: Language) {
        var str: String?
        switch langeuage {
        case .defout:
            if let languages = (UserDefaults.standard.object(forKey: "AppleLanguages") as? [String])?.first
            {
                if languages == "zh-Hans-CN" || languages=="zh-Hans" {
                    setLanguage(langeuage: .China)
                }else{
                    setLanguage(langeuage: .English)
                }
                return
            }
        case .China:
            str = "zh-Hans"
        case .English:
            str = "en"
        }
        
        UserDefaults.standard.set(str, forKey: "langeuage")
        UserDefaults.standard.synchronize()
        if let path = Bundle.main.path(forResource:str , ofType: "lproj"), let bu = Bundle(path: path) {
            bundle = bu
            self.language = langeuage
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LanguageChanged"), object: nil)
        }
    }
}
