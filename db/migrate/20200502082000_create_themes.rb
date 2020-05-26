class CreateThemes < ActiveRecord::Migration[6.0]
  def change
    create_table :themes do |t|
      t.references :who, null: false, foreign_key: true
      t.references :where, null: false, foreign_key: true
      t.references :what, null: false, foreign_key: true

      t.timestamps
    end
  end
end
