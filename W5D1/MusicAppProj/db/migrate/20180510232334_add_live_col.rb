class AddLiveCol < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :studio, :boolean, default: true
  end
end
