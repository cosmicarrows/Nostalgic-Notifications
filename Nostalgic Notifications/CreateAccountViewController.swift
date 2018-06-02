//
//  CreateAccountViewController.swift
//  Nostalgic Notifications
//
//  Created by Laurence Wingo on 5/31/18.
//  Copyright © 2018 Cosmic Arrows, LLC. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var confirmPasswordTextField: UITextField!
    
    @IBOutlet var getAccessButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        getAccessButton.layer.cornerRadius = 10
        passwordTextField.backgroundColor = UIColor.red
        confirmPasswordTextField.backgroundColor = UIColor.red

        // Do any additional setup after loading the view.
    }
    @IBAction func getAccess(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "NostalgicOneViewController") as! NostalgiaViewOneViewController
        present(viewController, animated: true, completion: nil)
        
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
