# What is a collection view controller (CVC)?

A collection view controller is akin to a table view controller, but allows for more flexible layout options. 

# When do you use a table view controller (TVC) and when a collection view controller (CVC)?

You typically use a table view controller when having stacks of information provided in a typically linear fashion.

A colection view controller is great for displaying things in a more refined way where the application has more control of how much content a user can see at once.

For example, a TVC would be great for a list of hospital patients and their needs, and a CVC would be great for a photo gallery with images of varied sizes in which a user can easily scroll through and then tap on the cells to act upon them. 

# What are the differences in the CVC vs TVC data source methods?

From Apple's documentation on [UICollectionViewDataSource](https://developer.apple.com/documentation/uikit/uicollectionviewdatasource) & [UITableViewDataSource](https://developer.apple.com/documentation/uikit/uitableviewdatasource), it seems as though the way the cells need to be in contact with UITaleView and UITableViewDelegate for the order and number of sections and rows for the TVC data source. For the CVC data source, the related objects only need to implement the collectionViews for the number of items in a section and the cells for item at a destination. 

### Correct answer: where you would put row for a table, you would put a cell instead.


# What kinds of interfaces can you build with CVCs that you cannot with TVCs? Under what circumstances are TVCs preferable?

You can build interfaces that do not look like a list or table with CVCs, and arrange the items almost however you'd like. TVCs are preferrable for confining elements in a predictable pattern.

### More specifically: You can make a catalog that can have sections of cells that can be navigated through vertically or horizontally with CVCs (like the Kindle, Netflix app, etc.), or only vertically with a TVC. 

# When do you use sections to organize table and collection view controllers? What advantages do sections offer?

When you want to categorize items by group, such as contact names by the first letter of their first name or surname. This enables the user to quickly parse through things without having to navigate through a subjectively unordered list of items.