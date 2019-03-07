//
//  outputVC.swift
//  FlightDelay
//
//  Created by Damian on 30/11/2018.
//  Copyright © 2018 Damian. All rights reserved.
//

import UIKit

class outputVC: UIViewController {

    @IBOutlet weak var txt: UITextView!
    var text: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txt.text = text
        // Do any additional setup after loading the view.
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
