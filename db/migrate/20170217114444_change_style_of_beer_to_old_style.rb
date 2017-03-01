class ChangeStyleOfBeerToOldStyle < ActiveRecord::Migration
  def change

    change_table :beers do |t|
      t.rename :style, :style_old
      t.integer :style_id
    end
  end
end
