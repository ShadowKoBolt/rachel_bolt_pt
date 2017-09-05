class AddDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :address, :text
    add_column :users, :mobile, :string
    add_column :users, :occupation, :string
    add_column :users, :support_contact, :string
    add_column :users, :catchup_contact, :string
    add_column :users, :smoke, :boolean
    add_column :users, :pregnant, :boolean
    add_column :users, :medical_heart, :boolean
    add_column :users, :medical_chest_pain, :boolean
    add_column :users, :medical_dizzy, :boolean
    add_column :users, :medical_high_blood_pressure, :boolean
    add_column :users, :medical_arthritis, :boolean
    add_column :users, :medical_asthma, :boolean
    add_column :users, :medical_bone_or_joint_problems, :boolean
    add_column :users, :medical_back_problems, :boolean
    add_column :users, :medical_epilepsy, :boolean
    add_column :users, :medical_sports_injury, :boolean
    add_column :users, :medical_depression, :boolean
    add_column :users, :medical_other, :text
  end
end
