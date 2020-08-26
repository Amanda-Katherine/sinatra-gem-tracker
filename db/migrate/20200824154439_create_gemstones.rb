class CreateGemstones < ActiveRecord::Migration
  def change
    create_table :gemstones do |t|
      t.string :name
      t.string :description
      t.integer :user_id
    end
  end
end

