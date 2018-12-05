//
//  CollectionViewController.swift
//  Sprint 2 Review - CollectionViewChallenge
//
//  Created by Sameera Leola on 12/5/18.
//

import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Put the images into an array
        for imageNum in 1 ... 12 {
            //Get the image name
            let imageName = "Image\(imageNum)"
            guard let image = UIImage(named: imageName) else { return }
            //and add the image to the array
           images.append(image)
        }
    }
    
    let targetDimension: CGFloat = 320
    let insetAmount: CGFloat = 32
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // MARK: Need additional clarification
        //Retrieve the collection view's collectionViewLayout cast to UICollectionViewFlowLayout
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        //Setup the layout
        layout.sectionInset = UIEdgeInsets(top: insetAmount, left: insetAmount, bottom: insetAmount, right: insetAmount)
        layout.minimumLineSpacing = .greatestFiniteMagnitude
        layout.scrollDirection = .horizontal
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //Get the image for the cell row
        let cellImage = images[indexPath.row]
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Fetch image
        let image = images[indexPath.row]
        
        // Fetch largest dimension of the image, whether width or height
        let maxDimension = max(image.size.width, image.size.height)
        
        // Calculate how to scale that largest dimension into `targetDimension`
        let scale = targetDimension / maxDimension
        
        // Return scaled dimensions
        return CGSize(width: image.size.width * scale, height: image.size.height * scale)
    }
    
    
    
    
    
    
    
    
    
    
    

    
}
