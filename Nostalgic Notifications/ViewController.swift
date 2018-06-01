//
//  ViewController.swift
//  Nostalgic Notifications
//
//  Created by Laurence Wingo on 5/30/18.
//  Copyright © 2018 Cosmic Arrows, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var walkAwayButton: UIButton!
    @IBOutlet var buzzYouInButton: UIButton!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var talkingTonyToggleSwitch: UISwitch!
    var talkingTonyOn: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        usernameTextField.clearButtonMode = .whileEditing
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        buzzYouInButton.addTarget(self, action: #selector(self.funnyBone), for: UIControlEvents.touchUpInside)
        walkAwayButton.layer.cornerRadius = 10
        buzzYouInButton.layer.cornerRadius = 10
        
        //view animation code
        let delay = 4.5 // time in seconds
        Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(animatedViewBackground), userInfo: nil, repeats: true)
        //end of view animation code
        
       
       
        
    }
    
    @objc func animatedViewBackground(){
        UIView.animate(withDuration: 4.0) {
            self.view.backgroundColor = self.generateRandomColor()
            self.buzzYouInButton.backgroundColor = self.generateRandomColor()
        }
    }
    
    @IBAction func toggleTalkingTony(_ sender: UISwitch) {
        
        if !sender.isOn {
            talkingTonyOn = false
            print("Okayyss I beee's quiet maan")
            
        } else {
            talkingTonyOn = true
            print("Heeyyy I knew you would miss me!")
           
        }
    
    }
    @objc func funnyBone(){
        print("Opps my funny bone, he-he....")
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Add sound saying cool name bro")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Add sound saying hmmm what should I call you?")
        textField.backgroundColor = UIColor.green
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = UIColor.white
    }
    
    func generateRandomColor() -> UIColor {
        let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
        let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
        let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.2 // from 0.5 to 1.0 to stay away from black
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
    

}

