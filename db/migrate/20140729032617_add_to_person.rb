class AddToPerson < ActiveRecord::Migration
  def change
  	  add_column :people, :firstname, :string
      add_column :people, :lastname, :string
      add_column :people, :age, :integer
      add_column :people, :occupation, :string
      add_column :people, :victim, :boolean, :default => false
      add_column :people, :guilty, :boolean, :default => false
  end
end
