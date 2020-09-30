class VideoSerializer < ActiveModel::Serializer
  attributes :id, :title, :lyrics, :youtubeId, :description, :captions
end
