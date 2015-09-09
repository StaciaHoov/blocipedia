class DropCollaborationsTable < ActiveRecord::Migration
  def change
    drop_table :collaborations
  end
end
