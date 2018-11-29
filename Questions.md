## Questions: Collection Views - Collected  

**What is a collection view controller (CVC)?**  
A collection view controller is a controller use to display data and images in an organized fashion.  It's purpose is along the same line as a table view controller, but has more features.  The key functionality is to display and organize collections of data (array, images, dictionaries, etc).

**When do you use a table view controller (TVC) and when a collection view controller (CVC)?**  
A table view is more efficient for one column presentations.  Collection view is can handle larger amounts of data and implement vertical and horizontal scrolling much more efficiently. One advantage in working with CVC is the greater ease in creating custom layouts and transitions.

**What are the differences in the CVC vs TVC data source methods?**  
One major difference with the CVC datasource is the support of interactive reordering of items.  The use of a built in default gesture recognizer can be used to accomplish the reorganization.  The TVC is only allowed to move the table view to a different row.  

**What kinds of interfaces can you build with CVCs that you cannot with TVCs? Under what circumstances are TVCs preferable?** CVC is able to create grid layouts as well as the full width vertical lists, which is the layout that TVC create. CVC may also contain supplementary views.

**When do you use sections to organize table and collection view controllers? What advantages do sections offer?**  
Sections
