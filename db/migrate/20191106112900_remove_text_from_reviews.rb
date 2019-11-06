class RemoveTextFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :text, :string
    add_column :reviews, :content, :string
  end
end
