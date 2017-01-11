//
//  ForgetPasswordViewController.swift
//  bigbusiness
//
//  Created by zzy on 12/30/15.
//  Copyright © 2015 zzy. All rights reserved.
//

import UIKit

class ForgetPasswordViewController: UIViewController, UITextFieldDelegate {

    var line1: UILabel!
    var backGroundView: UIView!
    var emailTxt: UITextField!
    var vetifyBtn: UIButton!
    var emailImg: UIImageView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = CustomColor(239, g: 239, b: 239)
        let titleLbl = UILabel(frame: CGRectMake(0, 0, 20, 20))
        titleLbl.backgroundColor = UIColor.clearColor()
        titleLbl.text = "找回密码"
        titleLbl.font = UIFont.systemFontOfSize(18)
        titleLbl.textAlignment = .Center
        titleLbl.textColor = UIColor.whiteColor()
        self.navigationItem.titleView = titleLbl
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_action_arrow_left")?.imageWithRenderingMode(.AlwaysOriginal), style: .Plain, target: self, action: #selector(ForgetPasswordViewController.backClick))
    
        
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
            make.height.equalTo()(UIAdapter.transferHeight(50))
            make.left.equalTo()(self.view.mas_left)
            make.right.equalTo()(self.view.mas_right)
            
        }
    }
    
    func setMiddleView() {
        
        self.emailImg = UIImageView()
        self.emailImg.image = UIImage(named: "login_phone")
        self.backGroundView.addSubview(self.emailImg)
        self.emailImg.mas_makeConstraints{ make in
            
            make.centerY.equalTo()(self.backGroundView.mas_centerY)
            make.height.equalTo()(UIAdapter.transferWidth(21))
            make.left.equalTo()(self.view.mas_left).with().offset()(UIAdapter.transferWidth(20))
            make.right.equalTo()(self.view.mas_left).with().offset()(UIAdapter.transferWidth(33))
            
        }
        
        self.emailTxt = UITextField()
        self.emailTxt.returnKeyType = .Done
        self.emailTxt.font = UIFont.systemFontOfSize(13)
        self.emailTxt.placeholder = "请输入电子邮件"
        self.emailTxt.delegate = self
        self.backGroundView.addSubview(self.emailTxt)
        self.emailTxt.mas_makeConstraints{ make in
            
            make.centerY.equalTo()(self.backGroundView.mas_centerY)
            make.height.equalTo()(UIAdapter.transferWidth(21))
            make.left.equalTo()(self.emailImg.mas_right).with().offset()(UIAdapter.transferWidth(5))
            make.right.equalTo()(self.view.mas_right)
            
        }
        
    }
    
    func setBottomBtn() {
        
        self.vetifyBtn = UIButton()
        vetifyBtn.setTitle("验证", forState: .Normal)
        self.vetifyBtn.backgroundColor = CustomColor(29, g: 172, b: 239)
        self.vetifyBtn.addTarget(self, action: #selector(ForgetPasswordViewController.vertifyClick), forControlEvents: .TouchUpInside)
        self.vetifyBtn.layer.cornerRadius = 5
        self.view.addSubview(self.vetifyBtn)
        self.vetifyBtn.mas_makeConstraints{ make in
            
            make.top.equalTo()(self.backGroundView.mas_bottom).with().offset()(UIAdapter.transferHeight(25))
            make.bottom.equalTo()(self.backGroundView.mas_bottom).with().offset()(UIAdapter.transferHeight(70))
            make.left.equalTo()(self.view.mas_left).with().offset()(UIAdapter.transferWidth(15))
            make.right.equalTo()(self.view.mas_right).with().offset()(-UIAdapter.transferWidth(15))
            
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    func vertifyClick() {
    
        //如果为空
        if !self.emailTxt.notEmpty() {
            
            myAlertView("温馨提示", msg: "邮箱不能为空")
            return
        }
        
        BmobUser.requestPasswordResetInBackgroundWithEmail(self.emailTxt.text)
        myAlertView("提示", msg: "密码重置邮件已发送，请注意查收邮箱")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.emailTxt.resignFirstResponder()
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
