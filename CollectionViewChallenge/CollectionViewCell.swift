//
//  CollectionViewCell.swift
//  CollectionViewChallenge
//
//  Created by Nikita Thomas on 10/15/18.
//  Copyright © 2018 Erica Sadun. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var nameOutlet: UILabel!
    
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                self.layer.borderWidth = 1
                self.layer.borderColor = UIColor.yellow.cgColor
                
            } else {
                self.layer.borderWidth = 0
            }
        }
    }
    
 
    
}
