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
      t.integer :xp_reward
    end

    create_table :questions do |t|
      t.text :description
      t.references :mission
      t.integer :difficulty
      t.integer :gold_reward
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
      t.string :hair_color
      t.string :eye_color
      t.string :nose_style
      t.string :gender
      t.string :skin_color
      t.string :uniform

      t.integer :level, default: 1
      t.integer :total_xp, default: 0
      t.integer :current_xp, default: 0
      t.integer :next_level_xp, default: 100

      t.integer :max_hp, default: 3
      t.integer :current_hp, default: 3
      t.integer :gold, default: 0
      t.integer :cash, default: 0
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

    create_table :items do |t|
      t.boolean :consummable
      t.string :name
      t.string :icon
      t.string :image
      t.string :slot
      t.string :effect
      t.integer :gold_price
      t.integer :cash_price
    end

    create_table :ownerships do |t|
      t.references :student
      t.references :item
      t.integer :quantity
      t.boolean :equipped
    end

    create_table :achievements do |t|
      t.references :student
      t.references :badge
    end

    create_table :badges do |t|
      t.string :icon
      t.string :name
      t.text :description
    end
  end
end
