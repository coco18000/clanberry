class CreateTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.string :email, null: false
      t.string :description
      t.string :password, null: false
      t.string :password_confirm, null: false

      t.timestamps null: false
    end

    create_table :videos do |t|
      t.integer :code, null: false
      t.string :title, null: false
      t.string :description, null: false
      t.references :user

      t.timestamps
    end

    create_table :comments do |t|
      t.string :description, null: false
      t.integer :user_id, null: false
      t.integer :video_id, null: false
      t.references :user, null: false
      t.references :video, null: false

      t.timestamps null: false
    end

    create_table :categories do |t|
      t.integer :video_id, null: false
      t.integer :code, null: false

      t.timestamps null: false
    end

    create_table :videos_categories do |t|
      t.integer :video_id, null: false
      t.integer :category_code, null: false
    end
  end
end
