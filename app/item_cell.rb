class ItemCell < UITableViewCell
  CellID = 'CellIdentifier'

  def self.cellForItem(item, inTableView:tableView)
    cell = tableView.dequeueReusableCellWithIdentifier(ItemCell::CellID) || ItemCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:CellID)
    cell.textLabel.text = item.title
    cell
  end
end
