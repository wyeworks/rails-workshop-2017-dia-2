class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.string :name
      t.references :board, foreign_key: true

      t.timestamps
    end
  end
end
