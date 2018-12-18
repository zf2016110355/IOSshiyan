//
//  ViewController.swift
//  实验五
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 周帆. All rights reserved.
//

import UIKit
class MyViewController:UIViewController{
    
    //声明UILabel对象
    var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置根视图视图背景色
        self.view.backgroundColor = UIColor.white
        
        //创建UILabel对象
        label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 40))
        label.text = "hello world"
        label.backgroundColor = UIColor.yellow
        self.view.addSubview(label)
        
        //创建UIButton对象
        let btn = UIButton(frame: CGRect(x: 100, y: 250, width: 100, height: 40))
        btn.setTitle("click me", for: .normal)         //设置正常状态下按钮的标题
        btn.layer.borderWidth = 1                   //设置按钮边框宽度
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.addTarget(self, action: #selector(clicked), for: .touchUpInside)    //给按钮添加target-action
        self.view.addSubview(btn)
        
        //创建UIImageView对象
        let imageView = UIImageView(frame: CGRect(x: 10, y: 400, width: self.view.frame.width - 20, height: (self.view.frame.width - 20) * 0.618))
        let path = Bundle.main.path(forResource: "nikun", ofType: "jpeg")        //获取图片资源路径
        let image = UIImage(contentsOfFile: path!)      //以该路径创建图片
        imageView.image = image                         //将图片加入到imageView中
        self.view.addSubview(imageView)                 //将imageView加入到控制器中
    }
    
    
    /// 按钮点击事件，改变label显示的文字
    @objc func clicked() {
        if label.text == "hello world" {
            label.text = "I'm clicked"
        } else {
            label.text = "hello world"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

