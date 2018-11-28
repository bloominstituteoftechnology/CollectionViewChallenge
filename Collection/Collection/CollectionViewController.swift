import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewFlowLayout {

    var images: [UIImage] = []
    
    let targetDimensions: CGFloat = 320
    let insetAmount: CGFloat = 32
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for number in 1 ... 12 {
            guard let image = UIImage(named: "Image\(number)") else { return }
            images.append(image)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //retrieve collectionview and casting it
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { fatalError("unable to retrieve layout")}
        
        //set layout sectionInset using insetAmount
        layout.sectionInset = UIEdgeInsets(top: insetAmount, left: insetAmount, bottom: insetAmount, right: insetAmount)
        
        //set layout minimumLineSpacing to .greatestFiniteMagnitude
        layout.minimumLineSpacing = .greatestFiniteMagnitude
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as? CollectionViewCell else { fatalError("Unable to dequeue proper cell")}
        
        cell.paintingView.image = images[indexPath.row]
        return cell
    }
}

