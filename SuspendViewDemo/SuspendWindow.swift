//
//  SuspendWindow.swift
//  SuspendViewDemo
//
//  Created by 冯琦帆 on 2018/7/13.
//  Copyright © 2018年 冯琦帆. All rights reserved.
//

import UIKit

let radious: CGFloat = 100

class SuspendWindow: UIWindow {

  fileprivate let coverImageName: String
  fileprivate let space: CGFloat = 10

  init(rootViewController: UIViewController ,coverImageName: String, frame: CGRect) {
    self.coverImageName = coverImageName
    super.init(frame: frame)
    self.rootViewController = rootViewController
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func show() {
    self.backgroundColor = UIColor.clear
    self.windowLevel = UIWindowLevelAlert - 1
    self.screen = UIScreen.main
    self.isHidden = false

    let iconImageView = UIImageView.init(image: UIImage.init(named: coverImageName))
    iconImageView.isUserInteractionEnabled = true
    iconImageView.frame = self.bounds
    iconImageView.layer.cornerRadius = radious / 2.0
    iconImageView.layer.borderColor = UIColor.lightGray.cgColor
    iconImageView.layer.borderWidth = 5
    iconImageView.layer.masksToBounds = true
    self.addSubview(iconImageView)

    let panGesture = UIPanGestureRecognizer.init(target: self, action: #selector(didPan(_:)))
    self.addGestureRecognizer(panGesture)

    let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(didTap(_:)))
    self.addGestureRecognizer(tapGesture)
  }

  @objc fileprivate func didTap(_ tapGesture: UITapGestureRecognizer) {
    SuspendTool.sharedInstance.origin = self.frame.origin
    self.rootViewController?.spread(from: self.self.frame.origin)
    SuspendTool.remove(suspendWindow: self)
  }

  @objc fileprivate func didPan(_ panGesture: UIPanGestureRecognizer) {
    let point = panGesture.translation(in: panGesture.view)
    var originX = self.frame.origin.x + point.x
    if originX < space {
      originX = space
    } else if originX > UIScreen.main.bounds.width - radious - space {
      originX = UIScreen.main.bounds.width - radious - space
    }
    var originY = self.frame.origin.y + point.y
    if originY < space {
      originY = space
    } else if originY > UIScreen.main.bounds.height - radious - space {
      originY = UIScreen.main.bounds.height - radious - space
    }
    self.frame = CGRect.init(x: originX, y: originY, width: self.bounds.width, height: self.bounds.height)
    if panGesture.state == UIGestureRecognizerState.cancelled || panGesture.state == UIGestureRecognizerState.ended || panGesture.state == UIGestureRecognizerState.failed {
      self.adjustFrameAfterPan()
    }
    panGesture.setTranslation(CGPoint.zero, in: self)
  }

  fileprivate func adjustFrameAfterPan() {
    var originX: CGFloat = space
    if self.center.x < UIScreen.main.bounds.width / 2 {
      originX = space
    } else if self.center.x >= UIScreen.main.bounds.width / 2 {
      originX = UIScreen.main.bounds.width - radious - space
    }
    UIView.animate(withDuration: 0.25, animations: {
      self.frame = CGRect.init(x: originX, y: self.frame.origin.y, width: self.frame.size.width, height: self.frame.size.height)
    }) { (complete) in
      SuspendTool.setLatestOrigin(origin: self.frame.origin)
    }
  }

}
