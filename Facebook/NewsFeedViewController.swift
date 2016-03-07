//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController{
    
    
    var fadeTransition = FadeTransition()
    var scaleTransition = ScaleTransition()
    var window = UIApplication.sharedApplication().keyWindow



    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var weddingone: UIImageView!
    @IBOutlet weak var weddingtwo: UIImageView!
    @IBOutlet weak var weddingthree: UIImageView!
    @IBOutlet weak var weddingfour: UIImageView!
    @IBOutlet weak var weddingfive: UIImageView!
    
    var selectedImage : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Configure the content size of the scroll view
        scrollView.contentSize = CGSizeMake(320, feedImageView.image!.size.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 50
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
    
    
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
        let photoViewController = segue.destinationViewController as! PhotoViewController
        
        
        // Set the modal presentation style of your destinationViewController to be custom.
        photoViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        photoViewController.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 0.3
        
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        photoViewController.transitioningDelegate = scaleTransition
        
        // Adjust the transition duration. (seconds)
        scaleTransition.duration = 0.3
        
        
    photoViewController.image = self.selectedImage.image
        
        
    }
    
    

    
    
    
    @IBAction func imageDidTap(sender: UITapGestureRecognizer) {
        selectedImage = sender.view as! UIImageView
        performSegueWithIdentifier("photoSegue", sender: self)
        

    }
}
