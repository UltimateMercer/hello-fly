class CreateGreetings < ActiveRecord::Migration[7.0]
  def change
    create_table :greetings do |t|
      t.string :message, null: false, limit: 500
      t.string :name, limit: 100

      t.timestamps
    end

    add_index :greetings, :name
    add_index :greetings, :created_at
  end
end
