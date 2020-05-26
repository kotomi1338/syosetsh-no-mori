class AddGenerationCounterToNovelNodes < ActiveRecord::Migration[6.0]
  def change
    add_column :novel_nodes, :gen, :integer
  end
end
