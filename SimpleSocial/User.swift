//
//  User.swift
//  zOlupa
//
//  Created by Mustafin Ruslan on 28.02.2021.
//

import Foundation
import UIKit
import MapKit

enum Gender{
    case male
    case female
}

class User: NSObject, MKAnnotation{
   var coordinate: CLLocationCoordinate2D
    var name: String
    var city: String
    var image: UIImage
    var gender: Gender
    var title: String?{
        return name
    }
    init (name:String, city:String, image:UIImage, gender:Gender,coordinate:CLLocationCoordinate2D){
        self.name = name
        self.city = city
        self.image = image
        self.gender = gender
        self.coordinate = coordinate
    }
    
}
