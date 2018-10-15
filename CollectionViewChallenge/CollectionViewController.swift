import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var images: [UIImage] = []
    
    let reuseIdentifier = "cell"
    
    override func viewDidLoad() {
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        
        
        for numbers in 1...12 {
            let imageString = ("Image\(numbers)")
            guard let image = UIImage(named: imageString) else { return }
            images.append(image)
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            fatalError("Unable to retrieve layout")
        }
        
        let targetDimension: CGFloat = 320
        let insetAmount: CGFloat = 32
        layout.sectionInset = UIEdgeInsets(top: insetAmount, left: insetAmount, bottom: insetAmount, right: insetAmount)
        layout.minimumLineSpacing = .greatestFiniteMagnitude
        layout.scrollDirection = .vertical
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
}
