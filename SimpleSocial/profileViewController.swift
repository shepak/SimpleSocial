//
//  profileViewController.swift
//  zOlupa
//
//  Created by Mustafin Ruslan on 02.02.2021.
//

import UIKit
    let countCells = 3
    let offset = CGFloat(2)
    let horizontalSpacing = CGFloat(2)

class profileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    let photo = Gallery()
    let identifire = "PhtoCollectionViewCell"
    
    let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        avatar.layer.borderWidth = 2.5
        avatar.layer.borderColor = UIColor.lightGray.cgColor
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifire)
        imagePicker.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnImage(_:)))
        avatar.addGestureRecognizer(tapGesture)
        avatar.isUserInteractionEnabled = true
    }
    
    @objc func tapOnImage(_ sender:UITapGestureRecognizer){
        let alert = UIAlertController(title: "Изображение", message: nil, preferredStyle: .actionSheet)
        let actionPhoto = UIAlertAction(title: "C галерии", style: .default) { (alert) in
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        let actionCamera = UIAlertAction(title: "Камера", style: .default) { (alert) in
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true,completion: nil)
        }
        let cancel = UIAlertAction(title: "Отмена", style: .cancel) { (alert) in
            
        }
        alert.addAction(actionPhoto)
        alert.addAction(actionCamera)
        alert.addAction(cancel)
        present (alert,animated: true, completion: nil)
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let name = UserDefaults.standard.string(forKey: "nameKey"){
            nameLabel.text = name
        }
    }


}

extension profileViewController:UICollectionViewDataSource,UIScrollViewDelegate,UICollectionViewDelegateFlowLayout{
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photo.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifire, for: indexPath) as! PhotoCollectionViewCell
        cell.photoView.image = photo.images[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = collectionView.frame
                let widthCell = frameCV.width / CGFloat(countCells)
                let heightCell = widthCell
                let spacing = (CGFloat(countCells + 1) * offset + horizontalSpacing) / CGFloat(countCells)
                //let width = CGFloat(frameCV.width)
                return CGSize(width: widthCell - spacing, height: heightCell - (offset * 2))
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "FullScreenViewController") as! FullScreenViewController
        vc.photo = photo
        vc.indexPath = indexPath
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension profileViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{avatar.image = pickedImage}
        dismiss(animated: true, completion: nil)
    }
}
