class CreatePayees < ActiveRecord::Migration
  def change
    create_table :payees do |t|
      t.text :name
      t.text :email

      t.timestamps null: false
    end
  end
end
