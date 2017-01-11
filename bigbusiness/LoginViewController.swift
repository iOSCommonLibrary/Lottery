//
//  LoginViewController.swift
//  helpby
//
//  Created by zzy on 12/9/15.
//  Copyright © 2015 zzy. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController, UITextFieldDelegate {

    var isHiddenNav: Bool = false
    
    @IBOutlet var loginBtn: UIButton!
    
    @IBOutlet var phoneTxt: UITextField!
    
    @IBOutlet var passWordTxt: UITextField!
    
    @IBOutlet var line1: UILabel!
    
    @IBOutlet var line2: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if isHiddenNav {
        
            self.navigationController!.navigationBarHidden = true
            
        }else {
        
            self.navigationController!.navigationBarHidden = false
        }
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: .Plain, target: self, action: #selector(LoginViewController.cancelClick))
        
        self.loginBtn.backgroundColor = CustomColor(59, g: 188, b: 121)
        self.loginBtn.layer.cornerRadius = 5
        self.phoneTxt.tintColor = UIColor.grayColor() //改变光标颜色
        self.phoneTxt.delegate = self
        self.passWordTxt.tintColor = UIColor.grayColor()
        self.passWordTxt.delegate = self
        self.passWordTxt.secureTextEntry = true
//        self.phoneTxt.text = "18584500435"
//        self.passWordTxt.text = "123456"

    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }

    
    func cancelClick() {
    
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //注册或者找回密码按钮点击事件
    @IBAction func registerClick(sender: UIButton) {
        
        //如果是忘记密码
        if sender.tag == 1 {
        
            let forgetPasswordView = ForgetPasswordViewController()

            self.navigationController?.pushViewController(forgetPasswordView, animated: true)
        }
        
       //如果是注册
        else {
        
            let registerView = RegisterViewController()
            self.navigationController?.pushViewController(registerView, animated: true)
        }
        
    }
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
    
        if textField.tag == 1 {
        
            self.line1.backgroundColor = UIColor.whiteColor()
        }
        
        else {
        
            self.line2.backgroundColor = UIColor.whiteColor()
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
    
        if textField.tag == 1 {
            
            self.line1.backgroundColor = UIColor.lightGrayColor()
        }
            
        else {
            
            self.line2.backgroundColor = UIColor.lightGrayColor()
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.phoneTxt.resignFirstResponder()
        self.passWordTxt.resignFirstResponder()
    }
    
    //登录按钮点击事件
    @IBAction func LoginClick(sender: UIButton) {
        
        //如果手机号或者密码为空
        if !self.phoneTxt.notEmpty() || !self.passWordTxt.notEmpty(){
        
            myAlertView("温馨提示", msg: "用户名或密码不能为空")
            return
        }
        
//        //邮箱格式验证
//        if !self.phoneTxt.validatePhoneNumber() {
//        
//            myAlertView("温馨提示", msg: "手机号格式不正确")
//            return
//        }
        
        self.showProgress()
//        var hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        BmobUser.loginInbackgroundWithAccount(self.phoneTxt.text!, andPassword: self.passWordTxt.text!) { (user:BmobUser!, error:NSError!) -> Void in
           self.closeProgress()
            //如果登录成功
            if (user != nil) {
                
                let defatluts = NSUserDefaults.standardUserDefaults();
                defatluts.setObject("token", forKey: "token")
                defatluts.synchronize()
                let mainView = MainViewController()
                self.navigationController?.pushViewController(mainView, animated: true)
            }
            
            //登录失败
            else {
            
                myAlertView("温馨提示", msg: "用户名或密码不正确")
            }
        }
    }
    
    func showProgress() {
        
        self.view.userInteractionEnabled = false
        SVProgressHUD.show()
    }
    
    func closeProgress() {
        
        SVProgressHUD.dismiss()
        self.view.userInteractionEnabled = true
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }

}
