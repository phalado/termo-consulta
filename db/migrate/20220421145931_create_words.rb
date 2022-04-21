class CreateWords < ActiveRecord::Migration[6.1]
  def change
    create_table :words do |t|
      t.string :word, null: false
      t.string :letters, array: true, default: []

      t.timestamps
    end
  end
end
