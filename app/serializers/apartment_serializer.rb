class ApartmentSerializer < ActiveModel::Serializer
  attributes :number

  has_many :leases, serializer: ApartmentLeaseSerializer
end
