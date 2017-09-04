class CreateArticles < ActiveRecord::Migration[5.0]
=begin
  def change
    create_table :articles do |t|
      t.string :slug
      t.string :title, null: false
      t.boolean :advertising, default: true, null: false
      t.string :description
      t.string :keywords
      t.text :content
      t.date :created_on, null: false
    end
  end
=end
end
