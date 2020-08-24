class CreateGems < ActiveRecord::Migration
  def change
    create_table :gems do |t|
      t.string :name
      t.string :description
      t.integer :user_id
    end
  end
end
