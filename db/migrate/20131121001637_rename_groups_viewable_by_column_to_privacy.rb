class RenameGroupsViewableByColumnToPrivacy < ActiveRecord::Migration
  def change
    rename_column :groups, :viewable_by, :privacy
  end
end
