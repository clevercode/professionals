class AddCategoryIdToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :category_id, :integer
  end
end
