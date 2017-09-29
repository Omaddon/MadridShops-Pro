//
//  LanguageVC.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 29/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit

class LanguageVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var title = ""
        title.setOptionsTitleLanguage()
        self.title = title
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "languageCell", for: indexPath)
        
        cell = UITableViewCell(style: .default, reuseIdentifier: "languageCell")
        cell.accessoryType = .disclosureIndicator
        
        var cellText = ""
        cellText.setTitleLaguangeCell()
        cell.textLabel?.text = cellText
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            performSegue(withIdentifier: "languageOptionsSegue", sender: nil)
        }
    }

}





















