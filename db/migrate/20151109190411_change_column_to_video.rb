class ChangeColumnToVideo < ActiveRecord::Migration
  def up
    change_column :videos, :code, :integer, null: true
  end

  def down
    change_column :videos, :code, :integer, null: false
  end
end
