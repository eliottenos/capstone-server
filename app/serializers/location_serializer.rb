class LocationSerializer < ActiveModel::Serializer
  attributes :id, :country, :visited, :note
  has_one :user
end
