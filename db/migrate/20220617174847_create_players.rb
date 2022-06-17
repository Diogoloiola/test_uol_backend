class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :email
      t.string :cellphone
      t.string :code_name
      t.string :group

      t.timestamps
    end
  end
end
