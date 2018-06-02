//
//  AppointmentViewController.swift
//  Nostalgic Notifications
//
//  Created by Laurence Wingo on 5/30/18.
//  Copyright © 2018 Cosmic Arrows, LLC. All rights reserved.
//

import UIKit

class AppointmentViewController: UIViewController {

    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //showAlertWhenLaurenceIsHeadedOut()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showAlertWhenLaurenceIsHeadedOut()
    }

    func showAlertWhenLaurenceIsHeadedOut()  {
        
        let alertController = UIAlertController.init(title: "Uh oh! He's headed out!", message: "Quick! Jot down your info to be even more direct.", preferredStyle: .alert)
        let okayButton = UIAlertAction.init(title: "Let's Show Him You Mean Business", style: .default, handler: nil)
        alertController.addAction(okayButton)
        self.present(alertController, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}