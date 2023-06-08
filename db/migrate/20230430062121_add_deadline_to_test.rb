class AddDeadlineToTest < ActiveRecord::Migration[7.0]
  def change
    add_column :tests, :deadline_seconds, :integer
  end
end
