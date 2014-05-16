data = {
  "1" => {
    project1: %w(a b c d),
    project2: %w(e f g h),
    project3: %w(i j k l),
    project4: %w(m n o p),
    project5: %w(q r s t),
    project6: %w(u v w x),
  },
  "2" => {
    project2: %w(a b c d),
    project3: %w(e f g h),
    project4: %w(i j k l),
    project5: %w(m n o p),
    project6: %w(q r s t),
    project1: %w(u v w x),
  },
  "3" => {
    project2: %w(a b c d),
    project3: %w(e f g h),
    project4: %w(i j k l),
    project5: %w(m n o p),
    project6: %w(q r s t),
    project1: %w(u v w x),
  },
  "4" => {
    project2: %w(a b c d),
    project3: %w(e f g h),
    project4: %w(i j k l),
    project5: %w(m n o p),
    project6: %w(q r s t),
    project1: %w(u v w x),
  },
  "5" => {
    project2: %w(a b c d),
    project3: %w(e f g h),
    project4: %w(i j k l),
    project5: %w(m n o p),
    project6: %w(q r s t),
    project1: %w(u v w x),
  },
  "6" => {
    project1: %w(a b c d),
    project2: %w(e f g h),
    project3: %w(i j k l),
    project4: %w(m n o p),
    project5: %w(q r s t),
    project6: %w(u v w x),
  },
}

require_relative 'evaluator'
require 'pp'

evaluator = Evaluator.new(data)

#puts "People Projects"
#pp evaluator.people_projects
#puts
#puts
#
#puts "People project counts"
#pp evaluator.people_project_counts
#puts
#puts
#
#puts "People missing projects"
#pp evaluator.people_missing_projects
#puts
#puts

puts "Are there people with non-consecutive projects?"
people_with_wonky_projects = evaluator.people_non_consecutive_projects
if people_with_wonky_projects.empty?
  puts "  Nope!"
else
  puts "  Yes, and they are:"
  pp people_with_wonky_projects
end
puts
puts

# is everyone on every project twice (we have that with people_project_counts)
# needs to be yes

# min / max number of times a given person is on a team with another person