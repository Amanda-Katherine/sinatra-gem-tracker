class CreateGemstones < ActiveRecord::Migration
  def change
    create_table :gemstones do |t|
      t.string :name
      t.string :description
      t.integer :user_id
    end
  end
end

class LAPTOP-2HT6APIL < ActiveRecord::Migration
  def change
    def up
      change_table :gemstones do |t|
        t.change :description, :string
      end
    end
   
    def down
      change_table :gemstones do |t|
        t.change :description, :text
      end
    end
  end
end