class VideoSerializer < ActiveModel::Serializer
  attributes :id, :title, :lyrics, :youTubeId, :description, :captions
  has_many :favorites
  has_many :users, through: :favorites
end
