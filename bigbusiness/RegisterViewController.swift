//
//  RegisterViewController.swift
//  helpby
//
//  Created by zzy on 12/9/15.
//  Copyright © 2015 zzy. All rights reserved.
//

import UIKit


class RegisterViewController: UIViewController, UITextFieldDelegate, UIAlertViewDelegate {

    var line1: UILabel!
    var line2: UILabel!
    var backGroundView: UIView!
    var emailTxt: UITextField!
    var passwordTxt: UITextField!
    var vetifyBtn: UIButton!
    var emailImg: UIImageView!
    var passwordImg: UIImageView!

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = CustomColor(239, g: 239, b: 239)
        let titleLbl = UILabel(frame: CGRectMake(0, 0, 20, 20))
        titleLbl.backgroundColor = UIColor.clearColor()
        titleLbl.font = UIFont.systemFontOfSize(18)
        titleLbl.textAlignment = .Center
        titleLbl.textColor = UIColor.whiteColor()
        titleLbl.text = "注册"
        self.navigationItem.titleView = titleLbl
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_action_arrow_left")?.imageWithRenderingMode(.AlwaysOriginal), style: .Plain, target: self, action: #selector(RegisterViewController.backClick))
        self.navigationController!.navigationBarHidden = false
        
        initView()
    }
    
    func backClick() {
    
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func initView() {
    
        setBackGround()
        setMiddleView()
        setBottomBtn()

    }
    
    func setBackGround() {
    
        self.backGroundView = UIView()
        self.backGroundView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.backGroundView)
        self.backGroundView.mas_makeConstraints{ make in
            
            make.top.equalTo()(self.view.mas_top).with().offset()(UIAdapter.transferHeight(90))
            make.height.equalTo()(UIAdapter.transferHeight(100))
            make.left.equalTo()(self.view.mas_left)
            make.right.equalTo()(self.view.mas_right)
            
        }
    }
    
    func setMiddleView() {
    
        self.emailImg = UIImageView()
        self.emailImg.image = UIImage(named: "login_phone")
        self.backGroundView.addSubview(self.emailImg)
        self.emailImg.mas_makeConstraints{ make in
            
            make.top.equalTo()(self.backGroundView.mas_top).with().offset()(UIAdapter.transferHeight(15))
            make.bottom.equalTo()(self.backGroundView.mas_top).with().offset()(UIAdapter.transferHeight(36))
            make.left.equalTo()(self.view.mas_left).with().offset()(UIAdapter.transferWidth(20))
            make.right.equalTo()(self.view.mas_left).with().offset()(UIAdapter.transferWidth(33))
            
        }
        
        self.emailTxt = UITextField()
        self.emailTxt.delegate = self
        self.emailTxt.returnKeyType = .Done
        self.emailTxt.font = UIFont.systemFontOfSize(13)
        self.emailTxt.placeholder = "请输入电子邮件"
        self.backGroundView.addSubview(self.emailTxt)
        self.emailTxt.mas_makeConstraints{ make in
            
            make.top.equalTo()(self.backGroundView.mas_top).with().offset()(UIAdapter.transferHeight(15))
            make.bottom.equalTo()(self.backGroundView.mas_top).with().offset()(UIAdapter.transferHeight(36))
            make.left.equalTo()(self.emailImg.mas_right).with().offset()(UIAdapter.transferWidth(5))
            make.right.equalTo()(self.view.mas_right)
            
        }
        
        self.line1 = UILabel()
        self.line1.backgroundColor = CustomColor(239, g: 239, b: 239)
        self.backGroundView.addSubview(self.line1)
        self.line1.mas_makeConstraints{ make in
            
            make.centerY.equalTo()(self.backGroundView.mas_centerY)
            make.height.equalTo()(1)
            make.left.equalTo()(self.view.mas_left).with().offset()(UIAdapter.transferWidth(3))
            make.right.equalTo()(self.view.mas_right).with().offset()(UIAdapter.transferWidth(-3))
            
        }
        
        self.passwordImg = UIImageView()
        self.passwordImg.image = UIImage(named: "lock")
        self.backGroundView.addSubview(self.passwordImg)
        self.passwordImg.mas_makeConstraints{ make in
            
            make.top.equalTo()(self.line1.mas_bottom).with().offset()(UIAdapter.transferHeight(15))
            make.bottom.equalTo()(self.line1.mas_bottom).with().offset()(UIAdapter.transferHeight(36))
            make.left.equalTo()(self.view.mas_left).with().offset()(UIAdapter.transferWidth(18))
            make.right.equalTo()(self.view.mas_left).with().offset()(UIAdapter.transferWidth(35))
            
        }
        
        self.passwordTxt = UITextField()
        self.passwordTxt.delegate = self
        self.passwordTxt.secureTextEntry = true
        self.passwordTxt.returnKeyType = .Done
        self.passwordTxt.font = UIFont.systemFontOfSize(13)
        self.passwordTxt.placeholder = "请输入密码"
        self.backGroundView.addSubview(self.passwordTxt)
        self.passwordTxt.mas_makeConstraints{ make in
            
            make.top.equalTo()(self.line1.mas_bottom).with().offset()(UIAdapter.transferHeight(15))
            make.bottom.equalTo()(self.line1.mas_bottom).with().offset()(UIAdapter.transferHeight(36))
            make.left.equalTo()(self.passwordImg.mas_right).with().offset()(UIAdapter.transferWidth(5))
            make.right.equalTo()(self.view.mas_right)
            
        }
        
    }
    
    func setBottomBtn() {
    
        self.vetifyBtn = UIButton()
        vetifyBtn.setTitle("注册", forState: .Normal)
        self.vetifyBtn.backgroundColor = CustomColor(29, g: 172, b: 239)
        self.vetifyBtn.addTarget(self, action: #selector(RegisterViewController.registerClick(_:)), forControlEvents: .TouchUpInside)
        self.vetifyBtn.layer.cornerRadius = 5
        self.view.addSubview(self.vetifyBtn)
        self.vetifyBtn.mas_makeConstraints{ make in
            
            make.top.equalTo()(self.backGroundView.mas_bottom).with().offset()(UIAdapter.transferHeight(25))
            make.bottom.equalTo()(self.backGroundView.mas_bottom).with().offset()(UIAdapter.transferHeight(70))
            make.left.equalTo()(self.view.mas_left).with().offset()(UIAdapter.transferWidth(15))
            make.right.equalTo()(self.view.mas_right).with().offset()(-UIAdapter.transferWidth(15))
            
        }
    }
    
    //验证按钮点击事件
    func registerClick(sender: UIButton) {
        
        //如果为空
        if !self.passwordTxt.notEmpty() || !self.emailTxt.notEmpty() {
            
            myAlertView("温馨提示", msg: "邮箱或者密码不能为空")
            return
        }

        
        let buser = BmobUser()
        buser.username = self.emailTxt.text
        buser.password = self.passwordTxt.text
        buser.email = self.emailTxt.text
        buser.setObject("normalUser", forKey: "UserType")
        self.showProgress()
        
        
        buser.signUpInBackgroundWithBlock { (isSuccessful, error) -> Void in
            
            self.closeProgress()
            // 如果注册成功
            if isSuccessful {
                
                let alert = UIAlertView()
                alert.title = "提示"
                alert.addButtonWithTitle("确定")
                alert.cancelButtonIndex=0
                alert.message = "注册成功"
                alert.delegate = self
                alert.show()
            }
                
            else {
                
                myAlertView("温馨提示", msg: "注册失败")
                print(error)
                return
            }

        }
        
    }
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.emailTxt.resignFirstResponder()
        self.passwordTxt.resignFirstResponder()

    }


    func showProgress() {
        
        self.view.userInteractionEnabled = false
        SVProgressHUD.setForegroundColor(UIColor.orangeColor())
        SVProgressHUD.show()
    }
    
    func closeProgress() {
        
        SVProgressHUD.dismiss()
        self.view.userInteractionEnabled = true
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }

}
