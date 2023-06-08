class AddAnswersToResult < ActiveRecord::Migration[7.0]
  def change
    add_column :results, :answers, :string
  end
end
