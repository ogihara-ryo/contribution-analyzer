class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :type
      t.string :actor
      t.string :repo_name
      t.datetime :timestamp

      t.timestamps
    end
  end
end
