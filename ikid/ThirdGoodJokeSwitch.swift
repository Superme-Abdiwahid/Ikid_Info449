//
//  ThirdGoodJokeSwitch.swift
//  ikid
//
//  Created by stlp on 5/7/22.
//

import Foundation
import UIKit
class ThirdGoodJokeSwitch: UIViewController {
    var thirdJokeFront: ThirdJokeFront! = nil
    var thridJokeCardBack:ThirdJokeBack! = nil
    @IBAction func switchViews(_ sender: Any) {
        secondView()
        firstView()

        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)

        if thirdJokeFront != nil &&
            thirdJokeFront?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            thridJokeCardBack.view.frame = self.view.frame
            switchViewController(thirdJokeFront, to: thridJokeCardBack)
        }
        else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            thirdJokeFront.view.frame = view.frame
            switchViewController(thridJokeCardBack, to: thirdJokeFront)
        }
        UIView.commitAnimations()
    }
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMove(toParent: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParent()
        }
        
        if to != nil {
            self.addChild(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParent: self)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        firstView()
        switchViewController(nil, to: thirdJokeFront)
    }
    
    fileprivate func firstView(){
        if(thirdJokeFront == nil){
            thirdJokeFront = storyboard?.instantiateViewController(identifier: "Good_Joke3")
            as! ThirdJokeFront
        }
    }
    fileprivate func secondView(){
        if(thridJokeCardBack == nil){
            thridJokeCardBack = storyboard?.instantiateViewController(withIdentifier: "ThirdJokeBack")
            as! ThirdJokeBack
        }
    }
    
    
}

