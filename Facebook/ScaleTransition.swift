//
//  FadeTransition.swift
//  transitionDemo
//
//  Created by Timothy Lee on 11/4/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class ScaleTransition: BaseTransition {
    
    
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let photoViewController = toViewController as! PhotoViewController
        
        photoViewController.photoImageView.transform = CGAffineTransformMakeScale(0.4, 0.4)
        UIView.animateWithDuration(duration, animations: {
            photoViewController.photoImageView.transform = CGAffineTransformMakeScale(1, 1)
            //do other shit here
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let photoViewController = fromViewController as! PhotoViewController
        
        photoViewController.photoImageView.transform = CGAffineTransformMakeScale(1, 1)
        UIView.animateWithDuration(duration, animations: {
            photoViewController.photoImageView.transform = CGAffineTransformMakeScale(0.4, 0.4)
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
}
