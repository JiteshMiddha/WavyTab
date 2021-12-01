//
//  ViewController.swift
//  WavyTabBar
//
//  Created by Jitesh Middha on 29/11/21.
//

import UIKit

class ViewController: UIViewController {
  var tabBarHeight = 0.0
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destination = segue.destination as? ModalViewController {
      destination.modalPresentationStyle = .custom
      destination.transitioningDelegate = self
    }
  }
  
  @IBAction func didPressRefreshButton(_ sender: Any) {
    DispatchQueue.main.async {
      self.performSegue(withIdentifier: "ToModalSegue", sender: nil)
    }
  }
  
}


// MARK: - UIViewControllerTransitioningDelegate
extension ViewController:  UIViewControllerTransitioningDelegate {
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return self
  }
  
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return self
  }
}

// MARK: - UIViewControllerAnimatedTransitioning
extension ViewController: UIViewControllerAnimatedTransitioning {
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return 1.0
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    // Retrieve the view controllers participating in the current transition from the context.
    var fromView = transitionContext.viewController(forKey: .from)!.view!
    
    if let tabBarController = transitionContext.viewController(forKey: .from)! as? UITabBarController {
      fromView = tabBarController.selectedViewController!.view!
      tabBarHeight = tabBarController.tabBar.frame.size.height
    }
    
    let toView = transitionContext.viewController(forKey: .to)!.view!
    
    // If the view to transition from is this controller's view, the drawer is being presented.
    let isPresentingDrawer = fromView == view
    
    let drawerView = isPresentingDrawer ? toView : fromView
    
    if isPresentingDrawer {
      // Any presented views must be part of the container view's hierarchy
      transitionContext.containerView.addSubview(drawerView)
    }
    
    /***** Animation *****/
    
    let drawerSize = self.view.frame.size
    
    let offScreenDrawerFrame = CGRect(origin: CGPoint(x: 0, y:UIScreen.main.bounds.size.height - tabBarHeight), size: drawerSize)
    let onScreenDrawerFrame = CGRect(origin: .zero, size: drawerSize)
    
    drawerView.frame = isPresentingDrawer ? offScreenDrawerFrame : onScreenDrawerFrame

    let fadeAnimationDuration = 0.2
    let animationDuration = transitionDuration(using: transitionContext) - fadeAnimationDuration
    
    // Animate the drawer sliding in and out.
    drawerView.alpha = isPresentingDrawer ? 0 : 1
    
    if isPresentingDrawer == true {
      // Fade in View if presenting Modal
      UIView.animate(withDuration: fadeAnimationDuration) {
        drawerView.alpha = 1
      } completion: { success in
        //
      }
    }
    
    // Bottom to top animation
    UIView.animate(withDuration: animationDuration, delay: isPresentingDrawer ? fadeAnimationDuration : 0, options: .allowAnimatedContent, animations: {
      
      drawerView.frame = isPresentingDrawer ? onScreenDrawerFrame : offScreenDrawerFrame
    }, completion: nil)
    
    if !isPresentingDrawer {
      // Fade out when dismissing modal
      UIView.animate(withDuration: fadeAnimationDuration, delay: animationDuration, options: .allowAnimatedContent, animations: {
        drawerView.alpha = 0
      }, completion: { success in
        //
        drawerView.removeFromSuperview()
        transitionContext.completeTransition(success)
      })
    } else {
      transitionContext.completeTransition(true)
    }
    
  }
}
