import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let reuseIdentifier = "cell"
    
    // Array that will hold the images
    var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add nib
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        
        // Load 12 images into the image array
        for counter in 1 ... 16 {
            
            // Name the images using string interpolation
            let imageName = "Image\(counter)"
            
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
    
    // Set the number of items in each section to be equal to the count of images in our images array
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    // Set the contents of the cells
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Conditionally cast the cell
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as? CollectionViewCell
            else { fatalError("Unable to dequeue proper cell") }
        
        // Set the image view's image
        cell.imageView.image = images[indexPath.row]
        
        return cell
    }
    
    // Flexible sizing for each image
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
