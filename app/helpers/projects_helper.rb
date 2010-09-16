module ProjectsHelper
  
  def title_column(project)
    "<font color='#{project.color}'>#{project.title}"
  end
  
end
