class CreateDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.string :name
      t.string :text
      t.text :content
      t.string :image
      t.date :diary_day
      t.timestamps
    end
  end
end
