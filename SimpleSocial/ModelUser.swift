//
//  ModelUser.swift
//  zOlupa
//
//  Created by Mustafin Ruslan on 28.02.2021.
//

import Foundation
import UIKit
import MapKit

class ModelUser{
    var users = [[User]]()
    init() {
        setup()
    }
    func setup(){
        let man1 = User(name: "Nikolay", city: "Kazan", image: UIImage(named: "bu")!, gender: .male, coordinate: CLLocationCoordinate2D(latitude: 55.753786, longitude: 37.613633))
        let man2 = User(name: "Alex", city: "Moscow", image: UIImage(named: "bu")!, gender: .male, coordinate: CLLocationCoordinate2D(latitude: 55.751781, longitude: 37.617633))
        let manArray = [man1,man2]
        
        let woman1 = User(name: "Baby", city: "Moskva", image: UIImage(named: "bu")!, gender: .female, coordinate: CLLocationCoordinate2D(latitude: 55.751786, longitude: 37.615633))
        
        let womanAraay = [woman1]
        users.append(manArray)
        users.append(womanAraay)
    }
    
}
