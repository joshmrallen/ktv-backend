class AddColumnsToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :title, :string
    add_column :videos, :youTubeId, :string
    add_column :videos, :description, :string
    add_column :videos, :captions, :boolean
  end
end
