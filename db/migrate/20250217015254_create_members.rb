class CreateMembers < ActiveRecord::Migration[7.2]
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :membership

      t.timestamps
    end
  end
end
