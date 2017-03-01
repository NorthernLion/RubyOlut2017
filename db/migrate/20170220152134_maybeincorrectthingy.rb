class Maybeincorrectthingy < ActiveRecord::Migration
  def change
	rename_column :users, :blocked, :jaahylla
  end
end
