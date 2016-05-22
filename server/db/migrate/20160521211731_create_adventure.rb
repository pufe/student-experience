class CreateAdventure < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.string :name
      t.text :description
      t.string :subject
      t.integer :previous_adventure_id
      t.timestamp :unlocked_at
    end

    create_table :adventure_assignments do |t|
      t.references :student
      t.references :adventure
      t.boolean :completed, default: false
      t.integer :student_level, default: 1
      t.timestamps
    end

    create_table :missions do |t|
      t.string :name
      t.text :description
      t.integer :level
      t.references :adventure
    end

    create_table :questions do |t|
      t.text :description
      t.references :mission
      t.integer :difficulty
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
      t.references :adventure_assignment
      t.references :mission
      t.boolean :completed, default: false
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
