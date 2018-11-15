import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let image = UIImage(named: name) else {return fatalError("Image name not exist")}
        
        let targetDimension: CGFloat = 320
        let insetAmount: CGFloat = 32
        
      func viewWillAppear(_ animated: Bool) {
            collectionView.reloadData()
            
            
        layout.sectionInset = UIEdgeInsets(top: amount, left: amount, bottom: amount, right: amount)
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.headerReferenceSize = CGSize(width: collectionView.bounds.width, height: 32)
        
    }
    
}
