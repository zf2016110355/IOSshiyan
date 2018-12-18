//
//  ViewController.swift
//  实验十一（1）
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 周帆. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    let userDefault = UserDefaults.standard
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Second"{
            let secVC = segue.destination as!SecondViewController
            secVC.name = userName.text!
            secVC.psw = passWord.text!
            userDefault.set(userName.text!,forKey: "name")
            userDefault.set(passWord.text!,forKey: "psw")
            userDefault.synchronize()
            print(NSTemporaryDirectory())
        }
    }
    @IBAction func myback(segue:UIStoryboardSegue){
        let secVC = segue.source as! SecondViewController
        userName.text = secVC.name
        passWord.text = secVC.psw
    }
    
}

