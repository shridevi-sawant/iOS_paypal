//
//  ViewController.swift
//  InteropDemo
//
//  Created by Shridevi Sawant on 04/10/24.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func continueClick(_ sender: Any) {
        
        // navigate to SwiftUI screen
        
        let vc = UIHostingController(rootView: LoginView())
        
        show(vc, sender: self)
    }
    
}

