class CreateAdventure < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.string :name
      t.text :description
    end

    create_table :missions do |t|
      t.string :name
      t.text :description
      t.integer :level
    end

    create_table :mission_prerequisites do |t|
      t.integer :blocked_mission_id
      t.integer :blocker_mission_id
    end

    create_table :questions do |t|
      t.text :description
      t.references :mission
    end

    create_table :question_options do |t|
      t.boolean :correct, default: false
      t.text :text
      t.references :question
    end

    create_table :question_hints do |t|
      t.integer :position
      t.text :text
      t.references :question
    end

    create_table :students do |t|
      t.string :real_name
      t.string :email
      t.string :password

      t.string :nickname
      t.string :hair_style
      t.string :eye_color
      t.string :nose_style
      t.string :gender
      t.string :skin_color

      # t.integer :level, default: 1
      # t.integer :total_xp, default: 0
      # t.integer :current_xp, default: 0
      # t.integer :max_hp, default: 100
      # t.integer :current_hp, default: 100
    end

    create_table :mission_assignments do |t|
      t.references :student
      t.references :mission
      t.string :status, default: 'start'
      t.timestamps
    end

    create_table :answer_attempts do |t|
      t.references :mission_assignment
      t.references :question_option
      t.timestamps
    end

    create_table :equipments do |t|
      t.string :icon
      t.string :image
    end

    create_table :ownerships do |t|
      t.references :student
      t.references :equipment
      t.boolean :equipped
    end
  end
end
