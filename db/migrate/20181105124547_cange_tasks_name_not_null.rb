class CangeTasksNameNotNull < ActiveRecord::Migration[5.1]
  def change
    change_column_null :tasks, :name, false
  end
end
