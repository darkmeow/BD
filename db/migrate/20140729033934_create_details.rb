class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.integer :weapon
      t.integer :primesuspect
      t.integer :personinvolved
      t.text :evid_collected
      t.text :evid_inv
      t.text :notes
      t.integer :guilty

      t.timestamps
    end
  end
end
