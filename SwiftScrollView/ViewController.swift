//
//  ViewController.swift
//  SwiftScrollView
//
//  Created by Sridhar Sanapala on 6/22/15.
//  Copyright (c) 2015 everythingswift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var swiftScrollview:UIScrollView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let btnWidth:CGFloat = 32.0
        let btnHeight:CGFloat = 32.0
        let paddingX:CGFloat = 5.0
        let paddingY:CGFloat = 5.0
        var offsetX:CGFloat = btnWidth + paddingX
        var offsetY:CGFloat = btnHeight + paddingY
        var multiplierX:CGFloat = 0.0
        var multiplierY:CGFloat = 0.0
        
        for(var i=0; i<12; i++, multiplierX++)
        {
            multiplierY = 0
            for(var j=0; j<12; j++, multiplierY++)
            {
                var btn:UIButton = UIButton(frame: CGRectMake(offsetX*multiplierX, offsetY*multiplierY, btnWidth, btnHeight))
                if j % 2 == 0
                {
                    btn.backgroundColor = UIColor.blueColor()
                }
                else
                {
                    btn.backgroundColor = UIColor.orangeColor()
                }
                
                btn.tag = (j*100)+i;
                btn.addTarget(self, action: "btnTapped:", forControlEvents: UIControlEvents.TouchUpInside)
                swiftScrollview.addSubview(btn)
            }
        }
        
        swiftScrollview.contentSize = CGSizeMake((multiplierX+2)*btnWidth, (multiplierY+2)*btnHeight)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func btnTapped(id:UIButton){
        println("Tapped button \(id.tag)")
        println("Column \(id.tag%100)")
        println("Row \(id.tag/100)")
    }


}

