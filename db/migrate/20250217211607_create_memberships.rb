class CreateMemberships < ActiveRecord::Migration[7.2]
  def change
    create_table :memberships do |t|
      t.string :membership_name
      t.integer :price
      t.text :benefits

      t.timestamps
    end
  end
end
