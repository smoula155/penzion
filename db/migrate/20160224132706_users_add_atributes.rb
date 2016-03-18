class UsersAddAtributes < ActiveRecord::Migration
  def change
    add_column :users, :jmeno, :string
    add_column :users, :prijmeni, :string
  end
end
