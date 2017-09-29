//
//  LanguageOptionsVC.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 29/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit

class LanguageOptionsVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var title = ""
        title.setTitleLaguangeCell()
        self.title = title
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languagesOptions(deviceLanguage()).count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "languageOptionsCell", for: indexPath)
        
        cell = UITableViewCell(style: .default, reuseIdentifier: "languageOptionsCell")
        cell.accessoryType = .checkmark
        
        var cellText = ""
        cellText = languagesOptions(deviceLanguage())[indexPath.row]
        
        cell.textLabel?.text = cellText
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
