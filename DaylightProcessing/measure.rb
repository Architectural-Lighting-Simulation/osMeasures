class RunDaylightSimulations < OpenStudio::Ruleset::ModelUserScript

def name
  return "Run Daylight Simulations"
end

def arguments(model)
  args = OpenStudio::Ruleset::OSArgumentVector.new


eplus_radiance = OpenStudio::Ruleset::OSArgument::makeBoolArgument('eplus_radiance',true)
eplus_radiance.setDisplayName("\n ****DAYLIGHT METRICS**** \n \n ")
eplus_radiance.setDisplayName('Process EnergyPlus with Radiance Daylighting Calculations)')
eplus_radiance.setDefaultValue(false)
args << eplus_radiance

energy_ch = OpenStudio::StringVector.new

energy_ch << "Use OSM Ref Points + Create New OSM w/Schedules"
energy_ch << "Locate Ref Points + Create New OSM w/Schedules"


energy_calc = OpenStudio::Ruleset::OSArgument::makeChoiceArgument('ref_point', energy_ch, true)
energy_calc.setDisplayName("Lighting Enegy Calculation Method - Select One:")
    energy_calc.setDefaultValue("Automatic Selection")
    args << energy_calc

grid_spacing = OpenStudio::Ruleset::OSArgument::makeDoubleArgument('grid_spacing',true)
grid_spacing.setDisplayName("Daylight Analysis Grid Spacing")
grid_spacing.setDefaultValue(2)
args << grid_spacing

wall_offset = OpenStudio::Ruleset::OSArgument::makeDoubleArgument('wall_offset',true)
wall_offset.setDisplayName("Daylight Analysis Grid Offset from wall")
wall_offset.setDefaultValue(1)
args << wall_offset


#DAYLIGHT METRICS


 
ptMetrics = OpenStudio::Ruleset::OSArgument::makeBoolArgument('ptMetrics',true)
ptMetrics.setDisplayName("\n ****DAYLIGHT METRICS**** \n \n ")
ptMetrics.setDisplayName('Calculate Point Daylight Metrics (DA, UDI, etc.)')
ptMetrics.setDefaultValue(false)
args << ptMetrics

spMetrics = OpenStudio::Ruleset::OSArgument::makeBoolArgument('spMetrics',true)
spMetrics.setDisplayName('Calculate Point and Space Metrics (sDA and ASE)')
spMetrics.setDefaultValue(false)
args << spMetrics

ltgEnergy = OpenStudio::Ruleset::OSArgument::makeBoolArgument('ltgEnergy',true)
ltgEnergy.setDisplayName('Calculate Lighting Energy Savings (no')
ltgEnergy.setDefaultValue(false)
args << ltgEnergy



  return args
end

end

RunDaylightSimulations.new.registerWithApplication
