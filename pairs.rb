group1 = Array.new(24) { |num| (num+65).chr }
result = Hash.new(0)

group2 = Array.new

index = 0
team = 1
while team < 7 do
  this_team = group1[index..index+3]

  group2 << {this_team[0] => team}
  group2 << {this_team[1] => team+1}
  group2 << {this_team[2] => team+2}
  group2 << {this_team[3] => team+3}

  result[this_team.sort.join] += 1
  index += 4
  team += 1
end
p result
p group2
