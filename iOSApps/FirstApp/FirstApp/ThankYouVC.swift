//
//  ThankYouVC.swift
//  FirstApp
//
//  Created by Shridevi Sawant on 30/09/24.
//

import UIKit

class ThankYouVC: UIViewController {

    @IBOutlet weak var msgL: UILabel!
    
    var userid = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        msgL.text = "Thank You, \(userid)!"
        view.backgroundColor = UIColor.lightGray
    }
    

    @IBAction func okClick(_ sender: Any) {
        
       // dismiss(animated: true) // if presented
        navigationController?.popViewController(animated: true) // if show()
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
