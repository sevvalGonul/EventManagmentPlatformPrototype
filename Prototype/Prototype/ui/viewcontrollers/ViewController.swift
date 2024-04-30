//
//  ViewController.swift
//  Prototype
//
//  Created by Şevval Gönül
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var segmentOutlet: UISegmentedControl!
    
    
    @IBOutlet weak var loginSegment: UIView!
    
    
    @IBOutlet weak var signUpSegment: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Show login
        self.view.bringSubviewToFront(loginSegment)
        

    }
    
    
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.view.bringSubviewToFront(loginSegment)
        case 1:
            self.view.bringSubviewToFront(signUpSegment)
        default:
            break
        }
    
        
    }
    

}

