class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles, options: 'ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci' do |t|
      t.string :slug
      t.string :title, null: false
      t.boolean :advertising, default: true, null: false
      t.string :description
      t.string :keywords
      t.text :content
      t.date :created_on, null: false
    end
  end
end
