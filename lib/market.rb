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
