class ItemsController < UITableViewController
  def load
    @item = Item.all.sort { |a,b| a.row.to_i <=> b.row.to_i }
    self.view.reloadData
  end
  
  def viewDidLoad
    searchBar = UISearchBar.alloc.initWithFrame(CGRectMake(0, 0, self.tableView.frame.size.width, 0))
    searchBar.delegate = self;
    searchBar.showsCancelButton = true;
    searchBar.sizeToFit
    view.tableHeaderView = searchBar
    load
  end
  
  def viewDidUnload
    @item = nil
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @item.size
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    ItemCell.cellForItem(@item[indexPath[1]], inTableView:tableView)
  end

  def searchBarSearchButtonClicked(searchBar)
    Item.create(:title => searchBar.text, :row => Item.all.size)
    load
    searchBar.text = nil
    searchBar.resignFirstResponder
  end

  def searchBarCancelButtonClicked(searchBar)
    searchBar.resignFirstResponder
  end
end
