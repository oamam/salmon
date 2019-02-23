class User < ActiveRecord::Migration[5.2]

  CREATE_TIMESTAMP = 'DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP'
  UPDATE_TIMESTAMP = 'DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'

  def change
    create_table :users do |t|
      t.string :name
      t.column :created_at, CREATE_TIMESTAMP
      t.column :updated_at, UPDATE_TIMESTAMP
    end
  end
end
