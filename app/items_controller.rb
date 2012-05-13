class ItemsController < UITableViewController
  def viewDidLoad
    @items = ['work', 'clean house', 'go to the park', 'have dinner', 'sleep']
  end

  def tableView(tableView, numberOfRowsInSection:section)
    @items.size
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    ItemCell.cellForItem(@items[indexPath.row], inTableView:tableView)
  end
end
