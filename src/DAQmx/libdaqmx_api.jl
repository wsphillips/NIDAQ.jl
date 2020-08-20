
# Task functions

function LoadTask(taskName::String, taskHandle::Ref{TaskHandle})
    ccall((:DAQmxLoadTask, :libnidaqmx), Cint,
          (Ref{UInt8}, Ref{TaskHandle}),
          taskName, taskHandle)
end

function CreateTask(taskName::String, taskHandle::Ref{TaskHandle})
    ccall((:DAQmxCreateTask, :libnidaqmx), Cint,
          (Cstring, Ref{TaskHandle}),
          taskName, taskHandle)
end

function AddGlobalChansToTask(taskHandle::TaskHandle, channelNames::String)
    ccall((:DAQmxAddGlobalChansToTask, :libnidaqmx), Cint,
          (TaskHandle, Cstring),
          taskHandle, channelNames)
end

function StartTask(taskHandle::TaskHandle)
    ccall((:DAQmxStartTask, :libnidaqmx), Cint,
          (TaskHandle,), taskHandle)
end

function StopTask(taskHandle::TaskHandle)
    ccall((:DAQmxStopTask, :libnidaqmx), Cint,
          (TaskHandle,), taskHandle)
end

function ClearTask(taskHandle::TaskHandle)
    ccall((:DAQmxClearTask, :libnidaqmx), Cint,
          (TaskHandle,), taskHandle)
end

function WaitUntilTaskDone(taskHandle::TaskHandle, timeToWait::Real)
    ccall((:DAQmxWaitUntilTaskDone, :libnidaqmx), Cint,
          (TaskHandle, Cdouble),
          taskHandle, timeToWait)
end

function WaitForValidTimestamp(taskHandle::TaskHandle, timestampEvent::Integer,
                               timeout::Real, timestamp::Ref{CVIAbsoluteTime})

    ccall((:DAQmxWaitForValidTimestamp, :libnidaqmx), Cint,
          (TaskHandle, Cint, Cdouble, Ref{CVIAbsoluteTime}),
          taskHandle, timestampEvent, timeout, timestamp)
end

function IsTaskDone(taskHandle::TaskHandle, isTaskDone::Ref{UInt32})
    
    ccall((:DAQmxIsTaskDone, :libnidaqmx), Cint,
          (TaskHandle, Ref{Cuint}),
          taskHandle, isTaskDone)
end

function TaskControl(taskHandle::TaskHandle, action::Integer)

    ccall((:DAQmxTaskControl, :libnidaqmx), Cint,
          (TaskHandle, Cint),
          taskHandle, action)
end

function GetNthTaskChannel(taskHandle::TaskHandle, index::UInt32,
                           buffer::Vector{UInt8}, bufferSize::Integer)

    ccall((:DAQmxGetNthTaskChannel, :libnidaqmx), Cint,
          (TaskHandle, Cuint, Ref{UInt8}, Cint),
          taskHandle, index, buffer, bufferSize)
end

function GetNthTaskDevice(taskHandle::TaskHandle, index::UInt32,
                          buffer::Vector{UInt8}, bufferSize::Integer)

    ccall((:DAQmxGetNthTaskDevice, :libnidaqmx), Cint,
          (TaskHandle, Cuint, Ref{UInt8}, Cint),
          taskHandle, index, buffer, bufferSize)
end

function GetTaskAttribute(taskHandle::TaskHandle, attribute::Integer, value::Ref{Cvoid})

    ccall((:DAQmxGetTaskAttribute, :libnidaqmx), Cint,
          (TaskHandle, Cint, Ref{Cvoid}),
          taskHandle, attribute, value)
end

function RegisterEveryNSamplesEvent(task::TaskHandle,
                                    everyNsamplesEventType::DAQmxConstant,
                                    nSamples::Integer,
                                    callbackFunction, callbackData)

    ccall((:DAQmxRegisterEveryNSamplesEvent, :libnidaqmx),
          Cint, (TaskHandle, Cint, Cuint, Cuint, Ptr{Cvoid}, Ptr{Cvoid}),
          task, everyNsamplesEventType, nSamples, UInt32(0), callbackFunction, callbackData)
end

function RegisterDoneEvent(task::TaskHandle, callbackFunction, callbackData)
    
    ccall((:DAQmxRegisterDoneEvent, :libnidaqmx),
          Cint, (TaskHandle, Cuint, Ptr{Cvoid}, Ptr{Cvoid}),
          task, UInt32(0), callbackFunction, callbackData)
end

function RegisterSignalEvent(task::TaskHandle, signalID::DAQmxConstant,
                             callbackFunction, callbackData)

    ccall((:DAQmxRegisterSignalEvent, :libnidaqmx), Cint,
          (TaskHandle, Cint, Cuint, Ptr{Cvoid}, Ptr{Cvoid}),
          task, signalID, UInt32(0), callbackFunction, callbackData)
end

#### Channel functions ####
# Channel creation

function CreateAIVoltageChan(taskHandle::TaskHandle, physicalChannel::String,
                             nameToAssignToChannel::String, terminalConfig::DAQmxConstant,
                             minVal::Real, maxVal::Real, units::DAQmxConstant,
                             customScaleName::String)

    ccall((:DAQmxCreateAIVoltageChan, :libnidaqmx), Cint,
          (TaskHandle, Cstring, Cstring, Cint, Cdouble, Cdouble, Cint, Cstring),
          taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal,
          maxVal, units, customScaleName)
end

function CreateAICurrentChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Integer, minVal::Real, maxVal::Real, units::Integer, shuntResistorLoc::Integer, extShuntResistorVal::Real, customScaleName::String)
    ccall((:DAQmxCreateAICurrentChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName)
end

function CreateAIVoltageRMSChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Integer, minVal::Real, maxVal::Real, units::Integer, customScaleName::String)
    ccall((:DAQmxCreateAIVoltageRMSChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
end

function CreateAICurrentRMSChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Integer, minVal::Real, maxVal::Real, units::Integer, shuntResistorLoc::Integer, extShuntResistorVal::Real, customScaleName::String)
    ccall((:DAQmxCreateAICurrentRMSChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName)
end

function CreateAIThrmcplChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, thermocoupleType::Integer, cjcSource::Integer, cjcVal::Real, cjcChannel::String)
    ccall((:DAQmxCreateAIThrmcplChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, thermocoupleType, cjcSource, cjcVal, cjcChannel)
end

function CreateAIRTDChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, rtdType::Integer, resistanceConfig::Integer, currentExcitSource::Integer, currentExcitVal::Real, r0::Real)
    ccall((:DAQmxCreateAIRTDChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cint, Cdouble, Cdouble), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, rtdType, resistanceConfig, currentExcitSource, currentExcitVal, r0)
end

function CreateAIThrmstrChanIex(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, resistanceConfig::Integer, currentExcitSource::Integer, currentExcitVal::Real, a::Real, b::Real, c::Real)
    ccall((:DAQmxCreateAIThrmstrChanIex, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Cdouble, Cdouble), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal, a, b, c)
end

function CreateAIThrmstrChanVex(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, resistanceConfig::Integer, voltageExcitSource::Integer, voltageExcitVal::Real, a::Real, b::Real, c::Real, r1::Real)
    ccall((:DAQmxCreateAIThrmstrChanVex, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, voltageExcitSource, voltageExcitVal, a, b, c, r1)
end

function CreateAIFreqVoltageChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, thresholdLevel::Real, hysteresis::Real, customScaleName::String)
    ccall((:DAQmxCreateAIFreqVoltageChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cdouble, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, thresholdLevel, hysteresis, customScaleName)
end

function CreateAIResistanceChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, resistanceConfig::Integer, currentExcitSource::Integer, currentExcitVal::Real, customScaleName::String)
    ccall((:DAQmxCreateAIResistanceChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal, customScaleName)
end

function CreateAIStrainGageChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, strainConfig::Integer, voltageExcitSource::Integer, voltageExcitVal::Real, gageFactor::Real, initialBridgeVoltage::Real, nominalGageResistance::Real, poissonRatio::Real, leadWireResistance::Real, customScaleName::String)
    ccall((:DAQmxCreateAIStrainGageChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, strainConfig, voltageExcitSource, voltageExcitVal, gageFactor, initialBridgeVoltage, nominalGageResistance, poissonRatio, leadWireResistance, customScaleName)
end

function CreateAIRosetteStrainGageChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, rosetteType::Integer, gageOrientation::Real, rosetteMeasTypes::Ref{Int32}, numRosetteMeasTypes::UInt32, strainConfig::Integer, voltageExcitSource::Integer, voltageExcitVal::Real, gageFactor::Real, nominalGageResistance::Real, poissonRatio::Real, leadWireResistance::Real)
    ccall((:DAQmxCreateAIRosetteStrainGageChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cdouble, Ref{Cint}, Cuint, Cint, Cint, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, rosetteType, gageOrientation, rosetteMeasTypes, numRosetteMeasTypes, strainConfig, voltageExcitSource, voltageExcitVal, gageFactor, nominalGageResistance, poissonRatio, leadWireResistance)
end

function CreateAIForceBridgeTwoPointLinChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, bridgeConfig::Integer, voltageExcitSource::Integer, voltageExcitVal::Real, nominalBridgeResistance::Real, firstElectricalVal::Real, secondElectricalVal::Real, electricalUnits::Integer, firstPhysicalVal::Real, secondPhysicalVal::Real, physicalUnits::Integer, customScaleName::String)
    ccall((:DAQmxCreateAIForceBridgeTwoPointLinChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Cdouble, Cdouble, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, firstElectricalVal, secondElectricalVal, electricalUnits, firstPhysicalVal, secondPhysicalVal, physicalUnits, customScaleName)
end

function CreateAIForceBridgeTableChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, bridgeConfig::Integer, voltageExcitSource::Integer, voltageExcitVal::Real, nominalBridgeResistance::Real, electricalVals::Ref{Cdouble}, numElectricalVals::UInt32, electricalUnits::Integer, physicalVals::Ref{Cdouble}, numPhysicalVals::UInt32, physicalUnits::Integer, customScaleName::String)
    ccall((:DAQmxCreateAIForceBridgeTableChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Ref{Cdouble}, Cuint, Cint, Ref{Cdouble}, Cuint, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, electricalVals, numElectricalVals, electricalUnits, physicalVals, numPhysicalVals, physicalUnits, customScaleName)
end

function CreateAIForceBridgePolynomialChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, bridgeConfig::Integer, voltageExcitSource::Integer, voltageExcitVal::Real, nominalBridgeResistance::Real, forwardCoeffs::Ref{Cdouble}, numForwardCoeffs::UInt32, reverseCoeffs::Ref{Cdouble}, numReverseCoeffs::UInt32, electricalUnits::Integer, physicalUnits::Integer, customScaleName::String)
    ccall((:DAQmxCreateAIForceBridgePolynomialChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Ref{Cdouble}, Cuint, Ref{Cdouble}, Cuint, Cint, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, forwardCoeffs, numForwardCoeffs, reverseCoeffs, numReverseCoeffs, electricalUnits, physicalUnits, customScaleName)
end

function CreateAIPressureBridgeTwoPointLinChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, bridgeConfig::Integer, voltageExcitSource::Integer, voltageExcitVal::Real, nominalBridgeResistance::Real, firstElectricalVal::Real, secondElectricalVal::Real, electricalUnits::Integer, firstPhysicalVal::Real, secondPhysicalVal::Real, physicalUnits::Integer, customScaleName::String)
    ccall((:DAQmxCreateAIPressureBridgeTwoPointLinChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Cdouble, Cdouble, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, firstElectricalVal, secondElectricalVal, electricalUnits, firstPhysicalVal, secondPhysicalVal, physicalUnits, customScaleName)
end

function CreateAIPressureBridgeTableChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, bridgeConfig::Integer, voltageExcitSource::Integer, voltageExcitVal::Real, nominalBridgeResistance::Real, electricalVals::Ref{Cdouble}, numElectricalVals::UInt32, electricalUnits::Integer, physicalVals::Ref{Cdouble}, numPhysicalVals::UInt32, physicalUnits::Integer, customScaleName::String)
    ccall((:DAQmxCreateAIPressureBridgeTableChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Ref{Cdouble}, Cuint, Cint, Ref{Cdouble}, Cuint, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, electricalVals, numElectricalVals, electricalUnits, physicalVals, numPhysicalVals, physicalUnits, customScaleName)
end

function CreateAIPressureBridgePolynomialChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, bridgeConfig::Integer, voltageExcitSource::Integer, voltageExcitVal::Real, nominalBridgeResistance::Real, forwardCoeffs::Ref{Cdouble}, numForwardCoeffs::UInt32, reverseCoeffs::Ref{Cdouble}, numReverseCoeffs::UInt32, electricalUnits::Integer, physicalUnits::Integer, customScaleName::String)
    ccall((:DAQmxCreateAIPressureBridgePolynomialChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Ref{Cdouble}, Cuint, Ref{Cdouble}, Cuint, Cint, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, forwardCoeffs, numForwardCoeffs, reverseCoeffs, numReverseCoeffs, electricalUnits, physicalUnits, customScaleName)
end

function CreateAITorqueBridgeTwoPointLinChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, bridgeConfig::Integer, voltageExcitSource::Integer, voltageExcitVal::Real, nominalBridgeResistance::Real, firstElectricalVal::Real, secondElectricalVal::Real, electricalUnits::Integer, firstPhysicalVal::Real, secondPhysicalVal::Real, physicalUnits::Integer, customScaleName::String)
    ccall((:DAQmxCreateAITorqueBridgeTwoPointLinChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Cdouble, Cdouble, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, firstElectricalVal, secondElectricalVal, electricalUnits, firstPhysicalVal, secondPhysicalVal, physicalUnits, customScaleName)
end

function CreateAITorqueBridgeTableChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, bridgeConfig::Integer, voltageExcitSource::Integer, voltageExcitVal::Real, nominalBridgeResistance::Real, electricalVals::Ref{Cdouble}, numElectricalVals::UInt32, electricalUnits::Integer, physicalVals::Ref{Cdouble}, numPhysicalVals::UInt32, physicalUnits::Integer, customScaleName::String)
    ccall((:DAQmxCreateAITorqueBridgeTableChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Ref{Cdouble}, Cuint, Cint, Ref{Cdouble}, Cuint, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, electricalVals, numElectricalVals, electricalUnits, physicalVals, numPhysicalVals, physicalUnits, customScaleName)
end

function CreateAITorqueBridgePolynomialChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, bridgeConfig::Integer, voltageExcitSource::Integer, voltageExcitVal::Real, nominalBridgeResistance::Real, forwardCoeffs::Ref{Cdouble}, numForwardCoeffs::UInt32, reverseCoeffs::Ref{Cdouble}, numReverseCoeffs::UInt32, electricalUnits::Integer, physicalUnits::Integer, customScaleName::String)
    ccall((:DAQmxCreateAITorqueBridgePolynomialChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Ref{Cdouble}, Cuint, Ref{Cdouble}, Cuint, Cint, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, forwardCoeffs, numForwardCoeffs, reverseCoeffs, numReverseCoeffs, electricalUnits, physicalUnits, customScaleName)
end

function CreateAIBridgeChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, bridgeConfig::Integer, voltageExcitSource::Integer, voltageExcitVal::Real, nominalBridgeResistance::Real, customScaleName::String)
    ccall((:DAQmxCreateAIBridgeChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, customScaleName)
end

function CreateAIVoltageChanWithExcit(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Integer, minVal::Real, maxVal::Real, units::Integer, bridgeConfig::Integer, voltageExcitSource::Integer, voltageExcitVal::Real, useExcitForScaling::UInt32, customScaleName::String)
    ccall((:DAQmxCreateAIVoltageChanWithExcit, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cuint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, useExcitForScaling, customScaleName)
end

function CreateAITempBuiltInSensorChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, units::Integer)
    ccall((:DAQmxCreateAITempBuiltInSensorChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint), taskHandle, physicalChannel, nameToAssignToChannel, units)
end

function CreateAIAccelChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Integer, minVal::Real, maxVal::Real, units::Integer, sensitivity::Real, sensitivityUnits::Integer, currentExcitSource::Integer, currentExcitVal::Real, customScaleName::String)
    ccall((:DAQmxCreateAIAccelChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, currentExcitSource, currentExcitVal, customScaleName)
end

function CreateAIVelocityIEPEChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Integer, minVal::Real, maxVal::Real, units::Integer, sensitivity::Real, sensitivityUnits::Integer, currentExcitSource::Integer, currentExcitVal::Real, customScaleName::String)
    ccall((:DAQmxCreateAIVelocityIEPEChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, currentExcitSource, currentExcitVal, customScaleName)
end

function CreateAIForceIEPEChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Integer, minVal::Real, maxVal::Real, units::Integer, sensitivity::Real, sensitivityUnits::Integer, currentExcitSource::Integer, currentExcitVal::Real, customScaleName::String)
    ccall((:DAQmxCreateAIForceIEPEChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, currentExcitSource, currentExcitVal, customScaleName)
end

function CreateAIMicrophoneChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Integer, units::Integer, micSensitivity::Real, maxSndPressLevel::Real, currentExcitSource::Integer, currentExcitVal::Real, customScaleName::String)
    ccall((:DAQmxCreateAIMicrophoneChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cint, Cdouble, Cdouble, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, units, micSensitivity, maxSndPressLevel, currentExcitSource, currentExcitVal, customScaleName)
end

function CreateAIChargeChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Integer, minVal::Real, maxVal::Real, units::Integer, customScaleName::String)
    ccall((:DAQmxCreateAIChargeChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
end

function CreateAIAccelChargeChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Integer, minVal::Real, maxVal::Real, units::Integer, sensitivity::Real, sensitivityUnits::Integer, customScaleName::String)
    ccall((:DAQmxCreateAIAccelChargeChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, customScaleName)
end

function CreateAIAccel4WireDCVoltageChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Integer, minVal::Real, maxVal::Real, units::Integer, sensitivity::Real, sensitivityUnits::Integer, voltageExcitSource::Integer, voltageExcitVal::Real, useExcitForScaling::UInt32, customScaleName::String)
    ccall((:DAQmxCreateAIAccel4WireDCVoltageChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cdouble, Cint, Cint, Cdouble, Cuint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, voltageExcitSource, voltageExcitVal, useExcitForScaling, customScaleName)
end

function CreateAIPosLVDTChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, sensitivity::Real, sensitivityUnits::Integer, voltageExcitSource::Integer, voltageExcitVal::Real, voltageExcitFreq::Real, ACExcitWireMode::Integer, customScaleName::String)
    ccall((:DAQmxCreateAIPosLVDTChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cdouble, Cint, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, sensitivity, sensitivityUnits, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
end

function CreateAIPosRVDTChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, sensitivity::Real, sensitivityUnits::Integer, voltageExcitSource::Integer, voltageExcitVal::Real, voltageExcitFreq::Real, ACExcitWireMode::Integer, customScaleName::String)
    ccall((:DAQmxCreateAIPosRVDTChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cdouble, Cint, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, sensitivity, sensitivityUnits, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
end

function CreateAIPosEddyCurrProxProbeChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, sensitivity::Real, sensitivityUnits::Integer, customScaleName::String)
    ccall((:DAQmxCreateAIPosEddyCurrProxProbeChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, sensitivity, sensitivityUnits, customScaleName)
end

function CreateAIDeviceTempChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, units::Integer)
    ccall((:DAQmxCreateAIDeviceTempChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint), taskHandle, physicalChannel, nameToAssignToChannel, units)
end

function CreateTEDSAIVoltageChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Integer, minVal::Real, maxVal::Real, units::Integer, customScaleName::String)
    ccall((:DAQmxCreateTEDSAIVoltageChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
end

function CreateTEDSAICurrentChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Integer, minVal::Real, maxVal::Real, units::Integer, shuntResistorLoc::Integer, extShuntResistorVal::Real, customScaleName::String)
    ccall((:DAQmxCreateTEDSAICurrentChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName)
end

function CreateTEDSAIThrmcplChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, cjcSource::Integer, cjcVal::Real, cjcChannel::String)
    ccall((:DAQmxCreateTEDSAIThrmcplChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, cjcSource, cjcVal, cjcChannel)
end

function CreateTEDSAIRTDChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, resistanceConfig::Integer, currentExcitSource::Integer, currentExcitVal::Real)
    ccall((:DAQmxCreateTEDSAIRTDChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal)
end

function CreateTEDSAIThrmstrChanIex(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, resistanceConfig::Integer, currentExcitSource::Integer, currentExcitVal::Real)
    ccall((:DAQmxCreateTEDSAIThrmstrChanIex, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal)
end

function CreateTEDSAIThrmstrChanVex(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, resistanceConfig::Integer, voltageExcitSource::Integer, voltageExcitVal::Real, r1::Real)
    ccall((:DAQmxCreateTEDSAIThrmstrChanVex, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, voltageExcitSource, voltageExcitVal, r1)
end

function CreateTEDSAIResistanceChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, resistanceConfig::Integer, currentExcitSource::Integer, currentExcitVal::Real, customScaleName::String)
    ccall((:DAQmxCreateTEDSAIResistanceChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal, customScaleName)
end

function CreateTEDSAIStrainGageChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, voltageExcitSource::Integer, voltageExcitVal::Real, initialBridgeVoltage::Real, leadWireResistance::Real, customScaleName::String)
    ccall((:DAQmxCreateTEDSAIStrainGageChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cdouble, Cdouble, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, initialBridgeVoltage, leadWireResistance, customScaleName)
end

function CreateTEDSAIForceBridgeChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, voltageExcitSource::Integer, voltageExcitVal::Real, customScaleName::String)
    ccall((:DAQmxCreateTEDSAIForceBridgeChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
end

function CreateTEDSAIPressureBridgeChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, voltageExcitSource::Integer, voltageExcitVal::Real, customScaleName::String)
    ccall((:DAQmxCreateTEDSAIPressureBridgeChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
end

function CreateTEDSAITorqueBridgeChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, voltageExcitSource::Integer, voltageExcitVal::Real, customScaleName::String)
    ccall((:DAQmxCreateTEDSAITorqueBridgeChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
end

function CreateTEDSAIBridgeChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, voltageExcitSource::Integer, voltageExcitVal::Real, customScaleName::String)
    ccall((:DAQmxCreateTEDSAIBridgeChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
end

function CreateTEDSAIVoltageChanWithExcit(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Integer, minVal::Real, maxVal::Real, units::Integer, voltageExcitSource::Integer, voltageExcitVal::Real, customScaleName::String)
    ccall((:DAQmxCreateTEDSAIVoltageChanWithExcit, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
end

function CreateTEDSAIAccelChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Integer, minVal::Real, maxVal::Real, units::Integer, currentExcitSource::Integer, currentExcitVal::Real, customScaleName::String)
    ccall((:DAQmxCreateTEDSAIAccelChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, currentExcitSource, currentExcitVal, customScaleName)
end

function CreateTEDSAIForceIEPEChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Integer, minVal::Real, maxVal::Real, units::Integer, currentExcitSource::Integer, currentExcitVal::Real, customScaleName::String)
    ccall((:DAQmxCreateTEDSAIForceIEPEChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, currentExcitSource, currentExcitVal, customScaleName)
end

function CreateTEDSAIMicrophoneChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Integer, units::Integer, maxSndPressLevel::Real, currentExcitSource::Integer, currentExcitVal::Real, customScaleName::String)
    ccall((:DAQmxCreateTEDSAIMicrophoneChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cint, Cdouble, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, units, maxSndPressLevel, currentExcitSource, currentExcitVal, customScaleName)
end

function CreateTEDSAIPosLVDTChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, voltageExcitSource::Integer, voltageExcitVal::Real, voltageExcitFreq::Real, ACExcitWireMode::Integer, customScaleName::String)
    ccall((:DAQmxCreateTEDSAIPosLVDTChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
end

function CreateTEDSAIPosRVDTChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, voltageExcitSource::Integer, voltageExcitVal::Real, voltageExcitFreq::Real, ACExcitWireMode::Integer, customScaleName::String)
    ccall((:DAQmxCreateTEDSAIPosRVDTChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
end

function CreateAOVoltageChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, customScaleName::String)
    ccall((:DAQmxCreateAOVoltageChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, customScaleName)
end

function CreateAOCurrentChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, customScaleName::String)
    ccall((:DAQmxCreateAOCurrentChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, customScaleName)
end

function CreateAOFuncGenChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, type::Integer, freq::Real, amplitude::Real, offset::Real)
    ccall((:DAQmxCreateAOFuncGenChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cdouble), taskHandle, physicalChannel, nameToAssignToChannel, type, freq, amplitude, offset)
end

function CreateDIChan(taskHandle::TaskHandle, lines::String, nameToAssignToLines::String, lineGrouping::Integer)
    ccall((:DAQmxCreateDIChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint), taskHandle, lines, nameToAssignToLines, lineGrouping)
end

function CreateDOChan(taskHandle::TaskHandle, lines::String, nameToAssignToLines::String, lineGrouping::Integer)
    ccall((:DAQmxCreateDOChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint), taskHandle, lines, nameToAssignToLines, lineGrouping)
end

function CreateCIFreqChan(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, edge::Integer, measMethod::Integer, measTime::Real, divisor::UInt32, customScaleName::String)
    ccall((:DAQmxCreateCIFreqChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cuint, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, edge, measMethod, measTime, divisor, customScaleName)
end

function CreateCIPeriodChan(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, edge::Integer, measMethod::Integer, measTime::Real, divisor::UInt32, customScaleName::String)
    ccall((:DAQmxCreateCIPeriodChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cuint, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, edge, measMethod, measTime, divisor, customScaleName)
end

function CreateCICountEdgesChan(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, edge::Integer, initialCount::UInt32, countDirection::Integer)
    ccall((:DAQmxCreateCICountEdgesChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cuint, Cint), taskHandle, counter, nameToAssignToChannel, edge, initialCount, countDirection)
end

function CreateCIDutyCycleChan(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, minFreq::Real, maxFreq::Real, edge::Integer, customScaleName::String)
    ccall((:DAQmxCreateCIDutyCycleChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, minFreq, maxFreq, edge, customScaleName)
end

function CreateCIPulseWidthChan(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, startingEdge::Integer, customScaleName::String)
    ccall((:DAQmxCreateCIPulseWidthChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, startingEdge, customScaleName)
end

function CreateCISemiPeriodChan(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, customScaleName::String)
    ccall((:DAQmxCreateCISemiPeriodChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, customScaleName)
end

function CreateCITwoEdgeSepChan(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer, firstEdge::Integer, secondEdge::Integer, customScaleName::String)
    ccall((:DAQmxCreateCITwoEdgeSepChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, firstEdge, secondEdge, customScaleName)
end

function CreateCIPulseChanFreq(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer)
    ccall((:DAQmxCreateCIPulseChanFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units)
end

function CreateCIPulseChanTime(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, units::Integer)
    ccall((:DAQmxCreateCIPulseChanTime, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units)
end

function CreateCIPulseChanTicks(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, sourceTerminal::String, minVal::Real, maxVal::Real)
    ccall((:DAQmxCreateCIPulseChanTicks, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble), taskHandle, counter, nameToAssignToChannel, sourceTerminal, minVal, maxVal)
end

function CreateCILinEncoderChan(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, decodingType::Integer, ZidxEnable::UInt32, ZidxVal::Real, ZidxPhase::Integer, units::Integer, distPerPulse::Real, initialPos::Real, customScaleName::String)
    ccall((:DAQmxCreateCILinEncoderChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cuint, Cdouble, Cint, Cint, Cdouble, Cdouble, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, decodingType, ZidxEnable, ZidxVal, ZidxPhase, units, distPerPulse, initialPos, customScaleName)
end

function CreateCIAngEncoderChan(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, decodingType::Integer, ZidxEnable::UInt32, ZidxVal::Real, ZidxPhase::Integer, units::Integer, pulsesPerRev::UInt32, initialAngle::Real, customScaleName::String)
    ccall((:DAQmxCreateCIAngEncoderChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cuint, Cdouble, Cint, Cint, Cuint, Cdouble, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, decodingType, ZidxEnable, ZidxVal, ZidxPhase, units, pulsesPerRev, initialAngle, customScaleName)
end

function CreateCILinVelocityChan(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, decodingType::Integer, units::Integer, distPerPulse::Real, customScaleName::String)
    ccall((:DAQmxCreateCILinVelocityChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, decodingType, units, distPerPulse, customScaleName)
end

function CreateCIAngVelocityChan(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, minVal::Real, maxVal::Real, decodingType::Integer, units::Integer, pulsesPerRev::UInt32, customScaleName::String)
    ccall((:DAQmxCreateCIAngVelocityChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cuint, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, decodingType, units, pulsesPerRev, customScaleName)
end

function CreateCIGPSTimestampChan(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, units::Integer, syncMethod::Integer, customScaleName::String)
    ccall((:DAQmxCreateCIGPSTimestampChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cint, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, units, syncMethod, customScaleName)
end

function CreateCOPulseChanFreq(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, units::Integer, idleState::Integer, initialDelay::Real, freq::Real, dutyCycle::Real)
    ccall((:DAQmxCreateCOPulseChanFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cint, Cdouble, Cdouble, Cdouble), taskHandle, counter, nameToAssignToChannel, units, idleState, initialDelay, freq, dutyCycle)
end

function CreateCOPulseChanTime(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, units::DAQmxConstant, idleState::DAQmxConstant, initialDelay::Real, lowTime::Real, highTime::Real)
    ccall((:DAQmxCreateCOPulseChanTime, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring, Cint, Cint, Cdouble, Cdouble, Cdouble), taskHandle, counter, nameToAssignToChannel, units, idleState, initialDelay, lowTime, highTime)
end

function CreateCOPulseChanTicks(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, sourceTerminal::String, idleState::Integer, initialDelay::Integer, lowTicks::Integer, highTicks::Integer)
    ccall((:DAQmxCreateCOPulseChanTicks, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Ref{UInt8}, Cint, Cint, Cint, Cint), taskHandle, counter, nameToAssignToChannel, sourceTerminal, idleState, initialDelay, lowTicks, highTicks)
end

# get/set channel

function GetAIChanCalCalDate(taskHandle::TaskHandle, channelName::String, year::UInt32, month::UInt32, day::UInt32, hour::UInt32, minute::UInt32)
    ccall((:DAQmxGetAIChanCalCalDate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}, Ref{Cuint}, Ref{Cuint}, Ref{Cuint}, Ref{Cuint}), taskHandle, channelName, year, month, day, hour, minute)
end

function SetAIChanCalCalDate(taskHandle::TaskHandle, channelName::String, year::UInt32, month::UInt32, day::UInt32, hour::UInt32, minute::UInt32)
    ccall((:DAQmxSetAIChanCalCalDate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint, Cuint, Cuint, Cuint, Cuint), taskHandle, channelName, year, month, day, hour, minute)
end

function GetAIChanCalExpDate(taskHandle::TaskHandle, channelName::String, year::UInt32, month::UInt32, day::UInt32, hour::UInt32, minute::UInt32)
    ccall((:DAQmxGetAIChanCalExpDate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}, Ref{Cuint}, Ref{Cuint}, Ref{Cuint}, Ref{Cuint}), taskHandle, channelName, year, month, day, hour, minute)
end

function SetAIChanCalExpDate(taskHandle::TaskHandle, channelName::String, year::UInt32, month::UInt32, day::UInt32, hour::UInt32, minute::UInt32)
    ccall((:DAQmxSetAIChanCalExpDate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint, Cuint, Cuint, Cuint, Cuint), taskHandle, channelName, year, month, day, hour, minute)
end

function GetChanAttribute(taskHandle::TaskHandle, channel::String, attribute::Integer, value::Ref{Cvoid})
    ccall((:DAQmxGetChanAttribute, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint, Ref{Cvoid}), taskHandle, channel, attribute, value)
end

function SetChanAttribute(taskHandle::TaskHandle, channel::String, attribute::Integer)
    ccall((:DAQmxSetChanAttribute, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, attribute)
end

function ResetChanAttribute(taskHandle::TaskHandle, channel::String, attribute::Integer)
    ccall((:DAQmxResetChanAttribute, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, attribute)
end

function CfgSampClkTiming(taskHandle::TaskHandle, source::String, rate::Union{Float64,Int64}, activeEdge::DAQmxConstant, sampleMode::DAQmxConstant, sampsPerChan::Int64)
    ccall((:DAQmxCfgSampClkTiming, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble, Cint, Cint, Culonglong), taskHandle, source, rate, activeEdge, sampleMode, sampsPerChan)
end

function CfgHandshakingTiming(taskHandle::TaskHandle, sampleMode::Integer, sampsPerChan::Culonglong)
    ccall((:DAQmxCfgHandshakingTiming, :libnidaqmx), Cint, (TaskHandle, Cint, Culonglong), taskHandle, sampleMode, sampsPerChan)
end

function CfgBurstHandshakingTimingImportClock(taskHandle::TaskHandle, sampleMode::Integer, sampsPerChan::Culonglong, sampleClkRate::Real, sampleClkSrc::String, sampleClkActiveEdge::Integer, pauseWhen::Integer, readyEventActiveLevel::Integer)
    ccall((:DAQmxCfgBurstHandshakingTimingImportClock, :libnidaqmx), Cint, (TaskHandle, Cint, Culonglong, Cdouble, Ref{UInt8}, Cint, Cint, Cint), taskHandle, sampleMode, sampsPerChan, sampleClkRate, sampleClkSrc, sampleClkActiveEdge, pauseWhen, readyEventActiveLevel)
end

function CfgBurstHandshakingTimingExportClock(taskHandle::TaskHandle, sampleMode::Integer, sampsPerChan::Culonglong, sampleClkRate::Real, sampleClkOutpTerm::String, sampleClkPulsePolarity::Integer, pauseWhen::Integer, readyEventActiveLevel::Integer)
    ccall((:DAQmxCfgBurstHandshakingTimingExportClock, :libnidaqmx), Cint, (TaskHandle, Cint, Culonglong, Cdouble, Ref{UInt8}, Cint, Cint, Cint), taskHandle, sampleMode, sampsPerChan, sampleClkRate, sampleClkOutpTerm, sampleClkPulsePolarity, pauseWhen, readyEventActiveLevel)
end

function CfgChangeDetectionTiming(taskHandle::TaskHandle, risingEdgeChan::String, fallingEdgeChan::String, sampleMode::Integer, sampsPerChan::Culonglong)
    ccall((:DAQmxCfgChangeDetectionTiming, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Culonglong), taskHandle, risingEdgeChan, fallingEdgeChan, sampleMode, sampsPerChan)
end

function CfgImplicitTiming(taskHandle::TaskHandle, sampleMode::DAQmxConstant, sampsPerChan::Integer)
    ccall((:DAQmxCfgImplicitTiming, :libnidaqmx), Cint, (TaskHandle, Cint, Culonglong), taskHandle, sampleMode, sampsPerChan)
end

function CfgPipelinedSampClkTiming(taskHandle::TaskHandle, source::String, rate::Real, activeEdge::Integer, sampleMode::Integer, sampsPerChan::Culonglong)
    ccall((:DAQmxCfgPipelinedSampClkTiming, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble, Cint, Cint, Culonglong), taskHandle, source, rate, activeEdge, sampleMode, sampsPerChan)
end

function GetTimingAttribute(taskHandle::TaskHandle, attribute::Integer, value::Ref{Cvoid})
    ccall((:DAQmxGetTimingAttribute, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{Cvoid}), taskHandle, attribute, value)
end

function SetTimingAttribute(taskHandle::TaskHandle, attribute::Integer)
    ccall((:DAQmxSetTimingAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ResetTimingAttribute(taskHandle::TaskHandle, attribute::Integer)
    ccall((:DAQmxResetTimingAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function GetTimingAttributeEx(taskHandle::TaskHandle, deviceNames::String, attribute::Integer, value::Ref{Cvoid})
    ccall((:DAQmxGetTimingAttributeEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint, Ref{Cvoid}), taskHandle, deviceNames, attribute, value)
end

function SetTimingAttributeEx(taskHandle::TaskHandle, deviceNames::String, attribute::Integer)
    ccall((:DAQmxSetTimingAttributeEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, deviceNames, attribute)
end

function ResetTimingAttributeEx(taskHandle::TaskHandle, deviceNames::String, attribute::Integer)
    ccall((:DAQmxResetTimingAttributeEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, deviceNames, attribute)
end

function DisableStartTrig(taskHandle::TaskHandle)
    ccall((:DAQmxDisableStartTrig, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function CfgDigEdgeStartTrig(taskHandle::TaskHandle, triggerSource::String, triggerEdge::Integer)
    ccall((:DAQmxCfgDigEdgeStartTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, triggerSource, triggerEdge)
end

function CfgAnlgEdgeStartTrig(taskHandle::TaskHandle, triggerSource::String, triggerSlope::Integer, triggerLevel::Real)
    ccall((:DAQmxCfgAnlgEdgeStartTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint, Cdouble), taskHandle, triggerSource, triggerSlope, triggerLevel)
end

function CfgAnlgMultiEdgeStartTrig(taskHandle::TaskHandle, triggerSources::String, triggerSlopeArray::Ref{Int32}, triggerLevelArray::Ref{Cdouble}, arraySize::UInt32)
    ccall((:DAQmxCfgAnlgMultiEdgeStartTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}, Ref{Cdouble}, Cuint), taskHandle, triggerSources, triggerSlopeArray, triggerLevelArray, arraySize)
end

function CfgAnlgWindowStartTrig(taskHandle::TaskHandle, triggerSource::String, triggerWhen::Integer, windowTop::Real, windowBottom::Real)
    ccall((:DAQmxCfgAnlgWindowStartTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint, Cdouble, Cdouble), taskHandle, triggerSource, triggerWhen, windowTop, windowBottom)
end

function CfgTimeStartTrig(taskHandle::TaskHandle, when::CVIAbsoluteTime, timescale::Integer)
    ccall((:DAQmxCfgTimeStartTrig, :libnidaqmx), Cint, (TaskHandle, CVIAbsoluteTime, Cint), taskHandle, when, timescale)
end

function CfgDigPatternStartTrig(taskHandle::TaskHandle, triggerSource::String, triggerPattern::String, triggerWhen::Integer)
    ccall((:DAQmxCfgDigPatternStartTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint), taskHandle, triggerSource, triggerPattern, triggerWhen)
end

function DisableRefTrig(taskHandle::TaskHandle)
    ccall((:DAQmxDisableRefTrig, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function CfgDigEdgeRefTrig(taskHandle::TaskHandle, triggerSource::String, triggerEdge::Integer, pretriggerSamples::UInt32)
    ccall((:DAQmxCfgDigEdgeRefTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint, Cuint), taskHandle, triggerSource, triggerEdge, pretriggerSamples)
end

function CfgAnlgEdgeRefTrig(taskHandle::TaskHandle, triggerSource::String, triggerSlope::Integer, triggerLevel::Real, pretriggerSamples::UInt32)
    ccall((:DAQmxCfgAnlgEdgeRefTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint, Cdouble, Cuint), taskHandle, triggerSource, triggerSlope, triggerLevel, pretriggerSamples)
end

function CfgAnlgMultiEdgeRefTrig(taskHandle::TaskHandle, triggerSources::String, triggerSlopeArray::Ref{Int32}, triggerLevelArray::Ref{Cdouble}, pretriggerSamples::UInt32, arraySize::UInt32)
    ccall((:DAQmxCfgAnlgMultiEdgeRefTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}, Ref{Cdouble}, Cuint, Cuint), taskHandle, triggerSources, triggerSlopeArray, triggerLevelArray, pretriggerSamples, arraySize)
end

function CfgAnlgWindowRefTrig(taskHandle::TaskHandle, triggerSource::String, triggerWhen::Integer, windowTop::Real, windowBottom::Real, pretriggerSamples::UInt32)
    ccall((:DAQmxCfgAnlgWindowRefTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint, Cdouble, Cdouble, Cuint), taskHandle, triggerSource, triggerWhen, windowTop, windowBottom, pretriggerSamples)
end

function CfgDigPatternRefTrig(taskHandle::TaskHandle, triggerSource::String, triggerPattern::String, triggerWhen::Integer, pretriggerSamples::UInt32)
    ccall((:DAQmxCfgDigPatternRefTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cuint), taskHandle, triggerSource, triggerPattern, triggerWhen, pretriggerSamples)
end

function GetTrigAttribute(taskHandle::TaskHandle, attribute::Integer, value::Ref{Cvoid})
    ccall((:DAQmxGetTrigAttribute, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{Cvoid}), taskHandle, attribute, value)
end

function SetTrigAttribute(taskHandle::TaskHandle, attribute::Integer)
    ccall((:DAQmxSetTrigAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ResetTrigAttribute(taskHandle::TaskHandle, attribute::Integer)
    ccall((:DAQmxResetTrigAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ReadAnalogF64(taskHandle::TaskHandle, numSampsPerChan::Integer, timeout::Real, fillMode::DAQmxConstant, readArray::AbstractArray{Float64}, arraySizeInSamps::Integer, sampsPerChanRead::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxReadAnalogF64, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cdouble}, Cuint, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadAnalogScalarF64(taskHandle::TaskHandle, timeout::Real, value::Real, reserved=C_NULL)
    ccall((:DAQmxReadAnalogScalarF64, :libnidaqmx), Cint, (TaskHandle, Cdouble, Ref{Cdouble}, Ref{Cvoid}), taskHandle, timeout, value, reserved)
end

function ReadBinaryI16(taskHandle::TaskHandle, numSampsPerChan::Integer, timeout::Real, fillMode::DAQmxConstant, readArray::Vector{Int16}, arraySizeInSamps::Integer, sampsPerChanRead::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxReadBinaryI16, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cshort}, Cuint, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadBinaryU16(taskHandle::TaskHandle, numSampsPerChan::Integer, timeout::Real, fillMode::DAQmxConstant, readArray::Vector{UInt16}, arraySizeInSamps::Integer, sampsPerChanRead::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxReadBinaryU16, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cushort}, Cuint, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadBinaryI32(taskHandle::TaskHandle, numSampsPerChan::Integer, timeout::Real, fillMode::DAQmxConstant, readArray::Vector{Int32}, arraySizeInSamps::Integer, sampsPerChanRead::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxReadBinaryI32, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cint}, Cuint, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadBinaryU32(taskHandle::TaskHandle, numSampsPerChan::Integer, timeout::Real, fillMode::DAQmxConstant, readArray::Vector{UInt32}, arraySizeInSamps::Integer, sampsPerChanRead::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxReadBinaryU32, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cuint}, Cuint, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadDigitalU8(taskHandle::TaskHandle, numSampsPerChan::Integer, timeout::Real, fillMode::DAQmxConstant, readArray::Vector{Cuchar}, arraySizeInSamps::UInt32, sampsPerChanRead::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxReadDigitalU8, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cuchar}, Cuint, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadDigitalU16(taskHandle::TaskHandle, numSampsPerChan::Integer, timeout::Real, fillMode::DAQmxConstant, readArray::Vector{Cushort}, arraySizeInSamps::UInt32, sampsPerChanRead::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxReadDigitalU16, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cushort}, Cuint, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadDigitalU32(taskHandle::TaskHandle, numSampsPerChan::Integer, timeout::Real, fillMode::DAQmxConstant, readArray::Vector{UInt32}, arraySizeInSamps::UInt32, sampsPerChanRead::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxReadDigitalU32, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cuint}, Cuint, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadDigitalScalarU32(taskHandle::TaskHandle, timeout::Real, value::Ref{UInt32}, reserved=C_NULL)
    ccall((:DAQmxReadDigitalScalarU32, :libnidaqmx), Cint, (TaskHandle, Cdouble, Ref{Cuint}, Ref{Cvoid}), taskHandle, timeout, value, reserved)
end

function ReadDigitalLines(taskHandle::TaskHandle, numSampsPerChan::Integer, timeout::Real, fillMode::DAQmxConstant, readArray::Vector{Cuchar}, arraySizeInBytes::UInt32, sampsPerChanRead::Ref{Int32}, numBytesPerSamp::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxReadDigitalLines, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cuchar}, Cuint, Ref{Cint}, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInBytes, sampsPerChanRead, numBytesPerSamp, reserved)
end

function ReadCounterF64(taskHandle::TaskHandle, numSampsPerChan::Integer, timeout::Real, readArray::Vector{Cdouble}, arraySizeInSamps::UInt32, sampsPerChanRead::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxReadCounterF64, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Ref{Cdouble}, Cuint, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, timeout, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadCounterU32(taskHandle::TaskHandle, numSampsPerChan::Integer, timeout::Real, readArray::Vector{UInt32}, arraySizeInSamps::UInt32, sampsPerChanRead::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxReadCounterU32, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Ref{Cuint}, Cuint, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, timeout, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadCounterF64Ex(taskHandle::TaskHandle, numSampsPerChan::Integer, timeout::Real, fillMode::DAQmxConstant, readArray::Vector{Cdouble}, arraySizeInSamps::UInt32, sampsPerChanRead::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxReadCounterF64Ex, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cdouble}, Cuint, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadCounterU32Ex(taskHandle::TaskHandle, numSampsPerChan::Integer, timeout::Real, fillMode::DAQmxConstant, readArray::Vector{UInt32}, arraySizeInSamps::UInt32, sampsPerChanRead::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxReadCounterU32Ex, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cuint}, Cuint, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadCounterScalarF64(taskHandle::TaskHandle, timeout::Real, value::Ref{Cdouble}, reserved=C_NULL)
    ccall((:DAQmxReadCounterScalarF64, :libnidaqmx), Cint, (TaskHandle, Cdouble, Ref{Cdouble}, Ref{Cvoid}), taskHandle, timeout, value, reserved)
end

function ReadCounterScalarU32(taskHandle::TaskHandle, timeout::Real, value::Ref{UInt32}, reserved=C_NULL)
    ccall((:DAQmxReadCounterScalarU32, :libnidaqmx), Cint, (TaskHandle, Cdouble, Ref{Cuint}, Ref{Cvoid}), taskHandle, timeout, value, reserved)
end

function ReadCtrFreq(taskHandle::TaskHandle, numSampsPerChan::Integer, timeout::Real, interleaved::UInt32, readArrayFrequency::Ref{Cdouble}, readArrayDutyCycle::Ref{Cdouble}, arraySizeInSamps::UInt32, sampsPerChanRead::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxReadCtrFreq, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cdouble}, Ref{Cdouble}, Cuint, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, timeout, interleaved, readArrayFrequency, readArrayDutyCycle, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadCtrTime(taskHandle::TaskHandle, numSampsPerChan::Integer, timeout::Real, interleaved::UInt32, readArrayHighTime::Ref{Cdouble}, readArrayLowTime::Ref{Cdouble}, arraySizeInSamps::UInt32, sampsPerChanRead::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxReadCtrTime, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cdouble}, Ref{Cdouble}, Cuint, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, timeout, interleaved, readArrayHighTime, readArrayLowTime, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadCtrTicks(taskHandle::TaskHandle, numSampsPerChan::Integer, timeout::Real, interleaved::UInt32, readArrayHighTicks::Ref{UInt32}, readArrayLowTicks::Ref{UInt32}, arraySizeInSamps::UInt32, sampsPerChanRead::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxReadCtrTicks, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cuint}, Ref{Cuint}, Cuint, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, timeout, interleaved, readArrayHighTicks, readArrayLowTicks, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadCtrFreqScalar(taskHandle::TaskHandle, timeout::Real, frequency::Ref{Cdouble}, dutyCycle::Ref{Cdouble}, reserved=C_NULL)
    ccall((:DAQmxReadCtrFreqScalar, :libnidaqmx), Cint, (TaskHandle, Cdouble, Ref{Cdouble}, Ref{Cdouble}, Ref{Cvoid}), taskHandle, timeout, frequency, dutyCycle, reserved)
end

function ReadCtrTimeScalar(taskHandle::TaskHandle, timeout::Real, highTime::Ref{Cdouble}, lowTime::Ref{Cdouble}, reserved=C_NULL)
    ccall((:DAQmxReadCtrTimeScalar, :libnidaqmx), Cint, (TaskHandle, Cdouble, Ref{Cdouble}, Ref{Cdouble}, Ref{Cvoid}), taskHandle, timeout, highTime, lowTime, reserved)
end

function ReadCtrTicksScalar(taskHandle::TaskHandle, timeout::Real, highTicks::Ref{UInt32}, lowTicks::Ref{UInt32}, reserved=C_NULL)
    ccall((:DAQmxReadCtrTicksScalar, :libnidaqmx), Cint, (TaskHandle, Cdouble, Ref{Cuint}, Ref{Cuint}, Ref{Cvoid}), taskHandle, timeout, highTicks, lowTicks, reserved)
end

function ReadRaw(taskHandle::TaskHandle, numSampsPerChan::Integer, timeout::Real, readArray::Vector{Cvoid}, arraySizeInBytes::UInt32, sampsRead::Ref{Int32}, numBytesPerSamp::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxReadRaw, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Ref{Cvoid}, Cuint, Ref{Cint}, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, timeout, readArray, arraySizeInBytes, sampsRead, numBytesPerSamp, reserved)
end

function GetNthTaskReadChannel(taskHandle::TaskHandle, index::UInt32, buffer::Vector{UInt8}, bufferSize::Integer)
    ccall((:DAQmxGetNthTaskReadChannel, :libnidaqmx), Cint, (TaskHandle, Cuint, Ref{UInt8}, Cint), taskHandle, index, buffer, bufferSize)
end

function GetReadAttribute(taskHandle::TaskHandle, attribute::Integer, value::Ref{Cvoid})
    ccall((:DAQmxGetReadAttribute, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{Cvoid}), taskHandle, attribute, value)
end

function SetReadAttribute(taskHandle::TaskHandle, attribute::Integer)
    ccall((:DAQmxSetReadAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ResetReadAttribute(taskHandle::TaskHandle, attribute::Integer)
    ccall((:DAQmxResetReadAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ConfigureLogging(taskHandle::TaskHandle, filePath::String, loggingMode::Integer, groupName::String, operation::Integer)
    ccall((:DAQmxConfigureLogging, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint, Ref{UInt8}, Cint), taskHandle, filePath, loggingMode, groupName, operation)
end

function StartNewFile(taskHandle::TaskHandle, filePath::String)
    ccall((:DAQmxStartNewFile, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, filePath)
end

function WriteAnalogF64(taskHandle::TaskHandle, numSampsPerChan::Integer, autoStart::Bool, timeout::Real, dataLayout::DAQmxConstant, writeArray::Vector{Float64}, sampsPerChanWritten::Ref{Int32}, reserved=C_NULL=Ref{UInt32}())
    ccall((:DAQmxWriteAnalogF64, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cdouble}, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function WriteAnalogScalarF64(taskHandle::TaskHandle, autoStart::Bool, timeout::Real, value::Real, reserved=C_NULL)
    ccall((:DAQmxWriteAnalogScalarF64, :libnidaqmx), Cint, (TaskHandle, Cuint, Cdouble, Cdouble, Ref{Cvoid}), taskHandle, autoStart, timeout, value, reserved)
end

function WriteBinaryI16(taskHandle::TaskHandle, numSampsPerChan::Integer, autoStart::Bool, timeout::Real, dataLayout::DAQmxConstant, writeArray::Vector{Int16}, sampsPerChanWritten::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxWriteBinaryI16, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cshort}, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function WriteBinaryU16(taskHandle::TaskHandle, numSampsPerChan::Integer, autoStart::Bool, timeout::Real, dataLayout::DAQmxConstant, writeArray::Vector{UInt16}, sampsPerChanWritten::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxWriteBinaryU16, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cushort}, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function WriteBinaryI32(taskHandle::TaskHandle, numSampsPerChan::Integer, autoStart::Bool, timeout::Real, dataLayout::DAQmxConstant, writeArray::Vector{Int32}, sampsPerChanWritten::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxWriteBinaryI32, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cint}, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function WriteBinaryU32(taskHandle::TaskHandle, numSampsPerChan::Integer, autoStart::Bool, timeout::Real, dataLayout::DAQmxConstant, writeArray::Vector{UInt32}, sampsPerChanWritten::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxWriteBinaryU32, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cuint}, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function WriteDigitalU8(taskHandle::TaskHandle, numSampsPerChan::Integer, autoStart::UInt32, timeout::Real, dataLayout::UInt32, writeArray::Vector{Cuchar}, sampsPerChanWritten::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxWriteDigitalU8, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cuchar}, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function WriteDigitalU16(taskHandle::TaskHandle, numSampsPerChan::Integer, autoStart::UInt32, timeout::Real, dataLayout::UInt32, writeArray::Vector{Cushort}, sampsPerChanWritten::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxWriteDigitalU16, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cushort}, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function WriteDigitalU32(taskHandle::TaskHandle, numSampsPerChan::Integer, autoStart::UInt32, timeout::Real, dataLayout::UInt32, writeArray::Vector{UInt32}, sampsPerChanWritten::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxWriteDigitalU32, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cuint}, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function WriteDigitalScalarU32(taskHandle::TaskHandle, autoStart::UInt32, timeout::Real, value::UInt32, reserved=C_NULL)
    ccall((:DAQmxWriteDigitalScalarU32, :libnidaqmx), Cint, (TaskHandle, Cuint, Cdouble, Cuint, Ref{Cvoid}), taskHandle, autoStart, timeout, value, reserved)
end

function WriteDigitalLines(taskHandle::TaskHandle, numSampsPerChan::Integer, autoStart::UInt32, timeout::Real, dataLayout::UInt32, writeArray::Vector{Cuchar}, sampsPerChanWritten::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxWriteDigitalLines, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cuchar}, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function WriteCtrFreq(taskHandle::TaskHandle, numSampsPerChan::Integer, autoStart::UInt32, timeout::Real, dataLayout::UInt32, frequency::Ref{Cdouble}, dutyCycle::Ref{Cdouble}, numSampsPerChanWritten::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxWriteCtrFreq, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cdouble}, Ref{Cdouble}, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, frequency, dutyCycle, numSampsPerChanWritten, reserved)
end

function WriteCtrFreqScalar(taskHandle::TaskHandle, autoStart::UInt32, timeout::Real, frequency::Real, dutyCycle::Real, reserved=C_NULL)
    ccall((:DAQmxWriteCtrFreqScalar, :libnidaqmx), Cint, (TaskHandle, Cuint, Cdouble, Cdouble, Cdouble, Ref{Cvoid}), taskHandle, autoStart, timeout, frequency, dutyCycle, reserved)
end

function WriteCtrTime(taskHandle::TaskHandle, numSampsPerChan::Integer, autoStart::UInt32, timeout::Real, dataLayout::UInt32, highTime::Ref{Cdouble}, lowTime::Ref{Cdouble}, numSampsPerChanWritten::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxWriteCtrTime, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cdouble}, Ref{Cdouble}, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, highTime, lowTime, numSampsPerChanWritten, reserved)
end

function WriteCtrTimeScalar(taskHandle::TaskHandle, autoStart::UInt32, timeout::Real, highTime::Real, lowTime::Real, reserved=C_NULL)
    ccall((:DAQmxWriteCtrTimeScalar, :libnidaqmx), Cint, (TaskHandle, Cuint, Cdouble, Cdouble, Cdouble, Ref{Cvoid}), taskHandle, autoStart, timeout, highTime, lowTime, reserved)
end

function WriteCtrTicks(taskHandle::TaskHandle, numSampsPerChan::Integer, autoStart::UInt32, timeout::Real, dataLayout::UInt32, highTicks::Ref{UInt32}, lowTicks::Ref{UInt32}, numSampsPerChanWritten::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxWriteCtrTicks, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cuint}, Ref{Cuint}, Ref{Cint}, Ref{Cvoid}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, highTicks, lowTicks, numSampsPerChanWritten, reserved)
end

function WriteCtrTicksScalar(taskHandle::TaskHandle, autoStart::UInt32, timeout::Real, highTicks::UInt32, lowTicks::UInt32, reserved=C_NULL)
    ccall((:DAQmxWriteCtrTicksScalar, :libnidaqmx), Cint, (TaskHandle, Cuint, Cdouble, Cuint, Cuint, Ref{Cvoid}), taskHandle, autoStart, timeout, highTicks, lowTicks, reserved)
end

function WriteRaw(taskHandle::TaskHandle, numSamps::Integer, autoStart::UInt32, timeout::Real, writeArray::Vector{Cvoid}, sampsPerChanWritten::Ref{Int32}, reserved=C_NULL)
    ccall((:DAQmxWriteRaw, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Ref{Cvoid}, Ref{Cint}, Ref{Cvoid}), taskHandle, numSamps, autoStart, timeout, writeArray, sampsPerChanWritten, reserved)
end

function GetWriteAttribute(taskHandle::TaskHandle, attribute::Integer, value::Ref{Cvoid})
    ccall((:DAQmxGetWriteAttribute, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{Cvoid}), taskHandle, attribute, value)
end

function SetWriteAttribute(taskHandle::TaskHandle, attribute::Integer)
    ccall((:DAQmxSetWriteAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ResetWriteAttribute(taskHandle::TaskHandle, attribute::Integer)
    ccall((:DAQmxResetWriteAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ExportSignal(taskHandle::TaskHandle, signalID::Integer, outputTerminal::String)
    ccall((:DAQmxExportSignal, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{UInt8}), taskHandle, signalID, outputTerminal)
end

function GetExportedSignalAttribute(taskHandle::TaskHandle, attribute::Integer, value::Ref{Cvoid})
    ccall((:DAQmxGetExportedSignalAttribute, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{Cvoid}), taskHandle, attribute, value)
end

function SetExportedSignalAttribute(taskHandle::TaskHandle, attribute::Integer)
    ccall((:DAQmxSetExportedSignalAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ResetExportedSignalAttribute(taskHandle::TaskHandle, attribute::Integer)
    ccall((:DAQmxResetExportedSignalAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function CreateLinScale(name::String, slope::Real, yIntercept::Real, preScaledUnits::Integer, scaledUnits::String)
    ccall((:DAQmxCreateLinScale, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble, Cdouble, Cint, Ref{UInt8}), name, slope, yIntercept, preScaledUnits, scaledUnits)
end

function CreateMapScale(name::String, prescaledMin::Real, prescaledMax::Real, scaledMin::Real, scaledMax::Real, preScaledUnits::Integer, scaledUnits::String)
    ccall((:DAQmxCreateMapScale, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble, Cdouble, Cdouble, Cdouble, Cint, Ref{UInt8}), name, prescaledMin, prescaledMax, scaledMin, scaledMax, preScaledUnits, scaledUnits)
end

function CreatePolynomialScale(name::String, forwardCoeffs::Ref{Cdouble}, numForwardCoeffsIn::UInt32, reverseCoeffs::Ref{Cdouble}, numReverseCoeffsIn::UInt32, preScaledUnits::Integer, scaledUnits::String)
    ccall((:DAQmxCreatePolynomialScale, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint, Ref{Cdouble}, Cuint, Cint, Ref{UInt8}), name, forwardCoeffs, numForwardCoeffsIn, reverseCoeffs, numReverseCoeffsIn, preScaledUnits, scaledUnits)
end

function CreateTableScale(name::String, prescaledVals::Ref{Cdouble}, numPrescaledValsIn::UInt32, scaledVals::Ref{Cdouble}, numScaledValsIn::UInt32, preScaledUnits::Integer, scaledUnits::String)
    ccall((:DAQmxCreateTableScale, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint, Ref{Cdouble}, Cuint, Cint, Ref{UInt8}), name, prescaledVals, numPrescaledValsIn, scaledVals, numScaledValsIn, preScaledUnits, scaledUnits)
end

function CalculateReversePolyCoeff(forwardCoeffs::Ref{Cdouble}, numForwardCoeffsIn::UInt32, minValX::Real, maxValX::Real, numPointsToCompute::Integer, reversePolyOrder::Integer, reverseCoeffs::Ref{Cdouble})
    ccall((:DAQmxCalculateReversePolyCoeff, :libnidaqmx), Cint, (Ref{Cdouble}, Cuint, Cdouble, Cdouble, Cint, Cint, Ref{Cdouble}), forwardCoeffs, numForwardCoeffsIn, minValX, maxValX, numPointsToCompute, reversePolyOrder, reverseCoeffs)
end

function GetScaleAttribute(scaleName::String, attribute::Integer, value::Ref{Cvoid})
    ccall((:DAQmxGetScaleAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint, Ref{Cvoid}), scaleName, attribute, value)
end

function SetScaleAttribute(scaleName::String, attribute::Integer)
    ccall((:DAQmxSetScaleAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint), scaleName, attribute)
end

function CfgInputBuffer(taskHandle::TaskHandle, numSampsPerChan::UInt32)
    ccall((:DAQmxCfgInputBuffer, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, numSampsPerChan)
end

function CfgOutputBuffer(taskHandle::TaskHandle, numSampsPerChan::UInt32)
    ccall((:DAQmxCfgOutputBuffer, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, numSampsPerChan)
end

function GetBufferAttribute(taskHandle::TaskHandle, attribute::Integer, value::Ref{Cvoid})
    ccall((:DAQmxGetBufferAttribute, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{Cvoid}), taskHandle, attribute, value)
end

function SetBufferAttribute(taskHandle::TaskHandle, attribute::Integer)
    ccall((:DAQmxSetBufferAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ResetBufferAttribute(taskHandle::TaskHandle, attribute::Integer)
    ccall((:DAQmxResetBufferAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end
# Switch functions are depracated
#=
function SwitchCreateScanList(scanList::String, taskHandle::Ref{TaskHandle})
    ccall((:DAQmxSwitchCreateScanList, :libnidaqmx), Cint, (Ref{UInt8}, Ref{TaskHandle}), scanList, taskHandle)
end

function SwitchConnect(switchChannel1::String, switchChannel2::String, waitForSettling::UInt32)
    ccall((:DAQmxSwitchConnect, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Cuint), switchChannel1, switchChannel2, waitForSettling)
end

function SwitchConnectMulti(connectionList::String, waitForSettling::UInt32)
    ccall((:DAQmxSwitchConnectMulti, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), connectionList, waitForSettling)
end

function SwitchDisconnect(switchChannel1::String, switchChannel2::String, waitForSettling::UInt32)
    ccall((:DAQmxSwitchDisconnect, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Cuint), switchChannel1, switchChannel2, waitForSettling)
end

function SwitchDisconnectMulti(connectionList::String, waitForSettling::UInt32)
    ccall((:DAQmxSwitchDisconnectMulti, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), connectionList, waitForSettling)
end

function SwitchDisconnectAll(deviceName::String, waitForSettling::UInt32)
    ccall((:DAQmxSwitchDisconnectAll, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), deviceName, waitForSettling)
end

function SwitchSetTopologyAndReset(deviceName::String, newTopology::String)
    ccall((:DAQmxSwitchSetTopologyAndReset, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}), deviceName, newTopology)
end

function SwitchFindPath(switchChannel1::String, switchChannel2::String, path::String, pathBufferSize::UInt32, pathStatus::Ref{Int32})
    ccall((:DAQmxSwitchFindPath, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Ref{UInt8}, Cuint, Ref{Cint}), switchChannel1, switchChannel2, path, pathBufferSize, pathStatus)
end

function SwitchOpenRelays(relayList::String, waitForSettling::UInt32)
    ccall((:DAQmxSwitchOpenRelays, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), relayList, waitForSettling)
end

function SwitchCloseRelays(relayList::String, waitForSettling::UInt32)
    ccall((:DAQmxSwitchCloseRelays, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), relayList, waitForSettling)
end

function SwitchGetSingleRelayCount(relayName::String, count::Ref{UInt32})
    ccall((:DAQmxSwitchGetSingleRelayCount, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), relayName, count)
end

function SwitchGetMultiRelayCount(relayList::String, count::Ref{UInt32}, countArraySize::UInt32, numRelayCountsRead::Ref{UInt32})
    ccall((:DAQmxSwitchGetMultiRelayCount, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}, Cuint, Ref{Cuint}), relayList, count, countArraySize, numRelayCountsRead)
end

function SwitchGetSingleRelayPos(relayName::String, relayPos::Ref{UInt32})
    ccall((:DAQmxSwitchGetSingleRelayPos, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), relayName, relayPos)
end

function SwitchGetMultiRelayPos(relayList::String, relayPos::Ref{UInt32}, relayPosArraySize::UInt32, numRelayPossRead::Ref{UInt32})
    ccall((:DAQmxSwitchGetMultiRelayPos, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}, Cuint, Ref{Cuint}), relayList, relayPos, relayPosArraySize, numRelayPossRead)
end

function SwitchWaitForSettling(deviceName::String)
    ccall((:DAQmxSwitchWaitForSettling, :libnidaqmx), Cint, (Ref{UInt8},), deviceName)
end

function GetSwitchChanAttribute(switchChannelName::String, attribute::Integer, value::Ref{Cvoid})
    ccall((:DAQmxGetSwitchChanAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint, Ref{Cvoid}), switchChannelName, attribute, value)
end

function SetSwitchChanAttribute(switchChannelName::String, attribute::Integer)
    ccall((:DAQmxSetSwitchChanAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint), switchChannelName, attribute)
end

function GetSwitchDeviceAttribute(deviceName::String, attribute::Integer, value::Ref{Cvoid})
    ccall((:DAQmxGetSwitchDeviceAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint, Ref{Cvoid}), deviceName, attribute, value)
end

function SetSwitchDeviceAttribute(deviceName::String, attribute::Integer)
    ccall((:DAQmxSetSwitchDeviceAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint), deviceName, attribute)
end

function GetSwitchScanAttribute(taskHandle::TaskHandle, attribute::Integer, value::Ref{Cvoid})
    ccall((:DAQmxGetSwitchScanAttribute, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{Cvoid}), taskHandle, attribute, value)
end

function SetSwitchScanAttribute(taskHandle::TaskHandle, attribute::Integer)
    ccall((:DAQmxSetSwitchScanAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ResetSwitchScanAttribute(taskHandle::TaskHandle, attribute::Integer)
    ccall((:DAQmxResetSwitchScanAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end
=#
function DisableAdvTrig(taskHandle::TaskHandle)
    ccall((:DAQmxDisableAdvTrig, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function CfgDigEdgeAdvTrig(taskHandle::TaskHandle, triggerSource::String, triggerEdge::Integer)
    ccall((:DAQmxCfgDigEdgeAdvTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, triggerSource, triggerEdge)
end

function SendSoftwareTrigger(taskHandle::TaskHandle, triggerID::Integer)
    ccall((:DAQmxSendSoftwareTrigger, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, triggerID)
end

function ConnectTerms(sourceTerminal::String, destinationTerminal::String, signalModifiers::Integer)
    ccall((:DAQmxConnectTerms, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Cint), sourceTerminal, destinationTerminal, signalModifiers)
end

function DisconnectTerms(sourceTerminal::String, destinationTerminal::String)
    ccall((:DAQmxDisconnectTerms, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}), sourceTerminal, destinationTerminal)
end

function TristateOutputTerm(outputTerminal::String)
    ccall((:DAQmxTristateOutputTerm, :libnidaqmx), Cint, (Ref{UInt8},), outputTerminal)
end

function ResetDevice(deviceName::String)
    ccall((:DAQmxResetDevice, :libnidaqmx), Cint, (Ref{UInt8},), deviceName)
end

function SelfTestDevice(deviceName::String)
    ccall((:DAQmxSelfTestDevice, :libnidaqmx), Cint, (Ref{UInt8},), deviceName)
end

function GetDeviceAttribute(deviceName::String, attribute::Integer, value::Ref{Cvoid})
    ccall((:DAQmxGetDeviceAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint, Ref{Cvoid}), deviceName, attribute, value)
end

function CreateWatchdogTimerTask(deviceName::String, taskName::String, taskHandle::Ref{TaskHandle}, timeout::Real, lines::String, expState::Integer)
    ccall((:DAQmxCreateWatchdogTimerTask, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Ref{TaskHandle}, Cdouble, Ref{UInt8}, Cint), deviceName, taskName, taskHandle, timeout, lines, expState)
end

function CreateWatchdogTimerTaskEx(deviceName::String, taskName::String, taskHandle::Ref{TaskHandle}, timeout::Real)
    ccall((:DAQmxCreateWatchdogTimerTaskEx, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Ref{TaskHandle}, Cdouble), deviceName, taskName, taskHandle, timeout)
end

function ControlWatchdogTask(taskHandle::TaskHandle, action::Integer)
    ccall((:DAQmxControlWatchdogTask, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, action)
end

function CfgWatchdogAOExpirStates(taskHandle::TaskHandle, channelNames::String, expirStateArray::Ref{Cdouble}, outputTypeArray::Ref{Int32}, arraySize::UInt32)
    ccall((:DAQmxCfgWatchdogAOExpirStates, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}, Ref{Cint}, Cuint), taskHandle, channelNames, expirStateArray, outputTypeArray, arraySize)
end

function CfgWatchdogCOExpirStates(taskHandle::TaskHandle, channelNames::String, expirStateArray::Ref{Int32}, arraySize::UInt32)
    ccall((:DAQmxCfgWatchdogCOExpirStates, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}, Cuint), taskHandle, channelNames, expirStateArray, arraySize)
end

function CfgWatchdogDOExpirStates(taskHandle::TaskHandle, channelNames::String, expirStateArray::Ref{Int32}, arraySize::UInt32)
    ccall((:DAQmxCfgWatchdogDOExpirStates, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}, Cuint), taskHandle, channelNames, expirStateArray, arraySize)
end

function GetWatchdogAttribute(taskHandle::TaskHandle, lines::String, attribute::Integer, value::Ref{Cvoid})
    ccall((:DAQmxGetWatchdogAttribute, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint, Ref{Cvoid}), taskHandle, lines, attribute, value)
end

function SetWatchdogAttribute(taskHandle::TaskHandle, lines::String, attribute::Integer)
    ccall((:DAQmxSetWatchdogAttribute, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, lines, attribute)
end

function ResetWatchdogAttribute(taskHandle::TaskHandle, lines::String, attribute::Integer)
    ccall((:DAQmxResetWatchdogAttribute, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, lines, attribute)
end

function SelfCal(deviceName::String)
    ccall((:DAQmxSelfCal, :libnidaqmx), Cint, (Ref{UInt8},), deviceName)
end

function PerformBridgeOffsetNullingCal(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxPerformBridgeOffsetNullingCal, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function PerformBridgeOffsetNullingCalEx(taskHandle::TaskHandle, channel::String, skipUnsupportedChannels::UInt32)
    ccall((:DAQmxPerformBridgeOffsetNullingCalEx, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, skipUnsupportedChannels)
end

function PerformThrmcplLeadOffsetNullingCal(taskHandle::TaskHandle, channel::String, skipUnsupportedChannels::UInt32)
    ccall((:DAQmxPerformThrmcplLeadOffsetNullingCal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, skipUnsupportedChannels)
end

function PerformStrainShuntCal(taskHandle::TaskHandle, channel::String, shuntResistorValue::Real, shuntResistorLocation::Integer, skipUnsupportedChannels::UInt32)
    ccall((:DAQmxPerformStrainShuntCal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble, Cint, Cuint), taskHandle, channel, shuntResistorValue, shuntResistorLocation, skipUnsupportedChannels)
end

function PerformStrainShuntCalEx(taskHandle::TaskHandle, channel::String, shuntResistorValue::Real, shuntResistorLocation::Integer, shuntResistorSelect::Integer, shuntResistorSource::Integer, skipUnsupportedChannels::UInt32)
    ccall((:DAQmxPerformStrainShuntCalEx, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble, Cint, Cint, Cint, Cuint), taskHandle, channel, shuntResistorValue, shuntResistorLocation, shuntResistorSelect, shuntResistorSource, skipUnsupportedChannels)
end

function PerformBridgeShuntCal(taskHandle::TaskHandle, channel::String, shuntResistorValue::Real, shuntResistorLocation::Integer, bridgeResistance::Real, skipUnsupportedChannels::UInt32)
    ccall((:DAQmxPerformBridgeShuntCal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble, Cint, Cdouble, Cuint), taskHandle, channel, shuntResistorValue, shuntResistorLocation, bridgeResistance, skipUnsupportedChannels)
end

function PerformBridgeShuntCalEx(taskHandle::TaskHandle, channel::String, shuntResistorValue::Real, shuntResistorLocation::Integer, shuntResistorSelect::Integer, shuntResistorSource::Integer, bridgeResistance::Real, skipUnsupportedChannels::UInt32)
    ccall((:DAQmxPerformBridgeShuntCalEx, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble, Cint, Cint, Cint, Cdouble, Cuint), taskHandle, channel, shuntResistorValue, shuntResistorLocation, shuntResistorSelect, shuntResistorSource, bridgeResistance, skipUnsupportedChannels)
end

function GetSelfCalLastDateAndTime(deviceName::String, year::Ref{UInt32}, month::Ref{UInt32}, day::Ref{UInt32}, hour::Ref{UInt32}, minute::Ref{UInt32})
    ccall((:DAQmxGetSelfCalLastDateAndTime, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}, Ref{Cuint}, Ref{Cuint}, Ref{Cuint}, Ref{Cuint}), deviceName, year, month, day, hour, minute)
end

function GetExtCalLastDateAndTime(deviceName::String, year::Ref{UInt32}, month::Ref{UInt32}, day::Ref{UInt32}, hour::Ref{UInt32}, minute::Ref{UInt32})
    ccall((:DAQmxGetExtCalLastDateAndTime, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}, Ref{Cuint}, Ref{Cuint}, Ref{Cuint}, Ref{Cuint}), deviceName, year, month, day, hour, minute)
end

function RestoreLastExtCalConst(deviceName::String)
    ccall((:DAQmxRestoreLastExtCalConst, :libnidaqmx), Cint, (Ref{UInt8},), deviceName)
end

function ESeriesCalAdjust(calHandle::CalHandle, referenceVoltage::Real)
    ccall((:DAQmxESeriesCalAdjust, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, referenceVoltage)
end

function MSeriesCalAdjust(calHandle::CalHandle, referenceVoltage::Real)
    ccall((:DAQmxMSeriesCalAdjust, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, referenceVoltage)
end

function SSeriesCalAdjust(calHandle::CalHandle, referenceVoltage::Real)
    ccall((:DAQmxSSeriesCalAdjust, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, referenceVoltage)
end

function SCBaseboardCalAdjust(calHandle::CalHandle, referenceVoltage::Real)
    ccall((:DAQmxSCBaseboardCalAdjust, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, referenceVoltage)
end

function AOSeriesCalAdjust(calHandle::CalHandle, referenceVoltage::Real)
    ccall((:DAQmxAOSeriesCalAdjust, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, referenceVoltage)
end

function XSeriesCalAdjust(calHandle::CalHandle, referenceVoltage::Real)
    ccall((:DAQmxXSeriesCalAdjust, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, referenceVoltage)
end

function DeviceSupportsCal(deviceName::String, calSupported::Ref{UInt32})
    ccall((:DAQmxDeviceSupportsCal, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, calSupported)
end

function GetCalInfoAttribute(deviceName::String, attribute::Integer, value::Ref{Cvoid})
    ccall((:DAQmxGetCalInfoAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint, Ref{Cvoid}), deviceName, attribute, value)
end

function SetCalInfoAttribute(deviceName::String, attribute::Integer)
    ccall((:DAQmxSetCalInfoAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint), deviceName, attribute)
end

function InitExtCal(deviceName::String, password::String, calHandle::Ref{CalHandle})
    ccall((:DAQmxInitExtCal, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Ref{CalHandle}), deviceName, password, calHandle)
end

function CloseExtCal(calHandle::CalHandle, action::Integer)
    ccall((:DAQmxCloseExtCal, :libnidaqmx), Cint, (CalHandle, Cint), calHandle, action)
end

function ChangeExtCalPassword(deviceName::String, password::String, newPassword::String)
    ccall((:DAQmxChangeExtCalPassword, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Ref{UInt8}), deviceName, password, newPassword)
end

function DSASetCalTemp(calHandle::CalHandle, temperature::Real)
    ccall((:DAQmxDSASetCalTemp, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, temperature)
end

function AdjustDSAAICal(calHandle::CalHandle, referenceVoltage::Real)
    ccall((:DAQmxAdjustDSAAICal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, referenceVoltage)
end

function AdjustDSAAICalEx(calHandle::CalHandle, referenceVoltage::Real, inputsShorted::UInt32)
    ccall((:DAQmxAdjustDSAAICalEx, :libnidaqmx), Cint, (CalHandle, Cdouble, Cuint), calHandle, referenceVoltage, inputsShorted)
end

function AdjustDSAAICalWithGainAndCoupling(calHandle::CalHandle, coupling::Integer, gain::Real, referenceVoltage::Real)
    ccall((:DAQmxAdjustDSAAICalWithGainAndCoupling, :libnidaqmx), Cint, (CalHandle, Cint, Cdouble, Cdouble), calHandle, coupling, gain, referenceVoltage)
end

function AdjustDSAAOCal(calHandle::CalHandle, channel::UInt32, requestedLowVoltage::Real, actualLowVoltage::Real, requestedHighVoltage::Real, actualHighVoltage::Real, gainSetting::Real)
    ccall((:DAQmxAdjustDSAAOCal, :libnidaqmx), Cint, (CalHandle, Cuint, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), calHandle, channel, requestedLowVoltage, actualLowVoltage, requestedHighVoltage, actualHighVoltage, gainSetting)
end

function Adjust4610Cal(calHandle::CalHandle, channelName::String, gain::Real, offset::Real)
    ccall((:DAQmxAdjust4610Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelName, gain, offset)
end

function AdjustDSATimebaseCal(calHandle::CalHandle, referenceFrequency::Real)
    ccall((:DAQmxAdjustDSATimebaseCal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, referenceFrequency)
end

function AdjustDSAAOTimebaseCal(calHandle::CalHandle, measuredFrequency::Real, calComplete::Ref{UInt32})
    ccall((:DAQmxAdjustDSAAOTimebaseCal, :libnidaqmx), Cint, (CalHandle, Cdouble, Ref{Cuint}), calHandle, measuredFrequency, calComplete)
end

function SetupDSAAOTimebaseCal(calHandle::CalHandle, expectedFrequency::Ref{Cdouble})
    ccall((:DAQmxSetupDSAAOTimebaseCal, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}), calHandle, expectedFrequency)
end

function Get4463AdjustPoints(calHandle::CalHandle, terminalConfig::Integer, gain::Real, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet4463AdjustPoints, :libnidaqmx), Cint, (CalHandle, Cint, Cdouble, Ref{Cdouble}, Cuint), calHandle, terminalConfig, gain, adjustmentPoints, bufferSize)
end

function Adjust4463Cal(calHandle::CalHandle, channelNames::String, referenceVoltage::Real)
    ccall((:DAQmxAdjust4463Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, referenceVoltage)
end

function Setup4463Cal(calHandle::CalHandle, channelNames::String, terminalConfig::Integer, gain::Real, outputVoltage::Real)
    ccall((:DAQmxSetup4463Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint, Cdouble, Cdouble), calHandle, channelNames, terminalConfig, gain, outputVoltage)
end

function Setup4480Cal(calHandle::CalHandle, channelNames::String, calMode::Integer)
    ccall((:DAQmxSetup4480Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint), calHandle, channelNames, calMode)
end

function AdjustTIOTimebaseCal(calHandle::CalHandle, referenceFrequency::Real)
    ccall((:DAQmxAdjustTIOTimebaseCal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, referenceFrequency)
end

function Adjust4204Cal(calHandle::CalHandle, channelNames::String, lowPassFreq::Real, trackHoldEnabled::UInt32, inputVal::Real)
    ccall((:DAQmxAdjust4204Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cuint, Cdouble), calHandle, channelNames, lowPassFreq, trackHoldEnabled, inputVal)
end

function Adjust4220Cal(calHandle::CalHandle, channelNames::String, gain::Real, inputVal::Real)
    ccall((:DAQmxAdjust4220Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelNames, gain, inputVal)
end

function Adjust4224Cal(calHandle::CalHandle, channelNames::String, gain::Real, inputVal::Real)
    ccall((:DAQmxAdjust4224Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelNames, gain, inputVal)
end

function Adjust4225Cal(calHandle::CalHandle, channelNames::String, gain::Real, inputVal::Real)
    ccall((:DAQmxAdjust4225Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelNames, gain, inputVal)
end

function Setup433xCal(calHandle::CalHandle, channelNames::String, excitationVoltage::Real)
    ccall((:DAQmxSetup433xCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, excitationVoltage)
end

function Adjust433xCal(calHandle::CalHandle, refVoltage::Real, refExcitation::Real, shuntLocation::Integer)
    ccall((:DAQmxAdjust433xCal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble, Cint), calHandle, refVoltage, refExcitation, shuntLocation)
end

function Setup4339Cal(calHandle::CalHandle, channelNames::String, calMode::Integer, rangeMax::Real, rangeMin::Real, excitationVoltage::Real)
    ccall((:DAQmxSetup4339Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint, Cdouble, Cdouble, Cdouble), calHandle, channelNames, calMode, rangeMax, rangeMin, excitationVoltage)
end

function Adjust4339Cal(calHandle::CalHandle, refVoltage::Real)
    ccall((:DAQmxAdjust4339Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, refVoltage)
end

function Get4339CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet4339CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust4300Cal(calHandle::CalHandle, refVoltage::Real)
    ccall((:DAQmxAdjust4300Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, refVoltage)
end

function Setup4302Cal(calHandle::CalHandle, channelNames::String, rangeMin::Real, rangeMax::Real)
    ccall((:DAQmxSetup4302Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelNames, rangeMin, rangeMax)
end

function Get4302CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet4302CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust4302Cal(calHandle::CalHandle, refVoltage::Real)
    ccall((:DAQmxAdjust4302Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, refVoltage)
end

function Setup4303Cal(calHandle::CalHandle, channelNames::String, rangeMin::Real, rangeMax::Real)
    ccall((:DAQmxSetup4303Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelNames, rangeMin, rangeMax)
end

function Get4303CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet4303CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust4303Cal(calHandle::CalHandle, refVoltage::Real)
    ccall((:DAQmxAdjust4303Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, refVoltage)
end

function Setup4304Cal(calHandle::CalHandle, channelNames::String, rangeMin::Real, rangeMax::Real)
    ccall((:DAQmxSetup4304Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelNames, rangeMin, rangeMax)
end

function Get4304CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet4304CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust4304Cal(calHandle::CalHandle, refVoltage::Real)
    ccall((:DAQmxAdjust4304Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, refVoltage)
end

function Setup4305Cal(calHandle::CalHandle, channelNames::String, rangeMin::Real, rangeMax::Real)
    ccall((:DAQmxSetup4305Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelNames, rangeMin, rangeMax)
end

function Get4305CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet4305CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust4305Cal(calHandle::CalHandle, refVoltage::Real)
    ccall((:DAQmxAdjust4305Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, refVoltage)
end

function Adjust4309Cal(calHandle::CalHandle, refVoltage::Real)
    ccall((:DAQmxAdjust4309Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, refVoltage)
end

function Adjust4310Cal(calHandle::CalHandle, refVoltage::Real)
    ccall((:DAQmxAdjust4310Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, refVoltage)
end

function Adjust4353Cal(calHandle::CalHandle, channelNames::String, refVal::Real)
    ccall((:DAQmxAdjust4353Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, refVal)
end

function Adjust4357Cal(calHandle::CalHandle, channelNames::String, refVals::Ref{Cdouble}, numRefVals::Integer)
    ccall((:DAQmxAdjust4357Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Ref{Cdouble}, Cint), calHandle, channelNames, refVals, numRefVals)
end

function Setup4322Cal(calHandle::CalHandle, channelNames::String, outputType::Integer, outputVal::Real)
    ccall((:DAQmxSetup4322Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint, Cdouble), calHandle, channelNames, outputType, outputVal)
end

function Adjust4322Cal(calHandle::CalHandle, channelNames::String, refVal::Real)
    ccall((:DAQmxAdjust4322Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, refVal)
end

function Get4322CalAdjustPoints(calHandle::CalHandle, outputType::Integer, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet4322CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Cint, Ref{Cdouble}, Cuint), calHandle, outputType, adjustmentPoints, bufferSize)
end

function ConnectSCExpressCalAccChans(calHandle::CalHandle, channelNames::String, connection::String)
    ccall((:DAQmxConnectSCExpressCalAccChans, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Ref{UInt8}), calHandle, channelNames, connection)
end

function DisconnectSCExpressCalAccChans(calHandle::CalHandle)
    ccall((:DAQmxDisconnectSCExpressCalAccChans, :libnidaqmx), Cint, (CalHandle,), calHandle)
end

function GetPossibleSCExpressCalAccConnections(deviceName::String, channelNames::String, connections, connectionsBufferSize::UInt32)
    ccall((:DAQmxGetPossibleSCExpressCalAccConnections, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Ref{UInt8}, Cuint), deviceName, channelNames, connections, connectionsBufferSize)
end

function SetSCExpressCalAccBridgeOutput(calHandle::CalHandle, voltsPerVolt::Real)
    ccall((:DAQmxSetSCExpressCalAccBridgeOutput, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, voltsPerVolt)
end

function FieldDAQSetCalTemp(calHandle::CalHandle, temperature::Real)
    ccall((:DAQmxFieldDAQSetCalTemp, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, temperature)
end

function Get11603CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet11603CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust11603Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust11603Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get11613CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet11613CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust11613Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust11613Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get11614CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet11614CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust11614Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust11614Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Setup11634Cal(calHandle::CalHandle, rangeMin::Real, rangeMax::Real)
    ccall((:DAQmxSetup11634Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, rangeMin, rangeMax)
end

function Get11634CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet11634CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust11634Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust11634Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Setup11637Cal(calHandle::CalHandle, channelNames::String, bridgeConfig::Integer, voltageExcitation::Real)
    ccall((:DAQmxSetup11637Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint, Cdouble), calHandle, channelNames, bridgeConfig, voltageExcitation)
end

function Adjust11637Cal(calHandle::CalHandle, value::Real, actualReading::Ref{Cdouble}, asFoundGainError::Ref{Cdouble}, asFoundOffsetError::Ref{Cdouble})
    ccall((:DAQmxAdjust11637Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}), calHandle, value, actualReading, asFoundGainError, asFoundOffsetError)
end

function Get9201CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9201CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function CSeriesSetCalTemp(calHandle::CalHandle, temperature::Real)
    ccall((:DAQmxCSeriesSetCalTemp, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, temperature)
end

function Adjust9201Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9201Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9202CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9202CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9202Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9202Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9203CalAdjustPoints(calHandle::CalHandle, rangeMin::Real, rangeMax::Real, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9203CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble, Ref{Cdouble}, Cuint), calHandle, rangeMin, rangeMax, adjustmentPoints, bufferSize)
end

function Adjust9203GainCal(calHandle::CalHandle, channelNames::String, rangeMin::Real, rangeMax::Real, value::Real)
    ccall((:DAQmxAdjust9203GainCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble, Cdouble), calHandle, channelNames, rangeMin, rangeMax, value)
end

function Adjust9203OffsetCal(calHandle::CalHandle, channelNames::String, rangeMin::Real, rangeMax::Real)
    ccall((:DAQmxAdjust9203OffsetCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelNames, rangeMin, rangeMax)
end

function Adjust9205Cal(calHandle::CalHandle, value::Real)
    ccall((:DAQmxAdjust9205Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, value)
end

function Adjust9206Cal(calHandle::CalHandle, value::Real)
    ccall((:DAQmxAdjust9206Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, value)
end

function Get9207CalAdjustPoints(calHandle::CalHandle, channelNames::String, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9207CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), calHandle, channelNames, adjustmentPoints, bufferSize)
end

function Adjust9207GainCal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9207GainCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Adjust9207OffsetCal(calHandle::CalHandle, channelNames::String)
    ccall((:DAQmxAdjust9207OffsetCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}), calHandle, channelNames)
end

function Get9208CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9208CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9208GainCal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9208GainCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Adjust9208OffsetCal(calHandle::CalHandle, channelNames::String)
    ccall((:DAQmxAdjust9208OffsetCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}), calHandle, channelNames)
end

function Get9209CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9209CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9209GainCal(calHandle::CalHandle, channelNames::String, terminalConfig::Integer, value::Real)
    ccall((:DAQmxAdjust9209GainCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint, Cdouble), calHandle, channelNames, terminalConfig, value)
end

function Adjust9209OffsetCal(calHandle::CalHandle, channelNames::String)
    ccall((:DAQmxAdjust9209OffsetCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}), calHandle, channelNames)
end

function Adjust9210Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9210Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Adjust9211Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9211Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9212CalAdjustPoints(calHandle::CalHandle, channelNames::String, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9212CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), calHandle, channelNames, adjustmentPoints, bufferSize)
end

function Adjust9212Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9212Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9213CalAdjustPoints(calHandle::CalHandle, rangeMin::Real, rangeMax::Real, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9213CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble, Ref{Cdouble}, Cuint), calHandle, rangeMin, rangeMax, adjustmentPoints, bufferSize)
end

function Adjust9213Cal(calHandle::CalHandle, channelNames::String, rangeMin::Real, rangeMax::Real, value::Real)
    ccall((:DAQmxAdjust9213Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble, Cdouble), calHandle, channelNames, rangeMin, rangeMax, value)
end

function Get9214CalAdjustPoints(calHandle::CalHandle, channelNames::String, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9214CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), calHandle, channelNames, adjustmentPoints, bufferSize)
end

function Adjust9214Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9214Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9215CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9215CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9215Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9215Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9216CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9216CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9216Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9216Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9217CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9217CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9217Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9217Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Setup9218Cal(calHandle::CalHandle, channelNames::String, rangeMin::Real, rangeMax::Real, measType::Integer)
    ccall((:DAQmxSetup9218Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble, Cint), calHandle, channelNames, rangeMin, rangeMax, measType)
end

function Get9218CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9218CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9218Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9218Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Setup9219Cal(calHandle::CalHandle, channelNames::String, rangeMin::Real, rangeMax::Real, measType::Integer, bridgeConfig::Integer)
    ccall((:DAQmxSetup9219Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint), calHandle, channelNames, rangeMin, rangeMax, measType, bridgeConfig)
end

function Get9219CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9219CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9219Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9219Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9220CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9220CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9220Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9220Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9221CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9221CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9221Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9221Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9222CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9222CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9222Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9222Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9223CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9223CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9223Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9223Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9224CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9224CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9224Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9224Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9225CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9225CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9225Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9225Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9226CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9226CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9226Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9226Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9227CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9227CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9227Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9227Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9228CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9228CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9228Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9228Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9229CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9229CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9229Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9229Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9230CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9230CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9230Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9230Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9231CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9231CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9231Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9231Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9232CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9232CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9232Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9232Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9234CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9234CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9234GainCal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9234GainCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Adjust9234OffsetCal(calHandle::CalHandle, channelNames::String)
    ccall((:DAQmxAdjust9234OffsetCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}), calHandle, channelNames)
end

function Get9238CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9238CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9238Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9238Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9239CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9239CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9239Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9239Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9242CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9242CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Setup9242Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxSetup9242Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Adjust9242Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9242Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9244CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9244CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Setup9244Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxSetup9244Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Adjust9244Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9244Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9246CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9246CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9246Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9246Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9247CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9247CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9247Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9247Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9250CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9250CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9250Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9250Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9251CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9251CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9251Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9251Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9260CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Int32}, bufferSize::UInt32)
    ccall((:DAQmxGet9260CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cint}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Setup9260Cal(calHandle::CalHandle, channelNames::String, value::Integer)
    ccall((:DAQmxSetup9260Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint), calHandle, channelNames, value)
end

function Adjust9260Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9260Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9263CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Int32}, bufferSize::UInt32)
    ccall((:DAQmxGet9263CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cint}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Setup9263Cal(calHandle::CalHandle, channelNames::String, value::Integer)
    ccall((:DAQmxSetup9263Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint), calHandle, channelNames, value)
end

function Adjust9263Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9263Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9264CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Int32}, bufferSize::UInt32)
    ccall((:DAQmxGet9264CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cint}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Setup9264Cal(calHandle::CalHandle, channelNames::String, value::Integer)
    ccall((:DAQmxSetup9264Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint), calHandle, channelNames, value)
end

function Adjust9264Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9264Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9265CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Int32}, bufferSize::UInt32)
    ccall((:DAQmxGet9265CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cint}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Setup9265Cal(calHandle::CalHandle, channelNames::String, value::Integer)
    ccall((:DAQmxSetup9265Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint), calHandle, channelNames, value)
end

function Adjust9265Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9265Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9266CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Int32}, bufferSize::UInt32)
    ccall((:DAQmxGet9266CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cint}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Setup9266Cal(calHandle::CalHandle, channelNames::String, value::Integer)
    ccall((:DAQmxSetup9266Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint), calHandle, channelNames, value)
end

function Adjust9266Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9266Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9269CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Int32}, bufferSize::UInt32)
    ccall((:DAQmxGet9269CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cint}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Setup9269Cal(calHandle::CalHandle, channelNames::String, value::Integer)
    ccall((:DAQmxSetup9269Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint), calHandle, channelNames, value)
end

function Adjust9269Cal(calHandle::CalHandle, channelNames::String, value::Real)
    ccall((:DAQmxAdjust9269Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9775CalAdjustPoints(calHandle::CalHandle, coupling::UInt32, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9775CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Cuint, Ref{Cdouble}, Cuint), calHandle, coupling, adjustmentPoints, bufferSize)
end

function Adjust9775Cal(calHandle::CalHandle, channelNames::String, value::Real, coupling::UInt32)
    ccall((:DAQmxAdjust9775Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cuint), calHandle, channelNames, value, coupling)
end

function Setup1102Cal(calHandle::CalHandle, channelName::String, gain::Real)
    ccall((:DAQmxSetup1102Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust1102Cal(calHandle::CalHandle, refVoltage::Real, measOutput::Real)
    ccall((:DAQmxAdjust1102Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1104Cal(calHandle::CalHandle, channelName::String)
    ccall((:DAQmxSetup1104Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}), calHandle, channelName)
end

function Adjust1104Cal(calHandle::CalHandle, refVoltage::Real, measOutput::Real)
    ccall((:DAQmxAdjust1104Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1112Cal(calHandle::CalHandle, channelName::String)
    ccall((:DAQmxSetup1112Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}), calHandle, channelName)
end

function Adjust1112Cal(calHandle::CalHandle, refVoltage::Real, measOutput::Real)
    ccall((:DAQmxAdjust1112Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1122Cal(calHandle::CalHandle, channelName::String, gain::Real)
    ccall((:DAQmxSetup1122Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust1122Cal(calHandle::CalHandle, refVoltage::Real, measOutput::Real)
    ccall((:DAQmxAdjust1122Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1124Cal(calHandle::CalHandle, channelName::String, range::Integer, dacValue::UInt32)
    ccall((:DAQmxSetup1124Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint, Cuint), calHandle, channelName, range, dacValue)
end

function Adjust1124Cal(calHandle::CalHandle, measOutput::Real)
    ccall((:DAQmxAdjust1124Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, measOutput)
end

function Setup1125Cal(calHandle::CalHandle, channelName::String, gain::Real)
    ccall((:DAQmxSetup1125Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust1125Cal(calHandle::CalHandle, refVoltage::Real, measOutput::Real)
    ccall((:DAQmxAdjust1125Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1126Cal(calHandle::CalHandle, channelName::String, upperFreqLimit::Real)
    ccall((:DAQmxSetup1126Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, upperFreqLimit)
end

function Adjust1126Cal(calHandle::CalHandle, refFreq::Real, measOutput::Real)
    ccall((:DAQmxAdjust1126Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refFreq, measOutput)
end

function Setup1141Cal(calHandle::CalHandle, channelName::String, gain::Real)
    ccall((:DAQmxSetup1141Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust1141Cal(calHandle::CalHandle, refVoltage::Real, measOutput::Real)
    ccall((:DAQmxAdjust1141Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1142Cal(calHandle::CalHandle, channelName::String, gain::Real)
    ccall((:DAQmxSetup1142Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust1142Cal(calHandle::CalHandle, refVoltage::Real, measOutput::Real)
    ccall((:DAQmxAdjust1142Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1143Cal(calHandle::CalHandle, channelName::String, gain::Real)
    ccall((:DAQmxSetup1143Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust1143Cal(calHandle::CalHandle, refVoltage::Real, measOutput::Real)
    ccall((:DAQmxAdjust1143Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1502Cal(calHandle::CalHandle, channelName::String, gain::Real)
    ccall((:DAQmxSetup1502Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust1502Cal(calHandle::CalHandle, refVoltage::Real, measOutput::Real)
    ccall((:DAQmxAdjust1502Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1503Cal(calHandle::CalHandle, channelName::String, gain::Real)
    ccall((:DAQmxSetup1503Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust1503Cal(calHandle::CalHandle, refVoltage::Real, measOutput::Real)
    ccall((:DAQmxAdjust1503Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Adjust1503CurrentCal(calHandle::CalHandle, channelName::String, measCurrent::Real)
    ccall((:DAQmxAdjust1503CurrentCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, measCurrent)
end

function Setup1520Cal(calHandle::CalHandle, channelName::String, gain::Real)
    ccall((:DAQmxSetup1520Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust1520Cal(calHandle::CalHandle, refVoltage::Real, measOutput::Real)
    ccall((:DAQmxAdjust1520Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1521Cal(calHandle::CalHandle, channelName::String)
    ccall((:DAQmxSetup1521Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}), calHandle, channelName)
end

function Adjust1521Cal(calHandle::CalHandle, refVoltage::Real, measOutput::Real)
    ccall((:DAQmxAdjust1521Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup153xCal(calHandle::CalHandle, channelName::String, gain::Real)
    ccall((:DAQmxSetup153xCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust153xCal(calHandle::CalHandle, refVoltage::Real, measOutput::Real)
    ccall((:DAQmxAdjust153xCal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1540Cal(calHandle::CalHandle, channelName::String, excitationVoltage::Real, excitationFreq::Real)
    ccall((:DAQmxSetup1540Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelName, excitationVoltage, excitationFreq)
end

function Adjust1540Cal(calHandle::CalHandle, refVoltage::Real, measOutput::Real, inputCalSource::Integer)
    ccall((:DAQmxAdjust1540Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble, Cint), calHandle, refVoltage, measOutput, inputCalSource)
end

function ConfigureTEDS(physicalChannel::String, filePath::String)
    ccall((:DAQmxConfigureTEDS, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}), physicalChannel, filePath)
end

function ClearTEDS(physicalChannel::String)
    ccall((:DAQmxClearTEDS, :libnidaqmx), Cint, (Ref{UInt8},), physicalChannel)
end

function WriteToTEDSFromArray(physicalChannel::String, bitStream::Ref{Cuchar}, arraySize::UInt32, basicTEDSOptions::Integer)
    ccall((:DAQmxWriteToTEDSFromArray, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuchar}, Cuint, Cint), physicalChannel, bitStream, arraySize, basicTEDSOptions)
end

function WriteToTEDSFromFile(physicalChannel::String, filePath::String, basicTEDSOptions::Integer)
    ccall((:DAQmxWriteToTEDSFromFile, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Cint), physicalChannel, filePath, basicTEDSOptions)
end

function GetPhysicalChanAttribute(physicalChannel::String, attribute::Integer, value::Ref{Cvoid})
    ccall((:DAQmxGetPhysicalChanAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint, Ref{Cvoid}), physicalChannel, attribute, value)
end

function WaitForNextSampleClock(taskHandle::TaskHandle, timeout::Real, isLate::Ref{UInt32})
    ccall((:DAQmxWaitForNextSampleClock, :libnidaqmx), Cint, (TaskHandle, Cdouble, Ref{Cuint}), taskHandle, timeout, isLate)
end

function GetRealTimeAttribute(taskHandle::TaskHandle, attribute::Integer, value::Ref{Cvoid})
    ccall((:DAQmxGetRealTimeAttribute, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{Cvoid}), taskHandle, attribute, value)
end

function SetRealTimeAttribute(taskHandle::TaskHandle, attribute::Integer)
    ccall((:DAQmxSetRealTimeAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ResetRealTimeAttribute(taskHandle::TaskHandle, attribute::Integer)
    ccall((:DAQmxResetRealTimeAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function IsReadOrWriteLate(errorCode::Integer)
    ccall((:DAQmxIsReadOrWriteLate, :libnidaqmx), Cint, (Cint,), errorCode)
end

function SaveTask(taskHandle::TaskHandle, saveAs::String, author::String, options::UInt32)
    ccall((:DAQmxSaveTask, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cuint), taskHandle, saveAs, author, options)
end

function SaveGlobalChan(taskHandle::TaskHandle, channelName::String, saveAs::String, author::String, options::UInt32)
    ccall((:DAQmxSaveGlobalChan, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Ref{UInt8}, Cuint), taskHandle, channelName, saveAs, author, options)
end

function SaveScale(scaleName::String, saveAs::String, author::String, options::UInt32)
    ccall((:DAQmxSaveScale, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Ref{UInt8}, Cuint), scaleName, saveAs, author, options)
end

function DeleteSavedTask(taskName::String)
    ccall((:DAQmxDeleteSavedTask, :libnidaqmx), Cint, (Ref{UInt8},), taskName)
end

function DeleteSavedGlobalChan(channelName::String)
    ccall((:DAQmxDeleteSavedGlobalChan, :libnidaqmx), Cint, (Ref{UInt8},), channelName)
end

function DeleteSavedScale(scaleName::String)
    ccall((:DAQmxDeleteSavedScale, :libnidaqmx), Cint, (Ref{UInt8},), scaleName)
end

function GetPersistedTaskAttribute(taskName::String, attribute::Integer, value::Ref{Cvoid})
    ccall((:DAQmxGetPersistedTaskAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint, Ref{Cvoid}), taskName, attribute, value)
end

function GetPersistedChanAttribute(channel::String, attribute::Integer, value::Ref{Cvoid})
    ccall((:DAQmxGetPersistedChanAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint, Ref{Cvoid}), channel, attribute, value)
end

function GetPersistedScaleAttribute(scaleName::String, attribute::Integer, value::Ref{Cvoid})
    ccall((:DAQmxGetPersistedScaleAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint, Ref{Cvoid}), scaleName, attribute, value)
end

function GetSystemInfoAttribute(attribute::Integer, value::Ref{Cvoid})
    ccall((:DAQmxGetSystemInfoAttribute, :libnidaqmx), Cint, (Cint, Ref{Cvoid}), attribute, value)
end

function SetDigitalPowerUpStates(deviceName::String, channelNames::String, state::Integer)
    ccall((:DAQmxSetDigitalPowerUpStates, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Cint), deviceName, channelNames, state)
end

function GetDigitalPowerUpStates(deviceName::String, channelName::String, state::Ref{Int32})
    ccall((:DAQmxGetDigitalPowerUpStates, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Ref{Cint}), deviceName, channelName, state)
end

function SetDigitalPullUpPullDownStates(deviceName::String, channelName::String, state::Integer)
    ccall((:DAQmxSetDigitalPullUpPullDownStates, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Cint), deviceName, channelName, state)
end

function GetDigitalPullUpPullDownStates(deviceName::String, channelName::String, state::Ref{Int32})
    ccall((:DAQmxGetDigitalPullUpPullDownStates, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Ref{Cint}), deviceName, channelName, state)
end

function SetAnalogPowerUpStates(deviceName::String, channelNames::String, state::Real, channelType::Integer)
    ccall((:DAQmxSetAnalogPowerUpStates, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Cdouble, Cint), deviceName, channelNames, state, channelType)
end

function SetAnalogPowerUpStatesWithOutputType(channelNames::String, stateArray::Ref{Cdouble}, channelTypeArray::Ref{Int32}, arraySize::UInt32)
    ccall((:DAQmxSetAnalogPowerUpStatesWithOutputType, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Ref{Cint}, Cuint), channelNames, stateArray, channelTypeArray, arraySize)
end

function GetAnalogPowerUpStates(deviceName::String, channelName::String, state::Ref{Cdouble}, channelType::Integer)
    ccall((:DAQmxGetAnalogPowerUpStates, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Ref{Cdouble}, Cint), deviceName, channelName, state, channelType)
end

function GetAnalogPowerUpStatesWithOutputType(channelNames::String, stateArray::Ref{Cdouble}, channelTypeArray::Ref{Int32}, arraySizePtr::Ref{UInt32})
    ccall((:DAQmxGetAnalogPowerUpStatesWithOutputType, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Ref{Cint}, Ref{Cuint}), channelNames, stateArray, channelTypeArray, arraySizePtr)
end

function SetDigitalLogicFamilyPowerUpState(deviceName::String, logicFamily::Integer)
    ccall((:DAQmxSetDigitalLogicFamilyPowerUpState, :libnidaqmx), Cint, (Ref{UInt8}, Cint), deviceName, logicFamily)
end

function GetDigitalLogicFamilyPowerUpState(deviceName::String, logicFamily::Ref{Int32})
    ccall((:DAQmxGetDigitalLogicFamilyPowerUpState, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), deviceName, logicFamily)
end

function AddNetworkDevice(IPAddress::String, deviceName::String, attemptReservation::UInt32, timeout::Real, deviceNameOut::String, deviceNameOutBufferSize::UInt32)
    ccall((:DAQmxAddNetworkDevice, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Cuint, Cdouble, Ref{UInt8}, Cuint), IPAddress, deviceName, attemptReservation, timeout, deviceNameOut, deviceNameOutBufferSize)
end

function DeleteNetworkDevice(deviceName::String)
    ccall((:DAQmxDeleteNetworkDevice, :libnidaqmx), Cint, (Ref{UInt8},), deviceName)
end

function ReserveNetworkDevice(deviceName::String, overrideReservation::UInt32)
    ccall((:DAQmxReserveNetworkDevice, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), deviceName, overrideReservation)
end

function UnreserveNetworkDevice(deviceName::String)
    ccall((:DAQmxUnreserveNetworkDevice, :libnidaqmx), Cint, (Ref{UInt8},), deviceName)
end

function AutoConfigureCDAQSyncConnections(chassisDevicesPorts::String, timeout::Real)
    ccall((:DAQmxAutoConfigureCDAQSyncConnections, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble), chassisDevicesPorts, timeout)
end

function GetAutoConfiguredCDAQSyncConnections(portList::String, portListSize::UInt32)
    ccall((:DAQmxGetAutoConfiguredCDAQSyncConnections, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), portList, portListSize)
end

function AreConfiguredCDAQSyncPortsDisconnected(chassisDevicesPorts::String, timeout::Real, disconnectedPortsExist::Ref{UInt32})
    ccall((:DAQmxAreConfiguredCDAQSyncPortsDisconnected, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble, Ref{Cuint}), chassisDevicesPorts, timeout, disconnectedPortsExist)
end

function GetDisconnectedCDAQSyncPorts(portList::String, portListSize::UInt32)
    ccall((:DAQmxGetDisconnectedCDAQSyncPorts, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), portList, portListSize)
end

function AddCDAQSyncConnection(portList::String)
    ccall((:DAQmxAddCDAQSyncConnection, :libnidaqmx), Cint, (Ref{UInt8},), portList)
end

function RemoveCDAQSyncConnection(portList::String)
    ccall((:DAQmxRemoveCDAQSyncConnection, :libnidaqmx), Cint, (Ref{UInt8},), portList)
end

function GetErrorString(errorCode::Integer, errorString::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetErrorString, :libnidaqmx), Cint, (Cint, Ref{UInt8}, Cuint), errorCode, errorString, bufferSize)
end

function GetExtendedErrorInfo(errorString::String, bufferSize::UInt32)
    ccall((:DAQmxGetExtendedErrorInfo, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), errorString, bufferSize)
end

function GetBufInputBufSize(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetBufInputBufSize, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetBufInputBufSize(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetBufInputBufSize, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetBufInputBufSize(taskHandle::TaskHandle)
    ccall((:DAQmxResetBufInputBufSize, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetBufInputOnbrdBufSize(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetBufInputOnbrdBufSize, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetBufOutputBufSize(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetBufOutputBufSize, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetBufOutputBufSize(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetBufOutputBufSize, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetBufOutputBufSize(taskHandle::TaskHandle)
    ccall((:DAQmxResetBufOutputBufSize, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetBufOutputOnbrdBufSize(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetBufOutputOnbrdBufSize, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetBufOutputOnbrdBufSize(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetBufOutputOnbrdBufSize, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetBufOutputOnbrdBufSize(taskHandle::TaskHandle)
    ccall((:DAQmxResetBufOutputOnbrdBufSize, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSelfCalSupported(deviceName::String, data::Ref{UInt32})
    ccall((:DAQmxGetSelfCalSupported, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function GetSelfCalLastTemp(deviceName::String, data::Real)
    ccall((:DAQmxGetSelfCalLastTemp, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), deviceName, data)
end

function GetExtCalRecommendedInterval(deviceName::String, data::Ref{UInt32})
    ccall((:DAQmxGetExtCalRecommendedInterval, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function GetExtCalLastTemp(deviceName::String, data::Real)
    ccall((:DAQmxGetExtCalLastTemp, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), deviceName, data)
end

function GetCalUserDefinedInfo(deviceName::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCalUserDefinedInfo, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), deviceName, data, bufferSize)
end

function SetCalUserDefinedInfo(deviceName::String, data)
    ccall((:DAQmxSetCalUserDefinedInfo, :libnidaqmx), Cint, (Ref{UInt8}, Cstring), deviceName, data)
end

function GetCalUserDefinedInfoMaxSize(deviceName::String, data::Ref{UInt32})
    ccall((:DAQmxGetCalUserDefinedInfoMaxSize, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function GetCalDevTemp(deviceName::String, data::Real)
    ccall((:DAQmxGetCalDevTemp, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), deviceName, data)
end

function GetCalAccConnectionCount(deviceName::String, data::Ref{UInt32})
    ccall((:DAQmxGetCalAccConnectionCount, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function SetCalAccConnectionCount(deviceName::String, data::Ref{UInt32})
    ccall((:DAQmxSetCalAccConnectionCount, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), deviceName, data)
end

function GetCalRecommendedAccConnectionCountLimit(deviceName::String, data::Ref{UInt32})
    ccall((:DAQmxGetCalRecommendedAccConnectionCountLimit, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function GetAIMax(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIMax, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIMax(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIMax, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIMax(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIMax, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIMin(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIMin, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIMin(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIMin, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIMin(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIMin, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAICustomScaleName(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAICustomScaleName, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetAICustomScaleName(taskHandle::TaskHandle, channel::String, data::String)
    ccall((:DAQmxSetAICustomScaleName, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetAICustomScaleName(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAICustomScaleName, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIMeasType(taskHandle::TaskHandle, channel::String, data::Ref{Int32})
    ccall((:DAQmxGetAIMeasType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function GetAIVoltageUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIVoltageUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIVoltageUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIVoltageUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIVoltageUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIVoltageUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIVoltagedBRef(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIVoltagedBRef, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIVoltagedBRef(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIVoltagedBRef, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIVoltagedBRef(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIVoltagedBRef, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIVoltageACRMSUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIVoltageACRMSUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIVoltageACRMSUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIVoltageACRMSUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIVoltageACRMSUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIVoltageACRMSUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAITempUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAITempUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAITempUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAITempUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAITempUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAITempUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIThrmcplType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIThrmcplType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIThrmcplType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIThrmcplType, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIThrmcplType(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIThrmcplType, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIThrmcplScaleType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIThrmcplScaleType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIThrmcplScaleType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIThrmcplScaleType, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIThrmcplScaleType(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIThrmcplScaleType, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIThrmcplCJCSrc(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIThrmcplCJCSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function GetAIThrmcplCJCVal(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIThrmcplCJCVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIThrmcplCJCVal(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIThrmcplCJCVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIThrmcplCJCVal(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIThrmcplCJCVal, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIThrmcplCJCChan(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAIThrmcplCJCChan, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function GetAIRTDType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIRTDType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIRTDType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIRTDType, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIRTDType(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRTDType, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIRTDR0(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIRTDR0, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIRTDR0(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIRTDR0, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIRTDR0(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRTDR0, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIRTDA(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIRTDA, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIRTDA(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIRTDA, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIRTDA(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRTDA, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIRTDB(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIRTDB, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIRTDB(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIRTDB, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIRTDB(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRTDB, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIRTDC(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIRTDC, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIRTDC(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIRTDC, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIRTDC(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRTDC, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIThrmstrA(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIThrmstrA, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIThrmstrA(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIThrmstrA, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIThrmstrA(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIThrmstrA, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIThrmstrB(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIThrmstrB, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIThrmstrB(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIThrmstrB, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIThrmstrB(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIThrmstrB, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIThrmstrC(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIThrmstrC, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIThrmstrC(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIThrmstrC, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIThrmstrC(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIThrmstrC, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIThrmstrR1(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIThrmstrR1, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIThrmstrR1(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIThrmstrR1, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIThrmstrR1(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIThrmstrR1, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIForceReadFromChan(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIForceReadFromChan, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIForceReadFromChan(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAIForceReadFromChan, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIForceReadFromChan(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIForceReadFromChan, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAICurrentUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAICurrentUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAICurrentUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAICurrentUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAICurrentUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAICurrentUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAICurrentACRMSUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAICurrentACRMSUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAICurrentACRMSUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAICurrentACRMSUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAICurrentACRMSUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAICurrentACRMSUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIStrainUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIStrainUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIStrainUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIStrainUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIStrainUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIStrainUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIStrainGageForceReadFromChan(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIStrainGageForceReadFromChan, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIStrainGageForceReadFromChan(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAIStrainGageForceReadFromChan, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIStrainGageForceReadFromChan(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIStrainGageForceReadFromChan, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIStrainGageGageFactor(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIStrainGageGageFactor, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIStrainGageGageFactor(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIStrainGageGageFactor, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIStrainGageGageFactor(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIStrainGageGageFactor, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIStrainGagePoissonRatio(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIStrainGagePoissonRatio, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIStrainGagePoissonRatio(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIStrainGagePoissonRatio, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIStrainGagePoissonRatio(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIStrainGagePoissonRatio, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIStrainGageCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIStrainGageCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIStrainGageCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIStrainGageCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIStrainGageCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIStrainGageCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIRosetteStrainGageRosetteType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIRosetteStrainGageRosetteType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function GetAIRosetteStrainGageOrientation(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIRosetteStrainGageOrientation, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIRosetteStrainGageOrientation(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIRosetteStrainGageOrientation, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIRosetteStrainGageOrientation(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRosetteStrainGageOrientation, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIRosetteStrainGageStrainChans(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAIRosetteStrainGageStrainChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function GetAIRosetteStrainGageRosetteMeasType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIRosetteStrainGageRosetteMeasType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIRosetteStrainGageRosetteMeasType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIRosetteStrainGageRosetteMeasType, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIRosetteStrainGageRosetteMeasType(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRosetteStrainGageRosetteMeasType, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIResistanceUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIResistanceUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIResistanceUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIResistanceUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIResistanceUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIResistanceUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIFreqUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIFreqUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIFreqUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIFreqUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIFreqUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIFreqUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIFreqThreshVoltage(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIFreqThreshVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIFreqThreshVoltage(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIFreqThreshVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIFreqThreshVoltage(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIFreqThreshVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIFreqHyst(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIFreqHyst, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIFreqHyst(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIFreqHyst, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIFreqHyst(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIFreqHyst, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAILVDTUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAILVDTUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAILVDTUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAILVDTUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAILVDTUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAILVDTUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAILVDTSensitivity(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAILVDTSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAILVDTSensitivity(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAILVDTSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAILVDTSensitivity(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAILVDTSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAILVDTSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAILVDTSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAILVDTSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAILVDTSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAILVDTSensitivityUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAILVDTSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIRVDTUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIRVDTUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIRVDTUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIRVDTUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIRVDTUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRVDTUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIRVDTSensitivity(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIRVDTSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIRVDTSensitivity(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIRVDTSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIRVDTSensitivity(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRVDTSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIRVDTSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIRVDTSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIRVDTSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIRVDTSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIRVDTSensitivityUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRVDTSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIEddyCurrentProxProbeUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIEddyCurrentProxProbeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIEddyCurrentProxProbeUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIEddyCurrentProxProbeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIEddyCurrentProxProbeUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIEddyCurrentProxProbeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIEddyCurrentProxProbeSensitivity(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIEddyCurrentProxProbeSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIEddyCurrentProxProbeSensitivity(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIEddyCurrentProxProbeSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIEddyCurrentProxProbeSensitivity(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIEddyCurrentProxProbeSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIEddyCurrentProxProbeSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIEddyCurrentProxProbeSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIEddyCurrentProxProbeSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIEddyCurrentProxProbeSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIEddyCurrentProxProbeSensitivityUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIEddyCurrentProxProbeSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAISoundPressureMaxSoundPressureLvl(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAISoundPressureMaxSoundPressureLvl, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAISoundPressureMaxSoundPressureLvl(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAISoundPressureMaxSoundPressureLvl, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAISoundPressureMaxSoundPressureLvl(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAISoundPressureMaxSoundPressureLvl, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAISoundPressureUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAISoundPressureUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAISoundPressureUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAISoundPressureUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAISoundPressureUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAISoundPressureUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAISoundPressuredBRef(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAISoundPressuredBRef, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAISoundPressuredBRef(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAISoundPressuredBRef, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAISoundPressuredBRef(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAISoundPressuredBRef, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIMicrophoneSensitivity(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIMicrophoneSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIMicrophoneSensitivity(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIMicrophoneSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIMicrophoneSensitivity(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIMicrophoneSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIAccelUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIAccelUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIAccelUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIAccelUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIAccelUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIAccelUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIAcceldBRef(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIAcceldBRef, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIAcceldBRef(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIAcceldBRef, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIAcceldBRef(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIAcceldBRef, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIAccel4WireDCVoltageSensitivity(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIAccel4WireDCVoltageSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIAccel4WireDCVoltageSensitivity(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIAccel4WireDCVoltageSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIAccel4WireDCVoltageSensitivity(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIAccel4WireDCVoltageSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIAccel4WireDCVoltageSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIAccel4WireDCVoltageSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIAccel4WireDCVoltageSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIAccel4WireDCVoltageSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIAccel4WireDCVoltageSensitivityUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIAccel4WireDCVoltageSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIAccelSensitivity(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIAccelSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIAccelSensitivity(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIAccelSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIAccelSensitivity(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIAccelSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIAccelSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIAccelSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIAccelSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIAccelSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIAccelSensitivityUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIAccelSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIAccelChargeSensitivity(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIAccelChargeSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIAccelChargeSensitivity(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIAccelChargeSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIAccelChargeSensitivity(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIAccelChargeSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIAccelChargeSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIAccelChargeSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIAccelChargeSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIAccelChargeSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIAccelChargeSensitivityUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIAccelChargeSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIVelocityUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIVelocityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIVelocityUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIVelocityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIVelocityUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIVelocityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIVelocityIEPESensordBRef(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIVelocityIEPESensordBRef, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIVelocityIEPESensordBRef(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIVelocityIEPESensordBRef, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIVelocityIEPESensordBRef(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIVelocityIEPESensordBRef, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIVelocityIEPESensorSensitivity(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIVelocityIEPESensorSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIVelocityIEPESensorSensitivity(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIVelocityIEPESensorSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIVelocityIEPESensorSensitivity(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIVelocityIEPESensorSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIVelocityIEPESensorSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIVelocityIEPESensorSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIVelocityIEPESensorSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIVelocityIEPESensorSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIVelocityIEPESensorSensitivityUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIVelocityIEPESensorSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIForceUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIForceUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIForceUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIForceUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIForceUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIForceUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIForceIEPESensorSensitivity(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIForceIEPESensorSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIForceIEPESensorSensitivity(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIForceIEPESensorSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIForceIEPESensorSensitivity(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIForceIEPESensorSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIForceIEPESensorSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIForceIEPESensorSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIForceIEPESensorSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIForceIEPESensorSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIForceIEPESensorSensitivityUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIForceIEPESensorSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIPressureUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIPressureUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIPressureUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIPressureUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIPressureUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIPressureUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAITorqueUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAITorqueUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAITorqueUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAITorqueUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAITorqueUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAITorqueUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIBridgeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIBridgeUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIBridgeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIBridgeUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeElectricalUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIBridgeElectricalUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIBridgeElectricalUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIBridgeElectricalUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIBridgeElectricalUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeElectricalUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgePhysicalUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIBridgePhysicalUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIBridgePhysicalUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIBridgePhysicalUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIBridgePhysicalUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgePhysicalUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeScaleType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIBridgeScaleType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIBridgeScaleType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIBridgeScaleType, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIBridgeScaleType(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeScaleType, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeTwoPointLinFirstElectricalVal(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIBridgeTwoPointLinFirstElectricalVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeTwoPointLinFirstElectricalVal(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIBridgeTwoPointLinFirstElectricalVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeTwoPointLinFirstElectricalVal(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeTwoPointLinFirstElectricalVal, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeTwoPointLinFirstPhysicalVal(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIBridgeTwoPointLinFirstPhysicalVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeTwoPointLinFirstPhysicalVal(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIBridgeTwoPointLinFirstPhysicalVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeTwoPointLinFirstPhysicalVal(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeTwoPointLinFirstPhysicalVal, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeTwoPointLinSecondElectricalVal(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIBridgeTwoPointLinSecondElectricalVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeTwoPointLinSecondElectricalVal(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIBridgeTwoPointLinSecondElectricalVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeTwoPointLinSecondElectricalVal(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeTwoPointLinSecondElectricalVal, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeTwoPointLinSecondPhysicalVal(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIBridgeTwoPointLinSecondPhysicalVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeTwoPointLinSecondPhysicalVal(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIBridgeTwoPointLinSecondPhysicalVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeTwoPointLinSecondPhysicalVal(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeTwoPointLinSecondPhysicalVal, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeTableElectricalVals(taskHandle::TaskHandle, channel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetAIBridgeTableElectricalVals, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function SetAIBridgeTableElectricalVals(taskHandle::TaskHandle, channel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxSetAIBridgeTableElectricalVals, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function ResetAIBridgeTableElectricalVals(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeTableElectricalVals, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeTablePhysicalVals(taskHandle::TaskHandle, channel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetAIBridgeTablePhysicalVals, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function SetAIBridgeTablePhysicalVals(taskHandle::TaskHandle, channel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxSetAIBridgeTablePhysicalVals, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function ResetAIBridgeTablePhysicalVals(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeTablePhysicalVals, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgePolyForwardCoeff(taskHandle::TaskHandle, channel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetAIBridgePolyForwardCoeff, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function SetAIBridgePolyForwardCoeff(taskHandle::TaskHandle, channel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxSetAIBridgePolyForwardCoeff, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function ResetAIBridgePolyForwardCoeff(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgePolyForwardCoeff, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgePolyReverseCoeff(taskHandle::TaskHandle, channel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetAIBridgePolyReverseCoeff, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function SetAIBridgePolyReverseCoeff(taskHandle::TaskHandle, channel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxSetAIBridgePolyReverseCoeff, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function ResetAIBridgePolyReverseCoeff(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgePolyReverseCoeff, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIChargeUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIChargeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIChargeUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIChargeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIChargeUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIChargeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIIsTEDS(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIIsTEDS, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function GetAITEDSUnits(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAITEDSUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function GetAICoupling(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAICoupling, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAICoupling(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAICoupling, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAICoupling(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAICoupling, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIImpedance(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIImpedance, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIImpedance(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIImpedance, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIImpedance(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIImpedance, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAITermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAITermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAITermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAITermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAITermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAITermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIInputSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAIInputSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetAIInputSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetAIInputSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetAIInputSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIInputSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIResistanceCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIResistanceCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIResistanceCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIResistanceCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIResistanceCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIResistanceCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAILeadWireResistance(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAILeadWireResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAILeadWireResistance(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAILeadWireResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAILeadWireResistance(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAILeadWireResistance, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIBridgeCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIBridgeCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIBridgeCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIBridgeCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeNomResistance(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIBridgeNomResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeNomResistance(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIBridgeNomResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeNomResistance(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeNomResistance, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeInitialVoltage(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIBridgeInitialVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeInitialVoltage(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIBridgeInitialVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeInitialVoltage(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeInitialVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeInitialRatio(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIBridgeInitialRatio, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeInitialRatio(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIBridgeInitialRatio, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeInitialRatio(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeInitialRatio, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeShuntCalEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIBridgeShuntCalEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIBridgeShuntCalEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAIBridgeShuntCalEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIBridgeShuntCalEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeShuntCalEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeShuntCalSelect(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIBridgeShuntCalSelect, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIBridgeShuntCalSelect(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIBridgeShuntCalSelect, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIBridgeShuntCalSelect(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeShuntCalSelect, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeShuntCalShuntCalASrc(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIBridgeShuntCalShuntCalASrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIBridgeShuntCalShuntCalASrc(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIBridgeShuntCalShuntCalASrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIBridgeShuntCalShuntCalASrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeShuntCalShuntCalASrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeShuntCalGainAdjust(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIBridgeShuntCalGainAdjust, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeShuntCalGainAdjust(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIBridgeShuntCalGainAdjust, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeShuntCalGainAdjust(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeShuntCalGainAdjust, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeShuntCalShuntCalAResistance(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIBridgeShuntCalShuntCalAResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeShuntCalShuntCalAResistance(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIBridgeShuntCalShuntCalAResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeShuntCalShuntCalAResistance(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeShuntCalShuntCalAResistance, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeShuntCalShuntCalAActualResistance(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIBridgeShuntCalShuntCalAActualResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeShuntCalShuntCalAActualResistance(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIBridgeShuntCalShuntCalAActualResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeShuntCalShuntCalAActualResistance(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeShuntCalShuntCalAActualResistance, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeShuntCalShuntCalBResistance(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIBridgeShuntCalShuntCalBResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeShuntCalShuntCalBResistance(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIBridgeShuntCalShuntCalBResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeShuntCalShuntCalBResistance(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeShuntCalShuntCalBResistance, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeShuntCalShuntCalBActualResistance(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIBridgeShuntCalShuntCalBActualResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeShuntCalShuntCalBActualResistance(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIBridgeShuntCalShuntCalBActualResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeShuntCalShuntCalBActualResistance(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeShuntCalShuntCalBActualResistance, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeBalanceCoarsePot(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIBridgeBalanceCoarsePot, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIBridgeBalanceCoarsePot(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIBridgeBalanceCoarsePot, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIBridgeBalanceCoarsePot(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeBalanceCoarsePot, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeBalanceFinePot(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIBridgeBalanceFinePot, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIBridgeBalanceFinePot(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIBridgeBalanceFinePot, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIBridgeBalanceFinePot(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeBalanceFinePot, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAICurrentShuntLoc(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAICurrentShuntLoc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAICurrentShuntLoc(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAICurrentShuntLoc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAICurrentShuntLoc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAICurrentShuntLoc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAICurrentShuntResistance(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAICurrentShuntResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAICurrentShuntResistance(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAICurrentShuntResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAICurrentShuntResistance(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAICurrentShuntResistance, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIExcitSense(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIExcitSense, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIExcitSense(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIExcitSense, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIExcitSense(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIExcitSense, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIExcitSrc(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIExcitSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIExcitSrc(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIExcitSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIExcitSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIExcitSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIExcitVal(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIExcitVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIExcitVal(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIExcitVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIExcitVal(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIExcitVal, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIExcitUseForScaling(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIExcitUseForScaling, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIExcitUseForScaling(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAIExcitUseForScaling, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIExcitUseForScaling(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIExcitUseForScaling, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIExcitUseMultiplexed(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIExcitUseMultiplexed, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIExcitUseMultiplexed(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAIExcitUseMultiplexed, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIExcitUseMultiplexed(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIExcitUseMultiplexed, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIExcitActualVal(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIExcitActualVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIExcitActualVal(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIExcitActualVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIExcitActualVal(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIExcitActualVal, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIExcitDCorAC(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIExcitDCorAC, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIExcitDCorAC(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIExcitDCorAC, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIExcitDCorAC(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIExcitDCorAC, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIExcitVoltageOrCurrent(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIExcitVoltageOrCurrent, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIExcitVoltageOrCurrent(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIExcitVoltageOrCurrent, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIExcitVoltageOrCurrent(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIExcitVoltageOrCurrent, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIExcitIdleOutputBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIExcitIdleOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIExcitIdleOutputBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIExcitIdleOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIExcitIdleOutputBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIExcitIdleOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIACExcitFreq(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIACExcitFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIACExcitFreq(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIACExcitFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIACExcitFreq(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIACExcitFreq, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIACExcitSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIACExcitSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIACExcitSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAIACExcitSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIACExcitSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIACExcitSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIACExcitWireMode(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIACExcitWireMode, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIACExcitWireMode(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIACExcitWireMode, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIACExcitWireMode(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIACExcitWireMode, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAISensorPowerVoltage(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAISensorPowerVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAISensorPowerVoltage(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAISensorPowerVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAISensorPowerVoltage(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAISensorPowerVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAISensorPowerCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAISensorPowerCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAISensorPowerCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAISensorPowerCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAISensorPowerCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAISensorPowerCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAISensorPowerType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAISensorPowerType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAISensorPowerType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAISensorPowerType, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAISensorPowerType(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAISensorPowerType, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIOpenThrmcplDetectEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIOpenThrmcplDetectEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIOpenThrmcplDetectEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAIOpenThrmcplDetectEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIOpenThrmcplDetectEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIOpenThrmcplDetectEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIThrmcplLeadOffsetVoltage(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIThrmcplLeadOffsetVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIThrmcplLeadOffsetVoltage(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIThrmcplLeadOffsetVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIThrmcplLeadOffsetVoltage(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIThrmcplLeadOffsetVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIAtten(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIAtten, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIAtten(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIAtten, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIAtten(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIAtten, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIProbeAtten(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIProbeAtten, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIProbeAtten(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIProbeAtten, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIProbeAtten(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIProbeAtten, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAILowpassEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAILowpassEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAILowpassEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAILowpassEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAILowpassEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAILowpassEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAILowpassCutoffFreq(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAILowpassCutoffFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAILowpassCutoffFreq(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAILowpassCutoffFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAILowpassCutoffFreq(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAILowpassCutoffFreq, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAILowpassSwitchCapClkSrc(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAILowpassSwitchCapClkSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAILowpassSwitchCapClkSrc(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAILowpassSwitchCapClkSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAILowpassSwitchCapClkSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAILowpassSwitchCapClkSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAILowpassSwitchCapExtClkFreq(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAILowpassSwitchCapExtClkFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAILowpassSwitchCapExtClkFreq(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAILowpassSwitchCapExtClkFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAILowpassSwitchCapExtClkFreq(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAILowpassSwitchCapExtClkFreq, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAILowpassSwitchCapExtClkDiv(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAILowpassSwitchCapExtClkDiv, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAILowpassSwitchCapExtClkDiv(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAILowpassSwitchCapExtClkDiv, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAILowpassSwitchCapExtClkDiv(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAILowpassSwitchCapExtClkDiv, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAILowpassSwitchCapOutClkDiv(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAILowpassSwitchCapOutClkDiv, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAILowpassSwitchCapOutClkDiv(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAILowpassSwitchCapOutClkDiv, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAILowpassSwitchCapOutClkDiv(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAILowpassSwitchCapOutClkDiv, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAIDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDigFltrType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIDigFltrType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIDigFltrType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIDigFltrType, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIDigFltrType(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDigFltrType, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDigFltrResponse(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIDigFltrResponse, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIDigFltrResponse(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIDigFltrResponse, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIDigFltrResponse(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDigFltrResponse, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDigFltrOrder(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIDigFltrOrder, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIDigFltrOrder(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAIDigFltrOrder, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIDigFltrOrder(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDigFltrOrder, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDigFltrLowpassCutoffFreq(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIDigFltrLowpassCutoffFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIDigFltrLowpassCutoffFreq(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIDigFltrLowpassCutoffFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIDigFltrLowpassCutoffFreq(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDigFltrLowpassCutoffFreq, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDigFltrHighpassCutoffFreq(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIDigFltrHighpassCutoffFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIDigFltrHighpassCutoffFreq(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIDigFltrHighpassCutoffFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIDigFltrHighpassCutoffFreq(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDigFltrHighpassCutoffFreq, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDigFltrBandpassCenterFreq(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIDigFltrBandpassCenterFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIDigFltrBandpassCenterFreq(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIDigFltrBandpassCenterFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIDigFltrBandpassCenterFreq(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDigFltrBandpassCenterFreq, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDigFltrBandpassWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIDigFltrBandpassWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIDigFltrBandpassWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIDigFltrBandpassWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIDigFltrBandpassWidth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDigFltrBandpassWidth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDigFltrNotchCenterFreq(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIDigFltrNotchCenterFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIDigFltrNotchCenterFreq(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIDigFltrNotchCenterFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIDigFltrNotchCenterFreq(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDigFltrNotchCenterFreq, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDigFltrNotchWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIDigFltrNotchWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIDigFltrNotchWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIDigFltrNotchWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIDigFltrNotchWidth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDigFltrNotchWidth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDigFltrCoeff(taskHandle::TaskHandle, channel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetAIDigFltrCoeff, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function SetAIDigFltrCoeff(taskHandle::TaskHandle, channel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxSetAIDigFltrCoeff, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function ResetAIDigFltrCoeff(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDigFltrCoeff, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIFilterEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIFilterEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIFilterEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAIFilterEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIFilterEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIFilterEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIFilterFreq(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIFilterFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIFilterFreq(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIFilterFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIFilterFreq(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIFilterFreq, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIFilterResponse(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIFilterResponse, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIFilterResponse(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIFilterResponse, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIFilterResponse(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIFilterResponse, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIFilterOrder(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIFilterOrder, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIFilterOrder(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAIFilterOrder, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIFilterOrder(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIFilterOrder, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIFilterDelay(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIFilterDelay, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function GetAIFilterDelayUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIFilterDelayUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIFilterDelayUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIFilterDelayUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIFilterDelayUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIFilterDelayUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIRemoveFilterDelay(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIRemoveFilterDelay, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIRemoveFilterDelay(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAIRemoveFilterDelay, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIRemoveFilterDelay(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRemoveFilterDelay, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIFilterDelayAdjustment(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIFilterDelayAdjustment, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIFilterDelayAdjustment(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIFilterDelayAdjustment, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIFilterDelayAdjustment(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIFilterDelayAdjustment, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIAveragingWinSize(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIAveragingWinSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIAveragingWinSize(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAIAveragingWinSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIAveragingWinSize(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIAveragingWinSize, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIResolutionUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIResolutionUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function GetAIResolution(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIResolution, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function GetAIRawSampSize(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIRawSampSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function GetAIRawSampJustification(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIRawSampJustification, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function GetAIADCTimingMode(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIADCTimingMode, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIADCTimingMode(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIADCTimingMode, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIADCTimingMode(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIADCTimingMode, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIADCCustomTimingMode(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIADCCustomTimingMode, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIADCCustomTimingMode(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAIADCCustomTimingMode, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIADCCustomTimingMode(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIADCCustomTimingMode, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDitherEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIDitherEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIDitherEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAIDitherEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIDitherEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDitherEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIChanCalHasValidCalInfo(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIChanCalHasValidCalInfo, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function GetAIChanCalEnableCal(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIChanCalEnableCal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIChanCalEnableCal(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAIChanCalEnableCal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIChanCalEnableCal(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIChanCalEnableCal, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIChanCalApplyCalIfExp(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIChanCalApplyCalIfExp, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIChanCalApplyCalIfExp(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAIChanCalApplyCalIfExp, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIChanCalApplyCalIfExp(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIChanCalApplyCalIfExp, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIChanCalScaleType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIChanCalScaleType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIChanCalScaleType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIChanCalScaleType, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIChanCalScaleType(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIChanCalScaleType, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIChanCalTablePreScaledVals(taskHandle::TaskHandle, channel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetAIChanCalTablePreScaledVals, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function SetAIChanCalTablePreScaledVals(taskHandle::TaskHandle, channel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxSetAIChanCalTablePreScaledVals, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function ResetAIChanCalTablePreScaledVals(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIChanCalTablePreScaledVals, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIChanCalTableScaledVals(taskHandle::TaskHandle, channel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetAIChanCalTableScaledVals, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function SetAIChanCalTableScaledVals(taskHandle::TaskHandle, channel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxSetAIChanCalTableScaledVals, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function ResetAIChanCalTableScaledVals(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIChanCalTableScaledVals, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIChanCalPolyForwardCoeff(taskHandle::TaskHandle, channel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetAIChanCalPolyForwardCoeff, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function SetAIChanCalPolyForwardCoeff(taskHandle::TaskHandle, channel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxSetAIChanCalPolyForwardCoeff, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function ResetAIChanCalPolyForwardCoeff(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIChanCalPolyForwardCoeff, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIChanCalPolyReverseCoeff(taskHandle::TaskHandle, channel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetAIChanCalPolyReverseCoeff, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function SetAIChanCalPolyReverseCoeff(taskHandle::TaskHandle, channel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxSetAIChanCalPolyReverseCoeff, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function ResetAIChanCalPolyReverseCoeff(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIChanCalPolyReverseCoeff, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIChanCalOperatorName(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAIChanCalOperatorName, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetAIChanCalOperatorName(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetAIChanCalOperatorName, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetAIChanCalOperatorName(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIChanCalOperatorName, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIChanCalDesc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAIChanCalDesc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetAIChanCalDesc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetAIChanCalDesc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetAIChanCalDesc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIChanCalDesc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIChanCalVerifRefVals(taskHandle::TaskHandle, channel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetAIChanCalVerifRefVals, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function SetAIChanCalVerifRefVals(taskHandle::TaskHandle, channel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxSetAIChanCalVerifRefVals, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function ResetAIChanCalVerifRefVals(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIChanCalVerifRefVals, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIChanCalVerifAcqVals(taskHandle::TaskHandle, channel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetAIChanCalVerifAcqVals, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function SetAIChanCalVerifAcqVals(taskHandle::TaskHandle, channel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxSetAIChanCalVerifAcqVals, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function ResetAIChanCalVerifAcqVals(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIChanCalVerifAcqVals, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIRngHigh(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIRngHigh, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIRngHigh(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIRngHigh, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIRngHigh(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRngHigh, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIRngLow(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIRngLow, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIRngLow(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIRngLow, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIRngLow(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRngLow, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDCOffset(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIDCOffset, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIDCOffset(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIDCOffset, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIDCOffset(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDCOffset, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIGain(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIGain, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIGain(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIGain, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIGain(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIGain, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAISampAndHoldEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAISampAndHoldEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAISampAndHoldEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAISampAndHoldEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAISampAndHoldEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAISampAndHoldEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIAutoZeroMode(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIAutoZeroMode, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIAutoZeroMode(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIAutoZeroMode, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIAutoZeroMode(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIAutoZeroMode, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIChopEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIChopEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIChopEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAIChopEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIChopEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIChopEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDataXferMaxRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAIDataXferMaxRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIDataXferMaxRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAIDataXferMaxRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIDataXferMaxRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDataXferMaxRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDataXferMech(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIDataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIDataXferMech(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIDataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIDataXferMech(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDataXferReqCond(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIDataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIDataXferReqCond(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIDataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIDataXferReqCond(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDataXferCustomThreshold(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIDataXferCustomThreshold, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIDataXferCustomThreshold(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAIDataXferCustomThreshold, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIDataXferCustomThreshold(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDataXferCustomThreshold, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIUsbXferReqSize(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIUsbXferReqSize(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAIUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIUsbXferReqSize(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIUsbXferReqCount(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIUsbXferReqCount(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAIUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIUsbXferReqCount(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIMemMapEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIMemMapEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAIMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIMemMapEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIRawDataCompressionType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAIRawDataCompressionType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIRawDataCompressionType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAIRawDataCompressionType, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIRawDataCompressionType(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRawDataCompressionType, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAILossyLSBRemovalCompressedSampSize(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAILossyLSBRemovalCompressedSampSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAILossyLSBRemovalCompressedSampSize(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAILossyLSBRemovalCompressedSampSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAILossyLSBRemovalCompressedSampSize(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAILossyLSBRemovalCompressedSampSize, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDevScalingCoeff(taskHandle::TaskHandle, channel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetAIDevScalingCoeff, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function GetAIEnhancedAliasRejectionEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIEnhancedAliasRejectionEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIEnhancedAliasRejectionEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAIEnhancedAliasRejectionEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIEnhancedAliasRejectionEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIEnhancedAliasRejectionEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIOpenChanDetectEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIOpenChanDetectEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIOpenChanDetectEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAIOpenChanDetectEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIOpenChanDetectEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIOpenChanDetectEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOMax(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAOMax, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOMax(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAOMax, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAOMax(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOMax, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOMin(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAOMin, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOMin(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAOMin, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAOMin(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOMin, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOCustomScaleName(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAOCustomScaleName, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetAOCustomScaleName(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetAOCustomScaleName, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetAOCustomScaleName(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOCustomScaleName, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOOutputType(taskHandle::TaskHandle, channel::String, data::Ref{Int32})
    ccall((:DAQmxGetAOOutputType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function GetAOVoltageUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAOVoltageUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAOVoltageUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAOVoltageUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAOVoltageUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOVoltageUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOVoltageCurrentLimit(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAOVoltageCurrentLimit, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOVoltageCurrentLimit(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAOVoltageCurrentLimit, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAOVoltageCurrentLimit(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOVoltageCurrentLimit, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOCurrentUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAOCurrentUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAOCurrentUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAOCurrentUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAOCurrentUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOCurrentUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOFuncGenType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAOFuncGenType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAOFuncGenType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAOFuncGenType, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAOFuncGenType(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOFuncGenType, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOFuncGenFreq(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAOFuncGenFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOFuncGenFreq(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAOFuncGenFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAOFuncGenFreq(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOFuncGenFreq, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOFuncGenAmplitude(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAOFuncGenAmplitude, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOFuncGenAmplitude(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAOFuncGenAmplitude, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAOFuncGenAmplitude(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOFuncGenAmplitude, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOFuncGenOffset(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAOFuncGenOffset, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOFuncGenOffset(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAOFuncGenOffset, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAOFuncGenOffset(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOFuncGenOffset, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOFuncGenSquareDutyCycle(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAOFuncGenSquareDutyCycle, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOFuncGenSquareDutyCycle(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAOFuncGenSquareDutyCycle, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAOFuncGenSquareDutyCycle(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOFuncGenSquareDutyCycle, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOFuncGenModulationType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAOFuncGenModulationType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAOFuncGenModulationType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAOFuncGenModulationType, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAOFuncGenModulationType(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOFuncGenModulationType, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOFuncGenFMDeviation(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAOFuncGenFMDeviation, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOFuncGenFMDeviation(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAOFuncGenFMDeviation, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAOFuncGenFMDeviation(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOFuncGenFMDeviation, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOOutputImpedance(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAOOutputImpedance, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOOutputImpedance(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAOOutputImpedance, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAOOutputImpedance(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOOutputImpedance, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOLoadImpedance(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAOLoadImpedance, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOLoadImpedance(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAOLoadImpedance, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAOLoadImpedance(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOLoadImpedance, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOIdleOutputBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAOIdleOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAOIdleOutputBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAOIdleOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAOIdleOutputBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOIdleOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAOTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAOTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAOTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAOTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOResolutionUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAOResolutionUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAOResolutionUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAOResolutionUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAOResolutionUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOResolutionUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOResolution(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAOResolution, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function GetAODACRngHigh(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAODACRngHigh, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAODACRngHigh(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAODACRngHigh, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAODACRngHigh(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAODACRngHigh, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAODACRngLow(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAODACRngLow, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAODACRngLow(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAODACRngLow, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAODACRngLow(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAODACRngLow, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAODACRefConnToGnd(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAODACRefConnToGnd, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAODACRefConnToGnd(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAODACRefConnToGnd, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAODACRefConnToGnd(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAODACRefConnToGnd, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAODACRefAllowConnToGnd(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAODACRefAllowConnToGnd, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAODACRefAllowConnToGnd(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAODACRefAllowConnToGnd, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAODACRefAllowConnToGnd(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAODACRefAllowConnToGnd, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAODACRefSrc(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAODACRefSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAODACRefSrc(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAODACRefSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAODACRefSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAODACRefSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAODACRefExtSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAODACRefExtSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetAODACRefExtSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetAODACRefExtSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetAODACRefExtSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAODACRefExtSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAODACRefVal(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAODACRefVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAODACRefVal(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAODACRefVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAODACRefVal(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAODACRefVal, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAODACOffsetSrc(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAODACOffsetSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAODACOffsetSrc(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAODACOffsetSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAODACOffsetSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAODACOffsetSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAODACOffsetExtSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAODACOffsetExtSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetAODACOffsetExtSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetAODACOffsetExtSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetAODACOffsetExtSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAODACOffsetExtSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAODACOffsetVal(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAODACOffsetVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAODACOffsetVal(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAODACOffsetVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAODACOffsetVal(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAODACOffsetVal, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOReglitchEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAOReglitchEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAOReglitchEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAOReglitchEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAOReglitchEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOReglitchEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOFilterDelay(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAOFilterDelay, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOFilterDelay(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAOFilterDelay, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAOFilterDelay(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOFilterDelay, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOFilterDelayUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAOFilterDelayUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAOFilterDelayUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAOFilterDelayUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAOFilterDelayUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOFilterDelayUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOFilterDelayAdjustment(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAOFilterDelayAdjustment, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOFilterDelayAdjustment(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAOFilterDelayAdjustment, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAOFilterDelayAdjustment(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOFilterDelayAdjustment, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOGain(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetAOGain, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOGain(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetAOGain, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAOGain(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOGain, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOUseOnlyOnBrdMem(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAOUseOnlyOnBrdMem, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAOUseOnlyOnBrdMem(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAOUseOnlyOnBrdMem, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAOUseOnlyOnBrdMem(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOUseOnlyOnBrdMem, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAODataXferMech(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAODataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAODataXferMech(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAODataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAODataXferMech(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAODataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAODataXferReqCond(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetAODataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAODataXferReqCond(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetAODataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAODataXferReqCond(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAODataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOUsbXferReqSize(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAOUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAOUsbXferReqSize(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAOUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAOUsbXferReqSize(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOUsbXferReqCount(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAOUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAOUsbXferReqCount(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAOUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAOUsbXferReqCount(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOMemMapEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAOMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAOMemMapEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAOMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAOMemMapEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAODevScalingCoeff(taskHandle::TaskHandle, channel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetAODevScalingCoeff, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function GetAOEnhancedImageRejectionEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAOEnhancedImageRejectionEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAOEnhancedImageRejectionEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAOEnhancedImageRejectionEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAOEnhancedImageRejectionEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOEnhancedImageRejectionEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDIInvertLines(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetDIInvertLines, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDIInvertLines(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetDIInvertLines, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDIInvertLines(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDIInvertLines, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDINumLines(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetDINumLines, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function GetDIDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetDIDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDIDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetDIDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDIDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDIDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDIDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetDIDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetDIDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetDIDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetDIDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDIDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDIDigFltrEnableBusMode(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetDIDigFltrEnableBusMode, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDIDigFltrEnableBusMode(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetDIDigFltrEnableBusMode, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDIDigFltrEnableBusMode(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDIDigFltrEnableBusMode, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDIDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDIDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetDIDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetDIDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetDIDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDIDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDIDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetDIDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetDIDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetDIDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetDIDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDIDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDIDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetDIDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDIDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetDIDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDIDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDIDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDITristate(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetDITristate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDITristate(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetDITristate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDITristate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDITristate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDILogicFamily(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetDILogicFamily, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetDILogicFamily(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetDILogicFamily, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetDILogicFamily(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDILogicFamily, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDIDataXferMech(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetDIDataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetDIDataXferMech(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetDIDataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetDIDataXferMech(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDIDataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDIDataXferReqCond(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetDIDataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetDIDataXferReqCond(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetDIDataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetDIDataXferReqCond(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDIDataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDIUsbXferReqSize(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetDIUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDIUsbXferReqSize(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetDIUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDIUsbXferReqSize(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDIUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDIUsbXferReqCount(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetDIUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDIUsbXferReqCount(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetDIUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDIUsbXferReqCount(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDIUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDIMemMapEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetDIMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDIMemMapEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetDIMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDIMemMapEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDIMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDIAcquireOn(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetDIAcquireOn, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetDIAcquireOn(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetDIAcquireOn, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetDIAcquireOn(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDIAcquireOn, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOOutputDriveType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetDOOutputDriveType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetDOOutputDriveType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetDOOutputDriveType, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetDOOutputDriveType(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOOutputDriveType, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOInvertLines(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetDOInvertLines, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDOInvertLines(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetDOInvertLines, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDOInvertLines(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOInvertLines, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDONumLines(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetDONumLines, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function GetDOTristate(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetDOTristate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDOTristate(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetDOTristate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDOTristate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOTristate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOLineStatesStartState(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetDOLineStatesStartState, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetDOLineStatesStartState(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetDOLineStatesStartState, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetDOLineStatesStartState(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOLineStatesStartState, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOLineStatesPausedState(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetDOLineStatesPausedState, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetDOLineStatesPausedState(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetDOLineStatesPausedState, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetDOLineStatesPausedState(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOLineStatesPausedState, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOLineStatesDoneState(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetDOLineStatesDoneState, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetDOLineStatesDoneState(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetDOLineStatesDoneState, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetDOLineStatesDoneState(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOLineStatesDoneState, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOLogicFamily(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetDOLogicFamily, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetDOLogicFamily(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetDOLogicFamily, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetDOLogicFamily(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOLogicFamily, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOOvercurrentLimit(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetDOOvercurrentLimit, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetDOOvercurrentLimit(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetDOOvercurrentLimit, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetDOOvercurrentLimit(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOOvercurrentLimit, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOOvercurrentAutoReenable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetDOOvercurrentAutoReenable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDOOvercurrentAutoReenable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetDOOvercurrentAutoReenable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDOOvercurrentAutoReenable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOOvercurrentAutoReenable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOOvercurrentReenablePeriod(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetDOOvercurrentReenablePeriod, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetDOOvercurrentReenablePeriod(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetDOOvercurrentReenablePeriod, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetDOOvercurrentReenablePeriod(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOOvercurrentReenablePeriod, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOUseOnlyOnBrdMem(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetDOUseOnlyOnBrdMem, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDOUseOnlyOnBrdMem(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetDOUseOnlyOnBrdMem, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDOUseOnlyOnBrdMem(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOUseOnlyOnBrdMem, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDODataXferMech(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetDODataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetDODataXferMech(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetDODataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetDODataXferMech(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDODataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDODataXferReqCond(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetDODataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetDODataXferReqCond(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetDODataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetDODataXferReqCond(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDODataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOUsbXferReqSize(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetDOUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDOUsbXferReqSize(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetDOUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDOUsbXferReqSize(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOUsbXferReqCount(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetDOUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDOUsbXferReqCount(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetDOUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDOUsbXferReqCount(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOMemMapEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetDOMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDOMemMapEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetDOMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDOMemMapEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOGenerateOn(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetDOGenerateOn, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetDOGenerateOn(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetDOGenerateOn, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetDOGenerateOn(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOGenerateOn, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIMax(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIMax, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIMax(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIMax, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIMax(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIMax, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIMin(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIMin, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIMin(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIMin, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIMin(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIMin, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICustomScaleName(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCICustomScaleName, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCICustomScaleName(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCICustomScaleName, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCICustomScaleName(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICustomScaleName, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIMeasType(taskHandle::TaskHandle, channel::String, data::Ref{Int32})
    ccall((:DAQmxGetCIMeasType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function GetCIFreqUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIFreqUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIFreqUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIFreqUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIFreqUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIFreqUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIFreqTerm(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCIFreqTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIFreqTerm(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCIFreqTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCIFreqTerm(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIFreqTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIFreqTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIFreqTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIFreqTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIFreqTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIFreqTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIFreqTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIFreqLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIFreqLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIFreqLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIFreqLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIFreqLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIFreqLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIFreqDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIFreqDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIFreqDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIFreqDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIFreqDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIFreqDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIFreqDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIFreqDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIFreqDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIFreqDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIFreqDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIFreqDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIFreqDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCIFreqDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIFreqDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCIFreqDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCIFreqDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIFreqDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIFreqDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIFreqDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIFreqDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIFreqDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIFreqDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIFreqDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIFreqDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIFreqDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIFreqDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIFreqDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIFreqDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIFreqDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIFreqStartingEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIFreqStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIFreqStartingEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIFreqStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIFreqStartingEdge(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIFreqStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIFreqMeasMeth(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIFreqMeasMeth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIFreqMeasMeth(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIFreqMeasMeth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIFreqMeasMeth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIFreqMeasMeth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIFreqEnableAveraging(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIFreqEnableAveraging, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIFreqEnableAveraging(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIFreqEnableAveraging, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIFreqEnableAveraging(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIFreqEnableAveraging, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIFreqMeasTime(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIFreqMeasTime, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIFreqMeasTime(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIFreqMeasTime, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIFreqMeasTime(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIFreqMeasTime, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIFreqDiv(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIFreqDiv, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIFreqDiv(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIFreqDiv, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIFreqDiv(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIFreqDiv, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPeriodUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIPeriodUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPeriodUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIPeriodUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPeriodUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPeriodUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPeriodTerm(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCIPeriodTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIPeriodTerm(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCIPeriodTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCIPeriodTerm(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPeriodTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPeriodTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIPeriodTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPeriodTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIPeriodTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPeriodTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPeriodTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPeriodLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIPeriodLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPeriodLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIPeriodLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPeriodLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPeriodLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPeriodDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIPeriodDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPeriodDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIPeriodDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIPeriodDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPeriodDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPeriodDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIPeriodDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPeriodDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIPeriodDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIPeriodDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPeriodDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPeriodDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCIPeriodDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIPeriodDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCIPeriodDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCIPeriodDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPeriodDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPeriodDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIPeriodDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPeriodDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIPeriodDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIPeriodDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPeriodDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPeriodDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIPeriodDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPeriodDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIPeriodDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIPeriodDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPeriodDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPeriodStartingEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIPeriodStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPeriodStartingEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIPeriodStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPeriodStartingEdge(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPeriodStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPeriodMeasMeth(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIPeriodMeasMeth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPeriodMeasMeth(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIPeriodMeasMeth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPeriodMeasMeth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPeriodMeasMeth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPeriodEnableAveraging(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIPeriodEnableAveraging, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPeriodEnableAveraging(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIPeriodEnableAveraging, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIPeriodEnableAveraging(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPeriodEnableAveraging, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPeriodMeasTime(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIPeriodMeasTime, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPeriodMeasTime(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIPeriodMeasTime, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIPeriodMeasTime(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPeriodMeasTime, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPeriodDiv(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIPeriodDiv, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPeriodDiv(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIPeriodDiv, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIPeriodDiv(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPeriodDiv, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesTerm(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCICountEdgesTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCICountEdgesTerm(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCICountEdgesTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCICountEdgesTerm(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCICountEdgesTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCICountEdgesTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCICountEdgesLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCICountEdgesLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCICountEdgesDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCICountEdgesDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCICountEdgesDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICountEdgesDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCICountEdgesDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCICountEdgesDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCICountEdgesDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCICountEdgesDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCICountEdgesDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCICountEdgesDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCICountEdgesDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICountEdgesDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCICountEdgesDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCICountEdgesDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCICountEdgesDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCICountEdgesDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesDir(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCICountEdgesDir, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesDir(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCICountEdgesDir, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesDir(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesDir, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesDirTerm(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCICountEdgesDirTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCICountEdgesDirTerm(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCICountEdgesDirTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCICountEdgesDirTerm(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesDirTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountDirTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCICountEdgesCountDirTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesCountDirTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCICountEdgesCountDirTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesCountDirTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountDirTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountDirLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCICountEdgesCountDirLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesCountDirLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCICountEdgesCountDirLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesCountDirLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountDirLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountDirDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCICountEdgesCountDirDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesCountDirDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCICountEdgesCountDirDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesCountDirDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountDirDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountDirDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCICountEdgesCountDirDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICountEdgesCountDirDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCICountEdgesCountDirDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCICountEdgesCountDirDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountDirDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountDirDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCICountEdgesCountDirDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCICountEdgesCountDirDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCICountEdgesCountDirDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCICountEdgesCountDirDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountDirDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountDirDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCICountEdgesCountDirDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICountEdgesCountDirDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCICountEdgesCountDirDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCICountEdgesCountDirDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountDirDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountDirDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCICountEdgesCountDirDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesCountDirDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCICountEdgesCountDirDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesCountDirDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountDirDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesInitialCnt(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCICountEdgesInitialCnt, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesInitialCnt(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCICountEdgesInitialCnt, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesInitialCnt(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesInitialCnt, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesActiveEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCICountEdgesActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesActiveEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCICountEdgesActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesActiveEdge(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountResetEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCICountEdgesCountResetEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesCountResetEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCICountEdgesCountResetEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountResetEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountResetResetCount(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCICountEdgesCountResetResetCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesCountResetResetCount(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCICountEdgesCountResetResetCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetResetCount(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountResetResetCount, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountResetTerm(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCICountEdgesCountResetTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCICountEdgesCountResetTerm(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCICountEdgesCountResetTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetTerm(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountResetTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountResetTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCICountEdgesCountResetTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesCountResetTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCICountEdgesCountResetTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountResetTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountResetLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCICountEdgesCountResetLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesCountResetLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCICountEdgesCountResetLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountResetLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountResetDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCICountEdgesCountResetDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesCountResetDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCICountEdgesCountResetDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountResetDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountResetDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCICountEdgesCountResetDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICountEdgesCountResetDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCICountEdgesCountResetDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountResetDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountResetDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCICountEdgesCountResetDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCICountEdgesCountResetDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCICountEdgesCountResetDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountResetDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountResetDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCICountEdgesCountResetDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICountEdgesCountResetDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCICountEdgesCountResetDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountResetDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountResetDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCICountEdgesCountResetDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesCountResetDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCICountEdgesCountResetDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountResetDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountResetActiveEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCICountEdgesCountResetActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesCountResetActiveEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCICountEdgesCountResetActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetActiveEdge(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountResetActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesGateEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCICountEdgesGateEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesGateEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCICountEdgesGateEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesGateEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesGateEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesGateTerm(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCICountEdgesGateTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCICountEdgesGateTerm(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCICountEdgesGateTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCICountEdgesGateTerm(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesGateTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesGateTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCICountEdgesGateTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesGateTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCICountEdgesGateTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesGateTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesGateTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesGateLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCICountEdgesGateLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesGateLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCICountEdgesGateLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesGateLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesGateLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesGateDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCICountEdgesGateDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesGateDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCICountEdgesGateDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesGateDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesGateDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesGateDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCICountEdgesGateDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICountEdgesGateDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCICountEdgesGateDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCICountEdgesGateDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesGateDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesGateDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCICountEdgesGateDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCICountEdgesGateDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCICountEdgesGateDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCICountEdgesGateDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesGateDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesGateDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCICountEdgesGateDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICountEdgesGateDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCICountEdgesGateDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCICountEdgesGateDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesGateDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesGateWhen(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCICountEdgesGateWhen, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesGateWhen(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCICountEdgesGateWhen, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesGateWhen(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesGateWhen, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIDutyCycleTerm(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCIDutyCycleTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIDutyCycleTerm(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCIDutyCycleTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCIDutyCycleTerm(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIDutyCycleTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIDutyCycleTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIDutyCycleTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIDutyCycleTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIDutyCycleTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIDutyCycleTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIDutyCycleTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIDutyCycleLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIDutyCycleLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIDutyCycleLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIDutyCycleLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIDutyCycleLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIDutyCycleLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIDutyCycleDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIDutyCycleDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIDutyCycleDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIDutyCycleDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIDutyCycleDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIDutyCycleDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIDutyCycleDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIDutyCycleDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIDutyCycleDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIDutyCycleDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIDutyCycleDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIDutyCycleDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIDutyCycleDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCIDutyCycleDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIDutyCycleDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCIDutyCycleDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCIDutyCycleDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIDutyCycleDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIDutyCycleDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIDutyCycleDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIDutyCycleDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIDutyCycleDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIDutyCycleDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIDutyCycleDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIDutyCycleStartingEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIDutyCycleStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIDutyCycleStartingEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIDutyCycleStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIDutyCycleStartingEdge(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIDutyCycleStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIAngEncoderUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIAngEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIAngEncoderUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIAngEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIAngEncoderUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIAngEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIAngEncoderPulsesPerRev(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIAngEncoderPulsesPerRev, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIAngEncoderPulsesPerRev(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIAngEncoderPulsesPerRev, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIAngEncoderPulsesPerRev(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIAngEncoderPulsesPerRev, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIAngEncoderInitialAngle(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIAngEncoderInitialAngle, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIAngEncoderInitialAngle(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIAngEncoderInitialAngle, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIAngEncoderInitialAngle(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIAngEncoderInitialAngle, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCILinEncoderUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCILinEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCILinEncoderUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCILinEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCILinEncoderUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCILinEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCILinEncoderDistPerPulse(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCILinEncoderDistPerPulse, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCILinEncoderDistPerPulse(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCILinEncoderDistPerPulse, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCILinEncoderDistPerPulse(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCILinEncoderDistPerPulse, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCILinEncoderInitialPos(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCILinEncoderInitialPos, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCILinEncoderInitialPos(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCILinEncoderInitialPos, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCILinEncoderInitialPos(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCILinEncoderInitialPos, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderDecodingType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIEncoderDecodingType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIEncoderDecodingType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIEncoderDecodingType, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIEncoderDecodingType(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderDecodingType, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderAInputTerm(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCIEncoderAInputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIEncoderAInputTerm(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCIEncoderAInputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCIEncoderAInputTerm(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderAInputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderAInputTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIEncoderAInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIEncoderAInputTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIEncoderAInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIEncoderAInputTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderAInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderAInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIEncoderAInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIEncoderAInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIEncoderAInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIEncoderAInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderAInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderAInputDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIEncoderAInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIEncoderAInputDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIEncoderAInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIEncoderAInputDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderAInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderAInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIEncoderAInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIEncoderAInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIEncoderAInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIEncoderAInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderAInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderAInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCIEncoderAInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIEncoderAInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCIEncoderAInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCIEncoderAInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderAInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderAInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIEncoderAInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIEncoderAInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIEncoderAInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIEncoderAInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderAInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderAInputDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIEncoderAInputDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIEncoderAInputDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIEncoderAInputDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIEncoderAInputDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderAInputDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderBInputTerm(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCIEncoderBInputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIEncoderBInputTerm(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCIEncoderBInputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCIEncoderBInputTerm(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderBInputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderBInputTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIEncoderBInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIEncoderBInputTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIEncoderBInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIEncoderBInputTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderBInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderBInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIEncoderBInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIEncoderBInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIEncoderBInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIEncoderBInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderBInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderBInputDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIEncoderBInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIEncoderBInputDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIEncoderBInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIEncoderBInputDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderBInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderBInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIEncoderBInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIEncoderBInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIEncoderBInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIEncoderBInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderBInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderBInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCIEncoderBInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIEncoderBInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCIEncoderBInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCIEncoderBInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderBInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderBInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIEncoderBInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIEncoderBInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIEncoderBInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIEncoderBInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderBInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderBInputDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIEncoderBInputDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIEncoderBInputDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIEncoderBInputDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIEncoderBInputDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderBInputDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderZInputTerm(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCIEncoderZInputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIEncoderZInputTerm(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCIEncoderZInputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCIEncoderZInputTerm(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderZInputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderZInputTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIEncoderZInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIEncoderZInputTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIEncoderZInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIEncoderZInputTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderZInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderZInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIEncoderZInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIEncoderZInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIEncoderZInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIEncoderZInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderZInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderZInputDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIEncoderZInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIEncoderZInputDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIEncoderZInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIEncoderZInputDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderZInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderZInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIEncoderZInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIEncoderZInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIEncoderZInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIEncoderZInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderZInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderZInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCIEncoderZInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIEncoderZInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCIEncoderZInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCIEncoderZInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderZInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderZInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIEncoderZInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIEncoderZInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIEncoderZInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIEncoderZInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderZInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderZInputDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIEncoderZInputDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIEncoderZInputDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIEncoderZInputDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIEncoderZInputDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderZInputDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderZIndexEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIEncoderZIndexEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIEncoderZIndexEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIEncoderZIndexEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIEncoderZIndexEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderZIndexEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderZIndexVal(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIEncoderZIndexVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIEncoderZIndexVal(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIEncoderZIndexVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIEncoderZIndexVal(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderZIndexVal, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderZIndexPhase(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIEncoderZIndexPhase, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIEncoderZIndexPhase(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIEncoderZIndexPhase, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIEncoderZIndexPhase(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderZIndexPhase, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseWidthUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIPulseWidthUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseWidthUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIPulseWidthUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPulseWidthUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseWidthUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseWidthTerm(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCIPulseWidthTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIPulseWidthTerm(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCIPulseWidthTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCIPulseWidthTerm(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseWidthTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseWidthTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIPulseWidthTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseWidthTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIPulseWidthTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPulseWidthTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseWidthTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseWidthLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIPulseWidthLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseWidthLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIPulseWidthLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPulseWidthLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseWidthLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseWidthDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIPulseWidthDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPulseWidthDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIPulseWidthDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIPulseWidthDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseWidthDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseWidthDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIPulseWidthDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPulseWidthDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIPulseWidthDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIPulseWidthDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseWidthDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseWidthDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCIPulseWidthDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIPulseWidthDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCIPulseWidthDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCIPulseWidthDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseWidthDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseWidthDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIPulseWidthDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPulseWidthDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIPulseWidthDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIPulseWidthDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseWidthDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseWidthDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIPulseWidthDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPulseWidthDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIPulseWidthDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIPulseWidthDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseWidthDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseWidthStartingEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIPulseWidthStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseWidthStartingEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIPulseWidthStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPulseWidthStartingEdge(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseWidthStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITimestampUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCITimestampUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCITimestampUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCITimestampUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCITimestampUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITimestampUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITimestampInitialSeconds(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCITimestampInitialSeconds, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCITimestampInitialSeconds(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCITimestampInitialSeconds, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCITimestampInitialSeconds(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITimestampInitialSeconds, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIGPSSyncMethod(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIGPSSyncMethod, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIGPSSyncMethod(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIGPSSyncMethod, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIGPSSyncMethod(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIGPSSyncMethod, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIGPSSyncSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCIGPSSyncSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIGPSSyncSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCIGPSSyncSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCIGPSSyncSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIGPSSyncSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityAngEncoderUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIVelocityAngEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIVelocityAngEncoderUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIVelocityAngEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIVelocityAngEncoderUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityAngEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityAngEncoderPulsesPerRev(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIVelocityAngEncoderPulsesPerRev, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIVelocityAngEncoderPulsesPerRev(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIVelocityAngEncoderPulsesPerRev, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIVelocityAngEncoderPulsesPerRev(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityAngEncoderPulsesPerRev, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityLinEncoderUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIVelocityLinEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIVelocityLinEncoderUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIVelocityLinEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIVelocityLinEncoderUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityLinEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityLinEncoderDistPerPulse(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIVelocityLinEncoderDistPerPulse, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIVelocityLinEncoderDistPerPulse(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIVelocityLinEncoderDistPerPulse, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIVelocityLinEncoderDistPerPulse(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityLinEncoderDistPerPulse, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityEncoderDecodingType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIVelocityEncoderDecodingType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIVelocityEncoderDecodingType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIVelocityEncoderDecodingType, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIVelocityEncoderDecodingType(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityEncoderDecodingType, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityEncoderAInputTerm(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCIVelocityEncoderAInputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIVelocityEncoderAInputTerm(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCIVelocityEncoderAInputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCIVelocityEncoderAInputTerm(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityEncoderAInputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityEncoderAInputTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIVelocityEncoderAInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIVelocityEncoderAInputTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIVelocityEncoderAInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIVelocityEncoderAInputTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityEncoderAInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityEncoderAInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIVelocityEncoderAInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIVelocityEncoderAInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIVelocityEncoderAInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIVelocityEncoderAInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityEncoderAInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityEncoderAInputDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIVelocityEncoderAInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIVelocityEncoderAInputDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIVelocityEncoderAInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIVelocityEncoderAInputDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityEncoderAInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityEncoderAInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIVelocityEncoderAInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIVelocityEncoderAInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIVelocityEncoderAInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIVelocityEncoderAInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityEncoderAInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityEncoderAInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCIVelocityEncoderAInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIVelocityEncoderAInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCIVelocityEncoderAInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCIVelocityEncoderAInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityEncoderAInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityEncoderAInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIVelocityEncoderAInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIVelocityEncoderAInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIVelocityEncoderAInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIVelocityEncoderAInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityEncoderAInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityEncoderBInputTerm(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCIVelocityEncoderBInputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIVelocityEncoderBInputTerm(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCIVelocityEncoderBInputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCIVelocityEncoderBInputTerm(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityEncoderBInputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityEncoderBInputTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIVelocityEncoderBInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIVelocityEncoderBInputTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIVelocityEncoderBInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIVelocityEncoderBInputTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityEncoderBInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityEncoderBInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIVelocityEncoderBInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIVelocityEncoderBInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIVelocityEncoderBInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIVelocityEncoderBInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityEncoderBInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityEncoderBInputDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIVelocityEncoderBInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIVelocityEncoderBInputDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIVelocityEncoderBInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIVelocityEncoderBInputDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityEncoderBInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityEncoderBInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIVelocityEncoderBInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIVelocityEncoderBInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIVelocityEncoderBInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIVelocityEncoderBInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityEncoderBInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityEncoderBInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCIVelocityEncoderBInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIVelocityEncoderBInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCIVelocityEncoderBInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCIVelocityEncoderBInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityEncoderBInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityEncoderBInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIVelocityEncoderBInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIVelocityEncoderBInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIVelocityEncoderBInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIVelocityEncoderBInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityEncoderBInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityMeasTime(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIVelocityMeasTime, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIVelocityMeasTime(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIVelocityMeasTime, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIVelocityMeasTime(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityMeasTime, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityDiv(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIVelocityDiv, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIVelocityDiv(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIVelocityDiv, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIVelocityDiv(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityDiv, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCITwoEdgeSepUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCITwoEdgeSepUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepFirstTerm(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCITwoEdgeSepFirstTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCITwoEdgeSepFirstTerm(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCITwoEdgeSepFirstTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCITwoEdgeSepFirstTerm(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepFirstTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepFirstTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCITwoEdgeSepFirstTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepFirstTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCITwoEdgeSepFirstTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepFirstTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepFirstTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepFirstLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCITwoEdgeSepFirstLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepFirstLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCITwoEdgeSepFirstLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepFirstLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepFirstLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepFirstDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCITwoEdgeSepFirstDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepFirstDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCITwoEdgeSepFirstDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepFirstDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepFirstDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepFirstDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCITwoEdgeSepFirstDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCITwoEdgeSepFirstDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCITwoEdgeSepFirstDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCITwoEdgeSepFirstDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepFirstDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepFirstDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCITwoEdgeSepFirstDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCITwoEdgeSepFirstDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCITwoEdgeSepFirstDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCITwoEdgeSepFirstDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepFirstDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepFirstDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCITwoEdgeSepFirstDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCITwoEdgeSepFirstDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCITwoEdgeSepFirstDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCITwoEdgeSepFirstDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepFirstDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepFirstDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCITwoEdgeSepFirstDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepFirstDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCITwoEdgeSepFirstDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepFirstDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepFirstDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepFirstEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCITwoEdgeSepFirstEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepFirstEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCITwoEdgeSepFirstEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepFirstEdge(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepFirstEdge, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepSecondTerm(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCITwoEdgeSepSecondTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCITwoEdgeSepSecondTerm(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCITwoEdgeSepSecondTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCITwoEdgeSepSecondTerm(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepSecondTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepSecondTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCITwoEdgeSepSecondTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepSecondTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCITwoEdgeSepSecondTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepSecondTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepSecondTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepSecondLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCITwoEdgeSepSecondLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepSecondLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCITwoEdgeSepSecondLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepSecondLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepSecondLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepSecondDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCITwoEdgeSepSecondDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepSecondDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCITwoEdgeSepSecondDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepSecondDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepSecondDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepSecondDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCITwoEdgeSepSecondDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCITwoEdgeSepSecondDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCITwoEdgeSepSecondDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCITwoEdgeSepSecondDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepSecondDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepSecondDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCITwoEdgeSepSecondDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCITwoEdgeSepSecondDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCITwoEdgeSepSecondDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCITwoEdgeSepSecondDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepSecondDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepSecondDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCITwoEdgeSepSecondDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCITwoEdgeSepSecondDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCITwoEdgeSepSecondDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCITwoEdgeSepSecondDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepSecondDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepSecondDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCITwoEdgeSepSecondDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepSecondDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCITwoEdgeSepSecondDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepSecondDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepSecondDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepSecondEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCITwoEdgeSepSecondEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepSecondEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCITwoEdgeSepSecondEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepSecondEdge(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepSecondEdge, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCISemiPeriodUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCISemiPeriodUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCISemiPeriodUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCISemiPeriodUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCISemiPeriodUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCISemiPeriodUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCISemiPeriodTerm(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCISemiPeriodTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCISemiPeriodTerm(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCISemiPeriodTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCISemiPeriodTerm(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCISemiPeriodTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCISemiPeriodTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCISemiPeriodTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCISemiPeriodTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCISemiPeriodTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCISemiPeriodTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCISemiPeriodTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCISemiPeriodLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCISemiPeriodLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCISemiPeriodLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCISemiPeriodLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCISemiPeriodLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCISemiPeriodLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCISemiPeriodDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCISemiPeriodDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCISemiPeriodDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCISemiPeriodDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCISemiPeriodDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCISemiPeriodDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCISemiPeriodDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCISemiPeriodDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCISemiPeriodDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCISemiPeriodDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCISemiPeriodDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCISemiPeriodDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCISemiPeriodDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCISemiPeriodDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCISemiPeriodDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCISemiPeriodDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCISemiPeriodDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCISemiPeriodDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCISemiPeriodDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCISemiPeriodDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCISemiPeriodDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCISemiPeriodDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCISemiPeriodDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCISemiPeriodDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCISemiPeriodDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCISemiPeriodDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCISemiPeriodDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCISemiPeriodDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCISemiPeriodDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCISemiPeriodDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCISemiPeriodStartingEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCISemiPeriodStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCISemiPeriodStartingEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCISemiPeriodStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCISemiPeriodStartingEdge(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCISemiPeriodStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseFreqUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIPulseFreqUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseFreqUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIPulseFreqUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPulseFreqUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseFreqUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseFreqTerm(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCIPulseFreqTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIPulseFreqTerm(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCIPulseFreqTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCIPulseFreqTerm(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseFreqTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseFreqTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIPulseFreqTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseFreqTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIPulseFreqTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPulseFreqTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseFreqTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseFreqLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIPulseFreqLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseFreqLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIPulseFreqLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPulseFreqLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseFreqLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseFreqDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIPulseFreqDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPulseFreqDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIPulseFreqDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIPulseFreqDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseFreqDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseFreqDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIPulseFreqDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPulseFreqDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIPulseFreqDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIPulseFreqDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseFreqDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseFreqDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCIPulseFreqDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIPulseFreqDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCIPulseFreqDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCIPulseFreqDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseFreqDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseFreqDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIPulseFreqDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPulseFreqDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIPulseFreqDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIPulseFreqDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseFreqDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseFreqDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIPulseFreqDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPulseFreqDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIPulseFreqDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIPulseFreqDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseFreqDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseFreqStartEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIPulseFreqStartEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseFreqStartEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIPulseFreqStartEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPulseFreqStartEdge(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseFreqStartEdge, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTimeUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIPulseTimeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseTimeUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIPulseTimeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPulseTimeUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTimeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTimeTerm(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCIPulseTimeTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIPulseTimeTerm(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCIPulseTimeTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCIPulseTimeTerm(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTimeTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTimeTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIPulseTimeTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseTimeTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIPulseTimeTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPulseTimeTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTimeTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTimeLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIPulseTimeLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseTimeLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIPulseTimeLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPulseTimeLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTimeLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTimeDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIPulseTimeDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPulseTimeDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIPulseTimeDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIPulseTimeDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTimeDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTimeDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIPulseTimeDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPulseTimeDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIPulseTimeDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIPulseTimeDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTimeDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTimeDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCIPulseTimeDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIPulseTimeDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCIPulseTimeDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCIPulseTimeDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTimeDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTimeDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIPulseTimeDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPulseTimeDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIPulseTimeDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIPulseTimeDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTimeDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTimeDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIPulseTimeDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPulseTimeDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIPulseTimeDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIPulseTimeDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTimeDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTimeStartEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIPulseTimeStartEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseTimeStartEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIPulseTimeStartEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPulseTimeStartEdge(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTimeStartEdge, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTicksTerm(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCIPulseTicksTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIPulseTicksTerm(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCIPulseTicksTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCIPulseTicksTerm(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTicksTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTicksTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIPulseTicksTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseTicksTermCfg(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIPulseTicksTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPulseTicksTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTicksTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTicksLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIPulseTicksLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseTicksLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIPulseTicksLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPulseTicksLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTicksLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTicksDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIPulseTicksDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPulseTicksDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIPulseTicksDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIPulseTicksDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTicksDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTicksDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIPulseTicksDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPulseTicksDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIPulseTicksDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIPulseTicksDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTicksDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTicksDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCIPulseTicksDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIPulseTicksDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCIPulseTicksDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCIPulseTicksDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTicksDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTicksDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIPulseTicksDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPulseTicksDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIPulseTicksDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIPulseTicksDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTicksDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTicksDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIPulseTicksDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPulseTicksDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIPulseTicksDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIPulseTicksDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTicksDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTicksStartEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIPulseTicksStartEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseTicksStartEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIPulseTicksStartEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPulseTicksStartEdge(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTicksStartEdge, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICtrTimebaseSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCICtrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCICtrTimebaseSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCICtrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCICtrTimebaseSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICtrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICtrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCICtrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICtrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCICtrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCICtrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICtrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICtrTimebaseActiveEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCICtrTimebaseActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCICtrTimebaseActiveEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCICtrTimebaseActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCICtrTimebaseActiveEdge(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICtrTimebaseActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICtrTimebaseDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCICtrTimebaseDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICtrTimebaseDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCICtrTimebaseDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCICtrTimebaseDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICtrTimebaseDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICtrTimebaseDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCICtrTimebaseDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICtrTimebaseDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCICtrTimebaseDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCICtrTimebaseDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICtrTimebaseDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICtrTimebaseDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCICtrTimebaseDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCICtrTimebaseDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCICtrTimebaseDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCICtrTimebaseDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICtrTimebaseDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICtrTimebaseDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCICtrTimebaseDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICtrTimebaseDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCICtrTimebaseDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCICtrTimebaseDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICtrTimebaseDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICtrTimebaseDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCICtrTimebaseDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICtrTimebaseDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCICtrTimebaseDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCICtrTimebaseDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICtrTimebaseDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIThreshVoltage(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIThreshVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIThreshVoltage(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIThreshVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIThreshVoltage(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIThreshVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICount(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCICount, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function GetCIOutputState(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIOutputState, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function GetCITCReached(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCITCReached, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function GetCICtrTimebaseMasterTimebaseDiv(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCICtrTimebaseMasterTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICtrTimebaseMasterTimebaseDiv(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCICtrTimebaseMasterTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCICtrTimebaseMasterTimebaseDiv(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICtrTimebaseMasterTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCISampClkOverrunBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCISampClkOverrunBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCISampClkOverrunBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCISampClkOverrunBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCISampClkOverrunBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCISampClkOverrunBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCISampClkOverrunSentinelVal(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCISampClkOverrunSentinelVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCISampClkOverrunSentinelVal(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCISampClkOverrunSentinelVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCISampClkOverrunSentinelVal(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCISampClkOverrunSentinelVal, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIDataXferMech(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIDataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIDataXferMech(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIDataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIDataXferMech(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIDataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIDataXferReqCond(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCIDataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIDataXferReqCond(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCIDataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIDataXferReqCond(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIDataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIUsbXferReqSize(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIUsbXferReqSize(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIUsbXferReqSize(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIUsbXferReqCount(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIUsbXferReqCount(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIUsbXferReqCount(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIMemMapEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIMemMapEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIMemMapEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCINumPossiblyInvalidSamps(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCINumPossiblyInvalidSamps, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function GetCIDupCountPrevent(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIDupCountPrevent, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIDupCountPrevent(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIDupCountPrevent, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIDupCountPrevent(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIDupCountPrevent, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPrescaler(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCIPrescaler, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPrescaler(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCIPrescaler, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIPrescaler(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPrescaler, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIMaxMeasPeriod(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCIMaxMeasPeriod, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIMaxMeasPeriod(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCIMaxMeasPeriod, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIMaxMeasPeriod(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIMaxMeasPeriod, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOOutputType(taskHandle::TaskHandle, channel::String, data::Ref{Int32})
    ccall((:DAQmxGetCOOutputType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function GetCOPulseIdleState(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCOPulseIdleState, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCOPulseIdleState(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCOPulseIdleState, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCOPulseIdleState(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOPulseIdleState, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPulseTerm(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCOPulseTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCOPulseTerm(taskHandle::TaskHandle, source_channel::String, target_channel::String)
    ccall((:DAQmxSetCOPulseTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, source_channel, target_channel)
end

function ResetCOPulseTerm(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOPulseTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPulseTimeUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCOPulseTimeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCOPulseTimeUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCOPulseTimeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCOPulseTimeUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOPulseTimeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPulseHighTime(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCOPulseHighTime, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCOPulseHighTime(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCOPulseHighTime, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCOPulseHighTime(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOPulseHighTime, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPulseLowTime(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCOPulseLowTime, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCOPulseLowTime(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCOPulseLowTime, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCOPulseLowTime(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOPulseLowTime, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPulseTimeInitialDelay(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCOPulseTimeInitialDelay, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCOPulseTimeInitialDelay(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCOPulseTimeInitialDelay, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCOPulseTimeInitialDelay(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOPulseTimeInitialDelay, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPulseDutyCyc(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCOPulseDutyCyc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCOPulseDutyCyc(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCOPulseDutyCyc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCOPulseDutyCyc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOPulseDutyCyc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPulseFreqUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCOPulseFreqUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCOPulseFreqUnits(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCOPulseFreqUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCOPulseFreqUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOPulseFreqUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPulseFreq(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCOPulseFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCOPulseFreq(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCOPulseFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCOPulseFreq(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOPulseFreq, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPulseFreqInitialDelay(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCOPulseFreqInitialDelay, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCOPulseFreqInitialDelay(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCOPulseFreqInitialDelay, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCOPulseFreqInitialDelay(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOPulseFreqInitialDelay, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPulseHighTicks(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCOPulseHighTicks, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOPulseHighTicks(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCOPulseHighTicks, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCOPulseHighTicks(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOPulseHighTicks, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPulseLowTicks(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCOPulseLowTicks, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOPulseLowTicks(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCOPulseLowTicks, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCOPulseLowTicks(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOPulseLowTicks, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPulseTicksInitialDelay(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCOPulseTicksInitialDelay, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOPulseTicksInitialDelay(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCOPulseTicksInitialDelay, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCOPulseTicksInitialDelay(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOPulseTicksInitialDelay, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOCtrTimebaseSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCOCtrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCOCtrTimebaseSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCOCtrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCOCtrTimebaseSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOCtrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOCtrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCOCtrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCOCtrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCOCtrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCOCtrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOCtrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOCtrTimebaseActiveEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCOCtrTimebaseActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCOCtrTimebaseActiveEdge(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCOCtrTimebaseActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCOCtrTimebaseActiveEdge(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOCtrTimebaseActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOCtrTimebaseDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCOCtrTimebaseDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOCtrTimebaseDigFltrEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCOCtrTimebaseDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCOCtrTimebaseDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOCtrTimebaseDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOCtrTimebaseDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCOCtrTimebaseDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCOCtrTimebaseDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCOCtrTimebaseDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCOCtrTimebaseDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOCtrTimebaseDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOCtrTimebaseDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCOCtrTimebaseDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCOCtrTimebaseDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCOCtrTimebaseDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCOCtrTimebaseDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOCtrTimebaseDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOCtrTimebaseDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxGetCOCtrTimebaseDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCOCtrTimebaseDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Real)
    ccall((:DAQmxSetCOCtrTimebaseDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCOCtrTimebaseDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOCtrTimebaseDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOCtrTimebaseDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCOCtrTimebaseDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOCtrTimebaseDigSyncEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCOCtrTimebaseDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCOCtrTimebaseDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOCtrTimebaseDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOCount(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCOCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function GetCOOutputState(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCOOutputState, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function GetCOAutoIncrCnt(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCOAutoIncrCnt, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOAutoIncrCnt(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCOAutoIncrCnt, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCOAutoIncrCnt(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOAutoIncrCnt, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOCtrTimebaseMasterTimebaseDiv(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCOCtrTimebaseMasterTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOCtrTimebaseMasterTimebaseDiv(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCOCtrTimebaseMasterTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCOCtrTimebaseMasterTimebaseDiv(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOCtrTimebaseMasterTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPulseDone(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCOPulseDone, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function GetCOEnableInitialDelayOnRetrigger(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCOEnableInitialDelayOnRetrigger, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOEnableInitialDelayOnRetrigger(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCOEnableInitialDelayOnRetrigger, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCOEnableInitialDelayOnRetrigger(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOEnableInitialDelayOnRetrigger, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOConstrainedGenMode(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCOConstrainedGenMode, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCOConstrainedGenMode(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCOConstrainedGenMode, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCOConstrainedGenMode(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOConstrainedGenMode, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOUseOnlyOnBrdMem(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCOUseOnlyOnBrdMem, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOUseOnlyOnBrdMem(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCOUseOnlyOnBrdMem, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCOUseOnlyOnBrdMem(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOUseOnlyOnBrdMem, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCODataXferMech(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCODataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCODataXferMech(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCODataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCODataXferMech(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCODataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCODataXferReqCond(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetCODataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCODataXferReqCond(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetCODataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCODataXferReqCond(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCODataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOUsbXferReqSize(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCOUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOUsbXferReqSize(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCOUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCOUsbXferReqSize(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOUsbXferReqCount(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCOUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOUsbXferReqCount(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCOUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCOUsbXferReqCount(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOMemMapEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCOMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOMemMapEnable(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCOMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCOMemMapEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPrescaler(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCOPrescaler, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOPrescaler(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxSetCOPrescaler, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCOPrescaler(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOPrescaler, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCORdyForNewVal(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetCORdyForNewVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function GetChanType(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetChanType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function GetPhysicalChanName(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetPhysicalChanName, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetPhysicalChanName(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetPhysicalChanName, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function GetChanDescr(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetChanDescr, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetChanDescr(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetChanDescr, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetChanDescr(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetChanDescr, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetChanIsGlobal(taskHandle::TaskHandle, channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetChanIsGlobal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function GetChanSyncUnlockBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxGetChanSyncUnlockBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetChanSyncUnlockBehavior(taskHandle::TaskHandle, channel::String, data::Integer)
    ccall((:DAQmxSetChanSyncUnlockBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetChanSyncUnlockBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetChanSyncUnlockBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDevIsSimulated(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevIsSimulated, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetDevProductCategory(device::String, data::Ref{Int32})
    ccall((:DAQmxGetDevProductCategory, :libnidaqmx), Cint, (Cstring, Ref{Cint}), device, data)
end

function GetDevProductType(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevProductType, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), device, data, bufferSize)
end

function GetDevProductNum(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevProductNum, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetDevSerialNum(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevSerialNum, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetDevAccessoryProductTypes(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevAccessoryProductTypes, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), device, data, bufferSize)
end

function GetDevAccessoryProductNums(device::String, data::Vector{UInt32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAccessoryProductNums, :libnidaqmx), Cint, (Cstring, Ref{Cuint}, Cuint), device, data, arraySizeInElements)
end

function GetDevAccessorySerialNums(device::String, data::Vector{UInt32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAccessorySerialNums, :libnidaqmx), Cint, (Cstring, Ref{Cuint}, Cuint), device, data, arraySizeInElements)
end

function GetCarrierSerialNum(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetCarrierSerialNum, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetFieldDAQDevName(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetFieldDAQDevName, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), device, data, bufferSize)
end

function GetFieldDAQBankDevNames(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetFieldDAQBankDevNames, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), device, data, bufferSize)
end

function GetDevChassisModuleDevNames(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevChassisModuleDevNames, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), device, data, bufferSize)
end

function GetDevAnlgTrigSupported(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevAnlgTrigSupported, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetDevDigTrigSupported(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevDigTrigSupported, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetDevTimeTrigSupported(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevTimeTrigSupported, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetDevAIPhysicalChans(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevAIPhysicalChans, :libnidaqmx), Cint, (Cstring, Ref{Cuchar}, Cuint), device, data, bufferSize)
end

function GetDevAISupportedMeasTypes(device::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAISupportedMeasTypes, :libnidaqmx), Cint, (Cstring, Ref{Cint}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIMaxSingleChanRate(device::String, data::Real)
    ccall((:DAQmxGetDevAIMaxSingleChanRate, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}), device, data)
end

function GetDevAIMaxMultiChanRate(device::String, data::Real)
    ccall((:DAQmxGetDevAIMaxMultiChanRate, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}), device, data)
end

function GetDevAIMinRate(device::String, data::Real)
    ccall((:DAQmxGetDevAIMinRate, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}), device, data)
end

function GetDevAISimultaneousSamplingSupported(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevAISimultaneousSamplingSupported, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetDevAINumSampTimingEngines(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevAINumSampTimingEngines, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetDevAISampModes(device::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAISampModes, :libnidaqmx), Cint, (Cstring, Ref{Cint}, Cuint), device, data, arraySizeInElements)
end

function GetDevAINumSyncPulseSrcs(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevAINumSyncPulseSrcs, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetDevAITrigUsage(device::String, data::Integer)
    ccall((:DAQmxGetDevAITrigUsage, :libnidaqmx), Cint, (Cstring, Ref{Cint}), device, data)
end

function GetDevAIVoltageRngs(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAIVoltageRngs, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIVoltageIntExcitDiscreteVals(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAIVoltageIntExcitDiscreteVals, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIVoltageIntExcitRangeVals(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAIVoltageIntExcitRangeVals, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIChargeRngs(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAIChargeRngs, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAICurrentRngs(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAICurrentRngs, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAICurrentIntExcitDiscreteVals(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAICurrentIntExcitDiscreteVals, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIBridgeRngs(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAIBridgeRngs, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIResistanceRngs(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAIResistanceRngs, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIFreqRngs(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAIFreqRngs, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIGains(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAIGains, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAICouplings(device::String, data::Integer)
    ccall((:DAQmxGetDevAICouplings, :libnidaqmx), Cint, (Cstring, Ref{Cint}), device, data)
end

function GetDevAILowpassCutoffFreqDiscreteVals(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAILowpassCutoffFreqDiscreteVals, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAILowpassCutoffFreqRangeVals(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAILowpassCutoffFreqRangeVals, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetAIDigFltrTypes(device::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetAIDigFltrTypes, :libnidaqmx), Cint, (Cstring, Ref{Cint}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIDigFltrLowpassCutoffFreqDiscreteVals(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAIDigFltrLowpassCutoffFreqDiscreteVals, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIDigFltrLowpassCutoffFreqRangeVals(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAIDigFltrLowpassCutoffFreqRangeVals, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAOPhysicalChans(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevAOPhysicalChans, :libnidaqmx), Cint, (Cstring, Ref{Cuchar}, Cuint), device, data, bufferSize)
end

function GetDevAOSupportedOutputTypes(device::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAOSupportedOutputTypes, :libnidaqmx), Cint, (Cstring, Ref{Cint}, Cuint), device, data, arraySizeInElements)
end

function GetDevAOMaxRate(device::String, data::Real)
    ccall((:DAQmxGetDevAOMaxRate, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}), device, data)
end

function GetDevAOMinRate(device::String, data::Real)
    ccall((:DAQmxGetDevAOMinRate, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}), device, data)
end

function GetDevAOSampClkSupported(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevAOSampClkSupported, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetDevAONumSampTimingEngines(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevAONumSampTimingEngines, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetDevAOSampModes(device::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAOSampModes, :libnidaqmx), Cint, (Cstring, Ref{Cint}, Cuint), device, data, arraySizeInElements)
end

function GetDevAONumSyncPulseSrcs(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevAONumSyncPulseSrcs, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetDevAOTrigUsage(device::String, data::Integer)
    ccall((:DAQmxGetDevAOTrigUsage, :libnidaqmx), Cint, (Cstring, Ref{Cint}), device, data)
end

function GetDevAOVoltageRngs(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAOVoltageRngs, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAOCurrentRngs(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAOCurrentRngs, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAOGains(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAOGains, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevDILines(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevDILines, :libnidaqmx), Cint, (Cstring, Ref{Cuchar}, Cuint), device, data, bufferSize)
end

function GetDevDIPorts(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevDIPorts, :libnidaqmx), Cint, (Cstring, Ref{Cuchar}, Cuint), device, data, bufferSize)
end

function GetDevDIMaxRate(device::String, data::Real)
    ccall((:DAQmxGetDevDIMaxRate, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}), device, data)
end

function GetDevDINumSampTimingEngines(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevDINumSampTimingEngines, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetDevDITrigUsage(device::String, data::Integer)
    ccall((:DAQmxGetDevDITrigUsage, :libnidaqmx), Cint, (Cstring, Ref{Cint}), device, data)
end

function GetDevDOLines(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevDOLines, :libnidaqmx), Cint, (Cstring, Ref{Cuchar}, Cuint), device, data, bufferSize)
end

function GetDevDOPorts(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevDOPorts, :libnidaqmx), Cint, (Cstring, Ref{Cuchar}, Cuint), device, data, bufferSize)
end

function GetDevDOMaxRate(device::String, data::Real)
    ccall((:DAQmxGetDevDOMaxRate, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}), device, data)
end

function GetDevDONumSampTimingEngines(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevDONumSampTimingEngines, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetDevDOTrigUsage(device::String, data::Integer)
    ccall((:DAQmxGetDevDOTrigUsage, :libnidaqmx), Cint, (Cstring, Ref{Cint}), device, data)
end

function GetDevCIPhysicalChans(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevCIPhysicalChans, :libnidaqmx), Cint, (Cstring, Ref{Cuchar}, Cuint), device, data, bufferSize)
end

function GetDevCISupportedMeasTypes(device::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevCISupportedMeasTypes, :libnidaqmx), Cint, (Cstring, Ref{Cint}, Cuint), device, data, arraySizeInElements)
end

function GetDevCITrigUsage(device::String, data::Integer)
    ccall((:DAQmxGetDevCITrigUsage, :libnidaqmx), Cint, (Cstring, Ref{Cint}), device, data)
end

function GetDevCISampClkSupported(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevCISampClkSupported, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetDevCISampModes(device::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevCISampModes, :libnidaqmx), Cint, (Cstring, Ref{Cint}, Cuint), device, data, arraySizeInElements)
end

function GetDevCIMaxSize(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevCIMaxSize, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetDevCIMaxTimebase(device::String, data::Real)
    ccall((:DAQmxGetDevCIMaxTimebase, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}), device, data)
end

function GetDevCOPhysicalChans(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevCOPhysicalChans, :libnidaqmx), Cint, (Cstring, Ref{Cuchar}, Cuint), device, data, bufferSize)
end

function GetDevCOSupportedOutputTypes(device::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevCOSupportedOutputTypes, :libnidaqmx), Cint, (Cstring, Ref{Cint}, Cuint), device, data, arraySizeInElements)
end

function GetDevCOSampClkSupported(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevCOSampClkSupported, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetDevCOSampModes(device::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevCOSampModes, :libnidaqmx), Cint, (Cstring, Ref{Cint}, Cuint), device, data, arraySizeInElements)
end

function GetDevCOTrigUsage(device::String, data::Integer)
    ccall((:DAQmxGetDevCOTrigUsage, :libnidaqmx), Cint, (Cstring, Ref{Cint}), device, data)
end

function GetDevCOMaxSize(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevCOMaxSize, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetDevCOMaxTimebase(device::String, data::Real)
    ccall((:DAQmxGetDevCOMaxTimebase, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}), device, data)
end

function GetDevTEDSHWTEDSSupported(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevTEDSHWTEDSSupported, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetDevNumDMAChans(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevNumDMAChans, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetDevBusType(device::String, data::Integer)
    ccall((:DAQmxGetDevBusType, :libnidaqmx), Cint, (Cstring, Ref{Cint}), device, data)
end

function GetDevPCIBusNum(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevPCIBusNum, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetDevPCIDevNum(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevPCIDevNum, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetDevPXIChassisNum(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevPXIChassisNum, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetDevPXISlotNum(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevPXISlotNum, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetDevCompactDAQChassisDevName(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevCompactDAQChassisDevName, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), device, data, bufferSize)
end

function GetDevCompactDAQSlotNum(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevCompactDAQSlotNum, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetDevCompactRIOChassisDevName(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevCompactRIOChassisDevName, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), device, data, bufferSize)
end

function GetDevCompactRIOSlotNum(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevCompactRIOSlotNum, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetDevTCPIPHostname(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevTCPIPHostname, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), device, data, bufferSize)
end

function GetDevTCPIPEthernetIP(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevTCPIPEthernetIP, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), device, data, bufferSize)
end

function GetDevTCPIPWirelessIP(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevTCPIPWirelessIP, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), device, data, bufferSize)
end

function GetDevTerminals(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevTerminals, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), device, data, bufferSize)
end

function GetDevNumTimeTrigs(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevNumTimeTrigs, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetDevNumTimestampEngines(device::String, data::Ref{UInt32})
    ccall((:DAQmxGetDevNumTimestampEngines, :libnidaqmx), Cint, (Cstring, Ref{Cuint}), device, data)
end

function GetExportedAIConvClkOutputTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetExportedAIConvClkOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedAIConvClkOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedAIConvClkOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedAIConvClkOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedAIConvClkOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedAIConvClkPulsePolarity(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetExportedAIConvClkPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function GetExported10MHzRefClkOutputTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetExported10MHzRefClkOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExported10MHzRefClkOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExported10MHzRefClkOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExported10MHzRefClkOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExported10MHzRefClkOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExported20MHzTimebaseOutputTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetExported20MHzTimebaseOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExported20MHzTimebaseOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExported20MHzTimebaseOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExported20MHzTimebaseOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExported20MHzTimebaseOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedSampClkOutputBehavior(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetExportedSampClkOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedSampClkOutputBehavior(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetExportedSampClkOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedSampClkOutputBehavior(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedSampClkOutputBehavior, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedSampClkOutputTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetExportedSampClkOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedSampClkOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedSampClkOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedSampClkOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedSampClkOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedSampClkDelayOffset(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetExportedSampClkDelayOffset, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetExportedSampClkDelayOffset(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetExportedSampClkDelayOffset, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetExportedSampClkDelayOffset(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedSampClkDelayOffset, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedSampClkPulsePolarity(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetExportedSampClkPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedSampClkPulsePolarity(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetExportedSampClkPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedSampClkPulsePolarity(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedSampClkPulsePolarity, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedSampClkTimebaseOutputTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetExportedSampClkTimebaseOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedSampClkTimebaseOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedSampClkTimebaseOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedSampClkTimebaseOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedSampClkTimebaseOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedDividedSampClkTimebaseOutputTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetExportedDividedSampClkTimebaseOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedDividedSampClkTimebaseOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedDividedSampClkTimebaseOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedDividedSampClkTimebaseOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedDividedSampClkTimebaseOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedAdvTrigOutputTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetExportedAdvTrigOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedAdvTrigOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedAdvTrigOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedAdvTrigOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedAdvTrigOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedAdvTrigPulsePolarity(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetExportedAdvTrigPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function GetExportedAdvTrigPulseWidthUnits(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetExportedAdvTrigPulseWidthUnits, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedAdvTrigPulseWidthUnits(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetExportedAdvTrigPulseWidthUnits, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedAdvTrigPulseWidthUnits(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedAdvTrigPulseWidthUnits, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedAdvTrigPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetExportedAdvTrigPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetExportedAdvTrigPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetExportedAdvTrigPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetExportedAdvTrigPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedAdvTrigPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedPauseTrigOutputTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetExportedPauseTrigOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedPauseTrigOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedPauseTrigOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedPauseTrigOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedPauseTrigOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedPauseTrigLvlActiveLvl(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetExportedPauseTrigLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedPauseTrigLvlActiveLvl(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetExportedPauseTrigLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedPauseTrigLvlActiveLvl(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedPauseTrigLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedRefTrigOutputTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetExportedRefTrigOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedRefTrigOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedRefTrigOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedRefTrigOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedRefTrigOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedRefTrigPulsePolarity(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetExportedRefTrigPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedRefTrigPulsePolarity(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetExportedRefTrigPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedRefTrigPulsePolarity(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedRefTrigPulsePolarity, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedStartTrigOutputTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetExportedStartTrigOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedStartTrigOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedStartTrigOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedStartTrigOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedStartTrigOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedStartTrigPulsePolarity(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetExportedStartTrigPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedStartTrigPulsePolarity(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetExportedStartTrigPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedStartTrigPulsePolarity(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedStartTrigPulsePolarity, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedAdvCmpltEventOutputTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetExportedAdvCmpltEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedAdvCmpltEventOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedAdvCmpltEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedAdvCmpltEventOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedAdvCmpltEventOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedAdvCmpltEventDelay(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetExportedAdvCmpltEventDelay, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetExportedAdvCmpltEventDelay(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetExportedAdvCmpltEventDelay, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetExportedAdvCmpltEventDelay(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedAdvCmpltEventDelay, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedAdvCmpltEventPulsePolarity(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetExportedAdvCmpltEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedAdvCmpltEventPulsePolarity(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetExportedAdvCmpltEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedAdvCmpltEventPulsePolarity(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedAdvCmpltEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedAdvCmpltEventPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetExportedAdvCmpltEventPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetExportedAdvCmpltEventPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetExportedAdvCmpltEventPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetExportedAdvCmpltEventPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedAdvCmpltEventPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedAIHoldCmpltEventOutputTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetExportedAIHoldCmpltEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedAIHoldCmpltEventOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedAIHoldCmpltEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedAIHoldCmpltEventOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedAIHoldCmpltEventOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedAIHoldCmpltEventPulsePolarity(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetExportedAIHoldCmpltEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedAIHoldCmpltEventPulsePolarity(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetExportedAIHoldCmpltEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedAIHoldCmpltEventPulsePolarity(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedAIHoldCmpltEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedChangeDetectEventOutputTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetExportedChangeDetectEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedChangeDetectEventOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedChangeDetectEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedChangeDetectEventOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedChangeDetectEventOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedChangeDetectEventPulsePolarity(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetExportedChangeDetectEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedChangeDetectEventPulsePolarity(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetExportedChangeDetectEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedChangeDetectEventPulsePolarity(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedChangeDetectEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedCtrOutEventOutputTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetExportedCtrOutEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedCtrOutEventOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedCtrOutEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedCtrOutEventOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedCtrOutEventOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedCtrOutEventOutputBehavior(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetExportedCtrOutEventOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedCtrOutEventOutputBehavior(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetExportedCtrOutEventOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedCtrOutEventOutputBehavior(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedCtrOutEventOutputBehavior, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedCtrOutEventPulsePolarity(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetExportedCtrOutEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedCtrOutEventPulsePolarity(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetExportedCtrOutEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedCtrOutEventPulsePolarity(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedCtrOutEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedCtrOutEventToggleIdleState(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetExportedCtrOutEventToggleIdleState, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedCtrOutEventToggleIdleState(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetExportedCtrOutEventToggleIdleState, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedCtrOutEventToggleIdleState(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedCtrOutEventToggleIdleState, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedHshkEventOutputTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetExportedHshkEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedHshkEventOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedHshkEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedHshkEventOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedHshkEventOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedHshkEventOutputBehavior(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetExportedHshkEventOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedHshkEventOutputBehavior(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetExportedHshkEventOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedHshkEventOutputBehavior(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedHshkEventOutputBehavior, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedHshkEventDelay(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetExportedHshkEventDelay, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetExportedHshkEventDelay(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetExportedHshkEventDelay, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetExportedHshkEventDelay(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedHshkEventDelay, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedHshkEventInterlockedAssertedLvl(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetExportedHshkEventInterlockedAssertedLvl, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedHshkEventInterlockedAssertedLvl(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetExportedHshkEventInterlockedAssertedLvl, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedHshkEventInterlockedAssertedLvl(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedHshkEventInterlockedAssertedLvl, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedHshkEventInterlockedAssertOnStart(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetExportedHshkEventInterlockedAssertOnStart, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetExportedHshkEventInterlockedAssertOnStart(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetExportedHshkEventInterlockedAssertOnStart, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetExportedHshkEventInterlockedAssertOnStart(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedHshkEventInterlockedAssertOnStart, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedHshkEventInterlockedDeassertDelay(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetExportedHshkEventInterlockedDeassertDelay, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetExportedHshkEventInterlockedDeassertDelay(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetExportedHshkEventInterlockedDeassertDelay, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetExportedHshkEventInterlockedDeassertDelay(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedHshkEventInterlockedDeassertDelay, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedHshkEventPulsePolarity(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetExportedHshkEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedHshkEventPulsePolarity(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetExportedHshkEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedHshkEventPulsePolarity(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedHshkEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedHshkEventPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetExportedHshkEventPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetExportedHshkEventPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetExportedHshkEventPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetExportedHshkEventPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedHshkEventPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedRdyForXferEventOutputTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetExportedRdyForXferEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedRdyForXferEventOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedRdyForXferEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedRdyForXferEventOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedRdyForXferEventOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedRdyForXferEventLvlActiveLvl(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetExportedRdyForXferEventLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedRdyForXferEventLvlActiveLvl(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetExportedRdyForXferEventLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedRdyForXferEventLvlActiveLvl(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedRdyForXferEventLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedRdyForXferEventDeassertCond(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetExportedRdyForXferEventDeassertCond, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedRdyForXferEventDeassertCond(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetExportedRdyForXferEventDeassertCond, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedRdyForXferEventDeassertCond(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedRdyForXferEventDeassertCond, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedRdyForXferEventDeassertCondCustomThreshold(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetExportedRdyForXferEventDeassertCondCustomThreshold, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetExportedRdyForXferEventDeassertCondCustomThreshold(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetExportedRdyForXferEventDeassertCondCustomThreshold, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetExportedRdyForXferEventDeassertCondCustomThreshold(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedRdyForXferEventDeassertCondCustomThreshold, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedDataActiveEventOutputTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetExportedDataActiveEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedDataActiveEventOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedDataActiveEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedDataActiveEventOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedDataActiveEventOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedDataActiveEventLvlActiveLvl(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetExportedDataActiveEventLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedDataActiveEventLvlActiveLvl(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetExportedDataActiveEventLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedDataActiveEventLvlActiveLvl(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedDataActiveEventLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedRdyForStartEventOutputTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetExportedRdyForStartEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedRdyForStartEventOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedRdyForStartEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedRdyForStartEventOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedRdyForStartEventOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedRdyForStartEventLvlActiveLvl(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetExportedRdyForStartEventLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedRdyForStartEventLvlActiveLvl(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetExportedRdyForStartEventLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedRdyForStartEventLvlActiveLvl(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedRdyForStartEventLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedSyncPulseEventOutputTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetExportedSyncPulseEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedSyncPulseEventOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedSyncPulseEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedSyncPulseEventOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedSyncPulseEventOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedWatchdogExpiredEventOutputTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetExportedWatchdogExpiredEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedWatchdogExpiredEventOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedWatchdogExpiredEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedWatchdogExpiredEventOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedWatchdogExpiredEventOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetPersistedChanAuthor(channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetPersistedChanAuthor, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), channel, data, bufferSize)
end

function GetPersistedChanAllowInteractiveEditing(channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetPersistedChanAllowInteractiveEditing, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), channel, data)
end

function GetPersistedChanAllowInteractiveDeletion(channel::String, data::Ref{UInt32})
    ccall((:DAQmxGetPersistedChanAllowInteractiveDeletion, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), channel, data)
end

function GetPersistedScaleAuthor(scaleName::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetPersistedScaleAuthor, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), scaleName, data, bufferSize)
end

function GetPersistedScaleAllowInteractiveEditing(scaleName::String, data::Ref{UInt32})
    ccall((:DAQmxGetPersistedScaleAllowInteractiveEditing, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), scaleName, data)
end

function GetPersistedScaleAllowInteractiveDeletion(scaleName::String, data::Ref{UInt32})
    ccall((:DAQmxGetPersistedScaleAllowInteractiveDeletion, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), scaleName, data)
end

function GetPersistedTaskAuthor(taskName::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetPersistedTaskAuthor, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), taskName, data, bufferSize)
end

function GetPersistedTaskAllowInteractiveEditing(taskName::String, data::Ref{UInt32})
    ccall((:DAQmxGetPersistedTaskAllowInteractiveEditing, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), taskName, data)
end

function GetPersistedTaskAllowInteractiveDeletion(taskName::String, data::Ref{UInt32})
    ccall((:DAQmxGetPersistedTaskAllowInteractiveDeletion, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), taskName, data)
end

function GetPhysicalChanAISupportedMeasTypes(physicalChannel::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetPhysicalChanAISupportedMeasTypes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetPhysicalChanAITermCfgs(physicalChannel::String, data::Integer)
    ccall((:DAQmxGetPhysicalChanAITermCfgs, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), physicalChannel, data)
end

function GetPhysicalChanAIInputSrcs(physicalChannel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetPhysicalChanAIInputSrcs, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), physicalChannel, data, bufferSize)
end

function GetPhysicalChanAISensorPowerTypes(physicalChannel::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetPhysicalChanAISensorPowerTypes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetPhysicalChanAISensorPowerVoltageRangeVals(physicalChannel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetPhysicalChanAISensorPowerVoltageRangeVals, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetPhysicalChanAIPowerControlVoltage(physicalChannel::String, data::Real)
    ccall((:DAQmxGetPhysicalChanAIPowerControlVoltage, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), physicalChannel, data)
end

function SetPhysicalChanAIPowerControlVoltage(physicalChannel::String, data::Real)
    ccall((:DAQmxSetPhysicalChanAIPowerControlVoltage, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble), physicalChannel, data)
end

function ResetPhysicalChanAIPowerControlVoltage(physicalChannel::String)
    ccall((:DAQmxResetPhysicalChanAIPowerControlVoltage, :libnidaqmx), Cint, (Ref{UInt8},), physicalChannel)
end

function GetPhysicalChanAIPowerControlEnable(physicalChannel::String, data::Ref{UInt32})
    ccall((:DAQmxGetPhysicalChanAIPowerControlEnable, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function SetPhysicalChanAIPowerControlEnable(physicalChannel::String, data::Ref{UInt32})
    ccall((:DAQmxSetPhysicalChanAIPowerControlEnable, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), physicalChannel, data)
end

function ResetPhysicalChanAIPowerControlEnable(physicalChannel::String)
    ccall((:DAQmxResetPhysicalChanAIPowerControlEnable, :libnidaqmx), Cint, (Ref{UInt8},), physicalChannel)
end

function GetPhysicalChanAIPowerControlType(physicalChannel::String, data::Integer)
    ccall((:DAQmxGetPhysicalChanAIPowerControlType, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), physicalChannel, data)
end

function SetPhysicalChanAIPowerControlType(physicalChannel::String, data::Integer)
    ccall((:DAQmxSetPhysicalChanAIPowerControlType, :libnidaqmx), Cint, (Ref{UInt8}, Cint), physicalChannel, data)
end

function ResetPhysicalChanAIPowerControlType(physicalChannel::String)
    ccall((:DAQmxResetPhysicalChanAIPowerControlType, :libnidaqmx), Cint, (Ref{UInt8},), physicalChannel)
end

function GetPhysicalChanAISensorPowerOpenChan(physicalChannel::String, data::Ref{UInt32})
    ccall((:DAQmxGetPhysicalChanAISensorPowerOpenChan, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanAISensorPowerOvercurrent(physicalChannel::String, data::Ref{UInt32})
    ccall((:DAQmxGetPhysicalChanAISensorPowerOvercurrent, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanAOSupportedOutputTypes(physicalChannel::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetPhysicalChanAOSupportedOutputTypes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetPhysicalChanAOSupportedPowerUpOutputTypes(physicalChannel::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetPhysicalChanAOSupportedPowerUpOutputTypes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetPhysicalChanAOTermCfgs(physicalChannel::String, data::Integer)
    ccall((:DAQmxGetPhysicalChanAOTermCfgs, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), physicalChannel, data)
end

function GetPhysicalChanAOManualControlEnable(physicalChannel::String, data::Ref{UInt32})
    ccall((:DAQmxGetPhysicalChanAOManualControlEnable, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function SetPhysicalChanAOManualControlEnable(physicalChannel::String, data::Ref{UInt32})
    ccall((:DAQmxSetPhysicalChanAOManualControlEnable, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), physicalChannel, data)
end

function ResetPhysicalChanAOManualControlEnable(physicalChannel::String)
    ccall((:DAQmxResetPhysicalChanAOManualControlEnable, :libnidaqmx), Cint, (Ref{UInt8},), physicalChannel)
end

function GetPhysicalChanAOManualControlShortDetected(physicalChannel::String, data::Ref{UInt32})
    ccall((:DAQmxGetPhysicalChanAOManualControlShortDetected, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanAOManualControlAmplitude(physicalChannel::String, data::Real)
    ccall((:DAQmxGetPhysicalChanAOManualControlAmplitude, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), physicalChannel, data)
end

function GetPhysicalChanAOManualControlFreq(physicalChannel::String, data::Real)
    ccall((:DAQmxGetPhysicalChanAOManualControlFreq, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), physicalChannel, data)
end

function GetAOPowerAmpChannelEnable(physicalChannel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAOPowerAmpChannelEnable, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function SetAOPowerAmpChannelEnable(physicalChannel::String, data::Ref{UInt32})
    ccall((:DAQmxSetAOPowerAmpChannelEnable, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), physicalChannel, data)
end

function ResetAOPowerAmpChannelEnable(physicalChannel::String)
    ccall((:DAQmxResetAOPowerAmpChannelEnable, :libnidaqmx), Cint, (Ref{UInt8},), physicalChannel)
end

function GetAOPowerAmpScalingCoeff(physicalChannel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetAOPowerAmpScalingCoeff, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetAOPowerAmpOvercurrent(physicalChannel::String, data::Ref{UInt32})
    ccall((:DAQmxGetAOPowerAmpOvercurrent, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetAOPowerAmpGain(physicalChannel::String, data::Real)
    ccall((:DAQmxGetAOPowerAmpGain, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), physicalChannel, data)
end

function GetAOPowerAmpOffset(physicalChannel::String, data::Real)
    ccall((:DAQmxGetAOPowerAmpOffset, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), physicalChannel, data)
end

function GetPhysicalChanDIPortWidth(physicalChannel::String, data::Ref{UInt32})
    ccall((:DAQmxGetPhysicalChanDIPortWidth, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanDISampClkSupported(physicalChannel::String, data::Ref{UInt32})
    ccall((:DAQmxGetPhysicalChanDISampClkSupported, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanDISampModes(physicalChannel::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetPhysicalChanDISampModes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetPhysicalChanDIChangeDetectSupported(physicalChannel::String, data::Ref{UInt32})
    ccall((:DAQmxGetPhysicalChanDIChangeDetectSupported, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanDOPortWidth(physicalChannel::String, data::Ref{UInt32})
    ccall((:DAQmxGetPhysicalChanDOPortWidth, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanDOSampClkSupported(physicalChannel::String, data::Ref{UInt32})
    ccall((:DAQmxGetPhysicalChanDOSampClkSupported, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanDOSampModes(physicalChannel::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetPhysicalChanDOSampModes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetPhysicalChanCISupportedMeasTypes(physicalChannel::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetPhysicalChanCISupportedMeasTypes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetPhysicalChanCOSupportedOutputTypes(physicalChannel::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetPhysicalChanCOSupportedOutputTypes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetPhysicalChanTEDSMfgID(physicalChannel::String, data::Ref{UInt32})
    ccall((:DAQmxGetPhysicalChanTEDSMfgID, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanTEDSModelNum(physicalChannel::String, data::Ref{UInt32})
    ccall((:DAQmxGetPhysicalChanTEDSModelNum, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanTEDSSerialNum(physicalChannel::String, data::Ref{UInt32})
    ccall((:DAQmxGetPhysicalChanTEDSSerialNum, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanTEDSVersionNum(physicalChannel::String, data::Ref{UInt32})
    ccall((:DAQmxGetPhysicalChanTEDSVersionNum, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanTEDSVersionLetter(physicalChannel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetPhysicalChanTEDSVersionLetter, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), physicalChannel, data, bufferSize)
end

function GetPhysicalChanTEDSBitStream(physicalChannel::String, data::Vector{Cuchar}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetPhysicalChanTEDSBitStream, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuchar}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetPhysicalChanTEDSTemplateIDs(physicalChannel::String, data::Vector{UInt32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetPhysicalChanTEDSTemplateIDs, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetReadRelativeTo(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetReadRelativeTo, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetReadRelativeTo(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetReadRelativeTo, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetReadRelativeTo(taskHandle::TaskHandle)
    ccall((:DAQmxResetReadRelativeTo, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetReadOffset(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetReadOffset, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetReadOffset(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetReadOffset, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetReadOffset(taskHandle::TaskHandle)
    ccall((:DAQmxResetReadOffset, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetReadChannelsToRead(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetReadChannelsToRead, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetReadChannelsToRead(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetReadChannelsToRead, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetReadChannelsToRead(taskHandle::TaskHandle)
    ccall((:DAQmxResetReadChannelsToRead, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetReadReadAllAvailSamp(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetReadReadAllAvailSamp, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetReadReadAllAvailSamp(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetReadReadAllAvailSamp, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetReadReadAllAvailSamp(taskHandle::TaskHandle)
    ccall((:DAQmxResetReadReadAllAvailSamp, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetReadAutoStart(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetReadAutoStart, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetReadAutoStart(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetReadAutoStart, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetReadAutoStart(taskHandle::TaskHandle)
    ccall((:DAQmxResetReadAutoStart, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetReadOverWrite(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetReadOverWrite, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetReadOverWrite(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetReadOverWrite, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetReadOverWrite(taskHandle::TaskHandle)
    ccall((:DAQmxResetReadOverWrite, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetLoggingFilePath(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetLoggingFilePath, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetLoggingFilePath(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetLoggingFilePath, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetLoggingFilePath(taskHandle::TaskHandle)
    ccall((:DAQmxResetLoggingFilePath, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetLoggingMode(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetLoggingMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetLoggingMode(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetLoggingMode, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetLoggingMode(taskHandle::TaskHandle)
    ccall((:DAQmxResetLoggingMode, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetLoggingTDMSGroupName(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetLoggingTDMSGroupName, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetLoggingTDMSGroupName(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetLoggingTDMSGroupName, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetLoggingTDMSGroupName(taskHandle::TaskHandle)
    ccall((:DAQmxResetLoggingTDMSGroupName, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetLoggingTDMSOperation(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetLoggingTDMSOperation, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetLoggingTDMSOperation(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetLoggingTDMSOperation, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetLoggingTDMSOperation(taskHandle::TaskHandle)
    ccall((:DAQmxResetLoggingTDMSOperation, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetLoggingPause(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetLoggingPause, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetLoggingPause(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetLoggingPause, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetLoggingPause(taskHandle::TaskHandle)
    ccall((:DAQmxResetLoggingPause, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetLoggingSampsPerFile(taskHandle::TaskHandle, data::Vector{Culonglong})
    ccall((:DAQmxGetLoggingSampsPerFile, :libnidaqmx), Cint, (TaskHandle, Ref{Culonglong}), taskHandle, data)
end

function SetLoggingSampsPerFile(taskHandle::TaskHandle, data::Culonglong)
    ccall((:DAQmxSetLoggingSampsPerFile, :libnidaqmx), Cint, (TaskHandle, Culonglong), taskHandle, data)
end

function ResetLoggingSampsPerFile(taskHandle::TaskHandle)
    ccall((:DAQmxResetLoggingSampsPerFile, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetLoggingFileWriteSize(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetLoggingFileWriteSize, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetLoggingFileWriteSize(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetLoggingFileWriteSize, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetLoggingFileWriteSize(taskHandle::TaskHandle)
    ccall((:DAQmxResetLoggingFileWriteSize, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetLoggingFilePreallocationSize(taskHandle::TaskHandle, data::Vector{Culonglong})
    ccall((:DAQmxGetLoggingFilePreallocationSize, :libnidaqmx), Cint, (TaskHandle, Ref{Culonglong}), taskHandle, data)
end

function SetLoggingFilePreallocationSize(taskHandle::TaskHandle, data::Culonglong)
    ccall((:DAQmxSetLoggingFilePreallocationSize, :libnidaqmx), Cint, (TaskHandle, Culonglong), taskHandle, data)
end

function ResetLoggingFilePreallocationSize(taskHandle::TaskHandle)
    ccall((:DAQmxResetLoggingFilePreallocationSize, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetReadCurrReadPos(taskHandle::TaskHandle, data::Vector{Culonglong})
    ccall((:DAQmxGetReadCurrReadPos, :libnidaqmx), Cint, (TaskHandle, Ref{Culonglong}), taskHandle, data)
end

function GetReadAvailSampPerChan(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetReadAvailSampPerChan, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadTotalSampPerChanAcquired(taskHandle::TaskHandle, data::Vector{Culonglong})
    ccall((:DAQmxGetReadTotalSampPerChanAcquired, :libnidaqmx), Cint, (TaskHandle, Ref{Culonglong}), taskHandle, data)
end

function GetReadCommonModeRangeErrorChansExist(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetReadCommonModeRangeErrorChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadCommonModeRangeErrorChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetReadCommonModeRangeErrorChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadExcitFaultChansExist(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetReadExcitFaultChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadExcitFaultChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetReadExcitFaultChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadOvercurrentChansExist(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetReadOvercurrentChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadOvercurrentChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetReadOvercurrentChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadOvertemperatureChansExist(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetReadOvertemperatureChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadOvertemperatureChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetReadOvertemperatureChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadOpenChansExist(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetReadOpenChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadOpenChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetReadOpenChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadOpenChansDetails(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetReadOpenChansDetails, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadOpenCurrentLoopChansExist(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetReadOpenCurrentLoopChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadOpenCurrentLoopChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetReadOpenCurrentLoopChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadOpenThrmcplChansExist(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetReadOpenThrmcplChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadOpenThrmcplChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetReadOpenThrmcplChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadOverloadedChansExist(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetReadOverloadedChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadOverloadedChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetReadOverloadedChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadPLLUnlockedChansExist(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetReadPLLUnlockedChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadPLLUnlockedChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetReadPLLUnlockedChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadSyncUnlockedChansExist(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetReadSyncUnlockedChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadSyncUnlockedChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetReadSyncUnlockedChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadAccessoryInsertionOrRemovalDetected(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetReadAccessoryInsertionOrRemovalDetected, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadDevsWithInsertedOrRemovedAccessories(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetReadDevsWithInsertedOrRemovedAccessories, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadChangeDetectHasOverflowed(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetReadChangeDetectHasOverflowed, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadRawDataWidth(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetReadRawDataWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadNumChans(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetReadNumChans, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadDigitalLinesBytesPerChan(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetReadDigitalLinesBytesPerChan, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadWaitMode(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetReadWaitMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetReadWaitMode(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetReadWaitMode, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetReadWaitMode(taskHandle::TaskHandle)
    ccall((:DAQmxResetReadWaitMode, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetReadSleepTime(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetReadSleepTime, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetReadSleepTime(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetReadSleepTime, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetReadSleepTime(taskHandle::TaskHandle)
    ccall((:DAQmxResetReadSleepTime, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRealTimeConvLateErrorsToWarnings(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetRealTimeConvLateErrorsToWarnings, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetRealTimeConvLateErrorsToWarnings(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetRealTimeConvLateErrorsToWarnings, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetRealTimeConvLateErrorsToWarnings(taskHandle::TaskHandle)
    ccall((:DAQmxResetRealTimeConvLateErrorsToWarnings, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRealTimeNumOfWarmupIters(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetRealTimeNumOfWarmupIters, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetRealTimeNumOfWarmupIters(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetRealTimeNumOfWarmupIters, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetRealTimeNumOfWarmupIters(taskHandle::TaskHandle)
    ccall((:DAQmxResetRealTimeNumOfWarmupIters, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRealTimeWaitForNextSampClkWaitMode(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetRealTimeWaitForNextSampClkWaitMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetRealTimeWaitForNextSampClkWaitMode(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetRealTimeWaitForNextSampClkWaitMode, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetRealTimeWaitForNextSampClkWaitMode(taskHandle::TaskHandle)
    ccall((:DAQmxResetRealTimeWaitForNextSampClkWaitMode, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRealTimeReportMissedSamp(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetRealTimeReportMissedSamp, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetRealTimeReportMissedSamp(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetRealTimeReportMissedSamp, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetRealTimeReportMissedSamp(taskHandle::TaskHandle)
    ccall((:DAQmxResetRealTimeReportMissedSamp, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRealTimeWriteRecoveryMode(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetRealTimeWriteRecoveryMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetRealTimeWriteRecoveryMode(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetRealTimeWriteRecoveryMode, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetRealTimeWriteRecoveryMode(taskHandle::TaskHandle)
    ccall((:DAQmxResetRealTimeWriteRecoveryMode, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetScaleDescr(scaleName::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetScaleDescr, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), scaleName, data, bufferSize)
end

function SetScaleDescr(scaleName::String, data)
    ccall((:DAQmxSetScaleDescr, :libnidaqmx), Cint, (Ref{UInt8}, Cstring), scaleName, data)
end

function GetScaleScaledUnits(scaleName::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetScaleScaledUnits, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), scaleName, data, bufferSize)
end

function SetScaleScaledUnits(scaleName::String, data)
    ccall((:DAQmxSetScaleScaledUnits, :libnidaqmx), Cint, (Ref{UInt8}, Cstring), scaleName, data)
end

function GetScalePreScaledUnits(scaleName::String, data::Integer)
    ccall((:DAQmxGetScalePreScaledUnits, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), scaleName, data)
end

function SetScalePreScaledUnits(scaleName::String, data::Integer)
    ccall((:DAQmxSetScalePreScaledUnits, :libnidaqmx), Cint, (Ref{UInt8}, Cint), scaleName, data)
end

function GetScaleType(scaleName::String, data::Integer)
    ccall((:DAQmxGetScaleType, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), scaleName, data)
end

function GetScaleLinSlope(scaleName::String, data::Real)
    ccall((:DAQmxGetScaleLinSlope, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), scaleName, data)
end

function SetScaleLinSlope(scaleName::String, data::Real)
    ccall((:DAQmxSetScaleLinSlope, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble), scaleName, data)
end

function GetScaleLinYIntercept(scaleName::String, data::Real)
    ccall((:DAQmxGetScaleLinYIntercept, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), scaleName, data)
end

function SetScaleLinYIntercept(scaleName::String, data::Real)
    ccall((:DAQmxSetScaleLinYIntercept, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble), scaleName, data)
end

function GetScaleMapScaledMax(scaleName::String, data::Real)
    ccall((:DAQmxGetScaleMapScaledMax, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), scaleName, data)
end

function SetScaleMapScaledMax(scaleName::String, data::Real)
    ccall((:DAQmxSetScaleMapScaledMax, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble), scaleName, data)
end

function GetScaleMapPreScaledMax(scaleName::String, data::Real)
    ccall((:DAQmxGetScaleMapPreScaledMax, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), scaleName, data)
end

function SetScaleMapPreScaledMax(scaleName::String, data::Real)
    ccall((:DAQmxSetScaleMapPreScaledMax, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble), scaleName, data)
end

function GetScaleMapScaledMin(scaleName::String, data::Real)
    ccall((:DAQmxGetScaleMapScaledMin, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), scaleName, data)
end

function SetScaleMapScaledMin(scaleName::String, data::Real)
    ccall((:DAQmxSetScaleMapScaledMin, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble), scaleName, data)
end

function GetScaleMapPreScaledMin(scaleName::String, data::Real)
    ccall((:DAQmxGetScaleMapPreScaledMin, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), scaleName, data)
end

function SetScaleMapPreScaledMin(scaleName::String, data::Real)
    ccall((:DAQmxSetScaleMapPreScaledMin, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble), scaleName, data)
end

function GetScalePolyForwardCoeff(scaleName::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetScalePolyForwardCoeff, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), scaleName, data, arraySizeInElements)
end

function SetScalePolyForwardCoeff(scaleName::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxSetScalePolyForwardCoeff, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), scaleName, data, arraySizeInElements)
end

function GetScalePolyReverseCoeff(scaleName::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetScalePolyReverseCoeff, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), scaleName, data, arraySizeInElements)
end

function SetScalePolyReverseCoeff(scaleName::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxSetScalePolyReverseCoeff, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), scaleName, data, arraySizeInElements)
end

function GetScaleTableScaledVals(scaleName::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetScaleTableScaledVals, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), scaleName, data, arraySizeInElements)
end

function SetScaleTableScaledVals(scaleName::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxSetScaleTableScaledVals, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), scaleName, data, arraySizeInElements)
end

function GetScaleTablePreScaledVals(scaleName::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetScaleTablePreScaledVals, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), scaleName, data, arraySizeInElements)
end

function SetScaleTablePreScaledVals(scaleName::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxSetScaleTablePreScaledVals, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), scaleName, data, arraySizeInElements)
end

function GetSwitchChanUsage(switchChannelName::String, data::Integer)
    ccall((:DAQmxGetSwitchChanUsage, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), switchChannelName, data)
end

function SetSwitchChanUsage(switchChannelName::String, data::Integer)
    ccall((:DAQmxSetSwitchChanUsage, :libnidaqmx), Cint, (Ref{UInt8}, Cint), switchChannelName, data)
end

function GetSwitchChanAnlgBusSharingEnable(switchChannelName::String, data::Ref{UInt32})
    ccall((:DAQmxGetSwitchChanAnlgBusSharingEnable, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), switchChannelName, data)
end

function SetSwitchChanAnlgBusSharingEnable(switchChannelName::String, data::Ref{UInt32})
    ccall((:DAQmxSetSwitchChanAnlgBusSharingEnable, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), switchChannelName, data)
end

function GetSwitchChanMaxACCarryCurrent(switchChannelName::String, data::Real)
    ccall((:DAQmxGetSwitchChanMaxACCarryCurrent, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanMaxACSwitchCurrent(switchChannelName::String, data::Real)
    ccall((:DAQmxGetSwitchChanMaxACSwitchCurrent, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanMaxACCarryPwr(switchChannelName::String, data::Real)
    ccall((:DAQmxGetSwitchChanMaxACCarryPwr, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanMaxACSwitchPwr(switchChannelName::String, data::Real)
    ccall((:DAQmxGetSwitchChanMaxACSwitchPwr, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanMaxDCCarryCurrent(switchChannelName::String, data::Real)
    ccall((:DAQmxGetSwitchChanMaxDCCarryCurrent, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanMaxDCSwitchCurrent(switchChannelName::String, data::Real)
    ccall((:DAQmxGetSwitchChanMaxDCSwitchCurrent, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanMaxDCCarryPwr(switchChannelName::String, data::Real)
    ccall((:DAQmxGetSwitchChanMaxDCCarryPwr, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanMaxDCSwitchPwr(switchChannelName::String, data::Real)
    ccall((:DAQmxGetSwitchChanMaxDCSwitchPwr, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanMaxACVoltage(switchChannelName::String, data::Real)
    ccall((:DAQmxGetSwitchChanMaxACVoltage, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanMaxDCVoltage(switchChannelName::String, data::Real)
    ccall((:DAQmxGetSwitchChanMaxDCVoltage, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanWireMode(switchChannelName::String, data::Ref{UInt32})
    ccall((:DAQmxGetSwitchChanWireMode, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), switchChannelName, data)
end

function GetSwitchChanBandwidth(switchChannelName::String, data::Real)
    ccall((:DAQmxGetSwitchChanBandwidth, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanImpedance(switchChannelName::String, data::Real)
    ccall((:DAQmxGetSwitchChanImpedance, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchDevSettlingTime(deviceName::String, data::Real)
    ccall((:DAQmxGetSwitchDevSettlingTime, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), deviceName, data)
end

function SetSwitchDevSettlingTime(deviceName::String, data::Real)
    ccall((:DAQmxSetSwitchDevSettlingTime, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble), deviceName, data)
end

function GetSwitchDevAutoConnAnlgBus(deviceName::String, data::Ref{UInt32})
    ccall((:DAQmxGetSwitchDevAutoConnAnlgBus, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function SetSwitchDevAutoConnAnlgBus(deviceName::String, data::Ref{UInt32})
    ccall((:DAQmxSetSwitchDevAutoConnAnlgBus, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), deviceName, data)
end

function GetSwitchDevPwrDownLatchRelaysAfterSettling(deviceName::String, data::Ref{UInt32})
    ccall((:DAQmxGetSwitchDevPwrDownLatchRelaysAfterSettling, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function SetSwitchDevPwrDownLatchRelaysAfterSettling(deviceName::String, data::Ref{UInt32})
    ccall((:DAQmxSetSwitchDevPwrDownLatchRelaysAfterSettling, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), deviceName, data)
end

function GetSwitchDevSettled(deviceName::String, data::Ref{UInt32})
    ccall((:DAQmxGetSwitchDevSettled, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function GetSwitchDevRelayList(deviceName::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetSwitchDevRelayList, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), deviceName, data, bufferSize)
end

function GetSwitchDevNumRelays(deviceName::String, data::Ref{UInt32})
    ccall((:DAQmxGetSwitchDevNumRelays, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function GetSwitchDevSwitchChanList(deviceName::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetSwitchDevSwitchChanList, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), deviceName, data, bufferSize)
end

function GetSwitchDevNumSwitchChans(deviceName::String, data::Ref{UInt32})
    ccall((:DAQmxGetSwitchDevNumSwitchChans, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function GetSwitchDevNumRows(deviceName::String, data::Ref{UInt32})
    ccall((:DAQmxGetSwitchDevNumRows, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function GetSwitchDevNumColumns(deviceName::String, data::Ref{UInt32})
    ccall((:DAQmxGetSwitchDevNumColumns, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function GetSwitchDevTopology(deviceName::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetSwitchDevTopology, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), deviceName, data, bufferSize)
end

function GetSwitchDevTemperature(deviceName::String, data::Real)
    ccall((:DAQmxGetSwitchDevTemperature, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), deviceName, data)
end

function GetSwitchScanBreakMode(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetSwitchScanBreakMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSwitchScanBreakMode(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetSwitchScanBreakMode, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSwitchScanBreakMode(taskHandle::TaskHandle)
    ccall((:DAQmxResetSwitchScanBreakMode, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSwitchScanRepeatMode(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetSwitchScanRepeatMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSwitchScanRepeatMode(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetSwitchScanRepeatMode, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSwitchScanRepeatMode(taskHandle::TaskHandle)
    ccall((:DAQmxResetSwitchScanRepeatMode, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSwitchScanWaitingForAdv(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetSwitchScanWaitingForAdv, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetSysGlobalChans(data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetSysGlobalChans, :libnidaqmx), Cint, (Ref{Cuchar}, Cuint), data, bufferSize)
end

function GetSysScales(data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetSysScales, :libnidaqmx), Cint, (Ref{Cuchar}, Cuint), data, bufferSize)
end

function GetSysTasks(data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetSysTasks, :libnidaqmx), Cint, (Ref{Cuchar}, Cuint), data, bufferSize)
end

function GetSysDevNames(data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetSysDevNames, :libnidaqmx), Cint, (Ref{Cuchar}, Cuint), data, bufferSize)
end

function GetSysNIDAQMajorVersion(data::Ref{UInt32})
    ccall((:DAQmxGetSysNIDAQMajorVersion, :libnidaqmx), Cint, (Ref{Cuint},), data)
end

function GetSysNIDAQMinorVersion(data::Ref{UInt32})
    ccall((:DAQmxGetSysNIDAQMinorVersion, :libnidaqmx), Cint, (Ref{Cuint},), data)
end

function GetSysNIDAQUpdateVersion(data::Ref{UInt32})
    ccall((:DAQmxGetSysNIDAQUpdateVersion, :libnidaqmx), Cint, (Ref{Cuint},), data)
end

function GetTaskName(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetTaskName, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetTaskChannels(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetTaskChannels, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetTaskNumChans(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetTaskNumChans, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetTaskDevices(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetTaskDevices, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetTaskNumDevices(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetTaskNumDevices, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetTaskComplete(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetTaskComplete, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetSampQuantSampMode(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetSampQuantSampMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSampQuantSampMode(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetSampQuantSampMode, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSampQuantSampMode(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampQuantSampMode, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampQuantSampPerChan(taskHandle::TaskHandle, data::Vector{Culonglong})
    ccall((:DAQmxGetSampQuantSampPerChan, :libnidaqmx), Cint, (TaskHandle, Ref{Culonglong}), taskHandle, data)
end

function SetSampQuantSampPerChan(taskHandle::TaskHandle, data::Culonglong)
    ccall((:DAQmxSetSampQuantSampPerChan, :libnidaqmx), Cint, (TaskHandle, Culonglong), taskHandle, data)
end

function ResetSampQuantSampPerChan(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampQuantSampPerChan, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampTimingType(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetSampTimingType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSampTimingType(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetSampTimingType, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSampTimingType(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampTimingType, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkRate(taskHandle::TaskHandle, data::Ref{Float64})
    ccall((:DAQmxGetSampClkRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetSampClkRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetSampClkRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetSampClkRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkMaxRate(taskHandle::TaskHandle, data::Ref{Float64})
    ccall((:DAQmxGetSampClkMaxRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function GetSampClkSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetSampClkSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetSampClkSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetSampClkSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetSampClkSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkActiveEdge(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetSampClkActiveEdge, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSampClkActiveEdge(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetSampClkActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSampClkActiveEdge(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkActiveEdge, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkOverrunBehavior(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetSampClkOverrunBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSampClkOverrunBehavior(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetSampClkOverrunBehavior, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSampClkOverrunBehavior(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkOverrunBehavior, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkUnderflowBehavior(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetSampClkUnderflowBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSampClkUnderflowBehavior(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetSampClkUnderflowBehavior, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSampClkUnderflowBehavior(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkUnderflowBehavior, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkTimebaseDiv(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetSampClkTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetSampClkTimebaseDiv(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetSampClkTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetSampClkTimebaseDiv(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkTimebaseDiv, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetSampClkTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetSampClkTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetSampClkTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetSampClkTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetSampClkTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetSampClkTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkTimebaseSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetSampClkTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetSampClkTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetSampClkTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetSampClkTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkTimebaseActiveEdge(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetSampClkTimebaseActiveEdge, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSampClkTimebaseActiveEdge(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetSampClkTimebaseActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSampClkTimebaseActiveEdge(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkTimebaseActiveEdge, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkTimebaseMasterTimebaseDiv(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetSampClkTimebaseMasterTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetSampClkTimebaseMasterTimebaseDiv(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetSampClkTimebaseMasterTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetSampClkTimebaseMasterTimebaseDiv(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkTimebaseMasterTimebaseDiv, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkTimebaseTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetSampClkTimebaseTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetSampClkDigFltrEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetSampClkDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetSampClkDigFltrEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetSampClkDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetSampClkDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetSampClkDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetSampClkDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetSampClkDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetSampClkDigFltrMinPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkDigFltrTimebaseSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetSampClkDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetSampClkDigFltrTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetSampClkDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetSampClkDigFltrTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkDigFltrTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetSampClkDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetSampClkDigFltrTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetSampClkDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetSampClkDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkDigSyncEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetSampClkDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetSampClkDigSyncEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetSampClkDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetSampClkDigSyncEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkDigSyncEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkWriteWfmUseInitialWfmDT(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetSampClkWriteWfmUseInitialWfmDT, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetSampClkWriteWfmUseInitialWfmDT(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetSampClkWriteWfmUseInitialWfmDT, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetSampClkWriteWfmUseInitialWfmDT(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkWriteWfmUseInitialWfmDT, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetHshkDelayAfterXfer(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetHshkDelayAfterXfer, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetHshkDelayAfterXfer(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetHshkDelayAfterXfer, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetHshkDelayAfterXfer(taskHandle::TaskHandle)
    ccall((:DAQmxResetHshkDelayAfterXfer, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetHshkStartCond(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetHshkStartCond, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetHshkStartCond(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetHshkStartCond, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetHshkStartCond(taskHandle::TaskHandle)
    ccall((:DAQmxResetHshkStartCond, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetHshkSampleInputDataWhen(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetHshkSampleInputDataWhen, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetHshkSampleInputDataWhen(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetHshkSampleInputDataWhen, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetHshkSampleInputDataWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetHshkSampleInputDataWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetChangeDetectDIRisingEdgePhysicalChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetChangeDetectDIRisingEdgePhysicalChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetChangeDetectDIRisingEdgePhysicalChans(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetChangeDetectDIRisingEdgePhysicalChans, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetChangeDetectDIRisingEdgePhysicalChans(taskHandle::TaskHandle)
    ccall((:DAQmxResetChangeDetectDIRisingEdgePhysicalChans, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetChangeDetectDIFallingEdgePhysicalChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetChangeDetectDIFallingEdgePhysicalChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetChangeDetectDIFallingEdgePhysicalChans(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetChangeDetectDIFallingEdgePhysicalChans, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetChangeDetectDIFallingEdgePhysicalChans(taskHandle::TaskHandle)
    ccall((:DAQmxResetChangeDetectDIFallingEdgePhysicalChans, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetChangeDetectDITristate(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetChangeDetectDITristate, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetChangeDetectDITristate(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetChangeDetectDITristate, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetChangeDetectDITristate(taskHandle::TaskHandle)
    ccall((:DAQmxResetChangeDetectDITristate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetOnDemandSimultaneousAOEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetOnDemandSimultaneousAOEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetOnDemandSimultaneousAOEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetOnDemandSimultaneousAOEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetOnDemandSimultaneousAOEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetOnDemandSimultaneousAOEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetImplicitUnderflowBehavior(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetImplicitUnderflowBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetImplicitUnderflowBehavior(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetImplicitUnderflowBehavior, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetImplicitUnderflowBehavior(taskHandle::TaskHandle)
    ccall((:DAQmxResetImplicitUnderflowBehavior, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAIConvRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAIConvRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetAIConvRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAIConvRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvRateEx(taskHandle::TaskHandle, deviceNames::String, data::Real)
    ccall((:DAQmxGetAIConvRateEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, deviceNames, data)
end

function SetAIConvRateEx(taskHandle::TaskHandle, deviceNames::String, data::Real)
    ccall((:DAQmxSetAIConvRateEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, deviceNames, data)
end

function ResetAIConvRateEx(taskHandle::TaskHandle, deviceNames::String)
    ccall((:DAQmxResetAIConvRateEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetAIConvMaxRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAIConvMaxRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function GetAIConvMaxRateEx(taskHandle::TaskHandle, deviceNames::String, data::Real)
    ccall((:DAQmxGetAIConvMaxRateEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, deviceNames, data)
end

function GetAIConvSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAIConvSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAIConvSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAIConvSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAIConvSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvSrcEx(taskHandle::TaskHandle, deviceNames::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAIConvSrcEx, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, deviceNames, data, bufferSize)
end

function SetAIConvSrcEx(taskHandle::TaskHandle, deviceNames::String, data)
    ccall((:DAQmxSetAIConvSrcEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, deviceNames, data)
end

function ResetAIConvSrcEx(taskHandle::TaskHandle, deviceNames::String)
    ccall((:DAQmxResetAIConvSrcEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetAIConvActiveEdge(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetAIConvActiveEdge, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAIConvActiveEdge(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetAIConvActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAIConvActiveEdge(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvActiveEdge, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvActiveEdgeEx(taskHandle::TaskHandle, deviceNames::String, data::Integer)
    ccall((:DAQmxGetAIConvActiveEdgeEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, deviceNames, data)
end

function SetAIConvActiveEdgeEx(taskHandle::TaskHandle, deviceNames::String, data::Integer)
    ccall((:DAQmxSetAIConvActiveEdgeEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, deviceNames, data)
end

function ResetAIConvActiveEdgeEx(taskHandle::TaskHandle, deviceNames::String)
    ccall((:DAQmxResetAIConvActiveEdgeEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetAIConvTimebaseDiv(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetAIConvTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAIConvTimebaseDiv(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetAIConvTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAIConvTimebaseDiv(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvTimebaseDiv, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvTimebaseDivEx(taskHandle::TaskHandle, deviceNames::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIConvTimebaseDivEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, deviceNames, data)
end

function SetAIConvTimebaseDivEx(taskHandle::TaskHandle, deviceNames::String, data::Ref{UInt32})
    ccall((:DAQmxSetAIConvTimebaseDivEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, deviceNames, data)
end

function ResetAIConvTimebaseDivEx(taskHandle::TaskHandle, deviceNames::String)
    ccall((:DAQmxResetAIConvTimebaseDivEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetAIConvTimebaseSrc(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetAIConvTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAIConvTimebaseSrc(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetAIConvTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAIConvTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvTimebaseSrcEx(taskHandle::TaskHandle, deviceNames::String, data::Integer)
    ccall((:DAQmxGetAIConvTimebaseSrcEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, deviceNames, data)
end

function SetAIConvTimebaseSrcEx(taskHandle::TaskHandle, deviceNames::String, data::Integer)
    ccall((:DAQmxSetAIConvTimebaseSrcEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, deviceNames, data)
end

function ResetAIConvTimebaseSrcEx(taskHandle::TaskHandle, deviceNames::String)
    ccall((:DAQmxResetAIConvTimebaseSrcEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetDelayFromSampClkDelayUnits(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetDelayFromSampClkDelayUnits, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDelayFromSampClkDelayUnits(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetDelayFromSampClkDelayUnits, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDelayFromSampClkDelayUnits(taskHandle::TaskHandle)
    ccall((:DAQmxResetDelayFromSampClkDelayUnits, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDelayFromSampClkDelayUnitsEx(taskHandle::TaskHandle, deviceNames::String, data::Integer)
    ccall((:DAQmxGetDelayFromSampClkDelayUnitsEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, deviceNames, data)
end

function SetDelayFromSampClkDelayUnitsEx(taskHandle::TaskHandle, deviceNames::String, data::Integer)
    ccall((:DAQmxSetDelayFromSampClkDelayUnitsEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, deviceNames, data)
end

function ResetDelayFromSampClkDelayUnitsEx(taskHandle::TaskHandle, deviceNames::String)
    ccall((:DAQmxResetDelayFromSampClkDelayUnitsEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetDelayFromSampClkDelay(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetDelayFromSampClkDelay, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetDelayFromSampClkDelay(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetDelayFromSampClkDelay, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetDelayFromSampClkDelay(taskHandle::TaskHandle)
    ccall((:DAQmxResetDelayFromSampClkDelay, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDelayFromSampClkDelayEx(taskHandle::TaskHandle, deviceNames::String, data::Real)
    ccall((:DAQmxGetDelayFromSampClkDelayEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, deviceNames, data)
end

function SetDelayFromSampClkDelayEx(taskHandle::TaskHandle, deviceNames::String, data::Real)
    ccall((:DAQmxSetDelayFromSampClkDelayEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, deviceNames, data)
end

function ResetDelayFromSampClkDelayEx(taskHandle::TaskHandle, deviceNames::String)
    ccall((:DAQmxResetDelayFromSampClkDelayEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetAIConvDigFltrEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetAIConvDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAIConvDigFltrEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetAIConvDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAIConvDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvDigFltrEnableEx(taskHandle::TaskHandle, deviceNames::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIConvDigFltrEnableEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, deviceNames, data)
end

function SetAIConvDigFltrEnableEx(taskHandle::TaskHandle, deviceNames::String, data::Ref{UInt32})
    ccall((:DAQmxSetAIConvDigFltrEnableEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, deviceNames, data)
end

function ResetAIConvDigFltrEnableEx(taskHandle::TaskHandle, deviceNames::String)
    ccall((:DAQmxResetAIConvDigFltrEnableEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetAIConvDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAIConvDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAIConvDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetAIConvDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAIConvDigFltrMinPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvDigFltrMinPulseWidthEx(taskHandle::TaskHandle, deviceNames::String, data::Real)
    ccall((:DAQmxGetAIConvDigFltrMinPulseWidthEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, deviceNames, data)
end

function SetAIConvDigFltrMinPulseWidthEx(taskHandle::TaskHandle, deviceNames::String, data::Real)
    ccall((:DAQmxSetAIConvDigFltrMinPulseWidthEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, deviceNames, data)
end

function ResetAIConvDigFltrMinPulseWidthEx(taskHandle::TaskHandle, deviceNames::String)
    ccall((:DAQmxResetAIConvDigFltrMinPulseWidthEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetAIConvDigFltrTimebaseSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAIConvDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAIConvDigFltrTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAIConvDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAIConvDigFltrTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvDigFltrTimebaseSrcEx(taskHandle::TaskHandle, deviceNames::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAIConvDigFltrTimebaseSrcEx, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, deviceNames, data, bufferSize)
end

function SetAIConvDigFltrTimebaseSrcEx(taskHandle::TaskHandle, deviceNames::String, data)
    ccall((:DAQmxSetAIConvDigFltrTimebaseSrcEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, deviceNames, data)
end

function ResetAIConvDigFltrTimebaseSrcEx(taskHandle::TaskHandle, deviceNames::String)
    ccall((:DAQmxResetAIConvDigFltrTimebaseSrcEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetAIConvDigFltrTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAIConvDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAIConvDigFltrTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetAIConvDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAIConvDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvDigFltrTimebaseRateEx(taskHandle::TaskHandle, deviceNames::String, data::Real)
    ccall((:DAQmxGetAIConvDigFltrTimebaseRateEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, deviceNames, data)
end

function SetAIConvDigFltrTimebaseRateEx(taskHandle::TaskHandle, deviceNames::String, data::Real)
    ccall((:DAQmxSetAIConvDigFltrTimebaseRateEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, deviceNames, data)
end

function ResetAIConvDigFltrTimebaseRateEx(taskHandle::TaskHandle, deviceNames::String)
    ccall((:DAQmxResetAIConvDigFltrTimebaseRateEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetAIConvDigSyncEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetAIConvDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAIConvDigSyncEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetAIConvDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAIConvDigSyncEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvDigSyncEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvDigSyncEnableEx(taskHandle::TaskHandle, deviceNames::String, data::Ref{UInt32})
    ccall((:DAQmxGetAIConvDigSyncEnableEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, deviceNames, data)
end

function SetAIConvDigSyncEnableEx(taskHandle::TaskHandle, deviceNames::String, data::Ref{UInt32})
    ccall((:DAQmxSetAIConvDigSyncEnableEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, deviceNames, data)
end

function ResetAIConvDigSyncEnableEx(taskHandle::TaskHandle, deviceNames::String)
    ccall((:DAQmxResetAIConvDigSyncEnableEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetMasterTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetMasterTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetMasterTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetMasterTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetMasterTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetMasterTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetMasterTimebaseSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetMasterTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetMasterTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetMasterTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetMasterTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetMasterTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefClkRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetRefClkRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetRefClkRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetRefClkRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetRefClkRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefClkRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefClkSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetRefClkSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetRefClkSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetRefClkSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetRefClkSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefClkSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSyncPulseType(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetSyncPulseType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSyncPulseType(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetSyncPulseType, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSyncPulseType(taskHandle::TaskHandle)
    ccall((:DAQmxResetSyncPulseType, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSyncPulseSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetSyncPulseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetSyncPulseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetSyncPulseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetSyncPulseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetSyncPulseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSyncPulseTimeWhen(taskHandle::TaskHandle, data::Vector{CVIAbsoluteTime})
    ccall((:DAQmxGetSyncPulseTimeWhen, :libnidaqmx), Cint, (TaskHandle, Ref{CVIAbsoluteTime}), taskHandle, data)
end

function SetSyncPulseTimeWhen(taskHandle::TaskHandle, data::CVIAbsoluteTime)
    ccall((:DAQmxSetSyncPulseTimeWhen, :libnidaqmx), Cint, (TaskHandle, CVIAbsoluteTime), taskHandle, data)
end

function ResetSyncPulseTimeWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetSyncPulseTimeWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSyncPulseTimeTimescale(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetSyncPulseTimeTimescale, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSyncPulseTimeTimescale(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetSyncPulseTimeTimescale, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSyncPulseTimeTimescale(taskHandle::TaskHandle)
    ccall((:DAQmxResetSyncPulseTimeTimescale, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSyncPulseSyncTime(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetSyncPulseSyncTime, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function GetSyncPulseMinDelayToStart(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetSyncPulseMinDelayToStart, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetSyncPulseMinDelayToStart(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetSyncPulseMinDelayToStart, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetSyncPulseMinDelayToStart(taskHandle::TaskHandle)
    ccall((:DAQmxResetSyncPulseMinDelayToStart, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSyncPulseResetTime(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetSyncPulseResetTime, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function GetSyncPulseResetDelay(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetSyncPulseResetDelay, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetSyncPulseResetDelay(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetSyncPulseResetDelay, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetSyncPulseResetDelay(taskHandle::TaskHandle)
    ccall((:DAQmxResetSyncPulseResetDelay, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSyncPulseTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetSyncPulseTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetSyncClkInterval(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetSyncClkInterval, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetSyncClkInterval(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetSyncClkInterval, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetSyncClkInterval(taskHandle::TaskHandle)
    ccall((:DAQmxResetSyncClkInterval, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampTimingEngine(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetSampTimingEngine, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetSampTimingEngine(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetSampTimingEngine, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetSampTimingEngine(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampTimingEngine, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetFirstSampTimestampEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetFirstSampTimestampEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetFirstSampTimestampEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetFirstSampTimestampEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetFirstSampTimestampEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetFirstSampTimestampEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetFirstSampTimestampTimescale(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetFirstSampTimestampTimescale, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetFirstSampTimestampTimescale(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetFirstSampTimestampTimescale, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetFirstSampTimestampTimescale(taskHandle::TaskHandle)
    ccall((:DAQmxResetFirstSampTimestampTimescale, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetFirstSampTimestampVal(taskHandle::TaskHandle, data::Vector{CVIAbsoluteTime})
    ccall((:DAQmxGetFirstSampTimestampVal, :libnidaqmx), Cint, (TaskHandle, Ref{CVIAbsoluteTime}), taskHandle, data)
end

function GetFirstSampClkWhen(taskHandle::TaskHandle, data::Vector{CVIAbsoluteTime})
    ccall((:DAQmxGetFirstSampClkWhen, :libnidaqmx), Cint, (TaskHandle, Ref{CVIAbsoluteTime}), taskHandle, data)
end

function SetFirstSampClkWhen(taskHandle::TaskHandle, data::CVIAbsoluteTime)
    ccall((:DAQmxSetFirstSampClkWhen, :libnidaqmx), Cint, (TaskHandle, CVIAbsoluteTime), taskHandle, data)
end

function ResetFirstSampClkWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetFirstSampClkWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetFirstSampClkTimescale(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetFirstSampClkTimescale, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetFirstSampClkTimescale(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetFirstSampClkTimescale, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetFirstSampClkTimescale(taskHandle::TaskHandle)
    ccall((:DAQmxResetFirstSampClkTimescale, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigType(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetStartTrigType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetStartTrigType(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetStartTrigType, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetStartTrigType(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigType, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetStartTrigTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetDigEdgeStartTrigSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDigEdgeStartTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigEdgeStartTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigEdgeStartTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigEdgeStartTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeStartTrigEdge(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetDigEdgeStartTrigEdge, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDigEdgeStartTrigEdge(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetDigEdgeStartTrigEdge, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDigEdgeStartTrigEdge(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigEdge, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeStartTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetDigEdgeStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetDigEdgeStartTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetDigEdgeStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetDigEdgeStartTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetDigEdgeStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetDigEdgeStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetDigEdgeStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetDigEdgeStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeStartTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDigEdgeStartTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigEdgeStartTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigEdgeStartTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigEdgeStartTrigDigFltrTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetDigEdgeStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetDigEdgeStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetDigEdgeStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetDigEdgeStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeStartTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetDigEdgeStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetDigEdgeStartTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetDigEdgeStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetDigEdgeStartTrigDigSyncEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigPatternStartTrigSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDigPatternStartTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigPatternStartTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigPatternStartTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigPatternStartTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigPatternStartTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigPatternStartTrigPattern(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDigPatternStartTrigPattern, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigPatternStartTrigPattern(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigPatternStartTrigPattern, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigPatternStartTrigPattern(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigPatternStartTrigPattern, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigPatternStartTrigWhen(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetDigPatternStartTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDigPatternStartTrigWhen(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetDigPatternStartTrigWhen, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDigPatternStartTrigWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigPatternStartTrigWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeStartTrigSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAnlgEdgeStartTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgEdgeStartTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgEdgeStartTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgEdgeStartTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeStartTrigSlope(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetAnlgEdgeStartTrigSlope, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgEdgeStartTrigSlope(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetAnlgEdgeStartTrigSlope, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgEdgeStartTrigSlope(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigSlope, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeStartTrigLvl(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAnlgEdgeStartTrigLvl, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgEdgeStartTrigLvl(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetAnlgEdgeStartTrigLvl, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgEdgeStartTrigLvl(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigLvl, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeStartTrigHyst(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAnlgEdgeStartTrigHyst, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgEdgeStartTrigHyst(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetAnlgEdgeStartTrigHyst, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgEdgeStartTrigHyst(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigHyst, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeStartTrigCoupling(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetAnlgEdgeStartTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgEdgeStartTrigCoupling(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetAnlgEdgeStartTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgEdgeStartTrigCoupling(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigCoupling, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeStartTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetAnlgEdgeStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgEdgeStartTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetAnlgEdgeStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgEdgeStartTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAnlgEdgeStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgEdgeStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetAnlgEdgeStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgEdgeStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeStartTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAnlgEdgeStartTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgEdgeStartTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgEdgeStartTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgEdgeStartTrigDigFltrTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAnlgEdgeStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgEdgeStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetAnlgEdgeStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgEdgeStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeStartTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetAnlgEdgeStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgEdgeStartTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetAnlgEdgeStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgEdgeStartTrigDigSyncEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgMultiEdgeStartTrigSrcs(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAnlgMultiEdgeStartTrigSrcs, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgMultiEdgeStartTrigSrcs(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgMultiEdgeStartTrigSrcs, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgMultiEdgeStartTrigSrcs(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeStartTrigSrcs, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgMultiEdgeStartTrigSlopes(taskHandle::TaskHandle, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetAnlgMultiEdgeStartTrigSlopes, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}, Cuint), taskHandle, data, arraySizeInElements)
end

function SetAnlgMultiEdgeStartTrigSlopes(taskHandle::TaskHandle, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxSetAnlgMultiEdgeStartTrigSlopes, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}, Cuint), taskHandle, data, arraySizeInElements)
end

function ResetAnlgMultiEdgeStartTrigSlopes(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeStartTrigSlopes, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgMultiEdgeStartTrigLvls(taskHandle::TaskHandle, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetAnlgMultiEdgeStartTrigLvls, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}, Cuint), taskHandle, data, arraySizeInElements)
end

function SetAnlgMultiEdgeStartTrigLvls(taskHandle::TaskHandle, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxSetAnlgMultiEdgeStartTrigLvls, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}, Cuint), taskHandle, data, arraySizeInElements)
end

function ResetAnlgMultiEdgeStartTrigLvls(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeStartTrigLvls, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgMultiEdgeStartTrigHysts(taskHandle::TaskHandle, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetAnlgMultiEdgeStartTrigHysts, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}, Cuint), taskHandle, data, arraySizeInElements)
end

function SetAnlgMultiEdgeStartTrigHysts(taskHandle::TaskHandle, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxSetAnlgMultiEdgeStartTrigHysts, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}, Cuint), taskHandle, data, arraySizeInElements)
end

function ResetAnlgMultiEdgeStartTrigHysts(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeStartTrigHysts, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgMultiEdgeStartTrigCouplings(taskHandle::TaskHandle, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetAnlgMultiEdgeStartTrigCouplings, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}, Cuint), taskHandle, data, arraySizeInElements)
end

function SetAnlgMultiEdgeStartTrigCouplings(taskHandle::TaskHandle, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxSetAnlgMultiEdgeStartTrigCouplings, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}, Cuint), taskHandle, data, arraySizeInElements)
end

function ResetAnlgMultiEdgeStartTrigCouplings(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeStartTrigCouplings, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinStartTrigSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAnlgWinStartTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgWinStartTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgWinStartTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgWinStartTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinStartTrigWhen(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetAnlgWinStartTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgWinStartTrigWhen(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetAnlgWinStartTrigWhen, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgWinStartTrigWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinStartTrigTop(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAnlgWinStartTrigTop, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinStartTrigTop(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetAnlgWinStartTrigTop, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinStartTrigTop(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigTop, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinStartTrigBtm(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAnlgWinStartTrigBtm, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinStartTrigBtm(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetAnlgWinStartTrigBtm, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinStartTrigBtm(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigBtm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinStartTrigCoupling(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetAnlgWinStartTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgWinStartTrigCoupling(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetAnlgWinStartTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgWinStartTrigCoupling(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigCoupling, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinStartTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetAnlgWinStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgWinStartTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetAnlgWinStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgWinStartTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAnlgWinStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetAnlgWinStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinStartTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAnlgWinStartTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgWinStartTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgWinStartTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgWinStartTrigDigFltrTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAnlgWinStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetAnlgWinStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinStartTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetAnlgWinStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgWinStartTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetAnlgWinStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgWinStartTrigDigSyncEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigTrigWhen(taskHandle::TaskHandle, data::Vector{CVIAbsoluteTime})
    ccall((:DAQmxGetStartTrigTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{CVIAbsoluteTime}), taskHandle, data)
end

function SetStartTrigTrigWhen(taskHandle::TaskHandle, data::CVIAbsoluteTime)
    ccall((:DAQmxSetStartTrigTrigWhen, :libnidaqmx), Cint, (TaskHandle, CVIAbsoluteTime), taskHandle, data)
end

function ResetStartTrigTrigWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigTrigWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigTimescale(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetStartTrigTimescale, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetStartTrigTimescale(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetStartTrigTimescale, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetStartTrigTimescale(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigTimescale, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigTimestampEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetStartTrigTimestampEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetStartTrigTimestampEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetStartTrigTimestampEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetStartTrigTimestampEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigTimestampEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigTimestampTimescale(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetStartTrigTimestampTimescale, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetStartTrigTimestampTimescale(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetStartTrigTimestampTimescale, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetStartTrigTimestampTimescale(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigTimestampTimescale, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigTimestampVal(taskHandle::TaskHandle, data::Vector{CVIAbsoluteTime})
    ccall((:DAQmxGetStartTrigTimestampVal, :libnidaqmx), Cint, (TaskHandle, Ref{CVIAbsoluteTime}), taskHandle, data)
end

function GetStartTrigDelay(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetStartTrigDelay, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetStartTrigDelay(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetStartTrigDelay, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetStartTrigDelay(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigDelay, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigDelayUnits(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetStartTrigDelayUnits, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetStartTrigDelayUnits(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetStartTrigDelayUnits, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetStartTrigDelayUnits(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigDelayUnits, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigRetriggerable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetStartTrigRetriggerable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetStartTrigRetriggerable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetStartTrigRetriggerable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetStartTrigRetriggerable(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigRetriggerable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigTrigWin(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetStartTrigTrigWin, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetStartTrigTrigWin(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetStartTrigTrigWin, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetStartTrigTrigWin(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigTrigWin, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigRetriggerWin(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetStartTrigRetriggerWin, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetStartTrigRetriggerWin(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetStartTrigRetriggerWin, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetStartTrigRetriggerWin(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigRetriggerWin, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigMaxNumTrigsToDetect(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetStartTrigMaxNumTrigsToDetect, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetStartTrigMaxNumTrigsToDetect(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetStartTrigMaxNumTrigsToDetect, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetStartTrigMaxNumTrigsToDetect(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigMaxNumTrigsToDetect, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigType(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetRefTrigType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetRefTrigType(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetRefTrigType, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetRefTrigType(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigType, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigPretrigSamples(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetRefTrigPretrigSamples, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetRefTrigPretrigSamples(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetRefTrigPretrigSamples, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetRefTrigPretrigSamples(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigPretrigSamples, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetRefTrigTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetDigEdgeRefTrigSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDigEdgeRefTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigEdgeRefTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigEdgeRefTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigEdgeRefTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeRefTrigEdge(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetDigEdgeRefTrigEdge, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDigEdgeRefTrigEdge(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetDigEdgeRefTrigEdge, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDigEdgeRefTrigEdge(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigEdge, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeRefTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetDigEdgeRefTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetDigEdgeRefTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetDigEdgeRefTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetDigEdgeRefTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeRefTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetDigEdgeRefTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetDigEdgeRefTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetDigEdgeRefTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetDigEdgeRefTrigDigFltrMinPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeRefTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDigEdgeRefTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigEdgeRefTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigEdgeRefTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigEdgeRefTrigDigFltrTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeRefTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetDigEdgeRefTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetDigEdgeRefTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetDigEdgeRefTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetDigEdgeRefTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeRefTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetDigEdgeRefTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetDigEdgeRefTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetDigEdgeRefTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetDigEdgeRefTrigDigSyncEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigPatternRefTrigSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDigPatternRefTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigPatternRefTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigPatternRefTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigPatternRefTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigPatternRefTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigPatternRefTrigPattern(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDigPatternRefTrigPattern, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigPatternRefTrigPattern(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigPatternRefTrigPattern, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigPatternRefTrigPattern(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigPatternRefTrigPattern, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigPatternRefTrigWhen(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetDigPatternRefTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDigPatternRefTrigWhen(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetDigPatternRefTrigWhen, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDigPatternRefTrigWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigPatternRefTrigWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeRefTrigSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAnlgEdgeRefTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgEdgeRefTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgEdgeRefTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgEdgeRefTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeRefTrigSlope(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetAnlgEdgeRefTrigSlope, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgEdgeRefTrigSlope(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetAnlgEdgeRefTrigSlope, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgEdgeRefTrigSlope(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigSlope, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeRefTrigLvl(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAnlgEdgeRefTrigLvl, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgEdgeRefTrigLvl(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetAnlgEdgeRefTrigLvl, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgEdgeRefTrigLvl(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigLvl, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeRefTrigHyst(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAnlgEdgeRefTrigHyst, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgEdgeRefTrigHyst(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetAnlgEdgeRefTrigHyst, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgEdgeRefTrigHyst(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigHyst, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeRefTrigCoupling(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetAnlgEdgeRefTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgEdgeRefTrigCoupling(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetAnlgEdgeRefTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgEdgeRefTrigCoupling(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigCoupling, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeRefTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetAnlgEdgeRefTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgEdgeRefTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetAnlgEdgeRefTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgEdgeRefTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeRefTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAnlgEdgeRefTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgEdgeRefTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetAnlgEdgeRefTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgEdgeRefTrigDigFltrMinPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeRefTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAnlgEdgeRefTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgEdgeRefTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgEdgeRefTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgEdgeRefTrigDigFltrTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeRefTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAnlgEdgeRefTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgEdgeRefTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetAnlgEdgeRefTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgEdgeRefTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeRefTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetAnlgEdgeRefTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgEdgeRefTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetAnlgEdgeRefTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgEdgeRefTrigDigSyncEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgMultiEdgeRefTrigSrcs(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAnlgMultiEdgeRefTrigSrcs, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgMultiEdgeRefTrigSrcs(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgMultiEdgeRefTrigSrcs, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgMultiEdgeRefTrigSrcs(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeRefTrigSrcs, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgMultiEdgeRefTrigSlopes(taskHandle::TaskHandle, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetAnlgMultiEdgeRefTrigSlopes, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}, Cuint), taskHandle, data, arraySizeInElements)
end

function SetAnlgMultiEdgeRefTrigSlopes(taskHandle::TaskHandle, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxSetAnlgMultiEdgeRefTrigSlopes, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}, Cuint), taskHandle, data, arraySizeInElements)
end

function ResetAnlgMultiEdgeRefTrigSlopes(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeRefTrigSlopes, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgMultiEdgeRefTrigLvls(taskHandle::TaskHandle, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetAnlgMultiEdgeRefTrigLvls, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}, Cuint), taskHandle, data, arraySizeInElements)
end

function SetAnlgMultiEdgeRefTrigLvls(taskHandle::TaskHandle, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxSetAnlgMultiEdgeRefTrigLvls, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}, Cuint), taskHandle, data, arraySizeInElements)
end

function ResetAnlgMultiEdgeRefTrigLvls(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeRefTrigLvls, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgMultiEdgeRefTrigHysts(taskHandle::TaskHandle, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetAnlgMultiEdgeRefTrigHysts, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}, Cuint), taskHandle, data, arraySizeInElements)
end

function SetAnlgMultiEdgeRefTrigHysts(taskHandle::TaskHandle, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxSetAnlgMultiEdgeRefTrigHysts, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}, Cuint), taskHandle, data, arraySizeInElements)
end

function ResetAnlgMultiEdgeRefTrigHysts(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeRefTrigHysts, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgMultiEdgeRefTrigCouplings(taskHandle::TaskHandle, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetAnlgMultiEdgeRefTrigCouplings, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}, Cuint), taskHandle, data, arraySizeInElements)
end

function SetAnlgMultiEdgeRefTrigCouplings(taskHandle::TaskHandle, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxSetAnlgMultiEdgeRefTrigCouplings, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}, Cuint), taskHandle, data, arraySizeInElements)
end

function ResetAnlgMultiEdgeRefTrigCouplings(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeRefTrigCouplings, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinRefTrigSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAnlgWinRefTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgWinRefTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgWinRefTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgWinRefTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinRefTrigWhen(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetAnlgWinRefTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgWinRefTrigWhen(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetAnlgWinRefTrigWhen, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgWinRefTrigWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinRefTrigTop(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAnlgWinRefTrigTop, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinRefTrigTop(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetAnlgWinRefTrigTop, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinRefTrigTop(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigTop, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinRefTrigBtm(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAnlgWinRefTrigBtm, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinRefTrigBtm(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetAnlgWinRefTrigBtm, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinRefTrigBtm(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigBtm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinRefTrigCoupling(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetAnlgWinRefTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgWinRefTrigCoupling(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetAnlgWinRefTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgWinRefTrigCoupling(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigCoupling, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinRefTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetAnlgWinRefTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgWinRefTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetAnlgWinRefTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgWinRefTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinRefTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAnlgWinRefTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinRefTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetAnlgWinRefTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinRefTrigDigFltrMinPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinRefTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAnlgWinRefTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgWinRefTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgWinRefTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgWinRefTrigDigFltrTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinRefTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAnlgWinRefTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinRefTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetAnlgWinRefTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinRefTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinRefTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetAnlgWinRefTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgWinRefTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetAnlgWinRefTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgWinRefTrigDigSyncEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigAutoTrigEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetRefTrigAutoTrigEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetRefTrigAutoTrigEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetRefTrigAutoTrigEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetRefTrigAutoTrigEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigAutoTrigEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigAutoTriggered(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetRefTrigAutoTriggered, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetRefTrigTimestampEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetRefTrigTimestampEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetRefTrigTimestampEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetRefTrigTimestampEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetRefTrigTimestampEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigTimestampEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigTimestampTimescale(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetRefTrigTimestampTimescale, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetRefTrigTimestampTimescale(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetRefTrigTimestampTimescale, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetRefTrigTimestampTimescale(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigTimestampTimescale, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigTimestampVal(taskHandle::TaskHandle, data::Vector{CVIAbsoluteTime})
    ccall((:DAQmxGetRefTrigTimestampVal, :libnidaqmx), Cint, (TaskHandle, Ref{CVIAbsoluteTime}), taskHandle, data)
end

function GetRefTrigDelay(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetRefTrigDelay, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetRefTrigDelay(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetRefTrigDelay, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetRefTrigDelay(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigDelay, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigRetriggerable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetRefTrigRetriggerable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetRefTrigRetriggerable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetRefTrigRetriggerable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetRefTrigRetriggerable(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigRetriggerable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigTrigWin(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetRefTrigTrigWin, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetRefTrigTrigWin(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetRefTrigTrigWin, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetRefTrigTrigWin(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigTrigWin, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigRetriggerWin(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetRefTrigRetriggerWin, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetRefTrigRetriggerWin(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetRefTrigRetriggerWin, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetRefTrigRetriggerWin(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigRetriggerWin, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigMaxNumTrigsToDetect(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetRefTrigMaxNumTrigsToDetect, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetRefTrigMaxNumTrigsToDetect(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetRefTrigMaxNumTrigsToDetect, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetRefTrigMaxNumTrigsToDetect(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigMaxNumTrigsToDetect, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAdvTrigType(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetAdvTrigType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAdvTrigType(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetAdvTrigType, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAdvTrigType(taskHandle::TaskHandle)
    ccall((:DAQmxResetAdvTrigType, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeAdvTrigSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDigEdgeAdvTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigEdgeAdvTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigEdgeAdvTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigEdgeAdvTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeAdvTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeAdvTrigEdge(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetDigEdgeAdvTrigEdge, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDigEdgeAdvTrigEdge(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetDigEdgeAdvTrigEdge, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDigEdgeAdvTrigEdge(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeAdvTrigEdge, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeAdvTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetDigEdgeAdvTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetDigEdgeAdvTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetDigEdgeAdvTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetDigEdgeAdvTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeAdvTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetHshkTrigType(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetHshkTrigType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetHshkTrigType(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetHshkTrigType, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetHshkTrigType(taskHandle::TaskHandle)
    ccall((:DAQmxResetHshkTrigType, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetInterlockedHshkTrigSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetInterlockedHshkTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetInterlockedHshkTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetInterlockedHshkTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetInterlockedHshkTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetInterlockedHshkTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetInterlockedHshkTrigAssertedLvl(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetInterlockedHshkTrigAssertedLvl, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetInterlockedHshkTrigAssertedLvl(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetInterlockedHshkTrigAssertedLvl, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetInterlockedHshkTrigAssertedLvl(taskHandle::TaskHandle)
    ccall((:DAQmxResetInterlockedHshkTrigAssertedLvl, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetPauseTrigType(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetPauseTrigType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetPauseTrigType(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetPauseTrigType, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetPauseTrigType(taskHandle::TaskHandle)
    ccall((:DAQmxResetPauseTrigType, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetPauseTrigTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetPauseTrigTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetAnlgLvlPauseTrigSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAnlgLvlPauseTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgLvlPauseTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgLvlPauseTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgLvlPauseTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgLvlPauseTrigWhen(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetAnlgLvlPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgLvlPauseTrigWhen(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetAnlgLvlPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgLvlPauseTrigWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgLvlPauseTrigLvl(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAnlgLvlPauseTrigLvl, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgLvlPauseTrigLvl(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetAnlgLvlPauseTrigLvl, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgLvlPauseTrigLvl(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigLvl, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgLvlPauseTrigHyst(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAnlgLvlPauseTrigHyst, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgLvlPauseTrigHyst(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetAnlgLvlPauseTrigHyst, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgLvlPauseTrigHyst(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigHyst, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgLvlPauseTrigCoupling(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetAnlgLvlPauseTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgLvlPauseTrigCoupling(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetAnlgLvlPauseTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgLvlPauseTrigCoupling(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigCoupling, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgLvlPauseTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetAnlgLvlPauseTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgLvlPauseTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetAnlgLvlPauseTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgLvlPauseTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgLvlPauseTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAnlgLvlPauseTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgLvlPauseTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetAnlgLvlPauseTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgLvlPauseTrigDigFltrMinPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgLvlPauseTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAnlgLvlPauseTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgLvlPauseTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgLvlPauseTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgLvlPauseTrigDigFltrTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgLvlPauseTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAnlgLvlPauseTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgLvlPauseTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetAnlgLvlPauseTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgLvlPauseTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgLvlPauseTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetAnlgLvlPauseTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgLvlPauseTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetAnlgLvlPauseTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgLvlPauseTrigDigSyncEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinPauseTrigSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAnlgWinPauseTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgWinPauseTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgWinPauseTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgWinPauseTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinPauseTrigWhen(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetAnlgWinPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgWinPauseTrigWhen(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetAnlgWinPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgWinPauseTrigWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinPauseTrigTop(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAnlgWinPauseTrigTop, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinPauseTrigTop(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetAnlgWinPauseTrigTop, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinPauseTrigTop(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigTop, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinPauseTrigBtm(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAnlgWinPauseTrigBtm, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinPauseTrigBtm(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetAnlgWinPauseTrigBtm, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinPauseTrigBtm(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigBtm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinPauseTrigCoupling(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetAnlgWinPauseTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgWinPauseTrigCoupling(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetAnlgWinPauseTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgWinPauseTrigCoupling(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigCoupling, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinPauseTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetAnlgWinPauseTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgWinPauseTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetAnlgWinPauseTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgWinPauseTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinPauseTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAnlgWinPauseTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinPauseTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetAnlgWinPauseTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinPauseTrigDigFltrMinPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinPauseTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAnlgWinPauseTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgWinPauseTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgWinPauseTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgWinPauseTrigDigFltrTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinPauseTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetAnlgWinPauseTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinPauseTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetAnlgWinPauseTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinPauseTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinPauseTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetAnlgWinPauseTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgWinPauseTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetAnlgWinPauseTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgWinPauseTrigDigSyncEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigLvlPauseTrigSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDigLvlPauseTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigLvlPauseTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigLvlPauseTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigLvlPauseTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigLvlPauseTrigWhen(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetDigLvlPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDigLvlPauseTrigWhen(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetDigLvlPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDigLvlPauseTrigWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigLvlPauseTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetDigLvlPauseTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetDigLvlPauseTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetDigLvlPauseTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetDigLvlPauseTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigLvlPauseTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetDigLvlPauseTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetDigLvlPauseTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetDigLvlPauseTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetDigLvlPauseTrigDigFltrMinPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigLvlPauseTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDigLvlPauseTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigLvlPauseTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigLvlPauseTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigLvlPauseTrigDigFltrTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigLvlPauseTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetDigLvlPauseTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetDigLvlPauseTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetDigLvlPauseTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetDigLvlPauseTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigLvlPauseTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetDigLvlPauseTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetDigLvlPauseTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetDigLvlPauseTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetDigLvlPauseTrigDigSyncEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigPatternPauseTrigSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDigPatternPauseTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigPatternPauseTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigPatternPauseTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigPatternPauseTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigPatternPauseTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigPatternPauseTrigPattern(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDigPatternPauseTrigPattern, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigPatternPauseTrigPattern(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigPatternPauseTrigPattern, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigPatternPauseTrigPattern(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigPatternPauseTrigPattern, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigPatternPauseTrigWhen(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetDigPatternPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDigPatternPauseTrigWhen(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetDigPatternPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDigPatternPauseTrigWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigPatternPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetArmStartTrigType(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetArmStartTrigType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetArmStartTrigType(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetArmStartTrigType, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetArmStartTrigType(taskHandle::TaskHandle)
    ccall((:DAQmxResetArmStartTrigType, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetArmStartTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetArmStartTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetDigEdgeArmStartTrigSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDigEdgeArmStartTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigEdgeArmStartTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigEdgeArmStartTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigEdgeArmStartTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeArmStartTrigEdge(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetDigEdgeArmStartTrigEdge, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDigEdgeArmStartTrigEdge(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetDigEdgeArmStartTrigEdge, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDigEdgeArmStartTrigEdge(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigEdge, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeArmStartTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetDigEdgeArmStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetDigEdgeArmStartTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetDigEdgeArmStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetDigEdgeArmStartTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeArmStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetDigEdgeArmStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetDigEdgeArmStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetDigEdgeArmStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetDigEdgeArmStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeArmStartTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDigEdgeArmStartTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigEdgeArmStartTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigEdgeArmStartTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigEdgeArmStartTrigDigFltrTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeArmStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetDigEdgeArmStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetDigEdgeArmStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetDigEdgeArmStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetDigEdgeArmStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeArmStartTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetDigEdgeArmStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetDigEdgeArmStartTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetDigEdgeArmStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetDigEdgeArmStartTrigDigSyncEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetArmStartTrigTrigWhen(taskHandle::TaskHandle, data::Vector{CVIAbsoluteTime})
    ccall((:DAQmxGetArmStartTrigTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{CVIAbsoluteTime}), taskHandle, data)
end

function SetArmStartTrigTrigWhen(taskHandle::TaskHandle, data::CVIAbsoluteTime)
    ccall((:DAQmxSetArmStartTrigTrigWhen, :libnidaqmx), Cint, (TaskHandle, CVIAbsoluteTime), taskHandle, data)
end

function ResetArmStartTrigTrigWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetArmStartTrigTrigWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetArmStartTrigTimescale(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetArmStartTrigTimescale, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetArmStartTrigTimescale(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetArmStartTrigTimescale, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetArmStartTrigTimescale(taskHandle::TaskHandle)
    ccall((:DAQmxResetArmStartTrigTimescale, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetArmStartTrigTimestampEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetArmStartTrigTimestampEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetArmStartTrigTimestampEnable(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetArmStartTrigTimestampEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetArmStartTrigTimestampEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetArmStartTrigTimestampEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetArmStartTrigTimestampTimescale(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetArmStartTrigTimestampTimescale, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetArmStartTrigTimestampTimescale(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetArmStartTrigTimestampTimescale, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetArmStartTrigTimestampTimescale(taskHandle::TaskHandle)
    ccall((:DAQmxResetArmStartTrigTimestampTimescale, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetArmStartTrigTimestampVal(taskHandle::TaskHandle, data::Vector{CVIAbsoluteTime})
    ccall((:DAQmxGetArmStartTrigTimestampVal, :libnidaqmx), Cint, (TaskHandle, Ref{CVIAbsoluteTime}), taskHandle, data)
end

function GetTriggerSyncType(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetTriggerSyncType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetTriggerSyncType(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetTriggerSyncType, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetTriggerSyncType(taskHandle::TaskHandle)
    ccall((:DAQmxResetTriggerSyncType, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetWatchdogTimeout(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetWatchdogTimeout, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetWatchdogTimeout(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetWatchdogTimeout, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetWatchdogTimeout(taskHandle::TaskHandle)
    ccall((:DAQmxResetWatchdogTimeout, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetWatchdogExpirTrigType(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetWatchdogExpirTrigType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetWatchdogExpirTrigType(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetWatchdogExpirTrigType, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetWatchdogExpirTrigType(taskHandle::TaskHandle)
    ccall((:DAQmxResetWatchdogExpirTrigType, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetWatchdogExpirTrigTrigOnNetworkConnLoss(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetWatchdogExpirTrigTrigOnNetworkConnLoss, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetWatchdogExpirTrigTrigOnNetworkConnLoss(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxSetWatchdogExpirTrigTrigOnNetworkConnLoss, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetWatchdogExpirTrigTrigOnNetworkConnLoss(taskHandle::TaskHandle)
    ccall((:DAQmxResetWatchdogExpirTrigTrigOnNetworkConnLoss, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeWatchdogExpirTrigSrc(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDigEdgeWatchdogExpirTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigEdgeWatchdogExpirTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigEdgeWatchdogExpirTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigEdgeWatchdogExpirTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeWatchdogExpirTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeWatchdogExpirTrigEdge(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetDigEdgeWatchdogExpirTrigEdge, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDigEdgeWatchdogExpirTrigEdge(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetDigEdgeWatchdogExpirTrigEdge, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDigEdgeWatchdogExpirTrigEdge(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeWatchdogExpirTrigEdge, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetWatchdogDOExpirState(taskHandle::TaskHandle, lines::String, data::Integer)
    ccall((:DAQmxGetWatchdogDOExpirState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, lines, data)
end

function SetWatchdogDOExpirState(taskHandle::TaskHandle, lines::String, data::Integer)
    ccall((:DAQmxSetWatchdogDOExpirState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, lines, data)
end

function ResetWatchdogDOExpirState(taskHandle::TaskHandle, lines::String)
    ccall((:DAQmxResetWatchdogDOExpirState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, lines)
end

function GetWatchdogAOOutputType(taskHandle::TaskHandle, lines::String, data::Integer)
    ccall((:DAQmxGetWatchdogAOOutputType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, lines, data)
end

function SetWatchdogAOOutputType(taskHandle::TaskHandle, lines::String, data::Integer)
    ccall((:DAQmxSetWatchdogAOOutputType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, lines, data)
end

function ResetWatchdogAOOutputType(taskHandle::TaskHandle, lines::String)
    ccall((:DAQmxResetWatchdogAOOutputType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, lines)
end

function GetWatchdogAOExpirState(taskHandle::TaskHandle, lines::String, data::Real)
    ccall((:DAQmxGetWatchdogAOExpirState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, lines, data)
end

function SetWatchdogAOExpirState(taskHandle::TaskHandle, lines::String, data::Real)
    ccall((:DAQmxSetWatchdogAOExpirState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, lines, data)
end

function ResetWatchdogAOExpirState(taskHandle::TaskHandle, lines::String)
    ccall((:DAQmxResetWatchdogAOExpirState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, lines)
end

function GetWatchdogCOExpirState(taskHandle::TaskHandle, lines::String, data::Integer)
    ccall((:DAQmxGetWatchdogCOExpirState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, lines, data)
end

function SetWatchdogCOExpirState(taskHandle::TaskHandle, lines::String, data::Integer)
    ccall((:DAQmxSetWatchdogCOExpirState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, lines, data)
end

function ResetWatchdogCOExpirState(taskHandle::TaskHandle, lines::String)
    ccall((:DAQmxResetWatchdogCOExpirState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, lines)
end

function GetWatchdogHasExpired(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetWatchdogHasExpired, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteRelativeTo(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetWriteRelativeTo, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetWriteRelativeTo(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetWriteRelativeTo, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetWriteRelativeTo(taskHandle::TaskHandle)
    ccall((:DAQmxResetWriteRelativeTo, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetWriteOffset(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetWriteOffset, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetWriteOffset(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetWriteOffset, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetWriteOffset(taskHandle::TaskHandle)
    ccall((:DAQmxResetWriteOffset, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetWriteRegenMode(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetWriteRegenMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetWriteRegenMode(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetWriteRegenMode, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetWriteRegenMode(taskHandle::TaskHandle)
    ccall((:DAQmxResetWriteRegenMode, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetWriteCurrWritePos(taskHandle::TaskHandle, data::Vector{Culonglong})
    ccall((:DAQmxGetWriteCurrWritePos, :libnidaqmx), Cint, (TaskHandle, Ref{Culonglong}), taskHandle, data)
end

function GetWriteOvercurrentChansExist(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetWriteOvercurrentChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteOvercurrentChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetWriteOvercurrentChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetWriteOvertemperatureChansExist(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetWriteOvertemperatureChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteOvertemperatureChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetWriteOvertemperatureChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetWriteExternalOvervoltageChansExist(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetWriteExternalOvervoltageChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteExternalOvervoltageChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetWriteExternalOvervoltageChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetWriteOverloadedChansExist(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetWriteOverloadedChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteOverloadedChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetWriteOverloadedChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetWriteOpenCurrentLoopChansExist(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetWriteOpenCurrentLoopChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteOpenCurrentLoopChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetWriteOpenCurrentLoopChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetWritePowerSupplyFaultChansExist(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetWritePowerSupplyFaultChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWritePowerSupplyFaultChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetWritePowerSupplyFaultChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetWriteSyncUnlockedChansExist(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetWriteSyncUnlockedChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteSyncUnlockedChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetWriteSyncUnlockedChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetWriteSpaceAvail(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetWriteSpaceAvail, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteTotalSampPerChanGenerated(taskHandle::TaskHandle, data::Vector{Culonglong})
    ccall((:DAQmxGetWriteTotalSampPerChanGenerated, :libnidaqmx), Cint, (TaskHandle, Ref{Culonglong}), taskHandle, data)
end

function GetWriteAccessoryInsertionOrRemovalDetected(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetWriteAccessoryInsertionOrRemovalDetected, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteDevsWithInsertedOrRemovedAccessories(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetWriteDevsWithInsertedOrRemovedAccessories, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetWriteRawDataWidth(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetWriteRawDataWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteNumChans(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetWriteNumChans, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteWaitMode(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetWriteWaitMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetWriteWaitMode(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetWriteWaitMode, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetWriteWaitMode(taskHandle::TaskHandle)
    ccall((:DAQmxResetWriteWaitMode, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetWriteSleepTime(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxGetWriteSleepTime, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetWriteSleepTime(taskHandle::TaskHandle, data::Real)
    ccall((:DAQmxSetWriteSleepTime, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetWriteSleepTime(taskHandle::TaskHandle)
    ccall((:DAQmxResetWriteSleepTime, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetWriteDigitalLinesBytesPerChan(taskHandle::TaskHandle, data::Ref{UInt32})
    ccall((:DAQmxGetWriteDigitalLinesBytesPerChan, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetSampClkTimingResponseMode(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxGetSampClkTimingResponseMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSampClkTimingResponseMode(taskHandle::TaskHandle, data::Integer)
    ccall((:DAQmxSetSampClkTimingResponseMode, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSampClkTimingResponseMode(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkTimingResponseMode, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end
