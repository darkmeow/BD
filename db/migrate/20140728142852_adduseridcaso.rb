class Adduseridcaso < ActiveRecord::Migration
  def change
  	add_column :casos, :user_id, :string 
  end
end
