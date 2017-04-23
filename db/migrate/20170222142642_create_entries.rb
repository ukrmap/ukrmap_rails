class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :category
      t.string :course
      t.integer :parent_id
      t.integer :level
      t.string :dir2
      t.string :tutorial
      t.string :title_ru
      t.string :title_uk
      t.string :title_en
      t.string :title_be
      t.text :content_ru
      t.text :content_uk
      t.text :content_en
      t.text :content_be
      t.string :dir
      t.string :text_file
      t.text :maps
      t.text :maps_names_ru
      t.text :maps_names_uk
      t.text :maps_names_en
      t.text :maps_names_be
      t.text :legend
      t.text :legends
      t.text :pictures
      t.string :video_file
      t.string :xmlfile
      t.boolean :text_with_title, default: false, null: false
      t.integer :sequence, default: 0, null: false
    end

    add_index :entries, :category
    add_index :entries, :course
    add_index :entries, :parent_id
    add_index :entries, :level
  end
end
