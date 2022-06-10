class TenantSerializer < ActiveModel::Serializer
  attributes :id, :name, :age

  def age
    "#{object.age} years old"
  end
end
