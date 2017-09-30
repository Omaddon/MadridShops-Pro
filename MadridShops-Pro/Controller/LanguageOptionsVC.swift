//
//  LanguageOptionsVC.swift
//  MadridShops-Pro
//
//  Created by MIGUEL JARDÓN PEINADO on 29/9/17.
//  Copyright © 2017 Ammyt. All rights reserved.
//

import UIKit

class LanguageOptionsVC: UITableViewController {
    
    @IBOutlet var languageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTitleForLanguageMenu()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setTitleForLanguageMenu()
        self.languageTableView.reloadData()
    }
    
    
    func setTitleForLanguageMenu() {
        var title = ""
        title.setTitleLaguangeCell()
        self.title = title
    }

    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
 
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languagesList(deviceLanguage()).count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "languageOptionsCell", for: indexPath)
        cell = UITableViewCell(style: .default, reuseIdentifier: "languageOptionsCell")
        
        var cellText = ""
        cellText = languagesList(deviceLanguage())[indexPath.row]
        cell.textLabel?.text = cellText
        
        let systemLanguage = deviceLanguage()
        
        if languageTypesOption(cellText) == systemLanguage {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let languageText    : String = languagesList(deviceLanguage())[indexPath.row]
        let language        : DeviceLanguageTypes = languageTypesOption(languageText)
        
        let userInteractor = UserSettingsInteractor()
        userInteractor.setUserLanguage(language: language)
        
        setTitleForLanguageMenu()
        self.languageTableView.reloadData()
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    
}





















