//
//  UIView+WavyTop.swift
//  WavyTabBar
//  This file contains code for the top wave design for UIView
//  Created by Jitesh Middha on 01/12/21.
//

import UIKit

extension UIView {
  
  private func createPath() -> CGPath {
    let path = UIBezierPath()
    
    let amplitude = 5.0
    let topOffset = 0 - (amplitude + 1)
    path.move(to: CGPoint(x: 0, y: topOffset))

    for angle in stride(from: 0, through: Double(frame.size.width), by: 1) {
      let x = angle
      let y = (CGFloat(sin(x/6)) * amplitude) + topOffset
      
      path.addLine(to: CGPoint(x: x, y: y))
    }
    
    path.addLine(to: CGPoint(x: frame.size.width, y: frame.size.height))
    path.addLine(to: CGPoint(x: 0, y: frame.size.height))
    path.close()
    path.stroke()
    return path.cgPath
  }
  
  func addShape() -> CAShapeLayer {
    let shape = CAShapeLayer()
    shape.path = createPath()
    shape.strokeColor = UIColor.black.cgColor
    shape.fillColor = self.backgroundColor?.cgColor
    shape.lineWidth = 2.0
    
//    if let oldShapeLayer = self.shapeLayer {
//      self.layer.replaceSublayer(oldShapeLayer, with: shape)
//    } else {
//      self.layer.insertSublayer(shape, at: 0)
//    }
    
    return shape
  }
}
