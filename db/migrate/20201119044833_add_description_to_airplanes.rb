class AddDescriptionToAirplanes < ActiveRecord::Migration[6.0]
  def change
    add_column :airplanes, :description, :text
  end
end
