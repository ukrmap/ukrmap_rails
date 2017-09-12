class AddTimestampsToEntry < ActiveRecord::Migration[5.0]
  def change
    change_table :entries do |t|
      t.timestamps null: true
    end
  end
end
