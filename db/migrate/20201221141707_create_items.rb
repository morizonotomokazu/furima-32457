class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string        :items_neme     ,null: false

      
      t.timestamps
    end
  end
end
