//
//  LaunchAnimation.swift
//  Button
//
//  Created by Apple on 08/02/18.
//  Copyright © 2018 spb. All rights reserved.
//

import UIKit

class LaunchAnimation: ViewController {
    
    
    @IBOutlet weak var lblAnimate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.animateLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func animateLabel() -> Void {
        let frame = self.view.frame
        var topDowntransform = CGAffineTransform.init(translationX: -(frame.size.width-60), y: -(frame.size.height-20))
        topDowntransform = topDowntransform.scaledBy(x: 2.0, y: 2.0)


        UIView.animate(withDuration: 2.50, animations: {
            self.lblAnimate.transform = topDowntransform
            
        }) { (result) in

                self.navigateToHomeScreen()
        }
        
        
        
    }
    
    func navigateToHomeScreen() -> Void {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: false)

    }

}
