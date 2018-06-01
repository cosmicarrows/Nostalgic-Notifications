//
//  SampleViewController.swift
//  Nostalgic Notifications
//
//  Created by Laurence Wingo on 5/31/18.
//  Copyright © 2018 Cosmic Arrows, LLC. All rights reserved.
//

import UIKit
import MediaPlayer

class SampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

   
        let myVolumeView = MPVolumeView(frame: view.bounds)
        view.addSubview(myVolumeView)
        // Do any additional setup after loading the view.
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
