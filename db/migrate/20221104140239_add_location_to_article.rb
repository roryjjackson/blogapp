class AddLocationToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :location, :string
  end
end
