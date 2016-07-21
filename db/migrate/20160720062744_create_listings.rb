class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|

    	t.string :titles
    	t.string :descriptions
    	t.string :locations
    	t.integer :prices
    	t.timestamps null: false
    end
  end
end
