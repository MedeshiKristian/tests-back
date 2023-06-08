class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.belongs_to :test
      t.belongs_to :user
      t.integer :correct
      t.integer :total

      t.timestamps
    end
  end
end
