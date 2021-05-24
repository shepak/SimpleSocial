//
//  gallery.swift
//  zOlupa
//
//  Created by Mustafin Ruslan on 10.02.2021.
//

import Foundation
import UIKit
class Gallery{
    var images = [UIImage]()
    
    init (){
        setupGallery() 
    }
    func setupGallery(){
        for i in 0...5 {
            let image = UIImage(named: "image\(i)")!
            images.append(image)
        }
    }
}
