import UIKit
import Foundation

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for values in 1...12 {
            guard let image = UIImage(named: "Image\(values)") else { fatalError("Unable to load the images") }
            images.append(image)
        }
    }
    
    let targetDimension: CGFloat = 320
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { fatalError("Unable to retrieve the layout.") }
    }
    let insetAmount: CGFloat = 32
}
