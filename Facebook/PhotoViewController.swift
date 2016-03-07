//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Madelyn Lee on 3/5/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var tabBar: UIImageView!
    @IBOutlet weak var doneImageView: UIImageView!
    
    var image: UIImage!
    var photoOriginalCenter: CGPoint!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImageView.image = image
        background.alpha = 0.8
        
        
        scrollView.contentSize = CGSize(width: 320, height: 1000)
//        scrollView.frame.size = CGSize(width: 320, height: 524)
        scrollView.delegate = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let scrollOffset = scrollView.contentOffset.y
        print("scroll")
        
        // This method is called as the user scrolls
        let fadeTransition = 1 - (scrollView.contentOffset.y / -80)

        background.alpha = fadeTransition
        doneImageView.alpha = fadeTransition
        tabBar.alpha = fadeTransition
 
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {
            print("end dragging")
            // This method is called right as the user lifts their finger
            if scrollView.contentOffset.y < -100 {
                dismissViewControllerAnimated(true, completion: nil)
            }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // This method is called when the scrollview finally stops scrolling.
        
    }


    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func doneDidTap(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
        
        
        
    }
    
}
