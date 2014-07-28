class Borratabla < ActiveRecord::Migration
  def change
  	drop_table :casos
  end
end
