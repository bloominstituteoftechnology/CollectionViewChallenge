import UIKit

class CollectionViewController : UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    
    let targetDimension : CGFloat = 320
    let insetAmount : CGFloat = 32
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.sectionInset.bottom = insetAmount
        layout?.sectionInset.top = insetAmount
        layout?.sectionInset.left = insetAmount
        layout?.sectionInset.right = insetAmount
        layout?.minimumLineSpacing = .greatestFiniteMagnitude
        layout?.scrollDirection = UICollectionView.ScrollDirection.horizontal
    }
    
    var images : [UIImage] = []
    
    override func viewDidLoad(){
        super.viewDidLoad()
        for count in 1...16 {
            var imageName = "Image\(count)"
            guard let image = UIImage(named: imageName) else {fatalError("Images failed to load")}
            images.append(image)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as? CollectionViewCell else {fatalError("Cell failed to populate.(CollectionViewController cell deque")}
        cell.imageView?.image = images[indexPath.item]
        return cell
    }
    
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
