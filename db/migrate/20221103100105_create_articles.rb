class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :meta_title
      t.text :content
      t.text :summary
      t.string :slug

      t.timestamps
    end
  end
end
