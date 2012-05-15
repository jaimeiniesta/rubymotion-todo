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
    load_items
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
    Item.create(:title => searchBar.text, :created_at => Time.now)
    load_items
    searchBar.text = nil
    searchBar.resignFirstResponder
  end

  def searchBarCancelButtonClicked(searchBar)
    searchBar.resignFirstResponder
  end

  private

  def load_items
    # we could use NanoStore sorting here, but wait until NanoStoreInMotion implement that
    @items = Item.all.sort {|a,b| a.created_at.is_a?(Time) && b.created_at.is_a?(Time) ? (a.created_at <=> b.created_at) : (a.title <=> b.title) }
    self.view.reloadData
  end
end
