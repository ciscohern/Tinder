//
//  CardsViewController.swift
//  Tinder
//
//  Created by Francisco Hernanedez on 10/30/18.
//  Copyright © 2018 Francisco Hernanedz. All rights reserved.
//

import UIKit

class CardsViewContoller: UIViewController {
    
    @IBOutlet weak var cardImageView: UIImageView!
    var cardInitialCenter: CGPoint!
    var cardCenter: CGPoint!
    var divisor: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(slideCard(_:)))
        
        cardImageView.isUserInteractionEnabled = true
        cardImageView.addGestureRecognizer(panGestureRecognizer)
        divisor = (view.frame.width / 2)/0.61
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func didTapCard(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "tappedCard", sender: self)
    }
    
    
    
    @IBAction func slideCard(_ sender: UIPanGestureRecognizer) {
        
        
        let translation = sender.translation(in: view)
        let xFromCenter = cardImageView.center.x - view.center.x
        
        cardImageView.transform = CGAffineTransform(rotationAngle: xFromCenter/divisor)
        print(xFromCenter)
        
        if sender.state == .began {
            print("Gesture began")
            cardCenter = cardImageView.center
        } else if sender.state == .changed {
            print("Gesture is changing")
            cardImageView.center = CGPoint(x: cardCenter.x + translation.x, y: cardCenter.y)
            
        } else if sender.state == .ended {
            print("Gesture ended")
            
            if (cardImageView.center.x < 75){
                UIView.animate(withDuration: 0.3, animations: {
                    self.cardImageView.alpha = 0
                    self.cardImageView.center = CGPoint(x: self.cardImageView.center.x - 150, y: self.cardImageView.center.y)
                }){(Bool) in
                    self.cardImageView.transform = CGAffineTransform.identity
                    self.cardImageView.center = self.view.center
                    self.cardImageView.alpha = 1
                }
                return
            }else if (cardImageView.center.x > (view.frame.width - 75)) {
                UIView.animate(withDuration: 0.3, animations: {
                    self.cardImageView.alpha = 0
                    self.cardImageView.center = CGPoint(x: self.cardImageView.center.x + 150, y: self.cardImageView.center.y)
                }){(Bool) in
                    self.cardImageView.transform = CGAffineTransform.identity
                    self.cardImageView.center = self.view.center
                    self.cardImageView.alpha = 1
                }
                return
            }
            self.cardImageView.transform = CGAffineTransform.identity
            self.cardImageView.center = self.view.center
            self.cardImageView.alpha = 1
        }
        
    }
    
    
}

