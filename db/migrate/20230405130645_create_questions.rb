class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.belongs_to :test
      t.string :task
      t.string :a
      t.string :b
      t.string :c
      t.string :d
      t.string :answer

      t.timestamps
    end
  end
end
