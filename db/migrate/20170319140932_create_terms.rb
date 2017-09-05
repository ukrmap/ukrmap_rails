class CreateTerms < ActiveRecord::Migration[5.0]
  def change
    create_table :terms, options: 'ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_general_ci' do |t|
      t.string :name, null: false
      t.integer :entries_count, null: false
      t.integer :popularity, default: 1, null: false

      t.timestamps null: false
    end

    add_index :terms, :name, unique: true
  end
end
