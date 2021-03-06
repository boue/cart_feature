class Cart

attr_reader :items


def self.build_from_hash hash 
  items = if hash["cart"] then 
    hash["cart"]["items"].map do |item_data|
      CartItem.new item_data["product_id"], item_data["quantity"]
    end
  else
    []
  end

  new items
end


def initialize items = []
  @items = []
end

def add_item product_id
  item = @items.find { |item| item.product_id == product_id }
  if item
    item.increment
  else
    @items << CartItem.new(product_id)
  end
end

def empty?
  @items.empty?
end



end