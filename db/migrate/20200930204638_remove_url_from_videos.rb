class RemoveUrlFromVideos < ActiveRecord::Migration[6.0]
  def change
    remove_column :videos, :url, :string
  end
end
