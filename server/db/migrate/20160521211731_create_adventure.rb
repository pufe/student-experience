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
      t.integer :blocked_mission
      t.integer :blocker_mission
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
      t.string :nickname
      t.string :hair_style
      t.string :body_style
      t.integer :level, default: 1
      t.integer :total_xp, default: 0
      t.integer :current_xp, default: 0
      t.integer :max_hp, default: 100
      t.integer :current_hp, default: 100
    end

    create_table :mission_assignments do |t|
      t.references :student
      t.references :mission
      t.boolean :completed, default: false
    end
  end
end
