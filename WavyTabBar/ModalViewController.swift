//
//  ModalViewController.swift
//  WavyTabBar
//
//  Created by Jitesh Middha on 29/11/21.
//

import UIKit

class ModalViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func disPressCloseButton(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }
}
