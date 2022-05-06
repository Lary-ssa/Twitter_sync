class CreateTwitterMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :twitter_messages do |t|
      t.references :user, null: false, foreign_key: true
      t.json :data
      t.string :timeline_id

      t.timestamps
    end
  end
end
