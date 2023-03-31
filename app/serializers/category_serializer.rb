class CategorySerializer < ActiveModel::Serializer
  attributes :name, :desc, :no_of_items, :restaurant_name

  def restaurant_name
    object.restaurant.name
  end
end
