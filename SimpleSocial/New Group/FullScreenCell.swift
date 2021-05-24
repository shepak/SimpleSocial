//
//  FullScreenCell.swift
//  zOlupa
//
//  Created by Mustafin Ruslan on 15.02.2021.
//

import UIKit

class FullScreenCell: UICollectionViewCell,UIScrollViewDelegate {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.scrollView.delegate = self
        self.scrollView.minimumZoomScale = 1
        self.scrollView.maximumZoomScale = 3.5
        
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return photoView
    }
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        scrollView.setZoomScale(1.0, animated: true)
    }
}
