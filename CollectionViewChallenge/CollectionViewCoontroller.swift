//
//  CollectionViewCoontroller.swift
//  CollectionViewChallenge
//
//  Created by Ivan Caldwell on 11/15/18.
//  Copyright © 2018 Erica Sadun. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewController: UICollectionViewController {
    
    var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var count = 0
        while count < 12 {
            guard let image = UIImage(named: "Image\(count)") else { return }
            images.append(image)
            count += 1
        }
    }
    
}
