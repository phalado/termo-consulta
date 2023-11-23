class CreateMonthTestTable < ActiveRecord::Migration[6.1]
  def change
    create_table :month_tests do |t|
      t.string :month, null: false
      t.integer :returned_value

      t.timestamps
    end
  end
end
