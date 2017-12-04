class CreateApplies < ActiveRecord::Migration
  def change
    create_table :applies do |t|
        t.string :name
        t.string :uin
        t.string :cellphone
        t.string :non_tamu_email
        t.string :course_fall
        t.string :course_credit_fall
        t.string :course_spring
        t.string :course_credit_spring
        t.string :major
        t.string :GPR_major
        t.string :GPR_overall
        t.string :employement
        t.boolean :flag_participate_SAE
        t.string :participate_SAE
        t.boolean :flag_grassroots
        t.string :grassroots
        t.boolean :flag_SAE_officer
        t.string :SAE_officer
        t.boolean :flag_Other
        t.string :Other
        t.text :activities_description
        t.text :motivation
        t.text :hands_on_activities
        t.text :leadership 
        t.text :skills
        t.text :preference
        t.boolean :acknoledgement

        t.timestamps null: false
    end
      
  end
end
