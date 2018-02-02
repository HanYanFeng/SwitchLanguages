//
//  ViewController.swift
//  Language
//
//  Created by Apple on 2018/2/2.
//  Copyright © 2018年 NumMayScore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label = UILabel(frame: CGRect(x: 0, y: 150, width: self.view.frame.width, height: 100))
        label.text = LocalizationTool.shareInstance.valueWithKey(key: "ok")
        self.view.addSubview(label)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if LocalizationTool.shareInstance.language == .China {
            LocalizationTool.shareInstance.setLanguage(langeuage: .English)
        }else{
            LocalizationTool.shareInstance.setLanguage(langeuage: .China)
        }
        label.text = LocalizationTool.shareInstance.valueWithKey(key: "ok")
    }
}

