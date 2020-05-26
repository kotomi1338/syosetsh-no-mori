class CreateNovelNodes < ActiveRecord::Migration[6.0]
  def change
    create_table :novel_nodes do |t|
      t.text :content
      t.references :user, foreign_key: { to_table: :users }
      t.references :theme, foreign_key: true
      t.boolean :is_temp
      t.references :parent, foreign_key: { to_table: :novel_nodes }

      t.timestamps
    end
  end
end
