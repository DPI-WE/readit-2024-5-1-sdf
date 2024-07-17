class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.text :body
      t.references :commentable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
