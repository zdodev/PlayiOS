//
//  MyCollectionViewCell.swift
//  CollectionView
//
//  Created by Zero DotOne on 2021/01/25.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    
    static let identifier = "MyCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with image: UIImage) {
        imageView.image = image
    }
    
    static func nib() -> UINib {
        UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
}
