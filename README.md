# Collection View Challenge

In this challenge, you build a scrolling art gallery. This gallery respects and preserves image aspect ratios during layout rather than embedding them into same-size views. Narrow images will sit directly next to wide ones and vice versa, without padding.

To accomplish this you'll use an advanced collection view feature that lets you customize the size of each collection view cell.

## Get started

* Fork this project.
* Create CollectionViewController.swift, CollectionViewCell.swift, CollectionViewCell.xib
* Create skeleton implementaitons for CollectionViewController and CollectionViewCell

```
class CollectionViewController: UICollectionViewController {
}

class CollectionViewCell: UICollectionViewCell {
}
```

* Add a new collection view controller to Main.storyboard. 
* Set it as the entry point. 
* Delete its prototype cell.
* Set its background color to black.
* Set its identity to CollectionViewController.

## Set up the view cell
* Add an `imageVIew` IBOutlet to your view cell class of type UIImageView.
* In CollectionViewCell.xib, set the view's identity to CollectionViewCell.
* In the Attributes inspector, set its simulated metric size to freeform.
* Add an image view and constrain it to stretch to all sides of its parent.
* Connect the image view to the IBOutlet.
* Set the image view's vertical and horizontal content hugging priorities to 1000.
* Set it's contentMode to scale aspect fit.
* In the collection view controller, create a property called `reuseIdentifier` set to `"cell"`.
* In the collection view controller, implement `viewDidLoad()` and register your nib:

```
let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
    collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
```

## Load the images

* Create an `images` variable property for the collection view controller. Set its type to `[UIImage]` and its initial value to `[]`.
* In the collection view controller's `viewDidLoad` method, load all 12 images into the image array. Don't forget to use string interpolation and check whether the image loaded properly using `guard let image = UIImage(named: name)`.

## Set up the layout

* Conform the collection view to `UICollectionViewDelegateFlowLayout`
* Add two `CGFloat` properties called `targetDimension` (set it to 320) and `insetAmount`, set it to 32.
* Implement `viewWillAppear` and within it, retrieve the collection view's `collectionViewLayout`, casting it to `UICollectionViewFlowLayout`.
* Set the layout's `sectionInset` using the `insetAmount` for each inset.
* Set the layout's `minimumLineSpacing` to `.greatestFiniteMagnitude`.
* Set the scroll direction to horizontal.

## Set up the data source

* Implement the collection view's `numberOfItemsInsection` (`images.count`) method.
* Implement the `cellForItemAt` method. In it, set the image view's image. Don't forget to cast the cell to the right type.

## Control the view size for your layout

Here's where flexible sizing comes to play. Add the following method to your collection view:

```
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
```

This method uses the largest dimension of each image to scale to your `targetDimension` extent.

## Stretch Goals

* Implement single selection by creating a yellow border around the selected cells. Don't forget about cell re-use.
* Implement multiple selection.
* Add a label to each cell. Use Google's reverse image search to find the name for each Van Gogh work of art.
* Embed the collection view in a Navigation Controller and set the collection view controller's `title` property to reflect the number of images selected or the name of the work that has been selected.