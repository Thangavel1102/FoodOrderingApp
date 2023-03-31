class RestaurantSerializer < ActiveModel::Serializer
  attributes :name, :desc, :phone, :location

  def location
    object.location.name
  end
end
