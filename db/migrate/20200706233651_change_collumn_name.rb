class ChangeCollumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :descrition, :description
  end
end
