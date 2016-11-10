class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :name
      t.text :message
      t.integer :rating
      t.integer :user_id

      t.timestamps
    end
  end
end
