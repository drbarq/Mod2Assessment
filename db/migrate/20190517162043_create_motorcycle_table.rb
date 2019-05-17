class CreateMotorcycleTable < ActiveRecord::Migration[5.2]
  def change
    create_table :motorcycles do |t|
      t.string :make
      t.string :model
      t.integer :engine_cc
    end
  end
end
