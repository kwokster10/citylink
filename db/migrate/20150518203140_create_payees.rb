class CreatePayees < ActiveRecord::Migration
  def change
    create_table :payees do |t|
      t.text :name
      t.text :email
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
