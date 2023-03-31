class LocationSerializer < ActiveModel::Serializer
  attributes :name, :address, :city, :state, :zipcode
end
