//
//  PunFirstJokeSwitch.swift
//  ikid
//
//  Created by stlp on 5/7/22.
//

import Foundation
import UIKit
class PunFirstJokeSwitch: UIViewController{
    var punFirstJokeFront: PunFirstJokeFront! = nil
    var punFirstJokeBack: PunFirstJokeBack! = nil
    
    
    
    @IBAction func switchViews(_ sender: Any){
        backViewDisplay()
        firstViewDisplay()
        UIView.beginAnimations("View flip", context: nil)
        UIView.setAnimationDuration(0.5)
        UIView.setAnimationCurve(.easeInOut)
        if(punFirstJokeFront != nil && punFirstJokeFront?.view.superview != nil){
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            punFirstJokeBack.view.frame = self.view.frame
            switchView(punFirstJokeFront, to: punFirstJokeBack)
        }else{
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            punFirstJokeFront.view.frame = view.frame
            switchView(punFirstJokeBack, to: punFirstJokeFront)
        }
        UIView.commitAnimations()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        firstViewDisplay()
        
    }
    
    fileprivate func switchView(_ from: UIViewController?, to: UIViewController?){
        if(from != nil){
            from!.willMove(toParent: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParent()
        }
        
        if(to != nil){
            self.addChild(to!)
            self.view.insertSubview(to!.view, at: 0)
            to?.didMove(toParent: self)
        }
    }
    
    fileprivate func firstViewDisplay(){
        if punFirstJokeFront == nil{
            punFirstJokeFront = storyboard?.instantiateViewController(withIdentifier: "Punned_First")
            as! PunFirstJokeFront
        }
    }
    
    fileprivate func backViewDisplay(){
        if punFirstJokeBack == nil{
            punFirstJokeBack = storyboard?.instantiateViewController(withIdentifier: "Punned_Back")
            
            as!PunFirstJokeBack
        }
    }
}
