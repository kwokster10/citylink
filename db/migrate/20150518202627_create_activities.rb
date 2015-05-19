class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.text :desc
      t.text :kind
      t.decimal :amount
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
