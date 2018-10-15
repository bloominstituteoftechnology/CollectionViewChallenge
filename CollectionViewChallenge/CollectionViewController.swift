import UIKit

class CollectionViewController: UICollectionViewController {

    let reuseIdentifier = "cell"
    var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        for i in 1...12 {
            guard let image = UIImage(named: "Image\(i)") else { return }
            //let painting = UIImage(named: "Image\(i)")
            images.append(image)
            }
        }
    
    let targetDimension: CGFloat = 320
    let insetAmount: CGFloat = 32
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {fatalError("unable to retrieve layout")}
        
        layout.sectionInset = UIEdgeInsets(top: insetAmount, left: insetAmount, bottom: insetAmount, right: insetAmount)
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.headerReferenceSize = CGSize(width: collectionView.bounds.width, height: 32)
    }
}

