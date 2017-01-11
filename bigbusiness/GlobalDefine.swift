//
//  GlobalDefine.swift
//  LuRenService
//
//  Created by zzy on 11/29/15.
//  Copyright © 2015 zzy. All rights reserved.
//

import Foundation


//let APIKey = "035a00f3de5f08b99936b20e7097fd01"

func CustomColor(r:CGFloat,g:CGFloat,b:CGFloat) -> UIColor {
    
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
}

func myAlertView(title: String?, msg: String?) {
    
    let alert = UIAlertView(title: title, message: msg, delegate: nil, cancelButtonTitle:"确定")
    alert.show()
}