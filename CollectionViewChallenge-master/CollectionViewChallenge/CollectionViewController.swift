import UIKit

class CollectionViewController: UICollectionViewController {
    
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
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return paintings.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as? CollectionViewCell
            else { fatalError("Unable to dequeue proper cell type") }
        
        cell.imageView.image = paintings[indexPath.item]
        
        return cell
    }
    
    // This method uses the largest dimension of each image to scale to your `targetDimension` extent.
    // Here's where flexible sizing comes to play. Add the following method to your collection view:
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Fetch image
        let image = paintings[indexPath.row]
        
        // Fetch largest dimension of the image, whether width or height
        let maxDimension = max(image.size.width, image.size.height)
        
        // Calculate how to scale that largest dimension into `targetDimension`
        let scale = targetDimension / maxDimension
        
        // Return scaled dimensions
        return CGSize(width: image.size.width * scale, height: image.size.height * scale)
    }
}
