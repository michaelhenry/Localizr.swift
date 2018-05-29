//
//  ViewController.swift
//  Localizr-iOS
//
//  Created by Michael Henry Pantaleon on 05/29/2018.
//  Copyright (c) 2018 Michael Henry Pantaleon. All rights reserved.
//

import UIKit
import Localizr_iOS

class ViewController: UITableViewController {
  
  lazy var keys = [
    "ALWAYS",
    "BACK",
    "CANCEL",
    "DONE",
    "DOWN",
    "FORWARD",
    "GOOD_AFTERNOON",
    "GOOD_BYE",
    "GOOD_LUCK",
    "GOOD_MORNING",
    "GOOD_NIGHT",
    "GREAT",
    "GREETING",
    "GTG",
    "HELLO",
    "HOME",
    "HOW_ARE_YOU",
    "I_HATE_YOU",
    "I_LOVE_YOU",
    "I_MISS_YOU",
    "INFO",
    "LEFT",
    "NAME",
    "NICE_TRY",
    "OK",
    "OMG",
    "RIGHT",
    "SAVE",
    "SEE_YOU",
    "SUCCESSFUL",
    "TAKE_CARE",
    "UP",
    "WARNING"
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 100
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return keys.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let localeCell = tableView.dequeueReusableCell(withIdentifier: "locale_cell")!
    localeCell.textLabel?.text = keys[indexPath.row]
    localeCell.detailTextLabel?.text = keys[indexPath.row].localized()
    return localeCell
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Current Locale: " + (
      Localizr.currentLocale()?.localized() ??
        Localizr.systemLocale()?.localized() ?? "unknown")
  }
  
  @IBAction func changeLocale(_ sender: Any) {
    let localeSelector = UIAlertController(title: "Select a Language", message: nil, preferredStyle: .actionSheet)
    
    Localizr.supportedLocales().forEach { localeCode in
      
      localeSelector.addAction(UIAlertAction(title: localeCode, style: .default, handler: { (action) in
        Localizr.update(locale: localeCode)
        self.tableView.reloadData()
      }))
      
    }
    
    localeSelector.addAction(UIAlertAction(title: "CANCEL", style: .cancel, handler: { (action) in
      
    }))
    
    present(localeSelector, animated: true) {
      
    }
  }
}


