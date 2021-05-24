//
//  SettingsTableViewController.swift
//  zOlupa
//
//  Created by Mustafin Ruslan on 16.02.2021.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    let testString = "testString"
    let nameKey = "nameKey"
    let soundKey = "soundKey"
    let volKey = "volKey"
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var volume: UISwitch!
    @IBOutlet weak var Sound: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()

        loadSetting()
        
    }
    func loadSetting(){
        if let name = UserDefaults.standard.string(forKey: nameKey){
        
            nameField.text = name
        }
        volume.isOn = UserDefaults.standard.bool(forKey: soundKey)
        Sound.value = UserDefaults.standard.float(forKey: volKey)
    }
    @IBAction func changeName(_ sender: UITextField) {
        
        
        
        if(sender.text != nil){
            UserDefaults.standard.set(sender.text!, forKey: nameKey)
        }
    }
    
    @IBAction func vol(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: soundKey)
    }
    @IBAction func soundAction(_ sender: UISlider) {
        UserDefaults.standard.set(sender.value, forKey: volKey)
    }
    
}
