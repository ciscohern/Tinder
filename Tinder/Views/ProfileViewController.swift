//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Francisco Hernanedez on 10/30/18.
//  Copyright © 2018 Francisco Hernanedz. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tappedDone(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "tappedDone", sender: self)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
