//
//  FullScreenViewController.swift
//  zOlupa
//
//  Created by Mustafin Ruslan on 15.02.2021.
//

import UIKit

class FullScreenViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var photo : Gallery!
    let countCells = 1
    let identifire = "FullscreenCell"
    var indexPath: IndexPath!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "FullScreenCell", bundle: nil), forCellWithReuseIdentifier: identifire)
        collectionView.performBatchUpdates(nil){(result) in
            self.collectionView.scrollToItem(at: self.indexPath, at: .centeredHorizontally, animated: false)
        }
    }
    
}
extension FullScreenViewController:UICollectionViewDataSource,UIScrollViewDelegate,UICollectionViewDelegateFlowLayout{
       
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return photo.images.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifire, for: indexPath) as! FullScreenCell
            cell.photoView.image = photo.images[indexPath.item]
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let frameCV = collectionView.frame
                    let widthCell = frameCV.width / CGFloat(countCells)
                    let heightCell = widthCell
                    
                    return CGSize(width: widthCell, height: heightCell)
        }
    

}
