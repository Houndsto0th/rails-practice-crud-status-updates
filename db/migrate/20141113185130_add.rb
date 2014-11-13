class Add < ActiveRecord::Migration
  def change
    create_table :statusupdates do |t|
      t.text :status
      t.string :user
      t.integer :likes
    end
  end
end
