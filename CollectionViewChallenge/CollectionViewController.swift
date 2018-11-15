import UIKit
import Foundation

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        for i in 1...12 {
            guard let image = UIImage(named: "Image\(i)") else { fatalError("Could not load image") }
            images.append(image)
        }
        
    }
        let targetDimension: CGFloat = 320
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { fatalError("Could not retrieve layout") }
            
            let insetAmount: CGFloat = 32
            
            layout.sectionInset = UIEdgeInsets(top: insetAmount, left: insetAmount, bottom: insetAmount, right: insetAmount)
            layout.minimumLineSpacing = .greatestFiniteMagnitude
            layout.scrollDirection = .horizontal
            
        }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as? CollectionViewCell else { fatalError("Unable to dequeue proper cell type" ) }
        
        cell.imageView.image = images[indexPath.row]
        
        return cell
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

