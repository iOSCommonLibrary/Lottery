//
//  UITextfiledExtession.swift
//  helpby
//
//  Created by zzy on 12/10/15.
//  Copyright © 2015 zzy. All rights reserved.
//

import Foundation

extension UITextField {

    //验证非空
    func notEmpty() -> Bool {
    
        return !(self.text?.isEmpty)!
    }
    
    
    func validate(RegEx:String) -> Bool {
    
        let predicate = NSPredicate(format: "SELF MATCHES %@", RegEx)
        return predicate.evaluateWithObject(self.text)
    }
    
    //验证邮箱
    func validateEmail() -> Bool {
    
        return self.validate("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}")
    }
    
    //验证手机号
    func validatePhoneNumber() -> Bool {
        
        return self.validate("^\\d{11}$")
    }
    
    //验证密码
    func validatePassword() -> Bool {
        
        return self.validate("^[A-Z0-9a-z]{6,18}")
    }

}