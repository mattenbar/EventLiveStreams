class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :commenter_id
      t.belongs_to :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
