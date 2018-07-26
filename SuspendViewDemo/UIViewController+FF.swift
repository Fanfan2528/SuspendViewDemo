//
//  UIViewController+FF.swift
//  SideSlideDemo
//
//  Created by 冯琦帆 on 2018/7/17.
//  Copyright © 2018年 冯琦帆. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

  func suspend(coverImageName: String, type: SuspendType) {
    if type == .none {
      self.navigationController?.popViewController(animated: true)
      return
    }
    self.view.layer.masksToBounds = true
    UIView.animate(withDuration: 0.25, animations: {
      self.view.layer.cornerRadius = radious / 2.0
      self.view.frame = CGRect.init(origin: SuspendTool.sharedInstance.origin, size: CGSize.init(width: radious, height: radious))
      self.view.layoutIfNeeded()
    }) { (complete) in
      self.navigationController?.popViewController(animated: false)
      if type == .single {
        SuspendTool.replaceSuspendWindow(rootViewController: self, coverImageName: coverImageName)
      } else {
        SuspendTool.showSuspendWindow(rootViewController: self, coverImageName: coverImageName)
      }
    }
  }

  func spread(from point: CGPoint) {
    if let isContain = self.navigationController?.viewControllers.contains(self), isContain {
      return
    }
    self.view.frame = CGRect.init(origin: point, size: CGSize.init(width: radious, height: radious))
    UIViewController.currentViewController().navigationController?.pushViewController(self, animated: false)
    UIView.animate(withDuration: 0.25, animations: {
      self.view.layer.cornerRadius = 0
      self.view.frame = UIScreen.main.bounds
      self.view.layoutIfNeeded()
    })
  }

  static func currentViewController() -> UIViewController {
    var rootViewController: UIViewController? = nil
    for window in UIApplication.shared.windows {
      if (window.rootViewController != nil) {
        rootViewController = window.rootViewController
        break
      }
    }
    var viewController = rootViewController
    while (true) {
      if viewController?.presentedViewController != nil {
        viewController = viewController!.presentedViewController
      } else if viewController!.isKind(of: UINavigationController.self) {
        viewController = (viewController as! UINavigationController).visibleViewController
      } else if viewController!.isKind(of: UITabBarController.self) {
        viewController = (viewController as! UITabBarController).selectedViewController
      } else {
        break
      }
    }
    return viewController!
  }

}

//extension UIViewController: UIGestureRecognizerDelegate {
//  func addNavigationPopListener() {
//    self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
//    self.navigationController?.interactivePopGestureRecognizer?.delegate = self
//    let gesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleNavigationTransition(_:)))
//    gesture.edges = .left
//    self.view.addGestureRecognizer(gesture)
//    SuspendTool.addSuspendSemiWindow()
//  }
//
//  @objc public func handleNavigationTransition(_ gesture: UIGestureRecognizer) -> Bool {
//    let location = gesture.location(in: self.view)
//    print(location)
//    let tool = SuspendTool.sharedInstance
//    if location.x <= 0 {
//      let percent = 1 - (-location.x) / UIScreen.main.bounds.width
//      tool.semicircle?.frame = CGRect.init(x: UIScreen.main.bounds.width - semiRadious * percent, y: UIScreen.main.bounds.height - semiRadious * percent, width: semiRadious * 2, height: semiRadious * 2)
//    } else {
//      tool.semicircle?.frame = CGRect.init(x: UIScreen.main.bounds.width, y: UIScreen.main.bounds.height, width: semiRadious * 2, height: semiRadious * 2)
//    }
//    if gesture.state == UIGestureRecognizerState.ended || gesture.state == UIGestureRecognizerState.cancelled || gesture.state == UIGestureRecognizerState.failed {
//      UIView.animate(withDuration: 0.25, animations: {
//        tool.semicircle?.frame = CGRect.init(x: UIScreen.main.bounds.width, y: UIScreen.main.bounds.height, width: semiRadious * 2, height: semiRadious * 2)
//      })
//    }
//    return true
//  }
//
//  public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//    return true
//  }
//
//}
