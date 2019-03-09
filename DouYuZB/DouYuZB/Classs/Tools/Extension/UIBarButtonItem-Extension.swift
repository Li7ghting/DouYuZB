//
//  UIBarButtonItem-Extension.swift
//  DouYuZB
//
//  Created by canguang on 2019/3/9.
//  Copyright © 2019 canguang. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    //类方法书写扩展方法
    /*class func createUIBarButtonItem (labelName: String,size: CGSize) ->UIBarButtonItem {
        let label = UILabel()
        label.text = labelName
        label.frame = CGRect(origin: CGPoint.zero, size: size)
        return UIBarButtonItem(customView: label)
    }*/
    // 便利构造函数： 1 > convenience开头 2 > 在构造函数中必须明确调用一个设计的构造函数（self 来调用）
    convenience init(labelName: String, size: CGSize) {
        let label = UILabel()
        label.text = labelName
        label.frame = CGRect(origin: CGPoint.zero, size: size)
        self.init(customView: label)
    }
    
    convenience init(imageName: String, size: CGSize = CGSize.zero) {
        let btn = UIButton()
        btn.setTitle(imageName, for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.setTitleColor(UIColor.orange, for: .highlighted)
        if size == CGSize.zero {
            btn.sizeToFit()
        }else{
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }
        self.init(customView: btn)
    }
}
