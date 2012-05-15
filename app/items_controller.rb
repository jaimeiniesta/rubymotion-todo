class ItemsController < UITableViewController
  def init
    super
    @items = []
    self
  end

  def viewDidLoad
    searchBar = UISearchBar.alloc.initWithFrame(CGRectMake(0, 0, self.tableView.frame.size.width, 0))
    searchBar.delegate = self;
    searchBar.showsCancelButton = true;
    searchBar.sizeToFit
    view.tableHeaderView = searchBar
    @items = Item.all.sort {|a,b| a.created_at <=> b.created_at}
  end

  def viewDidUnload
    @items = nil
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @items.size
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    ItemCell.cellForItem(@items[indexPath[1]], inTableView:tableView)
  end

  def searchBarSearchButtonClicked(searchBar)
    @items << Item.create(:title => searchBar.text, :created_at => Time.now)
    self.view.reloadData
    searchBar.text = nil
    searchBar.resignFirstResponder
  end

  def searchBarCancelButtonClicked(searchBar)
    searchBar.resignFirstResponder
  end
end
