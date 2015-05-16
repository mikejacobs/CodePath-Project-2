//
//  IntroViewController.swift
//  Carousel
//
//  Created by Mike Jacobs on 5/11/15.
//  Copyright (c) 2015 Mike Jacobs. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
    
    @IBOutlet weak var tile1: UIImageView!
    @IBOutlet weak var tile2: UIImageView!
    @IBOutlet weak var tile3: UIImageView!
    @IBOutlet weak var tile4: UIImageView!
    @IBOutlet weak var tile5: UIImageView!
    @IBOutlet weak var tile6: UIImageView!
    var tileArray = [UIImageView]()
    var tileStartPositionArray = [CGPoint]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tileArray = [tile1, tile2, tile3, tile4, tile5, tile6]
        
        tileStartPositionArray = [
            CGPoint(x: 103.5, y: 203.0),
            CGPoint(x: 238.0, y: 244.5),
            CGPoint(x: 238.0, y: 321.0),
            CGPoint(x: 85.0, y: 397.0),
            CGPoint(x: 160.0, y: 397.5),
            CGPoint(x: 238.0, y: 397.5)
        ]
        

//        http://stackoverflow.com/questions/26159012/uiscrollview-animation-depending-on-content-offset
//        for tile in tileArray {
//            tilePositionArray.append(tile.center)
//        }
        
        
        
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
