//
//  ViewController.swift
//  Button
//
//  Created by Apple on 08/02/18.
//  Copyright © 2018 spb. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var btnFirstAnimationSecond = 0.3
    var btnSecondAnimationSecond = 0.2
    
    var animationHeader = [String]()
    
    var animationType = [String]()
    var backgroundTransitions = [String]()
    var icon = [String]()
    var borderTransition = [String]()
    var shadowAndGrowTransition = [String]()
    var speechBubbles = [String]()
    var curls = [String]()

    
    let blueColor = UIColor.init(red: 0.0/255.0, green: 188.0/255.0, blue: 212.0/255.0, alpha: 1.0)
    var selectedIndex = 0
    
    @IBOutlet weak var btnAnimate: UIButton!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var collectionVw: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenWidth = UIScreen.main.bounds.width
        
        animationHeader.append("2D Transitions")
        animationHeader.append("Background Transitions")
        animationHeader.append("Icons")
        animationHeader.append("Border Transitions")
        animationHeader.append("Shadow and Glow Transitions")
        animationHeader.append("Speech Bubbles")
        animationHeader.append("Curls")
        
        
        //2D Transition
        animationType.append("Zoom out")
        animationType.append("Zoom in")
        animationType.append("Move left")
        animationType.append("Move right")
        animationType.append("Move top")
        animationType.append("Move bottom")
        animationType.append("Rotate Clockwise")
        animationType.append("Rotate Anti-Clockwise")
        /*
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
        */
 
        /*
        //Icon
        icon.append("Icon back")
        icon.append("Icon forward")
        icon.append("Icon down")
        icon.append("Icon up")
        icon.append("Icon spin")
        icon.append("Icon drop")
        icon.append("Icon fade")
        icon.append("Icon float away")
        icon.append("Icon sink away")
        icon.append("Icon grow")
        icon.append("Icon shrink")
        icon.append("Icon pulus")
        icon.append("Icon pulus grow")
        icon.append("Icon pulus shrink")
        icon.append("Icon push")
        icon.append("Icon pop")
        icon.append("Icon bounce")
        icon.append("Icon rotate")
        icon.append("Icon grow rotate")
        icon.append("Icon float")
        icon.append("Icon sink")
        icon.append("Icon bob")
        icon.append("Icon hang")
        icon.append("Icon wobble horizontal")
        icon.append("Icon wobble vertical")
        icon.append("Icon buzz")
        icon.append("Icon buzz out")
        */
        
        
        //Border Animation
        borderTransition.append("Border Fade")
        borderTransition.append("Hollow")
        borderTransition.append("Trim")
        borderTransition.append("Ripple Out")
        borderTransition.append("Ripple In")
        borderTransition.append("Outline Out")
        borderTransition.append("Outline In")
        borderTransition.append("Round corner")
        borderTransition.append("Underline from left")
        borderTransition.append("Underline from center")
        borderTransition.append("Underline form right")
        borderTransition.append("Reveal")
        borderTransition.append("Underline Reveal")
        borderTransition.append("Overline Reveal")
        borderTransition.append("Overline From Left")
        borderTransition.append("Overline From Center")
        borderTransition.append("Overline From Right")
        
        //Shadow and grow transition
        shadowAndGrowTransition.append("Shadow")
        shadowAndGrowTransition.append("Grow Shadow")
        shadowAndGrowTransition.append("Float Shadow")
        shadowAndGrowTransition.append("Grow")
        shadowAndGrowTransition.append("Shadow Radial")
        shadowAndGrowTransition.append("Box Shadow Outset")
        shadowAndGrowTransition.append("Box Shadow Inset")
        
        
        /*
        //Speech Bubbles
        speechBubbles.append("Bubble Top")
        speechBubbles.append("Bubble Right")
        speechBubbles.append("Bubble Bottom")
        speechBubbles.append("Bubble Left")
        speechBubbles.append("Bubble Float Top")
        speechBubbles.append("Bubble Float Right")
        speechBubbles.append("Bubble Float Bottom")
        speechBubbles.append("Bubble Float Left")
        */
        
        //Curls
        curls.append("Curl Top Left")
        curls.append("Curl Top Right")
        curls.append("Curl Bottom Left")
        curls.append("Curl Bottom Right")

    
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
        else if section == 4 {
            return shadowAndGrowTransition.count
        }
        else if section == 5 {
            return speechBubbles.count
        }
        else if section == 6 {
            return curls.count
        }
        return 0

    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let kWhateverHeightYouWant = 70
        return CGSize.init(width: (self.collectionVw.bounds.size.width-20)/3, height: CGFloat(kWhateverHeightYouWant))
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "CollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! AnimationTitleCell
        
        //Title
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
        else if indexPath.section == 4 {
            title = shadowAndGrowTransition[indexPath.row]
        }
        else if indexPath.section == 5 {
            title = speechBubbles[indexPath.row]
        }
        else if indexPath.section == 6 {
            title = curls[indexPath.row]
        }
        cell.lblAnimationTitle.text = title
        
        //Corner radius
        cell.containerView.layer.cornerRadius = 15.0
        
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
        else if indexPath.section == 4 {
            shadowAndGrow(selectedIndex)
        }
        else if indexPath.section == 5 {
            
        }
        else if indexPath.section == 6 {
            curlsAnimation(indexPath.row)
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
        case "Ripple In" :
            self.rippleIn()
            break
        case "Outline Out" :
            self.outlineOut()
            break
        case "Outline In" :
            self.outlineIn()
            break
        case "Round corner" :
            self.roundCorner()
            break
        case "Underline from left" :
            self.underLineFromLeft()
            break
        case "Underline from center" :
            self.underlineFromCenter()
            break
        case "Underline form right" :
            self.underLineFromRight()
            break
        case "Reveal" :
            self.reveal()
            break
        case "Underline Reveal" :
            self.underlineReveal()
            break
        case "Overline Reveal" :
            self.overlineReveal()
            break
        case "Overline From Left" :
            self.overlineFromLeft()
            break
        case "Overline From Center" :
            self.overlineFromCenter()
            break
        case "Overline From Right" :
            self.overlineFromRight()
            break
            
            
        default : break;
        }
    }
    
    func borderFade() -> Void {
        
        let layer = CALayer.init()
        layer.frame = CGRect.init(x: 0, y: 0, width: self.btnAnimate.frame.size.width, height: self.btnAnimate.frame.size.height)
        layer.borderWidth = 3.0;
        layer.borderColor = UIColor.lightGray.cgColor
        layer.backgroundColor = UIColor.clear.cgColor
        
        self.btnAnimate.layer.addSublayer(layer)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 0.5
        animation.fromValue = 0
        animation.toValue = 1
        
        CATransaction.setCompletionBlock {
            layer.removeFromSuperlayer()
        }
        layer.add(animation, forKey: "MyAnimation")
        
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
        
        let layer = CALayer.init()
        layer.frame = CGRect.init(x: 3, y: 3, width: self.btnAnimate.frame.size.width-6, height: self.btnAnimate.frame.size.height-6)
        layer.borderWidth = 3.0;
        layer.borderColor = UIColor.lightGray.cgColor
        layer.backgroundColor = UIColor.clear.cgColor
        
        self.btnAnimate.layer.addSublayer(layer)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 0.5
        animation.fromValue = 0
        animation.toValue = 1
        
        CATransaction.setCompletionBlock {
            layer.removeFromSuperlayer()
        }
        layer.add(animation, forKey: "MyAnimation")
    }
    
    func rippleOut() {
        
    }
    func rippleIn() {
        
    }
    func outlineOut() {
        
        let startFrame = CGRect.init(x: -5, y: -5, width: self.btnAnimate.frame.size.width+10, height: self.btnAnimate.frame.size.height+10)

        let endFrame = CGRect.init(x: -15, y: -15, width: self.btnAnimate.frame.size.width+30, height: self.btnAnimate.frame.size.height+30)
        
        
        let layer = CALayer.init()
        layer.frame = startFrame
        layer.borderWidth = 3.0
        layer.borderColor = UIColor.white.cgColor
        layer.backgroundColor = UIColor.clear.cgColor
        
        self.btnAnimate.layer.addSublayer(layer)
        
        let baseAnimation = CABasicAnimation.init(keyPath: "bounds")
        baseAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        baseAnimation.fromValue = NSValue.init(cgRect: startFrame)
        baseAnimation.toValue = NSValue.init(cgRect: endFrame)
        layer.frame = endFrame
        CATransaction.setCompletionBlock {
            layer.removeFromSuperlayer()
        }
        layer.add(baseAnimation, forKey: "frame")
    }
    func outlineIn() {
        
        let startFrame = CGRect.init(x: -15, y: -15, width: self.btnAnimate.frame.size.width+30, height: self.btnAnimate.frame.size.height+30)
        
        let endFrame = CGRect.init(x: -5, y: -5, width: self.btnAnimate.frame.size.width+10, height: self.btnAnimate.frame.size.height+10)
        
        let layer = CALayer.init()
        layer.frame = startFrame
        layer.borderWidth = 3.0
        layer.borderColor = UIColor.white.cgColor
        layer.backgroundColor = UIColor.clear.cgColor
        
        self.btnAnimate.layer.addSublayer(layer)
        
        let baseAnimation = CABasicAnimation.init(keyPath: "bounds")
        baseAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        baseAnimation.fromValue = NSValue.init(cgRect: startFrame)
        baseAnimation.toValue = NSValue.init(cgRect: endFrame)
        layer.frame = endFrame
        CATransaction.setCompletionBlock {
            layer.removeFromSuperlayer()
        }
        layer.add(baseAnimation, forKey: "frame")

        
        
    }
    func roundCorner() {
        
        UIView.animate(withDuration: 0.70, animations: {
            self.btnAnimate.layer.cornerRadius = 18.0
        }) { (_) in
            UIView.animate(withDuration: 0.30, animations: {
                self.btnAnimate.layer.cornerRadius = 0.0
            }) { (_) in
            }
        }
        
    }
    
    func underLineFromLeft() {
        
        let bezierpath = UIBezierPath.init()
        bezierpath.move(to: CGPoint.init(x: 0, y: self.btnAnimate.frame.size.height-2))
        bezierpath.addLine(to: CGPoint.init(x:  self.btnAnimate.frame.size.width, y: self.btnAnimate.frame.size.height-2))
        
        let layer = CAShapeLayer.init()
        layer.strokeColor = blueColor.cgColor
        layer.lineWidth = 4.0
        layer.path = bezierpath.cgPath
        self.btnAnimate.layer.addSublayer(layer)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 0.5
        animation.fromValue = 0
        animation.toValue = 1
        
        CATransaction.setCompletionBlock {
            layer.removeFromSuperlayer()
        }
        layer.add(animation, forKey: "MyAnimation")
        
    }
    func underlineFromCenter() {
        
        let center = CGPoint.init(x: (self.btnAnimate.frame.width/2), y: self.btnAnimate.frame.height-2)
        //Rignt -- >
        let bezierpathToRight = UIBezierPath.init()
        bezierpathToRight.move(to: center)
        bezierpathToRight.addLine(to: CGPoint.init(x:  self.btnAnimate.frame.size.width, y: self.btnAnimate.frame.size.height-2))
        
        let layerRight = CAShapeLayer.init()
        layerRight.strokeColor = blueColor.cgColor
        layerRight.lineWidth = 4.0
        layerRight.path = bezierpathToRight.cgPath
        self.btnAnimate.layer.addSublayer(layerRight)
        
        //Left -- >
        let bezierpathToLeft = UIBezierPath.init()
        bezierpathToLeft.move(to: center)
        bezierpathToLeft.addLine(to: CGPoint.init(x:  0, y: self.btnAnimate.frame.size.height-2))
        
        let layerLeft = CAShapeLayer.init()
        layerLeft.strokeColor = blueColor.cgColor
        layerLeft.lineWidth = 4.0
        layerLeft.path = bezierpathToLeft.cgPath
        self.btnAnimate.layer.addSublayer(layerLeft)
        
        //Animaiton -- >
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 0.5
        animation.fromValue = 0
        animation.toValue = 1
        
        CATransaction.setCompletionBlock {
            layerLeft.removeFromSuperlayer()
            layerRight.removeFromSuperlayer()
        }
        layerLeft.add(animation, forKey: "MyAnimation")
        layerRight.add(animation, forKey: "MyAnimation")
        
    }
    func underLineFromRight() {
        let bezierpath = UIBezierPath.init()
        bezierpath.move(to: CGPoint.init(x:  self.btnAnimate.frame.size.width, y: self.btnAnimate.frame.size.height-2))
        bezierpath.addLine(to: CGPoint.init(x: 0, y: self.btnAnimate.frame.size.height-2))
        
        let layer = CAShapeLayer.init()
        layer.strokeColor = blueColor.cgColor
        layer.lineWidth = 4.0
        layer.path = bezierpath.cgPath
        self.btnAnimate.layer.addSublayer(layer)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 0.5
        animation.fromValue = 0
        animation.toValue = 1
        
        CATransaction.setCompletionBlock {
            layer.removeFromSuperlayer()
        }
        layer.add(animation, forKey: "MyAnimation")
    }
    
    func reveal () {
        
        let layer = CALayer.init()
        layer.frame = CGRect.init(x: 0, y: 0, width: self.btnAnimate.frame.size.width, height: self.btnAnimate.frame.size.height)
        layer.borderWidth = 3.0;
        layer.borderColor = UIColor.lightGray.cgColor
        layer.backgroundColor = UIColor.clear.cgColor
        
        self.btnAnimate.layer.addSublayer(layer)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 0.5
        animation.fromValue = 0
        animation.toValue = 1
        
        CATransaction.setCompletionBlock {
            layer.removeFromSuperlayer()
        }
        layer.add(animation, forKey: "MyAnimation")
        


        
    }
    func underlineReveal () {
        
        let btnRect = self.btnAnimate.frame
        
        let startFrame = CGRect.init(x: 0, y: btnRect.size.height, width: btnRect.size.width, height: 0)
        
        let endFrame = CGRect.init(x: 0, y: btnRect.size.height-5, width: btnRect.size.width, height: 5)
        
        
        let layer = CALayer.init()
        layer.frame = startFrame
        layer.borderWidth = 2.5
        layer.borderColor = UIColor.gray    .cgColor
        layer.backgroundColor = UIColor.clear.cgColor
        
        self.btnAnimate.layer.addSublayer(layer)
        
        let baseAnimation = CABasicAnimation.init(keyPath: "bounds")
        baseAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        baseAnimation.fromValue = NSValue.init(cgRect: startFrame)
        baseAnimation.toValue = NSValue.init(cgRect: endFrame)
        layer.frame = endFrame
        CATransaction.setCompletionBlock {
            layer.removeFromSuperlayer()
        }
        layer.add(baseAnimation, forKey: "frame")

        
        
    }
    func overlineReveal () {
        /*
        //let bezierpath = UIBezierPath(roundedRect: CGRect.init(x: 0, y: 2, width: self.btnAnimate.frame.width, height: 4), cornerRadius: 0.0)
        
        let layer = CAShapeLayer.init()
        layer.frame = CGRect.init(x: 0, y: 2, width: self.btnAnimate.frame.width, height: 4)
        layer.strokeColor = blueColor.cgColor
        layer.lineWidth = 4.0
        //layer.path = bezierpath.cgPath
        self.btnAnimate.layer.addSublayer(layer)
        
        let animation = CABasicAnimation(keyPath: "fillColor")
        animation.duration = 0.5
        animation.fromValue = 0
        animation.toValue = 1

        CATransaction.setCompletionBlock {
            layer.removeFromSuperlayer()
        }
        layer.add(animation, forKey: "MyAnimation")
*/
        
        
        // setup
        let rect = CGRect(x: 0, y: 0, width: self.btnAnimate.bounds.width, height: 10)
        
        let rectShape = CAShapeLayer.init()

        rectShape.bounds = rect
        rectShape.position = view.center
        rectShape.path = UIBezierPath(rect:rect).cgPath
        
        // 1
        rectShape.lineWidth = 10
        rectShape.strokeColor = blueColor.cgColor
        
        self.btnAnimate.layer.addSublayer(rectShape)
        // animate
        let animation = CABasicAnimation(keyPath: "border")
        // 2
        animation.toValue = 1000
        animation.duration = 1 // duration is 1 sec
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut) // animation curve is Ease Out
        animation.fillMode = kCAFillModeBoth // keep to value after finishing
        animation.isRemovedOnCompletion = false // don't remove after finishing
        rectShape.add(animation, forKey: animation.keyPath)
        //rectShape.addAnimation(animation, forKey: animation.keyPath)
        
    }
    func overlineFromLeft () {
        let bezierpath = UIBezierPath.init()
        bezierpath.move(to: CGPoint.init(x: 0, y: 0))
        bezierpath.addLine(to: CGPoint.init(x:  self.btnAnimate.frame.size.width, y: 0))
        
        let layer = CAShapeLayer.init()
        layer.strokeColor = blueColor.cgColor
        layer.lineWidth = 4.0
        layer.path = bezierpath.cgPath
        self.btnAnimate.layer.addSublayer(layer)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 0.5
        animation.fromValue = 0
        animation.toValue = 1
        
        CATransaction.setCompletionBlock {
            layer.removeFromSuperlayer()
        }
        layer.add(animation, forKey: "MyAnimation")
    }
    func overlineFromCenter () {
    
        let center = CGPoint.init(x: (self.btnAnimate.frame.width/2), y: 0)
        //Rignt -- >
        let bezierpathToRight = UIBezierPath.init()
        bezierpathToRight.move(to: center)
        bezierpathToRight.addLine(to: CGPoint.init(x:  self.btnAnimate.frame.size.width, y: 0))
        
        let layerRight = CAShapeLayer.init()
        layerRight.strokeColor = blueColor.cgColor
        layerRight.lineWidth = 4.0
        layerRight.path = bezierpathToRight.cgPath
        self.btnAnimate.layer.addSublayer(layerRight)
        
        //Left -- >
        let bezierpathToLeft = UIBezierPath.init()
        bezierpathToLeft.move(to: center)
        bezierpathToLeft.addLine(to: CGPoint.init(x:  0, y: 0))
        
        let layerLeft = CAShapeLayer.init()
        layerLeft.strokeColor = blueColor.cgColor
        layerLeft.lineWidth = 4.0
        layerLeft.path = bezierpathToLeft.cgPath
        self.btnAnimate.layer.addSublayer(layerLeft)
        
        //Animaiton -- >
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 0.5
        animation.fromValue = 0
        animation.toValue = 1
        
        CATransaction.setCompletionBlock {
            layerLeft.removeFromSuperlayer()
            layerRight.removeFromSuperlayer()
        }
        layerLeft.add(animation, forKey: "MyAnimation")
        layerRight.add(animation, forKey: "MyAnimation")
    }
    
    func overlineFromRight () {
        let bezierpath = UIBezierPath.init()
        bezierpath.move(to: CGPoint.init(x:  self.btnAnimate.frame.size.width, y: 0))
        bezierpath.addLine(to: CGPoint.init(x: 0, y: 0))
        
        let layer = CAShapeLayer.init()
        layer.strokeColor = blueColor.cgColor
        layer.lineWidth = 4.0
        layer.path = bezierpath.cgPath
        self.btnAnimate.layer.addSublayer(layer)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 0.5
        animation.fromValue = 0
        animation.toValue = 1
        
        CATransaction.setCompletionBlock {
            layer.removeFromSuperlayer()
        }
        layer.add(animation, forKey: "MyAnimation")
        
    }
    
    //MARK:-
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
    
    //MARK:- Shadow and grow transition
    func shadowAndGrow(_ index: Int) {
        let animation = shadowAndGrowTransition[index]
        
        switch animation {
        case "Shadow":
            self.shadow()
            break
        case "Grow Shadow":
            self.growShadow()
            break
        case "Float Shadow":
            self.floatShadow()
            break
        case "Grow":
            self.grow()
            break
        case "Shadow Radial":
            self.shadowRadial()
            break
        case "Box Shadow Outset":
            self.boxShadowOutset()
            break
        case "Box Shadow Inset":
            self.boxShadowInset()
            break
        default:
            break
        }
        
    }
    func shadow() {
        
        self.btnAnimate.layer.shadowRadius = 2.0
        self.btnAnimate.layer.shadowColor = UIColor.black.cgColor
        self.btnAnimate.layer.shadowOffset = CGSize.init(width: 3.0, height: 3.0)

        let animation = CABasicAnimation(keyPath: "shadowOpacity")
        animation.fromValue = 0.0
        animation.toValue = 0.5
        animation.duration = 1
        CATransaction.setCompletionBlock {
            self.btnAnimate.layer.shadowOpacity = 0.0
            self.btnAnimate.layer.shadowRadius = 0.0
            self.btnAnimate.layer.shadowColor = UIColor.clear.cgColor

        }
        self.btnAnimate.layer.add(animation, forKey: "shadowOpacity")
        
    }
    
    func growShadow() {
        

    }
    
    func floatShadow() {
        
    }
    
    func grow() {
        
        self.btnAnimate.layer.shadowRadius = 6.0
        self.btnAnimate.layer.shadowColor = UIColor.black.cgColor
        self.btnAnimate.layer.shadowOffset = CGSize.init(width: 0.0, height: 0.0)
        
        let animation = CABasicAnimation(keyPath: "shadowOpacity")
        animation.fromValue = 0.0
        animation.toValue = 0.5
        animation.duration = 1
        CATransaction.setCompletionBlock {
            self.btnAnimate.layer.shadowOpacity = 0.0
            self.btnAnimate.layer.shadowRadius = 0.0
            self.btnAnimate.layer.shadowColor = UIColor.clear.cgColor
            
        }
        self.btnAnimate.layer.add(animation, forKey: "shadowOpacity")

    }
    
    func shadowRadial() {
        
    }
    
    func boxShadowOutset() {
        
        self.btnAnimate.layer.shadowRadius = 3.0
        self.btnAnimate.layer.shadowColor = UIColor.black.cgColor
        self.btnAnimate.layer.shadowOffset = CGSize.init(width: 3.0, height: 3.0)
        
        let animation = CABasicAnimation(keyPath: "shadowOpacity")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.duration = 1
        CATransaction.setCompletionBlock {
            self.btnAnimate.layer.shadowOpacity = 0.0
            self.btnAnimate.layer.shadowRadius = 0.0
            self.btnAnimate.layer.shadowColor = UIColor.clear.cgColor
            
        }
        self.btnAnimate.layer.add(animation, forKey: "shadowOpacity")

        
    }
    
    func boxShadowInset() {
        

        let bezierpath = UIBezierPath.init()
        bezierpath.move(to: CGPoint.init(x: 0, y: self.btnAnimate.frame.size.height))
        bezierpath.addLine(to: CGPoint.init(x: 0, y: self.btnAnimate.frame.size.height))
        bezierpath.addLine(to: CGPoint.init(x: 0, y: 0))
        bezierpath.addLine(to: CGPoint.init(x: self.btnAnimate.frame.size.width, y: 0))
        bezierpath.addLine(to: CGPoint.init(x: self.btnAnimate.frame.size.width, y: 0))
        bezierpath.addLine(to: CGPoint.init(x: 0, y: 0))
        bezierpath.addLine(to: CGPoint.init(x: 0, y: self.btnAnimate.frame.size.height))
        
        let layer = self.btnAnimate.layer.presentation()//CAShapeLayer.init()
        layer?.shadowColor = UIColor.black.cgColor
        layer?.shadowRadius = 10.0
        layer?.shadowOpacity = 1.0
        layer?.shadowOffset = CGSize.init(width: 1.0, height: 1.0)
        /*
        layer.fillColor = UIColor.black.cgColor
        layer.strokeColor = UIColor.black.cgColor
        layer.lineWidth = 0.3
        layer.path = bezierpath.cgPath
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 10.0
        layer.shadowOpacity = 1.0
        layer.shadowOffset = CGSize.init(width: 1.0, height: 1.0)
        */
        //self.btnAnimate.layer.addSublayer(layer)

        
        
        /*
        [[innerShadow layer] setMasksToBounds:YES];
        [[innerShadow layer] setCornerRadius:12.0f];
        [[innerShadow layer] setBorderColor:[UIColorFromRGB(180, 180, 180) CGColor]];
        [[innerShadow layer] setBorderWidth:1.0f];
        [[innerShadow layer] setShadowColor:[UIColorFromRGB(0, 0, 0) CGColor]];
        [[innerShadow layer] setShadowOffset:CGSizeMake(0, 0)];
        [[innerShadow layer] setShadowOpacity:1];
        [[innerShadow layer] setShadowRadius:2.0];
        */
        
        /*
        CAShapeLayer* shadowLayer = [CAShapeLayer layer];
        [shadowLayer setFrame:[self bounds]];
        
        // Standard shadow stuff
        [shadowLayer setShadowColor:[[UIColor colorWithWhite:0 alpha:1] CGColor]];
        [shadowLayer setShadowOffset:CGSizeMake(0.0f, 0.0f)];
        [shadowLayer setShadowOpacity:1.0f];
        [shadowLayer setShadowRadius:5];
        
        // Causes the inner region in this example to NOT be filled.
        [shadowLayer setFillRule:kCAFillRuleEvenOdd];
        
        // Create the larger rectangle path.
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathAddRect(path, NULL, CGRectInset(bounds, -42, -42));
        
        // Add the inner path so it's subtracted from the outer path.
        // someInnerPath could be a simple bounds rect, or maybe
        // a rounded one for some extra fanciness.
        CGPathAddPath(path, NULL, someInnerPath);
        CGPathCloseSubpath(path);
        
        [shadowLayer setPath:path];
        CGPathRelease(path);
        
        [[self layer] addSublayer:shadowLayer];
        */
    }
    
    //MARK:- Curls
    func curlsAnimation(_ index: Int) {
        let animation = curls[index]

        switch animation {

        case "Curl Top Left":
            self.curlsTopLeft()
            break
        case "Curl Top Right":
            self.curlsTopRight()
            break
        case "Curl Bottom Left":
            self.curlsBottomLeft()
            break

        case "Curl Bottom Right":
            self.curlsBottomRight()
            break
        default:
            break
        }
    }
    
    func curlsTopLeft () {
            let animation = CATransition.init()
            animation.duration = 1.0
            animation.startProgress = 0.0
            animation.endProgress = 0.6
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            animation.type = "CurlTopLeft"
            animation.subtype = kCATransitionFromTop
            animation.isRemovedOnCompletion = true
            animation.fillMode = kCAFillModeBoth
            
            self.btnAnimate.layer.add(animation, forKey: "FlipAnimation")
        
    }
    
    func curlsTopRight () {
        let animation = CATransition.init()
        animation.duration = 1.0
        animation.startProgress = 0.0
        animation.endProgress = 0.6
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.type = "pageCurl"
        animation.subtype = kCATransitionFromRight
        animation.isRemovedOnCompletion = true
        animation.fillMode = kCAFillModeBoth
        
        self.btnAnimate.layer.add(animation, forKey: "FlipAnimation")
    }
    
    func curlsBottomRight() {
        let animation = CATransition.init()
        animation.duration = 1.0
        animation.startProgress = 0.0
        animation.endProgress = 0.6
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = "pageCurl"
        animation.subtype = kCATransitionFromTop
        animation.isRemovedOnCompletion = true
        animation.fillMode = kCAFillModeForwards
        
        self.btnAnimate.layer.add(animation, forKey: "FlipAnimation")

    }
    
    func curlsBottomLeft() {
        
        let animation = CATransition.init()
        animation.duration = 1.0
        animation.startProgress = 0.0
        animation.endProgress = 0.6
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = "pageCurl"
        animation.subtype = kCATransitionFromLeft
        animation.isRemovedOnCompletion = true
        animation.fillMode = kCAFillModeForwards
        
        self.btnAnimate.layer.add(animation, forKey: "FlipAnimation")
        
    }
}



