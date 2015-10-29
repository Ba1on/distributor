module IssuesHelper
  def progressbar_percent(sprint)
    "width: #{sprint.process_in_percents}%;"
  end
end
