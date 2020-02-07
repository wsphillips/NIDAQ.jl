module NIDAQ



include("DAQmx/DAQmx.jl")
using .DAQmx
import Base.write, Base.read

# tasks
export DAQmx, DAQTask, start, stop, clear

# channels
#export analog_input, analog_output, digital_input, digital_output
#export count_edges, quadrature_input, line_to_line, generate_pulses

# properties
# export devices, DefaultDev #, channel_type, getproperties, setproperty!
#export analog_input_ranges, analog_output_ranges
#export analog_input_channels, analog_output_channels
#export digital_input_channels, digital_output_channels
#export counter_input_channels, counter_output_channels

#export RSE, NRSE, Differential, PseudoDifferential

include("task.jl")
#include("analog.jl")
#include("digital.jl")
#include("counter.jl")
include("properties.jl")
#include("deprecations.jl")

end
