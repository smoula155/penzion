class AddOrdersAgreesLicence < ActiveRecord::Migration
  def change
  	add_column :orders, :agress_licence, :boolean
  end
end
