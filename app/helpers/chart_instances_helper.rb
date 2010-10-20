module ChartInstancesHelper
  def id_for_title(title)
    title.downcase.gsub(' ', '_').gsub(/[^a-zA-Z0-9_]/, '')
  end
end
