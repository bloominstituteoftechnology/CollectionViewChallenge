import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let reuseIdentifier = "cell"
    var images: [UIImage] = []
    var names: [String] = ["The Old Violin","Seascape at Port-en-Bessin, Normandy","Pont Neuf, Paris","The Japanese Footbridge","At the Water's Edge","The Impasto Technique of Rembrandt","Vincent van Gogh", "Green Wheat Fields, Auvers", "The Dancing Couple", "Olive Orchard", "Farmhouse in Provence", "Niagara"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .black
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        for numbers in 1...12 {
            guard let image = UIImage(named: "Image\(numbers)") else {fatalError("Could not load image \(numbers)")}
            images.append(image)
        }
    }
    
    let targetDimenstion: CGFloat = 320
    let insetAmount: CGFloat = 32
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {fatalError("Enable to get layout")}
        
        layout.sectionInset = UIEdgeInsets(top: insetAmount, left: insetAmount, bottom: insetAmount, right: insetAmount)
        layout.minimumLineSpacing = .greatestFiniteMagnitude
        layout.scrollDirection = .horizontal
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CollectionViewCell else {fatalError("Couldn't load view state")}
        cell.imageView.image = images[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Fetch image
        let image = images[indexPath.row]
        
        // Fetch largest dimension of the image, whether width or height
        let maxDimension = max(image.size.width, image.size.height)
        
        // Calculate how to scale that largest dimension into `targetDimension`
        let scale = targetDimenstion / maxDimension
        
        // Return scaled dimensions
        return CGSize(width: image.size.width * scale, height: image.size.height * scale)
    }
    }

