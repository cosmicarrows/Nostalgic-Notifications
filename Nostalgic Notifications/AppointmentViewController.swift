//
//  AppointmentViewController.swift
//  Nostalgic Notifications
//
//  Created by Laurence Wingo on 5/30/18.
//  Copyright © 2018 Cosmic Arrows, LLC. All rights reserved.
//

import UIKit
import UserNotifications

class AppointmentViewController: UIViewController {

    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertUserNotificationsIsTurnedOff()
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
    
    func alertUserNotificationsIsTurnedOff(){
        
        let center = UNUserNotificationCenter.current()
        center.getNotificationSettings { (settings) in
            if settings.authorizationStatus != .authorized {
                print("Show an alert to user so they can turn on their notifications")
            }
        }
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

extension AppointmentViewController: UNUserNotificationCenterDelegate{
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        //play sound and show alert to the user
        completionHandler([.alert, .sound])
        
        print("notificaiton delivered while app is in the foreground on the appointment screen")
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        print("did receive response from user while the notification was presented!")
        
        switch response.actionIdentifier {
        case UNNotificationDismissActionIdentifier:
            print("Dismiss Action")
        case UNNotificationDefaultActionIdentifier:
            print("Default")
        case "VisitNostalgiaWebsite":
            print("add code here to open a browser to direct the user to the website")
        case "Delete":
            print("Delete")
        default:
            print("Uknown action")
        }
        completionHandler()
    }
}
