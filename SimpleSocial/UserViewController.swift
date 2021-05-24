//
//  UserViewController.swift
//  zOlupa
//
//  Created by Mustafin Ruslan on 01.03.2021.
//

import UIKit

class UserViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var user:User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = user.name
        imageView.image = user.image
        
        imageView.layer.borderWidth = 3.0
        if user.gender == .male{
            imageView.layer.borderColor = UIColor.blue.cgColor
        
        }else
        {
            imageView.layer.borderColor = UIColor.red.cgColor
        }
       
    }
    

    

}
