import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // Array that will hold the images
    var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load 12 images into the image array
        for counter in 1 ... 12 {
            
            // Name the images using string interpolation
            let imageName = "image\(counter)"
            
            // If the image is there, create a UIImage of the named image
            guard let image = UIImage(named: imageName) else { return }
            
            // Add the images to the images array
            images.append(image)
        }
    }
    
    // Flow properties
    let targetDimension: CGFloat = 320
    let insetAmount: CGFloat = 32
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Retrieve the layout and cast it to UICollectionViewFlowLayout
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
            else { fatalError("Unable to retrieve layout") }
        
        // Set the inset to 32
        layout.sectionInset = UIEdgeInsets(top: insetAmount, left: insetAmount, bottom: insetAmount, right: insetAmount)
        
        // Set the smallest line spacing to the largest of the all the images
        layout.minimumLineSpacing = .greatestFiniteMagnitude
        
        // Set the direction of the user's scrolling to be swiping horizontally
        layout.scrollDirection = .horizontal
        
    }
    
}
