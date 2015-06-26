class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :numbers
      t.timestamps null: false
    end
  end
end
