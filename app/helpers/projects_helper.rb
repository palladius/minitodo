module ProjectsHelper
  
  def title_column(project)
    "<font color='#{project.color}'>#{link_to( project.title, project, :border => 0, :class=> :project)}" rescue "TitleError(#{$!})"
  end
  
end
