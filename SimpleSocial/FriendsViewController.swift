//
//  FriendsViewController.swift
//  zOlupa
//
//  Created by Mustafin Ruslan on 28.02.2021.
//

import UIKit

class FriendsViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    let cellID = "UserTableViewCell"
    var modelUser = ModelUser()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        
    }
    

    

}
extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = modelUser.users[section]
        return section.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
      
        return modelUser.users.count
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Мужчины"
        }
        else{
         
            return "Женщины"
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: cellID) as! UserTableViewCell
        let section = modelUser.users[indexPath.section]
        let user = section[indexPath.row]
       
        cell.namelabel.text = user.name
        cell.userimage.image = user.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = modelUser.users[indexPath.section]
        let user = section[indexPath.row]
        let alert = UIAlertController(title: user.name, message: user.city, preferredStyle: .actionSheet)
        let profileAction = UIAlertAction(title: "Профиль", style: .default){(alert) in
            self.performSegue(withIdentifier: "gotoProfile", sender: indexPath)
        }
        let deleteaction = UIAlertAction(title: "Удалить из друзей", style: .destructive) { (alert) in
            self.modelUser.users[indexPath.section].remove(at: indexPath.row)
            self.tableview.reloadData()
        }
        alert.addAction(profileAction)
        alert.addAction(deleteaction)
        alert.addAction(UIAlertAction(title: "Oтмена", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoProfile"{
            let vc = segue.destination as! UserViewController
            let indexPath = sender as! IndexPath
            
            let section = modelUser.users[indexPath.section]
            let user = section[indexPath.row]
           
            vc.user = user
        }
        
    }
}
