class Evaluator
  def initialize(data)
    @data = data
  end

  def people_missing_projects
    result = {}
    people_project_counts.each do |person, project_counts|
      project_counts.each do |project, count|
        result[person] ||= []
        result[person] << project if count == 0
      end
    end
    result
  end

  def people_project_counts
    result = {}
    people_projects.each do |member, project_list|
      project_counts = {}
      %i(project1 project2 project3 project4 project5 project6).each do |project|
        project_counts[project] ||= 0
        project_counts[project] += 1 if project_list.include?(project)
      end
      result[member] = project_counts
    end
    result
  end

  # "A" => [:1, :1, :2, :2, :3, :3]
  # "B" => [:1, :1, :3, :3, :6, :6]
  # "B" => [:6, :1, :1, :4, :4, :6]
  def people_non_consecutive_projects
    result = {}
    people_projects.each do |member, project_list|
      i = 0
      consecutive_starting_at_0 = []
      3.times do
        consecutive_starting_at_0 << (project_list[i] == project_list[i + 1])
        i += 2
      end

      rotated_list = project_list.rotate
      i = 0
      consecutive_starting_at_1 = []
      3.times do
        consecutive_starting_at_1 << (rotated_list[i] == rotated_list[i + 1])
        i += 2
      end

      if consecutive_starting_at_0.any?{|element| !element } && consecutive_starting_at_1.any?{|element| !element }
        result[member] = project_list
      end
    end
    result
  end

  def people_projects
    result = {}
    @data.values.each do |teams_for_that_week|
      teams_for_that_week.each do |project, team|
        team.each do |member|
          result[member] ||= []
          result[member] << project
        end
      end
    end
    result
  end

end