class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :question
      t.text :content

      t.timestamps
    end
  end
end
