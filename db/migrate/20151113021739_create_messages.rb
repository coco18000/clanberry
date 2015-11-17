class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    	t.integer :from, null: false
    	t.integer :to, null: false
    	t.text :body

      t.timestamps null: false
    end
  end
end
