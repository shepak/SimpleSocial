//
//  EkransmertiViewController.swift
//  zOlupa
//
//  Created by Mustafin Ruslan on 02.02.2021.
//

import UIKit

class EkransmertiViewController: UIViewController {

    var textfromVC:String!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = textfromVC
    }
    

    @IBAction func goToRoot(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    

}
