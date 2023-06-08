class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.belongs_to :course
      t.string :topic

      t.timestamps
    end
  end
end
