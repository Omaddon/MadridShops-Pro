//
//  OptionsVC.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 29/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit
import CoreData

class OptionsVC: UITableViewController {
    
    var shopContext: NSManagedObjectContext!
    var activityContext: NSManagedObjectContext!
    
    @IBOutlet var optionsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        optionsTableView.tableFooterView = UIView()
        setTitleForLanguageMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setTitleForLanguageMenu()
        self.optionsTableView.reloadData()
    }
  
    
    func setTitleForLanguageMenu() {
        var title = ""
        title.setOptionsTitleLanguage()
        self.title = title
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = UITableViewCell(style: .default, reuseIdentifier: "languageCell")
            cell.accessoryType = .disclosureIndicator
            
            var cellText = ""
            cellText.setTitleLaguangeCell()
            cell.textLabel?.text = cellText
            
            return cell
        case 1:
            let cell = UITableViewCell(style: .default, reuseIdentifier: "dataCell")
            cell.accessoryType = .disclosureIndicator
            
            var cellText = ""
            cellText.setDataTitleCell()
            cell.textLabel?.text = cellText
            
            return cell
        default:
            return UITableViewCell()
        }
        

    }
  
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "languageOptionsSegue", sender: nil)
        case 1:
            performSegue(withIdentifier: "dataOptionsSegue", sender: nil)
        default:
            return
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dataOptionsSegue" {
            let vc = segue.destination as! DataOptions
            vc.shopContext = self.shopContext
            vc.activityContext = self.activityContext
        }
    }

}





















