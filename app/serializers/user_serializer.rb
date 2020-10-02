class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  has_many :favorites
  has_many :videos, through: :favorites

  # has_many :rooms
  # has_many :videos, through: :rooms

end
