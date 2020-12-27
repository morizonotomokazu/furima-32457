class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :name                      ,null: false
      t.text        :text                      ,null: false
      t.integer     :price                     ,null: false
      t.integer     :category_id               ,null: false
      t.integer     :status_id                 ,null: false
      t.integer     :shipping_fee_id           ,null: false
      t.integer     :prefecture_id             ,null: false
      t.integer     :scheduled_delivery_id     ,null: false
<<<<<<< Updated upstream:db/migrate/20201221141707_create_items.rb
      t.references  :user                      , foreign_key: true
=======
      t.references  :user                      ,foreign_key: true

    


>>>>>>> Stashed changes:db/migrate/20201225141707_create_items.rb
      t.timestamps
    end
  end
end
