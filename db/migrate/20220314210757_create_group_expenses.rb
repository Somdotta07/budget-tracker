class CreateGroupExpenses < ActiveRecord::Migration[7.0]
  def change
    create_join_table :groups, :expenses do |t|
      t.index [:group_id, :expense_id]

      t.timestamps
    end
  end
end
