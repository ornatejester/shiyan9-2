//
//  ViewController.swift
//  UIAlertController
//
//  Created by jiang on 2018/11/19.
//  Copyright © 2018年 jiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var myView: UITableView!
    var users=[User]()
    let loginAlert=UIAlertController(title: "登录", message: nil, preferredStyle:.alert)
    let registerAlert=UIAlertController(title: "注册", message: nil, preferredStyle: .alert)
    let sureAlert=UIAlertController(title: nil , message:"登录成功", preferredStyle:.alert)
    let warningAlert=UIAlertController(title: nil, message:"该用户不存在", preferredStyle: .alert)
    let errorAlert=UIAlertController(title: nil, message: "改用户已经存在", preferredStyle: .alert)
    var images=["baiyun","chengxi","furong","jinping","nangang","qilihe","shangjie","wuhou"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return  users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userTableViewCell=tableView.dequeueReusableCell(withIdentifier: "userTableViewCell") as! UserTableViewCell
        userTableViewCell.userName.text=users[indexPath.row].userName
        userTableViewCell.passWord.text=users[indexPath.row].passWord
        userTableViewCell.images.image=UIImage(named: images[indexPath.row%7])
       
       userTableViewCell.images.layer.cornerRadius=userTableViewCell.images.frame.size.width/2
        userTableViewCell.images.clipsToBounds=true
        return userTableViewCell
    }
    

  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let user1=User(userName: "11", passWord: "22")
        users.append(user1)
        sureAlert.addAction(UIAlertAction(title: "确定", style: .default, handler: nil))
        warningAlert.addAction(UIAlertAction(title: "确定", style: .default, handler: nil))
         errorAlert.addAction(UIAlertAction(title: "确定", style: .default, handler: nil))
        loginAlert.addTextField{(textField) in textField.placeholder="请输入的userName"}
        loginAlert.addTextField{(textField) in textField.placeholder="请输入的passWord"}
        loginAlert.addAction(UIAlertAction(title: "确定", style: .default, handler: {(action) in self.judgeUser()}))
        
        loginAlert.addAction(UIAlertAction(title: "取消", style: .default, handler: nil))
        registerAlert.addTextField{(textField) in textField.placeholder="请输入的userName"}
        registerAlert.addTextField{(textField) in textField.placeholder="请输入的passWord"}
        registerAlert.addAction(UIAlertAction(title: "确定", style: .default, handler: {(action) in self.addUser()}))
        
        registerAlert.addAction(UIAlertAction(title: "取消", style: .default, handler: nil))
        
    }
    func judgeUser()
    {
        guard let username=loginAlert.textFields![0].text,let password=loginAlert.textFields![1].text
        else {
            return
        }
        var flage=false
        for user in users
        {
            if user.passWord==password&&user.userName==username
            {
                flage=true
                break
            }
        }
        if flage==true
        {
            self.present(sureAlert, animated: true, completion: nil)
        }
        else
        {
             self.present(warningAlert, animated: true, completion: nil)
        }
    }
    func addUser()
    {
        guard let username=registerAlert.textFields![0].text,let password=registerAlert.textFields![1].text
            else {
                
                return
        }
       
        var flage=false
        for user in users
        {
            if user.passWord==password&&user.userName==username
            {
                flage=true
                
                break
            }
        }
        if flage==true
        {
            self.present(errorAlert, animated: true, completion: nil)
        }
        else
        {
            let user=User(userName: username, passWord: password)
            users.append(user)
        }
      myView.reloadData()
    }
    @IBAction func alertSheet(_ sender: UIButton) {
        let alert=UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "登录", style: .default, handler: {(action) in self.present(self.loginAlert, animated: true, completion: nil)}))
        alert.addAction(UIAlertAction(title: "注册", style: .default, handler: {(action) in self.present(self.registerAlert, animated: true, completion: nil)}))
        self.present(alert, animated: true, completion: nil)
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

