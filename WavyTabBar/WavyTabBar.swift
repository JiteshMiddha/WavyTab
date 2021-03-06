//
//  WavyTabBar.swift
//  WavyTabBar
//
//  Created by Jitesh Middha on 29/11/21.
//

import UIKit

class WavyTabBar: UITabBar {

  private var shapeLayer: CALayer?
  
  override func draw(_ rect: CGRect) {
    
    let shape = self.addShape()
    if let oldShapeLayer = self.shapeLayer {
      self.layer.replaceSublayer(oldShapeLayer, with: shape)
    } else {
      self.layer.insertSublayer(shape, at: 0)
    }
  }
}
