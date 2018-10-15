import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

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
    
        collectionView?.allowsMultipleSelection = true
    
    }
    
    let targetDimension: CGFloat = 320
    let insertAmount: CGFloat = 32
    let maxDimension = 1000
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {fatalError("unable to retrieve layout")}
        
        let insetAmount: CGFloat = 32
        
        layout.sectionInset = UIEdgeInsets(top: insetAmount, left: insetAmount, bottom: insetAmount, right: insetAmount)
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.headerReferenceSize = CGSize(width: collectionView.bounds.width, height: 32)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
        }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CollectionViewCell else {fatalError("No Cell")}
        cell.imageView.image = images[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath)  -> CGSize {
        let image = images[indexPath.row]
        let maxDimension = max(image.size.width, image.size.height)
        let scale = targetDimension / maxDimension
        return CGSize(width: image.size.width * scale, height: image.size.height * scale)
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let cell = collectionView.cellForItem(at: indexPath) else {return}
//        cell.layer.borderWidth = 1
//        cell.layer.borderColor = UIColor.yellow.cgColor
    }

}

