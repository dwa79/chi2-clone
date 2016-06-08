class AddBackupToStudent < ActiveRecord::Migration
  def change
    add_column :students, :backup, :string
  end
end
