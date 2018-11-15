//
//  DetailViewController.swift
//  CollectionViewChallenge
//
//  Created by Benjamin Hakes on 11/15/18.
//  Copyright © 2018 Erica Sadun. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController{
    
    weak var image: UIImage?
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let image = image else {return}
        imageView.image = image
        
    }
    
}
