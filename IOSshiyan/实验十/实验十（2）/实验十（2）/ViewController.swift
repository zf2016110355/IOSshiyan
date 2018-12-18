//
//  ViewController.swift
//  实验十（2）
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 周帆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 1.产生力学动画制片人
    lazy var animator = UIDynamicAnimator(referenceView: self.view)
    // 重力
    var gravity = UIGravityBehavior()
    // 碰撞
    var collider = UICollisionBehavior()
    // 其他
    var itemBehavior = UIDynamicItemBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 弹性系数 [0,1]之间
        itemBehavior.elasticity = 0.5
        
        // 2.加入物理学行为
        animator.addBehavior(gravity)
        animator.addBehavior(collider)
        animator.addBehavior(itemBehavior)
        
        collider.translatesReferenceBoundsIntoBoundary = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func add(_ sender: Any) {
        // 计算label宽度
        let width = Int(view.bounds.width/10)
        // 随机生成初始位置
        let x = Int(arc4random()) % 10
        // 创建label
        let label = UILabel(frame: CGRect(x: width*x, y: 0, width: width, height: width))
        label.text = "a"
        label.textAlignment = .center
        label.backgroundColor = UIColor.red
        self.view.addSubview(label)
        
        // 3.新添加的视图添加受力学影响
        gravity.addItem(label)
        collider.addItem(label)
        itemBehavior.addItem(label)
    }
    
}
