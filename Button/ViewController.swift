//
//  ViewController.swift
//  Button
//
//  Created by Apple on 08/02/18.
//  Copyright © 2018 spb. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var btnFirstAnimationSecond = 0.3
    var btnSecondAnimationSecond = 0.2
    
    var animationHeader = [String]()
    var animationType = [String]()
    var backgroundTransitions = [String]()
    var icon = [String]()
    var borderTransition = [String]()

    var selectedIndex = 0
    
    @IBOutlet weak var btnAnimate: UIButton!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var collectionVw: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        animationHeader.append("2D Transitions")
        animationHeader.append("Background Transitions")
        animationHeader.append("Icons")
        animationHeader.append("Border Transitions")
//        animationHeader.append("Shadow and Glow Transitions")
//        animationHeader.append("Speech Bubbles")
//        animationHeader.append("Curls")


        animationType.append("Zoom out")
        animationType.append("Zoom in")
        animationType.append("Move left")
        animationType.append("Move right")
        animationType.append("Move top")
        animationType.append("Move bottom")
        animationType.append("Rotate Clockwise")
        animationType.append("Rotate Anti-Clockwise")
        
        //backgroundTransitions - section II
        backgroundTransitions.append("Fade")
        backgroundTransitions.append("Back Pulse")
        backgroundTransitions.append("Sweep to Right")
        backgroundTransitions.append("Sweep to Left")
        backgroundTransitions.append("Sweep to Bottom")
        backgroundTransitions.append("Sweep to Top")
        backgroundTransitions.append("Bounce to Right")
        backgroundTransitions.append("Bounce to Left")
        backgroundTransitions.append("Bounce to Bottom")
        backgroundTransitions.append("Bounce to Top")
        backgroundTransitions.append("Radial Out")
        backgroundTransitions.append("Radial In")
        backgroundTransitions.append("Rectangle In")
        backgroundTransitions.append("Rectangel Out")
        backgroundTransitions.append("Shutter in Horizontal")
        backgroundTransitions.append("Shutter Out Horizontal")
        backgroundTransitions.append("Shutter in Vertical")
        backgroundTransitions.append("Shutter Out Vertical")


        //Border Animation
        borderTransition.append("Border Fade")
        borderTransition.append("Hollow")
        borderTransition.append("Trim")
        borderTransition.append("Ripple Out")
        borderTransition.append("Ripple In")
        borderTransition.append("Outline Out")
        borderTransition.append("Outline In")
        borderTransition.append("Round corner")


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onClickButtonAnimate(_ sender: Any) {
        startAnimation(selectedIndex)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return animationType.count
        }
        else if section == 1 {
            return backgroundTransitions.count
        }
        else if section == 2 {
            return icon.count
        }
        else if section == 3 {
            return borderTransition.count
        }
    
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "CollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! AnimationTitleCell
        
        var title = ""
        if indexPath.section == 0 {
            title = animationType[indexPath.row]
        }
        else if indexPath.section == 1 {
            title = backgroundTransitions[indexPath.row]
        }
        else if indexPath.section == 2 {
            title = icon[indexPath.row]
        }
        else if indexPath.section == 3 {
            title = borderTransition[indexPath.row]
        }
        else {
            
        }
        
        cell.lblAnimationTitle.text = title
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return animationHeader.count;
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: 
        IndexPath) -> UICollectionReusableView {
        
        let identifier = "Header"
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: identifier, for: indexPath) as! AnimationListHeader
        
        header.lblHeader.text = animationHeader[indexPath.section]
        return header

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        if indexPath.section == 0 {
            startAnimation(selectedIndex)
        }
        else if indexPath.section == 1 {
            //backgroundTransitionAnimation(selectedIndex)
        }
        else if indexPath.section == 2 {
            
        }
        else if indexPath.section == 3 {
            borderTransitionAnimation(selectedIndex)
        }
    }
    

    //MARK:-
    func startAnimation(_ index: Int) -> Void {
        UIView.animate(withDuration: btnFirstAnimationSecond, animations: {

            self.animate(index)

        }) { (result) in
            UIView.animate(withDuration: self.btnSecondAnimationSecond, animations: {
                self.btnAnimate.transform = CGAffineTransform.identity
            }) { (result) in
            }
        }
    }
    
    func animate(_ index: Int) -> Void {
        
        
            switch index {
            case 0:
                self.buttonZoomOut()
                break;
                
            case 1:
                self.buttonZoomIn()
                break;
                
            case 2:
                self.buttonMoveLeft()
                break;
                
            case 3:
                self.buttonMoveRight()
                break;
                
            case 4:
                self.buttonMoveTop()
                break;
                
            case 5:
                self.buttonMoveBottom()
                break;
                
            case 6:
                self.buttonRotateClockwise()
                break;
                
            case 7:
                self.buttonRotateAntiClockwise()
                break;
                
            default:
                break;
            }
            
    }
    
    //MARK:-
    func backgroundTransitionAnimation (_ index: Int) {
        let type = backgroundTransitions[index]
        /*
        UIView.transition(with: self.btnAnimate, duration: 0.4, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: {
            self.btnAnimate.backgroundColor = UIColor.blue
        }) { (result) in
            self.btnAnimate.backgroundColor = UIColor.white
        }
        */
//        CATransaction.begin()
//        CATransaction.setAnimationDuration(0.5)
//
//        self.btnAnimate.layer.backgroundColor = UIColor.blue.cgColor
//        CATransformLayer.
//
//        CATransaction.commit()
        
//        let flash = CABasicAnimation(keyPath: "opacity")
//        flash.duration = 0.5
//        flash.fromValue = 1
//        flash.toValue = 0.1
//        //flash.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//        flash.timingFunction = CAMediaTimingFunction.init(controlPoints: 0, 0, Float(self.btnAnimate.frame.size.width), Float(self.btnAnimate.frame.size.height))
//        flash.autoreverses = true
//
//        self.btnAnimate.layer.add(flash, forKey: nil)

        
//        CALayer *layer = [CALayer layer];
//        layer.frame = CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height);
//        layer.backgroundColor = [UIColor blueColor].CGColor;
//        [self.view.layer addSublayer:layer];
//
//        CABasicAnimation *animation = [CABasicAnimation animation];
//        animation.keyPath = @"position.y";
//        animation.byValue = @(-self.view.bounds.size.height);
//        animation.duration = 1;
//
//        animation.fillMode = kCAFillModeForwards;
//        animation.removedOnCompletion = NO;
//
//        [layer addAnimation:animation forKey:@"Splash"];
        
        let layer = CALayer.init()
        layer.frame = self.btnAnimate.frame
        layer.backgroundColor = UIColor.blue.cgColor
        self.view.layer.addSublayer(layer)
        
        let animation = CABasicAnimation.init()
        animation.keyPath = "position.y"
        animation.byValue = -self.btnAnimate.bounds.size.height
        animation.duration = 1.0
        
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = true
        animation.autoreverses = true
        layer.add(animation, forKey: "Splash")
        
        switch type {
        case "Fade" : break
        case "Back Pulse" : break
        case "Sweep to Right" : break
        case "Sweep to Left" : break
        case "Sweep to Bottom" : break
        case "Sweep to Top" : break
        case "Bounce to Right" : break
        case "Bounce to Left" : break
        case "Bounce to Bottom" : break
        case "Bounce to Top" : break
        case "Radial Out" : break
        case "Radial In" : break
        case "Rectangle In" : break
        case "Rectangel Out" : break
        case "Shutter in Horizontal" : break
        case "Shutter Out Horizontal" : break
        case "Shutter in Vertical" : break
        case "Shutter Out Vertical" : break
        default:
            break
        }
        
        
    }
    
    func borderTransitionAnimation(_ Index: Int) -> Void {
    
        let type = borderTransition[Index]
        
        switch(type) {
            case "Border Fade" :
                self.borderFade()
                break
            case "Hollow" :
                self.hollow()
                break
            case "Trim":
                self.trim()
                break
            case "Ripple Out" :
                self.rippleOut()
            break
            case "Ripple In" : break
            case "Outline Out" : break
            case "Outline In" : break
            case "Round corner" : break
            
            default : break;
        }
    }
    
    func borderFade() -> Void {
        UIView.animate(withDuration: 0.5, animations: {
            self.btnAnimate.layer.borderWidth = 3.0
            self.btnAnimate.layer.borderColor = UIColor.blue.cgColor
        }) { (_) in
            self.btnAnimate.layer.borderWidth = 0.0
            self.btnAnimate.layer.borderColor = UIColor.clear.cgColor
        }
    }
    
    func hollow() {
        
        self.btnAnimate.layer.borderWidth = 3.0
        self.btnAnimate.layer.borderColor = UIColor.white.cgColor
        
        UIView.animate(withDuration: 0.5, animations: {
            self.btnAnimate.backgroundColor = UIColor.lightGray
        }) { (_) in
            self.btnAnimate.backgroundColor = UIColor.white
            self.btnAnimate.layer.borderWidth = 0.0
            self.btnAnimate.layer.borderColor = UIColor.clear.cgColor

        }

    }
    func trim() {
        
    }
    func rippleOut() {
        
    }
    func rippleIn() {
        
    }
    func outlineOut() {
        
    }
    func outlineIn() {
        
    }
    func roundCorner() {
        
    }
    
    func buttonZoomOut() -> Void {
        self.btnAnimate.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
    }
    
    func buttonZoomIn() -> Void {
        self.btnAnimate.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    }
    
    func buttonMoveLeft() -> Void {
        self.btnAnimate.transform = CGAffineTransform.init(translationX: -30.0, y: 0.0)
    }
    
    func buttonMoveRight() -> Void {
        self.btnAnimate.transform = CGAffineTransform.init(translationX: 30.0, y: 0.0)
    }
    
    func buttonMoveTop() -> Void {
        self.btnAnimate.transform = CGAffineTransform.init(translationX: 0.0, y: -30.0)
    }
    
    func buttonMoveBottom() -> Void {
        self.btnAnimate.transform = CGAffineTransform.init(translationX: 0.0, y: 30.0)
    }
    
    func buttonRotateClockwise() -> Void {
        self.btnAnimate.transform = CGAffineTransform.init(rotationAngle: CGFloat((Double.pi*120.0)/180.0))
    }
    
    func buttonRotateAntiClockwise() -> Void {
        self.btnAnimate.transform = CGAffineTransform.init(rotationAngle: CGFloat((Double.pi*(-120.0))/180.0))
    }
    
    


}



