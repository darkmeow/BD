class CreateCasos < ActiveRecord::Migration
  def change
    create_table :casos do |t|
      t.string :casename
      t.string :victname
      t.date :date_occu
      t.string :place_occu
      t.text :desc
      t.string :status
      t.integer :user_id

      t.timestamps
    end
  end
end
