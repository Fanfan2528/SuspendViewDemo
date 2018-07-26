//
//  SuspendTool.swift
//  SuspendViewDemo
//
//  Created by 冯琦帆 on 2018/7/17.
//  Copyright © 2018年 冯琦帆. All rights reserved.
//

import Foundation
import UIKit

enum SuspendType {
  case none
  case single
  case multi
}

class SuspendTool: NSObject {

  static let sharedInstance = SuspendTool()
  private var suspendWindows: [SuspendWindow] = []
//  var semicircle: Semicircle?
  var origin: CGPoint = CGPoint.init(x: 10, y: 300)

  static func showSuspendWindow(rootViewController: UIViewController, coverImageName: String) {
    let tool = SuspendTool.sharedInstance
    let window = SuspendWindow.init(rootViewController: rootViewController, coverImageName: coverImageName, frame: CGRect.init(origin: tool.origin, size: CGSize.init(width: radious, height: radious)))
    window.show()
    tool.suspendWindows.append(window)
  }

  static func replaceSuspendWindow(rootViewController: UIViewController, coverImageName: String) {
    let tool = SuspendTool.sharedInstance
    tool.suspendWindows.removeAll()
    let window = SuspendWindow.init(rootViewController: rootViewController, coverImageName: coverImageName, frame: CGRect.init(origin: tool.origin, size: CGSize.init(width: radious, height: radious)))
    window.show()
    tool.suspendWindows.append(window)
  }

  static func remove(suspendWindow: SuspendWindow) {
    UIView.animate(withDuration: 0.25, animations: {
      suspendWindow.alpha = 0
    }) { (complete) in
      if let index = SuspendTool.sharedInstance.suspendWindows.index(of: suspendWindow) {
        SuspendTool.sharedInstance.suspendWindows.remove(at: index)
      }
    }
  }

  static func setLatestOrigin(origin: CGPoint) {
    SuspendTool.sharedInstance.origin = origin
  }

//  static func addSuspendSemiWindow() {
//    let tool = SuspendTool.sharedInstance
//    tool.semicircle = Semicircle.init(frame: CGRect.init(x: UIScreen.main.bounds.width, y: UIScreen.main.bounds.height, width: semiRadious * 2, height: semiRadious * 2))
//    tool.semicircle?.floatStyle()
//  }
//
//  static func removeSuspendSemiWindow() {
//    let tool = SuspendTool.sharedInstance
//    tool.semicircle = nil
//  }

}
