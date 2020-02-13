function Base.show(io::IO, chan::PhysicalChannel{T}) where T <: AbstractIO 
    println(io, "Channel name: ", chan.name)
    println(io, "Channel type: ", "$T")
    println(io, "Parent device: ", chan.parent.name)
    if chan.ranges !== nothing
        print(io, "Available ranges: ")
        for x in chan.ranges
            print(io, x, ", ")
        end
    end
end

#FIXME: make a reasonable display of
# DAQDevice so it doesn't look like garbagio
function Base.show(io::IO, dev::DAQDevice)
    return nothing
end

function Base.push!(task::DAQTask, chan::TaskChannel{T}) where T <: AbstractIO
end

function Base.push!(task::DAQTask, chan::PhysicalChannel{T}) where T <: AbstractIO
end


