class CreateQuotes < ActiveRecord::Migration
def up
    create_table :quotes do |t|
      t.string :film
      t.text :content
      t.string :character
      t.string :actor
      t.integer :year
      t.timestamps
    end
  end

  def down
    drop_table :quotes
  end
end
