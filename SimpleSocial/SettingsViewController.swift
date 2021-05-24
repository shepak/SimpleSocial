//
//  SettingsViewController.swift
//  zOlupa
//
//  Created by Mustafin Ruslan on 02.02.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoEkran"{
            let text = textfield.text
            let newVC = segue.destination as! EkransmertiViewController
            newVC.textfromVC = text
        }
    }
    
//    @IBAction func gotoekran(_ sender: UIButton) {
//        let newVC = storyboard?.instantiateViewController(withIdentifier: "EkransmertiViewController") as! EkransmertiViewController
//        let text = textfield.text
//        newVC.textfromVC = text
//        navigationController?.pushViewController(newVC, animated:true)
//    }
    
}
