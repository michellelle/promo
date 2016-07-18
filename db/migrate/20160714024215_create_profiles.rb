class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
<<<<<<< HEAD
      t.string :company_title
=======
      t.string :job_title
>>>>>>> stripe_integration
      t.string :phone_number
      t.string :contact_email
      t.text :description
      
<<<<<<< HEAD
      t.timestamps
=======
      t.timestamp
>>>>>>> stripe_integration
    end
  end
end
