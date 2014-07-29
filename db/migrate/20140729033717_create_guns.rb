class CreateGuns < ActiveRecord::Migration
  def change
    create_table :guns do |t|
      t.string :type
      t.string :model

      t.timestamps
    end
  end
end
