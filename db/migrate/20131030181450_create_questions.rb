class CreateQuestions < ActiveRecord::Migration
  def change
  
    create_table :questions do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  
  end
end
