class ProductSerializer < ActiveModel::Serializer
  attributes :name, :desc, :unit_price, :category

  def category
    object.category.name
  end
end
