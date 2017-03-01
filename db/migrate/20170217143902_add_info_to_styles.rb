class AddInfoToStyles < ActiveRecord::Migration
  def change
    add_column :styles, :info, :text
  end
end
