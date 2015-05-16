//
//  IntroViewController.swift
//  Carousel2
//
//  Created by Mike Jacobs on 5/13/15.
//  Copyright (c) 2015 Mike Jacobs. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var scrollImage: UIImageView!
    @IBOutlet weak var tile1: UIImageView!
    @IBOutlet weak var tile2: UIImageView!
    @IBOutlet weak var tile3: UIImageView!
    @IBOutlet weak var tile4: UIImageView!
    @IBOutlet weak var tile5: UIImageView!
    @IBOutlet weak var tile6: UIImageView!
    
    var tileArray = [UIImageView]()
    var tileOffsets = [CGPoint]()
//    var tileStartXOffsets : [Float] = [43.5, 280.0, 250.0, 160.0, 43.0, 137.0]
//    var tileStartYOffsets : [Float] = [546.0, 545.5, 442.0, 545.0, 442.5, 454.5]
//    var tileStartXOffsets : [Float] = [80.0, 42.0, 12.0, 75.0, 118.0, 101.0]
//    var tileStartYOffsets : [Float] = [-283.0, -321.0, -141.0, -168.0, -65.0, -77.0]
    var tileStartXOffsets : [Float] = [-72.0, 44.0, 37.0, 88.5, -130.5, -74.5]
    var tileStartYOffsets : [Float] = [-284.5, -240.0, -430.0, -408.5, -518.5, -502.0]
    var tileStartScales : [Float] = [1, 2, 2, 2, 2, 2]
    var tileStartrotations : [Float] = [-10, -10, 10, 10, 10, -10]
    var screenHeight: Float = 568.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tileArray = [tile1, tile2, tile3, tile4, tile5, tile6]
//        
//        var tileEndPositionArray = [
//            CGPoint(x: 123.5, y: 263.0),
//            CGPoint(x: 238.0, y: 224.5),
//            CGPoint(x: 238.0, y: 301.0),
//            CGPoint(x: 85.0, y: 377.0),
//            CGPoint(x: 161.0, y: 377.5),
//            CGPoint(x: 238.0, y: 377.5)
//        ]
//        
//        var tileStartPositionArray = [
//            CGPoint(x: 43.5, y: 546.0),
//            CGPoint(x: 280.0, y: 545.5),
//            CGPoint(x: 250.0, y: 442.0),
//            CGPoint(x: 160.0, y: 545.0),
//            CGPoint(x: 43.0, y: 442.5),
//            CGPoint(x: 137.0, y: 454.5)
//        ]
        
        updateTiles(0)
        
        scroller.delegate = self
        scroller.contentSize = scrollImage.image!.size
    }
    
    
    func animateHelper(offset: Float, startVal: Float, endVal: Float) -> Float {
        var ratio = (endVal - startVal) / screenHeight
        return offset * ratio + startVal
    }
    
    func updateTiles(offset: Float) -> Void {
        for (i, tile) in enumerate(tileArray) {
            
            var rotation =      animateHelper(offset, startVal: tileStartrotations[i], endVal: 0)
            var scale =         animateHelper(offset, startVal: tileStartScales[i], endVal: 1)
            var translateX =    animateHelper(offset, startVal: tileStartXOffsets[i], endVal: 0)
            var translateY =    animateHelper(offset, startVal: tileStartYOffsets[i], endVal: 0)
            
            tile.transform = CGAffineTransformMakeTranslation(CGFloat(translateX), CGFloat(translateY))
            tile.transform = CGAffineTransformScale(tile.transform, CGFloat(scale), CGFloat(scale))
            tile.transform = CGAffineTransformRotate(tile.transform, CGFloat(Double(rotation) * M_PI / 180.0))
            
        }
    }
    
    func scrollViewDidScroll(scroller: UIScrollView) {
        // This method is called as the user scrolls
        
        var offset = Float(scroller.contentOffset.y)
        
        
        if offset > screenHeight {
            offset = screenHeight
        } else if offset < 0 {
            offset = 0
        }
        updateTiles(offset)
        
        
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
