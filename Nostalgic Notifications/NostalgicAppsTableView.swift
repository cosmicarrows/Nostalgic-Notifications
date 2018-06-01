//
//  NostalgicAppsTableView.swift
//  Nostalgic Notifications
//
//  Created by Laurence Wingo on 5/31/18.
//  Copyright © 2018 Cosmic Arrows, LLC. All rights reserved.
//

import UIKit

class NostalgicAppsTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nostalgicCell", for: indexPath) as! CustomNostalgicCellTableViewCell
        
        cell.appTitleLabel.text = "Row \(indexPath.row)"
        
        
        // Configure the cell...
        return cell
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    

}
