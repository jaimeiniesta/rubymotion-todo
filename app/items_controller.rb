class ItemsController < UITableViewController
  def viewDidLoad
    searchBar = UISearchBar.alloc.initWithFrame(CGRectMake(0, 0, self.tableView.frame.size.width, 0))
    searchBar.delegate = self;
    searchBar.showsCancelButton = true;
    searchBar.sizeToFit
    view.tableHeaderView = searchBar
  end

  def tableView(tableView, numberOfRowsInSection:section)
    Item.all.size
  end

  # TODO: find the item using Item.find(:row)
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    item = Item.all.sort { |a,b| a.row.to_i <=> b.row.to_i }[indexPath.row]
    ItemCell.cellForItem(item, inTableView:tableView)
  end

  def searchBarSearchButtonClicked(searchBar)
    Item.create(:title => searchBar.text, :row => Item.all.size)
    view.reloadData
    searchBar.text = nil
    searchBar.resignFirstResponder
  end

  def searchBarCancelButtonClicked(searchBar)
    searchBar.resignFirstResponder
  end
end
