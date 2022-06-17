class ChangeGroupType < ActiveRecord::Migration[7.0]
  def up
    change_column :players, :group, :integer
  end

  def down
    change_column :players, :group, :string
  end
end
