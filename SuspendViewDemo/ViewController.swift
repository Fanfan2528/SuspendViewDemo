//
//  ViewController.swift
//  SuspendViewDemo
//
//  Created by 冯琦帆 on 2018/7/13.
//  Copyright © 2018年 冯琦帆. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  

  @IBAction func article1ButtonClicked(_ sender: Any) {
    let controller = ContentViewController.init(imageName: "200_200.jpg")
    self.navigationController?.pushViewController(controller, animated: true)
  }

  @IBAction func article2ButtonClicked(_ sender: Any) {
    let controller = ContentViewController.init(imageName: "200_200(1).jpg")
    self.navigationController?.pushViewController(controller, animated: true)
  }

}

