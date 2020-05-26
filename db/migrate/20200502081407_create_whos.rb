class CreateWhos < ActiveRecord::Migration[6.0]
  def change
    create_table :whos do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
