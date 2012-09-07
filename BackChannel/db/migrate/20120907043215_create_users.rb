class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.binary :admin_flag

      t.timestamps
    end
  end
end
