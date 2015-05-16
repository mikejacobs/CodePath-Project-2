//
//  WelcomeScrollViewController.swift
//  Carousel2
//
//  Created by Mike Jacobs on 5/14/15.
//  Copyright (c) 2015 Mike Jacobs. All rights reserved.
//

import UIKit

class WelcomeScrollViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    
    @IBOutlet weak var buttonGroup: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scroller.delegate = self
        scroller.contentSize = CGSize(width: 1280, height: 568)
    }
    
    func scrollViewDidScroll(scroller: UIScrollView) {
        // This method is called as the user scrolls
    
    }
    
    func scrollViewDidEndDecelerating(scroller: UIScrollView) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(scroller.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        if page == 3 {
            UIView.animateWithDuration(0.3) {
                self.pageControl.alpha = 0
                self.buttonGroup.alpha = 1
            }
        }
    }
    

    @IBAction func didPressSpinButton(sender: AnyObject) {
        performSegueWithIdentifier("segueToTimeline", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
