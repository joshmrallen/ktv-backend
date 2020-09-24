class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :query
      t.json :results, default: nil
    end
  end
end
