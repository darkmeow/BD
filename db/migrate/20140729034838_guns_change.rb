class GunsChange < ActiveRecord::Migration
  def change
  	remove_column :guns, :type
    add_column :guns, :name, :string
  end
end
