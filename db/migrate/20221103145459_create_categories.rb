class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :title
      t.string :meta_title
      t.text :content
      t.string :slug

      t.timestamps
    end
  end
end
