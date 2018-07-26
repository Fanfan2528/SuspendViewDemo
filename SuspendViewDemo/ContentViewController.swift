//
//  ContentViewController.swift
//  SuspendViewDemo
//
//  Created by 冯琦帆 on 2018/7/13.
//  Copyright © 2018年 冯琦帆. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

  @IBOutlet fileprivate weak var coverImageView: UIImageView!
  @IBOutlet weak var singleImageView: UIImageView!
  @IBOutlet weak var multiImageView: UIImageView!
  @IBOutlet weak var cancelImageView: UIImageView!
  private let imageName: String
  private var suspendType: SuspendType = .single

  init(imageName: String) {
    self.imageName = imageName
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.coverImageView.image = UIImage.init(named: imageName)
  }
  
  @IBAction func singleSuspendButtonClicked(_ sender: Any) {
    self.singleImageView.image = UIImage.init(named: "payment_tick_icon")
    self.multiImageView.image = nil
    self.cancelImageView.image = nil
    self.suspendType = .single
  }

  @IBAction func multiSuspendButtonClicked(_ sender: Any) {
    self.singleImageView.image = nil
    self.multiImageView.image = UIImage.init(named: "payment_tick_icon")
    self.cancelImageView.image = nil
    self.suspendType = .multi
  }

  @IBAction func cancelSuspendButtonClicked(_ sender: Any) {
    self.singleImageView.image = nil
    self.multiImageView.image = nil
    self.cancelImageView.image = UIImage.init(named: "payment_tick_icon")
    self.suspendType = .none
  }

  @IBAction func closeButtonClicked(_ sender: Any) {
    self.suspend(coverImageName: imageName, type: suspendType)
  }

}
