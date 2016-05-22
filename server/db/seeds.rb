# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

[Student, Adventure, Mission, Question, QuestionOption].each do |model|
  CSV.open("db/#{model.to_s.underscore}.csv", "r", col_sep: ';', headers: :first_row) do |input|
    input.each do |row|
      model.create(input.headers.inject({}) do |hash, col|
                     if row[col].present?
                       if (row[col] === String)
                         hash.merge(col => row[col].gsub(/\\n/,"\n"))
                       else
                         hash.merge(col => row[col])
                       end
                     else
                       hash
                     end
                   end)

    end
  end
end
