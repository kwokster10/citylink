class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.text :desc
      t.text :type
      t.real :amount

      t.timestamps null: false
    end
  end
end
