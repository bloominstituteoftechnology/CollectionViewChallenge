import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
    var images: [UIImage] = []
    override func viewDidLoad() {
     super.viewDidLoad()
        
    for number in 1...12 {
    let name = "Image\(number)"
        guard let image = UIImage(named: name) else {fatalError("Image not exist")}
        
    images.append(image)
        return
        }
    
         func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as? CollectionViewCell else { fatalError("Error")}
            return cell
        }
             func viewDidLoad() {
                super.viewDidLoad()
                reloadInputViews()
                
            guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else {
                fatalError("Unable to retrieve layout")}
        
        
        let targetDimension: CGFloat = 320
        let insetAmount: CGFloat = 32
        
        layout.sectionInset = UIEdgeInsets(top: insetAmount, left: insetAmount, bottom: insetAmount, right: insetAmount)
            layout.minimumLineSpacing = .greatestFiniteMagnitude
            layout.scrollDirection = .horizontal
       
                
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Fetch image
        let image = images[indexPath.row]
        
        // Fetch largest dimension of the image, whether width or height
        let maxDimension = max(image.size.width, image.size.height)
        
        // Calculate how to scale that largest dimension into `targetDimension`
        let scale = targetDimension / maxDimension
        
        // Return scaled dimensions
        return CGSize(width: image.size.width * scale, height: image.size.height * scale) }
    }
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count }
    }
}


