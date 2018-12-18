//
//  ViewController.swift
//  实验十（1）
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 周帆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myView: UIView!
    @IBAction func animation(_ sender: Any) {
        UIView.animate(withDuration: 1, animations: {
            // 修改位置
            self.myView.center.y += 200
            // 修改大小
            self.myView.frame.size.height -= 50
            self.myView.frame.size.width -= 50
            // 修改transform属性
            self.myView.transform = CGAffineTransform(rotationAngle: CGFloat(CGFloat.pi))
        }, completion: { _ in
            UIView.animate(withDuration: 1, animations: {
                self.myView.center.y -= 200
                self.myView.frame.size.height += 50
                self.myView.frame.size.width += 50
            }, completion: nil)
        })
    }
    // transform改变视图的背景颜色
    @IBAction func transform(_ sender: Any) {
        let view = UIView(frame: myView.bounds)
        view.backgroundColor = UIColor.yellow
        UIView.transition(with: myView, duration: 1.0, options: .transitionFlipFromLeft, animations: {
            self.myView.addSubview(view)
        }, completion: nil)
        
    }
    // 切换两个子视图
    @IBAction func transform2(_ sender: Any) {
        if let view1 = myView.subviews.first {
            let view2 = UIView(frame: myView.bounds)
            view2.backgroundColor = UIColor.green
            
            UIView.transition(from: view1, to: view2, duration: 2, options: [.transitionFlipFromLeft], completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


