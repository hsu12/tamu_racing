class RenameNonTamuEmailToEmail < ActiveRecord::Migration
  def change
    rename_column :applies, :non_tamu_email, :email
  end
end
