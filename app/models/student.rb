# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(name)
    # puts "search students for : #{name}"
    students = []
    if name == ""
      # puts "Return all students"
      students = Student.all
    else
      # puts "Check for name : #{name}"
      Student.all.each do |student|
        # puts "check student #{student.name}"
        if student.name.downcase.include?(name.downcase)
          # puts "Student '#{student.name}' includes '#{name}'"
          students << student
          # puts "Update array : #{students}"
        end
      end
    end
    students
  end

end
