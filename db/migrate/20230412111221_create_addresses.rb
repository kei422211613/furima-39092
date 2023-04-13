class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :ouder,         null: false, foreign_key: true
      t.string     :post_code,      null: false
      t.integer    :region_id, null: false
      t.string     :municipalities,          null: false
      t.string     :banchi,         null: false
      t.string     :building_name
      t.string     :number,  null: false
      t.timestamps
    end
  end
end
20230412125151