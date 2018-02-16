class ChangeColumn < ActiveRecord::Migration[5.1]
  def change
    change_column(:todos, :completed, :boolean, :default => false)
  end
end
