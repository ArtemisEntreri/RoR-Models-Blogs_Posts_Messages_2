class ChangeEscriptionToDescription < ActiveRecord::Migration
  def change
  	rename_column(:blogs, :escription, :description)
  end
end
