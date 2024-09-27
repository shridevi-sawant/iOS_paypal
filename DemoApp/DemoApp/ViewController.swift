//
//  ViewController.swift
//  DemoApp
//
//  Created by Shridevi Sawant on 27/09/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let obj = MyObjcClass()
        let msg = obj.greeting("john")
        print(msg!)
    }


}

