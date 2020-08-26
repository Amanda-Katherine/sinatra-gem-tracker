class ChangeGemstonesDescription < ActiveRecord::Migration
  def change
    change_column :gemstones, :description, :text
  end
end
