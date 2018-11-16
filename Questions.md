# Questions

### What is a collection view controller (CVC)?
A collection view controller is a special type of view controller that specializes in managing a collection view. A collection view groups items together, almost like a table view, but in a much more flexible environment that allows you too create a much more free-form representation of a collection of items than would normally be the case w/ a table view

### When do you use a table view controller (TVC) and when a collection view controller (CVC)?
Use table views when you want to list things out and you don't need special layout or to display other properties of the particular items in the list

Use collection view controllers when you may want to show the user how items differ from one another and/or you want to highlight differences to the user in a visually impactful way.

### What are the differences in the CVC vs TVC data source methods?
The definitions of each are shown below. The difference between the two is that the CVDC requires that you implement the # of items in section and the cell for item  at methods, while the TVDS requires the later but not the former. In TVDS the former is replace with a required reference to the number of sections and the number of rows in each section.

*UICollectionViewDataSource:*
At a minimum, all data source objects must implement the collectionView(_:numberOfItemsInSection:) and collectionView(_:cellForItemAt:) methods. These methods are responsible for returning the number of items in the collection view along with the items themselves. The remaining methods of the protocol are optional and only needed if your collection view organizes items into multiple sections or provides headers and footers for a given section.

*UITableViewDataSource:*
As a representative of the data model, the data source supplies minimal information about the table view’s appearance. The table-view object’s delegate—an object adopting the UITableViewDelegate protocol—provides that information.

The required methods of the protocol provide the cells to be displayed by the table-view as well as inform the UITableView object about the number of sections and the number of rows in each section. The data source may implement optional methods to configure various aspects of the table view and to insert, delete, and reorder rows.




### What kinds of interfaces can you build with CVCs that you cannot with TVCs? Under what circumstances are TVCs preferable?
You can build really dynamic user interfaces with CVCs that are much more flexible than with TVCs. With CVCs, you can build a collection that shows you the collection in a "wheel" or shows collections that you can scroll through horizontally almost like an apple music record scroll.

You want to use TVCs when you are not as concerned about layout and UX with the items in the list. For a basic list of settings, you should prefer to use the table view controller.

### When do you use sections to organize table and collection view controllers? What advantages do sections offer?
Sections over the advantages that they "buffer" items of different catagories from one another. Let's say you were making a furniture app. If you were making a furniture app, you might want separate sections for "living room" and "kitchen" and "bedroom" it can be helpful to use sections to separate these distinct categories.
