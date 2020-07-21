class RemoveNameFromDiaries < ActiveRecord::Migration[6.0]
  def change
    remove_column :diaries, :name, :string
  end
end
