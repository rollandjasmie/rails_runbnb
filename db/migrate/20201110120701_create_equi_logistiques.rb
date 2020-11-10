class CreateEquiLogistiques < ActiveRecord::Migration[6.0]
  def change
    create_table :equi_logistiques do |t|
      t.string :title, array: true, default: []
      t.belongs_to :logement, index: true

      t.timestamps
    end
  end
end
