class ItemsController < UITableViewController
  def viewDidLoad
    @items = ['work', 'clean house', 'go to the park', 'have dinner', 'sleep']

    searchBar = UISearchBar.alloc.initWithFrame(CGRectMake(0, 0, self.tableView.frame.size.width, 0))
    searchBar.delegate = self;
    searchBar.showsCancelButton = true;
    searchBar.sizeToFit
    view.tableHeaderView = searchBar
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @items.size
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    ItemCell.cellForItem(@items[indexPath.row], inTableView:tableView)
  end

  def searchBarSearchButtonClicked(searchBar)
    @items << searchBar.text
    view.reloadData
    searchBar.text = nil
    searchBar.resignFirstResponder
  end

  def searchBarCancelButtonClicked(searchBar)
    searchBar.resignFirstResponder
  end
end
