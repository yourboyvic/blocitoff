class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :description
      t.boolean :done

      t.timestamps null: false
    end
  end
end
