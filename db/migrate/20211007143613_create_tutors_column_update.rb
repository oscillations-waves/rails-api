class CreateTutorsColumnUpdate < ActiveRecord::Migration[6.1]
  def change
    rename_column :tutors, :name, :tutor_name

  end
end
