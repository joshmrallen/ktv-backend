class RemoveNameFromVideos < ActiveRecord::Migration[6.0]
  def change
    remove_column :videos, :name, :string
  end
end
