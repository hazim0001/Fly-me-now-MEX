class AddAddressToAirplanes < ActiveRecord::Migration[6.0]
  def change
    add_column :airplanes, :address, :string
  end
end
