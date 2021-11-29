//
//  ModalViewController.swift
//  WavyTabBar
//
//  Created by Jitesh Middha on 29/11/21.
//

import UIKit

class ModalViewController: UIViewController, UIViewControllerAnimatedTransitioning {
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 3
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    
    let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
    
    guard let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else {
      return
    }
    
    var toViewStartFrame = transitionContext.initialFrame(for: toVC)

    
    let containerView = transitionContext.containerView

    
    
//    if (self.presenting) {
            // Modify the frame of the presented view so that it starts
            // offscreen at the lower-right corner of the container.
    toViewStartFrame.origin.x = 0//containerView.frame.size.width;
    toViewStartFrame.origin.y = containerView.frame.size.height - 60;
//        }
//        else {
//            // Modify the frame of the dismissed view so it ends in
//            // the lower-right corner of the container view.
//            fromViewFinalFrame = CGRectMake(containerFrame.size.width,
//                                          containerFrame.size.height,
//                                          toView.frame.size.width,
//                                          toView.frame.size.height);
//        }
  }
  
  private var shapeLayer: CALayer?

  override func viewDidLoad() {
    super.viewDidLoad()

    
    let shape = self.view.addShape()
    if let oldShapeLayer = self.shapeLayer {
      self.view.layer.replaceSublayer(oldShapeLayer, with: shape)
    } else {
      self.view.layer.insertSublayer(shape, at: 0)
    }
  }
  
  @IBAction func disPressCloseButton(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}

class CustomView: UIView {
  
  
}
