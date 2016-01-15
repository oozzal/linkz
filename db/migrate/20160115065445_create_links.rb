class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :host
      t.string :path

      t.timestamps null: false
    end
    add_index :links, :host
  end
end
