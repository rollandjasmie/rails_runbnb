class CreateAccesVoyageurs < ActiveRecord::Migration[6.0]
  def change
    create_table :acces_voyageurs do |t|
      t.string :acces
      t.string :aide1
      t.string :aide2
      t.string :autre
      t.belongs_to :logement, index: true

      t.timestamps
    end
  end
end
