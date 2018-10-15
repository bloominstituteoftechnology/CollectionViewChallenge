import UIKit

class CollectionViewController: UICollectionViewController {
    
    var images: [UIImage] = []
    
    let reuseIdentifier = "cell"
    
    override func viewDidLoad() {
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
    }
}
