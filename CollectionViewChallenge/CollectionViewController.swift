import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var images: [UIImage] = []
    let reuseIdentifier = "UIImage"
    @IBOutlet var paintingImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for counter in 1 ... 12 {
            let paintingName = "Image\(counter)"
            // if let image = UIImage(named: paintingName) {
            guard let image = UIImage(named: paintingName) else { fatalError("Could not connect to image assets.") }
            images.append(image)
        }
        // return images ?
        

        
        
//        let imageViewNib = UINib(nibName: "CollectionReusableImageView", bundle: nil)
//
//        collectionView.register(imageViewNib, withReuseIdentifier: CollectionReusableImageView.reuseIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            fatalError("Unable to retrieve layout")
        }
        
        // added this
        let insetAmount: CGFloat = 32
        let targetDimension: CGFloat = 320
        
        // modify below
        
        layout.sectionInset = UIEdgeInsets(top: insetAmount, left: insetAmount, bottom: insetAmount, right: insetAmount)
//        layout.itemSize = CGSize(width: 120, height: 120)
//        layout.headerReferenceSize = CGSize(width: collectionView.bounds.width, height: 32)
        layout.minimumLineSpacing = .greatestFiniteMagnitude
        layout.scrollDirection = .horizontal
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as? CollectionViewCell else {
            fatalError("Unable to dequeue proper cell type")
        }
        
        // somehow set the cell equal to the UIImage
        // cell.collectionViewImageCell = images.index
        
        return cell
    }
    
    
    // where do we place this?
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
