//
//  Semicircle.swift
//  SuspendViewDemo
//
//  Created by 冯琦帆 on 2018/7/23.
//  Copyright © 2018年 冯琦帆. All rights reserved.
//

import UIKit

let semiRadious: CGFloat = 200

class Semicircle: UIWindow {

  func floatStyle() {
    self.isHidden = false
    self.windowLevel = UIWindowLevelAlert - 1

    let semicircle = CAShapeLayer()
    let path = UIBezierPath()
    path.addArc(withCenter: CGPoint.init(x: semiRadious, y: semiRadious), radius: semiRadious, startAngle: CGFloat.pi * 1.5, endAngle: CGFloat.pi, clockwise: false)
    path.addLine(to: CGPoint.init(x: semiRadious, y: semiRadious))
    path.addLine(to: CGPoint.init(x: semiRadious, y: 0))
    path.close()
    semicircle.path = path.cgPath
    self.layer.addSublayer(semicircle)
    semicircle.fillColor = UIColor.red.cgColor
  }

}
