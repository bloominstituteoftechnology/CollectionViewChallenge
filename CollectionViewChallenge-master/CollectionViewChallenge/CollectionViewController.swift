import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var paintings: [UIImage] = []
    let targetDimension: CGFloat = 320
    let insetAmount: CGFloat = 32
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for counter in 1 ... 12 {
            let paintingImageName = "Image\(counter)"
            guard let image = UIImage(named: paintingImageName) else { fatalError("Could not provide any images from the assets folder.") }
                paintings.append(image)
            }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            fatalError("Unable to retrieve layout!")
        }
        
        layout.sectionInset = UIEdgeInsets(top: insetAmount, left: insetAmount, bottom: insetAmount, right: insetAmount)
        layout.minimumLineSpacing = .greatestFiniteMagnitude
        layout.scrollDirection = .horizontal
        
    }
}
