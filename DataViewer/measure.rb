class ViewDaylightResults < OpenStudio::Ruleset::ModelUserScript

def name
  return "Daylighting Results Viewer"
end

def arguments(model)
  args = OpenStudio::Ruleset::OSArgumentVector.new


view_data = OpenStudio::StringVector.new
view_data << "Annual Metrics"
view_data << "Illuminance Grid"
view_data << "Shade Settings"

get_view = OpenStudio::Ruleset::OSArgument::makeChoiceArgument('ref_point', view_data, true)
get_view.setDisplayName("Daylighting Results to View - Select One:")
    get_view.setDefaultValue("Automatic Selection")
    args << get_view



  return args
end


end

def run(model, runner, user_arguments)

# The following should work, and is a call to a test website.  Currently experiencing problems, but will be replaced with a different arrangment that involves data embedded html files.

    #link = "http://goo.gl/sOg4BN"
    #system "start #{link}"

end

ViewDaylightResults.new.registerWithApplication
