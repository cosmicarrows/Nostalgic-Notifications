//
//  ViewController.swift
//  Nostalgic Notifications
//
//  Created by Laurence Wingo on 5/30/18.
//  Copyright © 2018 Cosmic Arrows, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var talkingTonyLabel: UILabel!
    @IBOutlet var walkAwayButton: UIButton!
    @IBOutlet var buzzYouInButton: UIButton!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var talkingTonyToggleSwitch: UISwitch!
    var talkingTonyOn: Bool = true
    var blackLayer: UIView!
    var heyView: UIView!
    var haloImg: UIImageView!
    var greetings: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.clearButtonMode = .whileEditing
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        buzzYouInButton.addTarget(self, action: #selector(self.funnyBone), for: UIControlEvents.touchUpInside)
        walkAwayButton.layer.cornerRadius = 10
        buzzYouInButton.layer.cornerRadius = 10
        //view animation code
        let delay = 4.2 // time in seconds
        Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(animatedViewBackground), userInfo: nil, repeats: true)
        //end of view animation code
        blackLayer = UIView.init(frame: CGRect.init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        blackLayer.backgroundColor = UIColor.black
        blackLayer.alpha = 0.9
        view.addSubview(blackLayer)
        blackLayer.isHidden = true
        
        heyView = UIView.init(frame: CGRect.init(origin: CGPoint.init(x: 0, y: usernameTextField.center.y), size: CGSize.init(width: view.bounds.width, height: 100)))
        heyView.backgroundColor = UIColor.black
        heyView.layer.cornerRadius = 20
        heyView.layer.borderColor = UIColor.white.cgColor
        heyView.layer.borderWidth = 2
        view.addSubview(heyView)
        heyView.isHidden = true
        
        haloImg = UIImageView.init(frame: CGRect.init(x: heyView.center.x/2, y: heyView.center.y/1.6, width: 200, height: 100))
        haloImg.image = UIImage.init(named: "halo")
        view.addSubview(haloImg)
        haloImg.isHidden = true
        
        greetings = UILabel.init(frame: CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: CGSize.init(width: heyView.bounds.width, height: heyView.bounds.height)))
        greetings.textColor = UIColor.white
        greetings.textAlignment = .center
        greetings.font = UIFont.systemFont(ofSize: 20, weight: .ultraLight)
        heyView.addSubview(greetings)
        greetings.isHidden = true
        
    }
    
    
    
    
    
    @objc func animatedViewBackground(){
        UIView.animateKeyframes(withDuration: 4.0, delay: 0.0, options: .allowUserInteraction, animations: {
                self.view.backgroundColor = self.generateRandomColor()
                self.buzzYouInButton.backgroundColor = self.generateRandomColor()
        }, completion: nil)
    }
    
    @IBAction func toggleTalkingTony(_ sender: UISwitch) {
        
        if !sender.isOn {
            talkingTonyOn = false
            print("Okayyss I beee's quiet maan")
            talkingTonyLabel.text = "Unmute Talking Tony:"
            
            
        } else {
            talkingTonyOn = true
            print("Heeyyy I knew you would miss me!")
            talkingTonyLabel.text = "Mute Talking Tony:"
           
        }
    
    }
    
    
    
    @objc func funnyBone(){
        
        if !(usernameTextField.text?.isEmpty)! && passwordTextField.text == "nostalgia"{
            
            blackLayer.isHidden = false
            
            heyView.isHidden = false
            haloImg.image = UIImage.init(named: "halo")
            
            haloImg.isHidden = false
            
            let animation = CABasicAnimation.init(keyPath: "position.y")
            animation.fromValue = haloImg.center.y - 5
            animation.toValue = haloImg.center.y + -20
            animation.duration = 2.5
            animation.autoreverses = true
            animation.repeatCount = 3
            haloImg.layer.add(animation, forKey: "BasicAnimation")
            
            greetings.isHidden = false
            greetings.text = "\(usernameTextField.text!) has arrived!"
            
            let delay = 2.5 // time in seconds
            Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(showNostalgicViewController), userInfo: nil, repeats: false)
            
            
        } else if (usernameTextField.text?.isEmpty)! && (passwordTextField.text?.isEmpty)! {
            
            blackLayer.isHidden = false
            
            heyView.isHidden = false
            
            haloImg.isHidden = false
            haloImg.image = UIImage.init(named: "horns")
            
            let animation = CABasicAnimation.init(keyPath: "position.y")
            animation.fromValue = haloImg.center.y - 5
            animation.toValue = haloImg.center.y + -20
            animation.duration = 2.5
            animation.autoreverses = true
            animation.repeatCount = 3
            haloImg.layer.add(animation, forKey: "BasicAnimation")
            
            greetings.isHidden = false
            greetings.text = "You didn't enter anything?!"
       
            
            let delay = 3.5 // time in seconds
            Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(revealInitialState), userInfo: nil, repeats: false)
        } else if !(usernameTextField.text?.isEmpty)! && passwordTextField.text != "nostalgia" {
            blackLayer.isHidden = false
            
            heyView.isHidden = false
            
            haloImg.isHidden = false
            haloImg.image = UIImage.init(named: "horns")
            
            let animation = CABasicAnimation.init(keyPath: "position.y")
            animation.fromValue = haloImg.center.y - 5
            animation.toValue = haloImg.center.y + -20
            animation.duration = 2.5
            animation.autoreverses = true
            animation.repeatCount = 3
            haloImg.layer.add(animation, forKey: "BasicAnimation")
            
            greetings.isHidden = false
            greetings.text = "Password incorrect!  See the concierge."
            passwordTextField.backgroundColor = UIColor.red
            
            let delay = 3.5 // time in seconds
            Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(revealInitialState), userInfo: nil, repeats: false)
        } else if (usernameTextField.text?.isEmpty)! && passwordTextField.text != "nostalgia" {
            blackLayer.isHidden = false
            
            heyView.isHidden = false
            
            haloImg.isHidden = false
            haloImg.image = UIImage.init(named: "horns")
            
            let animation = CABasicAnimation.init(keyPath: "position.y")
            animation.fromValue = haloImg.center.y - 5
            animation.toValue = haloImg.center.y + -20
            animation.duration = 2.5
            animation.autoreverses = true
            animation.repeatCount = 3
            haloImg.layer.add(animation, forKey: "BasicAnimation")
            
            greetings.isHidden = false
            greetings.text = "You didn't say who you are..."
            usernameTextField.backgroundColor = UIColor.red
            
            let delay = 3.5 // time in seconds
            Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(revealInitialState), userInfo: nil, repeats: false)        }
        
    }
    
  
    
    @objc func revealInitialState(){
        UIView.animate(withDuration: 0.7, animations: {
            self.greetings.alpha = 0.0
            self.haloImg.alpha = 0.0
            self.heyView.alpha = 0.0
            self.blackLayer.alpha = 0.0
        })
        let delay = 5.2 // time in seconds
        Timer.scheduledTimer(timeInterval: delay, target: self, selector: #selector(hideThoseViews), userInfo: nil, repeats: false)
    }
    
    @objc func hideThoseViews(){
        UIView.animate(withDuration: 0.7, animations: {
            self.greetings.isHidden = true
            self.haloImg.isHidden = true
            self.heyView.isHidden = true
            self.blackLayer.isHidden = true
            self.greetings.alpha = 1.0
            self.haloImg.alpha = 1.0
            self.heyView.alpha = 1.0
            self.blackLayer.alpha = 1.0
        })
    }
    
    @objc func showNostalgicViewController() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NostalgicOneViewController") as! NostalgiaViewOneViewController
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func walkAway(_ sender: UIButton) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let createAccountVC = storyboard.instantiateViewController(withIdentifier: "CreateAccount") as! CreateAccountViewController
        present(createAccountVC, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Add sound saying cool name bro")
        self.usernameTextField.resignFirstResponder()
        self.passwordTextField.resignFirstResponder()
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

