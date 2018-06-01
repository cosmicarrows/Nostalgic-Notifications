//
//  NostalgiaViewOneViewController.swift
//  Nostalgic Notifications
//
//  Created by Laurence Wingo on 5/30/18.
//  Copyright © 2018 Cosmic Arrows, LLC. All rights reserved.
//

import UIKit
import WebKit
import MediaPlayer

class NostalgiaViewOneViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet var webView: WKWebView!
    @IBOutlet var webProgressView: UIProgressView!
    @IBOutlet var musicVolumeSlider: UISlider!
    
    @IBOutlet var iTunesTableView: NostalgicAppsTableView!
    @IBOutlet var webViewContainer: UIView!
    @IBOutlet var askMoreQuestionsButton: UIButton!
    @IBOutlet var setupAppointmentButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        webViewContainer.layer.cornerRadius = 10
        webViewContainer.backgroundColor = UIColor.black
        webView.center = webViewContainer.center
        webViewContainer.clipsToBounds = true
        askMoreQuestionsButton.layer.cornerRadius = 10
        setupAppointmentButton.layer.cornerRadius = 10
        webView.navigationDelegate = self
        iTunesTableView.layer.cornerRadius = 10
        setupAppointmentButton.titleLabel?.textAlignment = .center
        askMoreQuestionsButton.titleLabel?.textAlignment = .center
        let vimeoURL = URL.init(string: "http://www.youtube.com")
        let vimeoPageRequest = URLRequest(url: vimeoURL!)
        webView.load(vimeoPageRequest)
        let musicSliderThumbImgHighlighted = UIImage.init(named: "beatsHighlighted")
        let musicSliderThumbImg = UIImage.init(named: "beats")
        musicVolumeSlider.setThumbImage(musicSliderThumbImg, for: .normal)
        musicVolumeSlider.setThumbImage(musicSliderThumbImg, for: .focused)
        musicVolumeSlider.setThumbImage(musicSliderThumbImgHighlighted, for: .highlighted)
        musicVolumeSlider.setThumbImage(musicSliderThumbImg, for: .selected)
        activityIndicator.color = UIColor.purple
        activityIndicator.center = webViewContainer.center
        
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("Webview has committed to downloading content")
        webProgressView.progress = 0.2
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Webview content has begun to load into webview")
        webProgressView.progress = 0.5
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Finished loading the website!")
        webProgressView.progress = 1.0
        webProgressView.isHidden = true
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
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
