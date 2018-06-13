//
//  ViewController.swift
//  swift约束
//
//  Created by 曹得地 on 2018/6/13.
//  Copyright © 2018年 caodedi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //开始你的约束
        setContTest()
    }
}
//这里是个扩展可以单独写出去（这样你可以选是否相对于安全域）
extension UIViewController {
    var guide: UILayoutGuide {
        if #available(iOS 11.0, *) {
            return self.view.safeAreaLayoutGuide
        } else {
            return self.view.layoutMarginsGuide
        }
    }
}
//约束
extension ViewController {
    func setContTest() {
        //两个view
        let blueBlock = UIView()
        let orangeBlock = UIView()
        //这两句必须写
        blueBlock.translatesAutoresizingMaskIntoConstraints = false
        orangeBlock.translatesAutoresizingMaskIntoConstraints = false
        //颜色设置
        blueBlock.backgroundColor = UIColor.blue
        orangeBlock.backgroundColor = .orange
        //和snp一样先加入
        view.addSubview(blueBlock)
        view.addSubview(orangeBlock)
        
        /*
         四个可约束环境
         leadingAnchor
         topAnchor
         widthAnchor
         heightAnchor
         
        此句： equalTo: 相对于谁做约束, constant: 10（意思就是加10）
        此句： .isActive = true //开启这个约束（不可省略，只有开启了才算有意义）
         */
        blueBlock.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10).isActive = true
        blueBlock.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10).isActive = true
        blueBlock.widthAnchor.constraint(equalToConstant: 100).isActive = true
        blueBlock.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        orangeBlock.leadingAnchor.constraint(equalTo: blueBlock.trailingAnchor, constant: 10).isActive = true
        orangeBlock.topAnchor.constraint(equalTo: blueBlock.topAnchor, constant: 10).isActive = true
        orangeBlock.widthAnchor.constraint(equalTo: blueBlock.widthAnchor, multiplier: 2).isActive = true
        //  高级点的用法，如果你要用stroyboard, 一定得懂这个方法。
        
        /*
         equalTo: 相对于谁做约束, multiplier: blueBlock.heightAnchor乘以2, constant: 10（加10）
         是不是可以自己计算啦！写到这儿有兴趣就练练手吧！
         
         */
        orangeBlock.heightAnchor.constraint(equalTo: blueBlock.heightAnchor, multiplier: 2, constant: 10).isActive = true
        
    }
}
