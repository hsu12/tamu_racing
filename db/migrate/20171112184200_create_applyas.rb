class CreateApplyas < ActiveRecord::Migration
  def change
    create_table :applyas do |t|
        t.string :name
        t.string :uin
        t.string :email
        t.string :course_401
        t.string :FSAE_interest
        t.string :FSAE_as_senoir
        t.string :FSAE_experience
        t.string :sub_team
        t.string :current_course
        t.string :user_id
        t.text :comment
        t.boolean :admission
        
      t.timestamps null: false
    end
  end
end