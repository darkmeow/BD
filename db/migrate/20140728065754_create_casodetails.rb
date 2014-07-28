class CreateCasodetails < ActiveRecord::Migration
  def change
    create_table :casodetails do |t|
    	t.string :name
    	t.string :type
    	t.string :desc
    end
  end
end
