import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for counter in 1 ... 12 {
            let name = "image\(counter)"
            guard let image = UIImage(named: name) else { return }
            images.append(image)
            
        }
       
     }
    
    let targetDimension: CGFloat = 320
    let insetAmount: CGFloat = 32

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { fatalError("Unable to retrieve layout")}
        
        layout.sectionInset = UIEdgeInsets(top: insetAmount, left: insetAmount, bottom: insetAmount, right: insetAmount)
        layout.minimumLineSpacing = .greatestFiniteMagnitude
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        
    }
    
    
    
}
