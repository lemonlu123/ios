//
//  Circle.swift
//  004.shiyan4
//
//  Created by 客人用户 on 2018/12/18.
//  Copyright © 2018年 yanlu. All rights reserved.
//

import UIKit

class Circle: UIView {
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        
        UIColor.black.setStroke()  //边界
        path.stroke()
        
        UIColor.yellow.setFill()  //黄色填充
        path.fill()
    }
    
}
