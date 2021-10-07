class CreateTutors < ActiveRecord::Migration[6.1]
  def change
    create_table :tutors do |t|
      t.string :name
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
