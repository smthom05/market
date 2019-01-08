require 'pry'

class Market

  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    vendor_names = []
    @vendors.each do |vendor|
      vendor_names << vendor.name
    end
    vendor_names
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.inventory.keys.include?(item)
    end
  end

  def sorted_item_list
    all_items_being_sold = []
    @vendors.each do |vendor|
      vendor.inventory.keys.each do |key|
        all_items_being_sold << key
      end
    end
    all_items_being_sold.sort.uniq
  end

  def total_inventory
    total_inventory_summary = Hash.new(0)
    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        total_inventory_summary[item] += quantity
      end
    end
    total_inventory_summary
  end

  def sell(item, quantity)
    total_inventory_summary = total_inventory
    total_inventory_summary.each do |stocked_item, stocked_quantity|
      if item != stocked_item || quantity > stocked_quantity
        return false
      end
    end
  end

end

  # OLD REFACTORED METHODS

  # def vendors_that_sell(item)
  #   vendors_with_item = []
  #   @vendors.each do |vendor|
  #     vendor.inventory.each do |inventory_item, amount|
  #       if inventory_item == item
  #         vendors_with_item << vendor
  #       end
  #     end
  #   end
  #   vendors_with_item
  # end
