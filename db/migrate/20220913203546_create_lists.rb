class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.string :name
      t.integer :position, :null => false,:default =>1

      t.timestamps
    end
  end
end
