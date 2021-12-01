//
//  WavyUIView.swift
//  WavyTabBar
//  WavyUIView - This View can be used where we need wavy top design

//  Created by Jitesh Middha on 01/12/21.
//

import UIKit

class WavyUIView: UIView {
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
