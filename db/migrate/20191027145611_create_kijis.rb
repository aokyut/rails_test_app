class CreateKijis < ActiveRecord::Migration[5.2]
  def change
    create_table :kijis do |t|
      t.string :title
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
