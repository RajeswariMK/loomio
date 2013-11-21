class RenameGroupsViewableByColumnToPrivacy < ActiveRecord::Migration
  def up
    rename_column :groups, :viewable_by, :privacy
    Group.reset_column_information
    Group.where(privacy: 'everyone').update_all(privacy: 'public')
  end

  def down
    rename_column :groups, :privacy, :viewable_by
  end
end
