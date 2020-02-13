
# Task functions

function LoadTask(taskName::String, taskHandle::Ref{TaskHandle})
    ccall((:DAQmxLoadTask, :libnidaqmx), Cint, (Ref{UInt8}, Ref{TaskHandle}), taskName, taskHandle)
end

function CreateTask(taskName::String, taskHandle::Ref{TaskHandle})
    ccall((:DAQmxCreateTask, :libnidaqmx), Cint, (Cstring, Ref{TaskHandle}), taskName, taskHandle)
end

function AddGlobalChansToTask(taskHandle::TaskHandle, channelNames::String)
    ccall((:DAQmxAddGlobalChansToTask, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channelNames)
end

function StartTask(taskHandle::TaskHandle)
    ccall((:DAQmxStartTask, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function StopTask(taskHandle::TaskHandle)
    ccall((:DAQmxStopTask, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function ClearTask(taskHandle::TaskHandle)
    ccall((:DAQmxClearTask, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function WaitUntilTaskDone(taskHandle::TaskHandle, timeToWait::Float64)
    ccall((:DAQmxWaitUntilTaskDone, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, timeToWait)
end

function WaitForValidTimestamp(taskHandle::TaskHandle, timestampEvent::Int32, timeout::Float64, timestamp::Ref{CVIAbsoluteTime})
    ccall((:DAQmxWaitForValidTimestamp, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Ref{CVIAbsoluteTime}), taskHandle, timestampEvent, timeout, timestamp)
end

function IsTaskDone(taskHandle::TaskHandle, isTaskDone::Ref{UInt32})
    ccall((:DAQmxIsTaskDone, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, isTaskDone)
end

function TaskControl(taskHandle::TaskHandle, action::Int32)
    ccall((:DAQmxTaskControl, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, action)
end

function GetNthTaskChannel(taskHandle::TaskHandle, index::UInt32, buffer::Vector{UInt8}, bufferSize::Int32)
    ccall((:DAQmxGetNthTaskChannel, :libnidaqmx), Cint, (TaskHandle, Cuint, Ref{UInt8}, Cint), taskHandle, index, buffer, bufferSize)
end

function GetNthTaskDevice(taskHandle::TaskHandle, index::UInt32, buffer::Vector{UInt8}, bufferSize::Int32)
    ccall((:DAQmxGetNthTaskDevice, :libnidaqmx), Cint, (TaskHandle, Cuint, Ref{UInt8}, Cint), taskHandle, index, buffer, bufferSize)
end

function GetTaskAttribute(taskHandle::TaskHandle, attribute::Int32, value::Ref{Cvoid})
    ccall((:DAQmxGetTaskAttribute, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{Cvoid}), taskHandle, attribute, value)
end

function RegisterEveryNSamplesEvent(task::TaskHandle, everyNsamplesEventType::Int32, nSamples::UInt32, options::UInt32, callbackFunction::EveryNSamplesEventCallbackPtr, callbackData::Ref{Cvoid})
    ccall((:DAQmxRegisterEveryNSamplesEvent, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cuint, EveryNSamplesEventCallbackPtr, Ref{Cvoid}), task, everyNsamplesEventType, nSamples, options, callbackFunction, callbackData)
end

function RegisterDoneEvent(task::TaskHandle, options::UInt32, callbackFunction::DoneEventCallbackPtr, callbackData::Ref{Cvoid})
    ccall((:DAQmxRegisterDoneEvent, :libnidaqmx), Cint, (TaskHandle, Cuint, DoneEventCallbackPtr, Ref{Cvoid}), task, options, callbackFunction, callbackData)
end

function RegisterSignalEvent(task::TaskHandle, signalID::Int32, options::UInt32, callbackFunction::SignalEventCallbackPtr, callbackData::Ref{Cvoid})
    ccall((:DAQmxRegisterSignalEvent, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, SignalEventCallbackPtr, Ref{Cvoid}), task, signalID, options, callbackFunction, callbackData)
end

#### Channel functions ####
# Channel creation

function CreateAIVoltageChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::DAQmxConstant, minVal::Float64, maxVal::Float64, units::DAQmxConstant, customScaleName::String)
    ccall((:DAQmxCreateAIVoltageChan, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring, Cint, Cdouble, Cdouble, Cint, Cstring), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
end

function CreateAICurrentChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Int32, minVal::Float64, maxVal::Float64, units::Int32, shuntResistorLoc::Int32, extShuntResistorVal::Float64, customScaleName::String)
    ccall((:DAQmxCreateAICurrentChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName)
end

function CreateAIVoltageRMSChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Int32, minVal::Float64, maxVal::Float64, units::Int32, customScaleName::String)
    ccall((:DAQmxCreateAIVoltageRMSChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
end

function CreateAICurrentRMSChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Int32, minVal::Float64, maxVal::Float64, units::Int32, shuntResistorLoc::Int32, extShuntResistorVal::Float64, customScaleName::String)
    ccall((:DAQmxCreateAICurrentRMSChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName)
end

function CreateAIThrmcplChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, thermocoupleType::Int32, cjcSource::Int32, cjcVal::Float64, cjcChannel::String)
    ccall((:DAQmxCreateAIThrmcplChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, thermocoupleType, cjcSource, cjcVal, cjcChannel)
end

function CreateAIRTDChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, rtdType::Int32, resistanceConfig::Int32, currentExcitSource::Int32, currentExcitVal::Float64, r0::Float64)
    ccall((:DAQmxCreateAIRTDChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cint, Cdouble, Cdouble), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, rtdType, resistanceConfig, currentExcitSource, currentExcitVal, r0)
end

function CreateAIThrmstrChanIex(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, resistanceConfig::Int32, currentExcitSource::Int32, currentExcitVal::Float64, a::Float64, b::Float64, c::Float64)
    ccall((:DAQmxCreateAIThrmstrChanIex, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Cdouble, Cdouble), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal, a, b, c)
end

function CreateAIThrmstrChanVex(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, resistanceConfig::Int32, voltageExcitSource::Int32, voltageExcitVal::Float64, a::Float64, b::Float64, c::Float64, r1::Float64)
    ccall((:DAQmxCreateAIThrmstrChanVex, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, voltageExcitSource, voltageExcitVal, a, b, c, r1)
end

function CreateAIFreqVoltageChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, thresholdLevel::Float64, hysteresis::Float64, customScaleName::String)
    ccall((:DAQmxCreateAIFreqVoltageChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cdouble, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, thresholdLevel, hysteresis, customScaleName)
end

function CreateAIResistanceChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, resistanceConfig::Int32, currentExcitSource::Int32, currentExcitVal::Float64, customScaleName::String)
    ccall((:DAQmxCreateAIResistanceChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal, customScaleName)
end

function CreateAIStrainGageChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, strainConfig::Int32, voltageExcitSource::Int32, voltageExcitVal::Float64, gageFactor::Float64, initialBridgeVoltage::Float64, nominalGageResistance::Float64, poissonRatio::Float64, leadWireResistance::Float64, customScaleName::String)
    ccall((:DAQmxCreateAIStrainGageChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, strainConfig, voltageExcitSource, voltageExcitVal, gageFactor, initialBridgeVoltage, nominalGageResistance, poissonRatio, leadWireResistance, customScaleName)
end

function CreateAIRosetteStrainGageChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, rosetteType::Int32, gageOrientation::Float64, rosetteMeasTypes::Ref{Int32}, numRosetteMeasTypes::UInt32, strainConfig::Int32, voltageExcitSource::Int32, voltageExcitVal::Float64, gageFactor::Float64, nominalGageResistance::Float64, poissonRatio::Float64, leadWireResistance::Float64)
    ccall((:DAQmxCreateAIRosetteStrainGageChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cdouble, Ref{Cint}, Cuint, Cint, Cint, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, rosetteType, gageOrientation, rosetteMeasTypes, numRosetteMeasTypes, strainConfig, voltageExcitSource, voltageExcitVal, gageFactor, nominalGageResistance, poissonRatio, leadWireResistance)
end

function CreateAIForceBridgeTwoPointLinChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, bridgeConfig::Int32, voltageExcitSource::Int32, voltageExcitVal::Float64, nominalBridgeResistance::Float64, firstElectricalVal::Float64, secondElectricalVal::Float64, electricalUnits::Int32, firstPhysicalVal::Float64, secondPhysicalVal::Float64, physicalUnits::Int32, customScaleName::String)
    ccall((:DAQmxCreateAIForceBridgeTwoPointLinChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Cdouble, Cdouble, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, firstElectricalVal, secondElectricalVal, electricalUnits, firstPhysicalVal, secondPhysicalVal, physicalUnits, customScaleName)
end

function CreateAIForceBridgeTableChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, bridgeConfig::Int32, voltageExcitSource::Int32, voltageExcitVal::Float64, nominalBridgeResistance::Float64, electricalVals::Ref{Cdouble}, numElectricalVals::UInt32, electricalUnits::Int32, physicalVals::Ref{Cdouble}, numPhysicalVals::UInt32, physicalUnits::Int32, customScaleName::String)
    ccall((:DAQmxCreateAIForceBridgeTableChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Ref{Cdouble}, Cuint, Cint, Ref{Cdouble}, Cuint, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, electricalVals, numElectricalVals, electricalUnits, physicalVals, numPhysicalVals, physicalUnits, customScaleName)
end

function CreateAIForceBridgePolynomialChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, bridgeConfig::Int32, voltageExcitSource::Int32, voltageExcitVal::Float64, nominalBridgeResistance::Float64, forwardCoeffs::Ref{Cdouble}, numForwardCoeffs::UInt32, reverseCoeffs::Ref{Cdouble}, numReverseCoeffs::UInt32, electricalUnits::Int32, physicalUnits::Int32, customScaleName::String)
    ccall((:DAQmxCreateAIForceBridgePolynomialChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Ref{Cdouble}, Cuint, Ref{Cdouble}, Cuint, Cint, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, forwardCoeffs, numForwardCoeffs, reverseCoeffs, numReverseCoeffs, electricalUnits, physicalUnits, customScaleName)
end

function CreateAIPressureBridgeTwoPointLinChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, bridgeConfig::Int32, voltageExcitSource::Int32, voltageExcitVal::Float64, nominalBridgeResistance::Float64, firstElectricalVal::Float64, secondElectricalVal::Float64, electricalUnits::Int32, firstPhysicalVal::Float64, secondPhysicalVal::Float64, physicalUnits::Int32, customScaleName::String)
    ccall((:DAQmxCreateAIPressureBridgeTwoPointLinChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Cdouble, Cdouble, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, firstElectricalVal, secondElectricalVal, electricalUnits, firstPhysicalVal, secondPhysicalVal, physicalUnits, customScaleName)
end

function CreateAIPressureBridgeTableChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, bridgeConfig::Int32, voltageExcitSource::Int32, voltageExcitVal::Float64, nominalBridgeResistance::Float64, electricalVals::Ref{Cdouble}, numElectricalVals::UInt32, electricalUnits::Int32, physicalVals::Ref{Cdouble}, numPhysicalVals::UInt32, physicalUnits::Int32, customScaleName::String)
    ccall((:DAQmxCreateAIPressureBridgeTableChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Ref{Cdouble}, Cuint, Cint, Ref{Cdouble}, Cuint, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, electricalVals, numElectricalVals, electricalUnits, physicalVals, numPhysicalVals, physicalUnits, customScaleName)
end

function CreateAIPressureBridgePolynomialChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, bridgeConfig::Int32, voltageExcitSource::Int32, voltageExcitVal::Float64, nominalBridgeResistance::Float64, forwardCoeffs::Ref{Cdouble}, numForwardCoeffs::UInt32, reverseCoeffs::Ref{Cdouble}, numReverseCoeffs::UInt32, electricalUnits::Int32, physicalUnits::Int32, customScaleName::String)
    ccall((:DAQmxCreateAIPressureBridgePolynomialChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Ref{Cdouble}, Cuint, Ref{Cdouble}, Cuint, Cint, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, forwardCoeffs, numForwardCoeffs, reverseCoeffs, numReverseCoeffs, electricalUnits, physicalUnits, customScaleName)
end

function CreateAITorqueBridgeTwoPointLinChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, bridgeConfig::Int32, voltageExcitSource::Int32, voltageExcitVal::Float64, nominalBridgeResistance::Float64, firstElectricalVal::Float64, secondElectricalVal::Float64, electricalUnits::Int32, firstPhysicalVal::Float64, secondPhysicalVal::Float64, physicalUnits::Int32, customScaleName::String)
    ccall((:DAQmxCreateAITorqueBridgeTwoPointLinChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Cdouble, Cdouble, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, firstElectricalVal, secondElectricalVal, electricalUnits, firstPhysicalVal, secondPhysicalVal, physicalUnits, customScaleName)
end

function CreateAITorqueBridgeTableChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, bridgeConfig::Int32, voltageExcitSource::Int32, voltageExcitVal::Float64, nominalBridgeResistance::Float64, electricalVals::Ref{Cdouble}, numElectricalVals::UInt32, electricalUnits::Int32, physicalVals::Ref{Cdouble}, numPhysicalVals::UInt32, physicalUnits::Int32, customScaleName::String)
    ccall((:DAQmxCreateAITorqueBridgeTableChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Ref{Cdouble}, Cuint, Cint, Ref{Cdouble}, Cuint, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, electricalVals, numElectricalVals, electricalUnits, physicalVals, numPhysicalVals, physicalUnits, customScaleName)
end

function CreateAITorqueBridgePolynomialChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, bridgeConfig::Int32, voltageExcitSource::Int32, voltageExcitVal::Float64, nominalBridgeResistance::Float64, forwardCoeffs::Ref{Cdouble}, numForwardCoeffs::UInt32, reverseCoeffs::Ref{Cdouble}, numReverseCoeffs::UInt32, electricalUnits::Int32, physicalUnits::Int32, customScaleName::String)
    ccall((:DAQmxCreateAITorqueBridgePolynomialChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Ref{Cdouble}, Cuint, Ref{Cdouble}, Cuint, Cint, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, forwardCoeffs, numForwardCoeffs, reverseCoeffs, numReverseCoeffs, electricalUnits, physicalUnits, customScaleName)
end

function CreateAIBridgeChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, bridgeConfig::Int32, voltageExcitSource::Int32, voltageExcitVal::Float64, nominalBridgeResistance::Float64, customScaleName::String)
    ccall((:DAQmxCreateAIBridgeChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, customScaleName)
end

function CreateAIVoltageChanWithExcit(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Int32, minVal::Float64, maxVal::Float64, units::Int32, bridgeConfig::Int32, voltageExcitSource::Int32, voltageExcitVal::Float64, useExcitForScaling::UInt32, customScaleName::String)
    ccall((:DAQmxCreateAIVoltageChanWithExcit, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cuint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, useExcitForScaling, customScaleName)
end

function CreateAITempBuiltInSensorChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, units::Int32)
    ccall((:DAQmxCreateAITempBuiltInSensorChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint), taskHandle, physicalChannel, nameToAssignToChannel, units)
end

function CreateAIAccelChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Int32, minVal::Float64, maxVal::Float64, units::Int32, sensitivity::Float64, sensitivityUnits::Int32, currentExcitSource::Int32, currentExcitVal::Float64, customScaleName::String)
    ccall((:DAQmxCreateAIAccelChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, currentExcitSource, currentExcitVal, customScaleName)
end

function CreateAIVelocityIEPEChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Int32, minVal::Float64, maxVal::Float64, units::Int32, sensitivity::Float64, sensitivityUnits::Int32, currentExcitSource::Int32, currentExcitVal::Float64, customScaleName::String)
    ccall((:DAQmxCreateAIVelocityIEPEChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, currentExcitSource, currentExcitVal, customScaleName)
end

function CreateAIForceIEPEChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Int32, minVal::Float64, maxVal::Float64, units::Int32, sensitivity::Float64, sensitivityUnits::Int32, currentExcitSource::Int32, currentExcitVal::Float64, customScaleName::String)
    ccall((:DAQmxCreateAIForceIEPEChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, currentExcitSource, currentExcitVal, customScaleName)
end

function CreateAIMicrophoneChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Int32, units::Int32, micSensitivity::Float64, maxSndPressLevel::Float64, currentExcitSource::Int32, currentExcitVal::Float64, customScaleName::String)
    ccall((:DAQmxCreateAIMicrophoneChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cint, Cdouble, Cdouble, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, units, micSensitivity, maxSndPressLevel, currentExcitSource, currentExcitVal, customScaleName)
end

function CreateAIChargeChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Int32, minVal::Float64, maxVal::Float64, units::Int32, customScaleName::String)
    ccall((:DAQmxCreateAIChargeChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
end

function CreateAIAccelChargeChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Int32, minVal::Float64, maxVal::Float64, units::Int32, sensitivity::Float64, sensitivityUnits::Int32, customScaleName::String)
    ccall((:DAQmxCreateAIAccelChargeChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, customScaleName)
end

function CreateAIAccel4WireDCVoltageChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Int32, minVal::Float64, maxVal::Float64, units::Int32, sensitivity::Float64, sensitivityUnits::Int32, voltageExcitSource::Int32, voltageExcitVal::Float64, useExcitForScaling::UInt32, customScaleName::String)
    ccall((:DAQmxCreateAIAccel4WireDCVoltageChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cdouble, Cint, Cint, Cdouble, Cuint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, voltageExcitSource, voltageExcitVal, useExcitForScaling, customScaleName)
end

function CreateAIPosLVDTChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, sensitivity::Float64, sensitivityUnits::Int32, voltageExcitSource::Int32, voltageExcitVal::Float64, voltageExcitFreq::Float64, ACExcitWireMode::Int32, customScaleName::String)
    ccall((:DAQmxCreateAIPosLVDTChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cdouble, Cint, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, sensitivity, sensitivityUnits, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
end

function CreateAIPosRVDTChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, sensitivity::Float64, sensitivityUnits::Int32, voltageExcitSource::Int32, voltageExcitVal::Float64, voltageExcitFreq::Float64, ACExcitWireMode::Int32, customScaleName::String)
    ccall((:DAQmxCreateAIPosRVDTChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cdouble, Cint, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, sensitivity, sensitivityUnits, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
end

function CreateAIPosEddyCurrProxProbeChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, sensitivity::Float64, sensitivityUnits::Int32, customScaleName::String)
    ccall((:DAQmxCreateAIPosEddyCurrProxProbeChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, sensitivity, sensitivityUnits, customScaleName)
end

function CreateAIDeviceTempChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, units::Int32)
    ccall((:DAQmxCreateAIDeviceTempChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint), taskHandle, physicalChannel, nameToAssignToChannel, units)
end

function CreateTEDSAIVoltageChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Int32, minVal::Float64, maxVal::Float64, units::Int32, customScaleName::String)
    ccall((:DAQmxCreateTEDSAIVoltageChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
end

function CreateTEDSAICurrentChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Int32, minVal::Float64, maxVal::Float64, units::Int32, shuntResistorLoc::Int32, extShuntResistorVal::Float64, customScaleName::String)
    ccall((:DAQmxCreateTEDSAICurrentChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName)
end

function CreateTEDSAIThrmcplChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, cjcSource::Int32, cjcVal::Float64, cjcChannel::String)
    ccall((:DAQmxCreateTEDSAIThrmcplChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, cjcSource, cjcVal, cjcChannel)
end

function CreateTEDSAIRTDChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, resistanceConfig::Int32, currentExcitSource::Int32, currentExcitVal::Float64)
    ccall((:DAQmxCreateTEDSAIRTDChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal)
end

function CreateTEDSAIThrmstrChanIex(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, resistanceConfig::Int32, currentExcitSource::Int32, currentExcitVal::Float64)
    ccall((:DAQmxCreateTEDSAIThrmstrChanIex, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal)
end

function CreateTEDSAIThrmstrChanVex(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, resistanceConfig::Int32, voltageExcitSource::Int32, voltageExcitVal::Float64, r1::Float64)
    ccall((:DAQmxCreateTEDSAIThrmstrChanVex, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, voltageExcitSource, voltageExcitVal, r1)
end

function CreateTEDSAIResistanceChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, resistanceConfig::Int32, currentExcitSource::Int32, currentExcitVal::Float64, customScaleName::String)
    ccall((:DAQmxCreateTEDSAIResistanceChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal, customScaleName)
end

function CreateTEDSAIStrainGageChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, voltageExcitSource::Int32, voltageExcitVal::Float64, initialBridgeVoltage::Float64, leadWireResistance::Float64, customScaleName::String)
    ccall((:DAQmxCreateTEDSAIStrainGageChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cdouble, Cdouble, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, initialBridgeVoltage, leadWireResistance, customScaleName)
end

function CreateTEDSAIForceBridgeChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, voltageExcitSource::Int32, voltageExcitVal::Float64, customScaleName::String)
    ccall((:DAQmxCreateTEDSAIForceBridgeChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
end

function CreateTEDSAIPressureBridgeChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, voltageExcitSource::Int32, voltageExcitVal::Float64, customScaleName::String)
    ccall((:DAQmxCreateTEDSAIPressureBridgeChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
end

function CreateTEDSAITorqueBridgeChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, voltageExcitSource::Int32, voltageExcitVal::Float64, customScaleName::String)
    ccall((:DAQmxCreateTEDSAITorqueBridgeChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
end

function CreateTEDSAIBridgeChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, voltageExcitSource::Int32, voltageExcitVal::Float64, customScaleName::String)
    ccall((:DAQmxCreateTEDSAIBridgeChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
end

function CreateTEDSAIVoltageChanWithExcit(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Int32, minVal::Float64, maxVal::Float64, units::Int32, voltageExcitSource::Int32, voltageExcitVal::Float64, customScaleName::String)
    ccall((:DAQmxCreateTEDSAIVoltageChanWithExcit, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
end

function CreateTEDSAIAccelChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Int32, minVal::Float64, maxVal::Float64, units::Int32, currentExcitSource::Int32, currentExcitVal::Float64, customScaleName::String)
    ccall((:DAQmxCreateTEDSAIAccelChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, currentExcitSource, currentExcitVal, customScaleName)
end

function CreateTEDSAIForceIEPEChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Int32, minVal::Float64, maxVal::Float64, units::Int32, currentExcitSource::Int32, currentExcitVal::Float64, customScaleName::String)
    ccall((:DAQmxCreateTEDSAIForceIEPEChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, currentExcitSource, currentExcitVal, customScaleName)
end

function CreateTEDSAIMicrophoneChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, terminalConfig::Int32, units::Int32, maxSndPressLevel::Float64, currentExcitSource::Int32, currentExcitVal::Float64, customScaleName::String)
    ccall((:DAQmxCreateTEDSAIMicrophoneChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cint, Cdouble, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, units, maxSndPressLevel, currentExcitSource, currentExcitVal, customScaleName)
end

function CreateTEDSAIPosLVDTChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, voltageExcitSource::Int32, voltageExcitVal::Float64, voltageExcitFreq::Float64, ACExcitWireMode::Int32, customScaleName::String)
    ccall((:DAQmxCreateTEDSAIPosLVDTChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
end

function CreateTEDSAIPosRVDTChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, voltageExcitSource::Int32, voltageExcitVal::Float64, voltageExcitFreq::Float64, ACExcitWireMode::Int32, customScaleName::String)
    ccall((:DAQmxCreateTEDSAIPosRVDTChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
end

function CreateAOVoltageChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, customScaleName::String)
    ccall((:DAQmxCreateAOVoltageChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, customScaleName)
end

function CreateAOCurrentChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, customScaleName::String)
    ccall((:DAQmxCreateAOCurrentChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, customScaleName)
end

function CreateAOFuncGenChan(taskHandle::TaskHandle, physicalChannel::String, nameToAssignToChannel::String, type::Int32, freq::Float64, amplitude::Float64, offset::Float64)
    ccall((:DAQmxCreateAOFuncGenChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cdouble), taskHandle, physicalChannel, nameToAssignToChannel, type, freq, amplitude, offset)
end

function CreateDIChan(taskHandle::TaskHandle, lines::String, nameToAssignToLines::String, lineGrouping::Int32)
    ccall((:DAQmxCreateDIChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint), taskHandle, lines, nameToAssignToLines, lineGrouping)
end

function CreateDOChan(taskHandle::TaskHandle, lines::String, nameToAssignToLines::String, lineGrouping::Int32)
    ccall((:DAQmxCreateDOChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint), taskHandle, lines, nameToAssignToLines, lineGrouping)
end

function CreateCIFreqChan(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, edge::Int32, measMethod::Int32, measTime::Float64, divisor::UInt32, customScaleName::String)
    ccall((:DAQmxCreateCIFreqChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cuint, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, edge, measMethod, measTime, divisor, customScaleName)
end

function CreateCIPeriodChan(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, edge::Int32, measMethod::Int32, measTime::Float64, divisor::UInt32, customScaleName::String)
    ccall((:DAQmxCreateCIPeriodChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cuint, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, edge, measMethod, measTime, divisor, customScaleName)
end

function CreateCICountEdgesChan(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, edge::Int32, initialCount::UInt32, countDirection::Int32)
    ccall((:DAQmxCreateCICountEdgesChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cuint, Cint), taskHandle, counter, nameToAssignToChannel, edge, initialCount, countDirection)
end

function CreateCIDutyCycleChan(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, minFreq::Float64, maxFreq::Float64, edge::Int32, customScaleName::String)
    ccall((:DAQmxCreateCIDutyCycleChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, minFreq, maxFreq, edge, customScaleName)
end

function CreateCIPulseWidthChan(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, startingEdge::Int32, customScaleName::String)
    ccall((:DAQmxCreateCIPulseWidthChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, startingEdge, customScaleName)
end

function CreateCISemiPeriodChan(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, customScaleName::String)
    ccall((:DAQmxCreateCISemiPeriodChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, customScaleName)
end

function CreateCITwoEdgeSepChan(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32, firstEdge::Int32, secondEdge::Int32, customScaleName::String)
    ccall((:DAQmxCreateCITwoEdgeSepChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, firstEdge, secondEdge, customScaleName)
end

function CreateCIPulseChanFreq(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32)
    ccall((:DAQmxCreateCIPulseChanFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units)
end

function CreateCIPulseChanTime(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, units::Int32)
    ccall((:DAQmxCreateCIPulseChanTime, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units)
end

function CreateCIPulseChanTicks(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, sourceTerminal::String, minVal::Float64, maxVal::Float64)
    ccall((:DAQmxCreateCIPulseChanTicks, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble), taskHandle, counter, nameToAssignToChannel, sourceTerminal, minVal, maxVal)
end

function CreateCILinEncoderChan(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, decodingType::Int32, ZidxEnable::UInt32, ZidxVal::Float64, ZidxPhase::Int32, units::Int32, distPerPulse::Float64, initialPos::Float64, customScaleName::String)
    ccall((:DAQmxCreateCILinEncoderChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cuint, Cdouble, Cint, Cint, Cdouble, Cdouble, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, decodingType, ZidxEnable, ZidxVal, ZidxPhase, units, distPerPulse, initialPos, customScaleName)
end

function CreateCIAngEncoderChan(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, decodingType::Int32, ZidxEnable::UInt32, ZidxVal::Float64, ZidxPhase::Int32, units::Int32, pulsesPerRev::UInt32, initialAngle::Float64, customScaleName::String)
    ccall((:DAQmxCreateCIAngEncoderChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cuint, Cdouble, Cint, Cint, Cuint, Cdouble, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, decodingType, ZidxEnable, ZidxVal, ZidxPhase, units, pulsesPerRev, initialAngle, customScaleName)
end

function CreateCILinVelocityChan(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, decodingType::Int32, units::Int32, distPerPulse::Float64, customScaleName::String)
    ccall((:DAQmxCreateCILinVelocityChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, decodingType, units, distPerPulse, customScaleName)
end

function CreateCIAngVelocityChan(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, minVal::Float64, maxVal::Float64, decodingType::Int32, units::Int32, pulsesPerRev::UInt32, customScaleName::String)
    ccall((:DAQmxCreateCIAngVelocityChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cuint, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, decodingType, units, pulsesPerRev, customScaleName)
end

function CreateCIGPSTimestampChan(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, units::Int32, syncMethod::Int32, customScaleName::String)
    ccall((:DAQmxCreateCIGPSTimestampChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cint, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, units, syncMethod, customScaleName)
end

function CreateCOPulseChanFreq(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, units::Int32, idleState::Int32, initialDelay::Float64, freq::Float64, dutyCycle::Float64)
    ccall((:DAQmxCreateCOPulseChanFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cint, Cdouble, Cdouble, Cdouble), taskHandle, counter, nameToAssignToChannel, units, idleState, initialDelay, freq, dutyCycle)
end

function CreateCOPulseChanTime(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, units::Int32, idleState::Int32, initialDelay::Float64, lowTime::Float64, highTime::Float64)
    ccall((:DAQmxCreateCOPulseChanTime, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cint, Cdouble, Cdouble, Cdouble), taskHandle, counter, nameToAssignToChannel, units, idleState, initialDelay, lowTime, highTime)
end

function CreateCOPulseChanTicks(taskHandle::TaskHandle, counter::String, nameToAssignToChannel::String, sourceTerminal::String, idleState::Int32, initialDelay::Int32, lowTicks::Int32, highTicks::Int32)
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

function GetChanAttribute(taskHandle::TaskHandle, channel::String, attribute::Int32, value::Ref{Cvoid})
    ccall((:DAQmxGetChanAttribute, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint, Ref{Cvoid}), taskHandle, channel, attribute, value)
end

function SetChanAttribute(taskHandle::TaskHandle, channel::String, attribute::Int32)
    ccall((:DAQmxSetChanAttribute, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, attribute)
end

function ResetChanAttribute(taskHandle::TaskHandle, channel::String, attribute::Int32)
    ccall((:DAQmxResetChanAttribute, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, attribute)
end

function CfgSampClkTiming(taskHandle::TaskHandle, source::String, rate::Float64, activeEdge::Int32, sampleMode::Int32, sampsPerChan::Culonglong)
    ccall((:DAQmxCfgSampClkTiming, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble, Cint, Cint, Culonglong), taskHandle, source, rate, activeEdge, sampleMode, sampsPerChan)
end

function CfgHandshakingTiming(taskHandle::TaskHandle, sampleMode::Int32, sampsPerChan::Culonglong)
    ccall((:DAQmxCfgHandshakingTiming, :libnidaqmx), Cint, (TaskHandle, Cint, Culonglong), taskHandle, sampleMode, sampsPerChan)
end

function CfgBurstHandshakingTimingImportClock(taskHandle::TaskHandle, sampleMode::Int32, sampsPerChan::Culonglong, sampleClkRate::Float64, sampleClkSrc::String, sampleClkActiveEdge::Int32, pauseWhen::Int32, readyEventActiveLevel::Int32)
    ccall((:DAQmxCfgBurstHandshakingTimingImportClock, :libnidaqmx), Cint, (TaskHandle, Cint, Culonglong, Cdouble, Ref{UInt8}, Cint, Cint, Cint), taskHandle, sampleMode, sampsPerChan, sampleClkRate, sampleClkSrc, sampleClkActiveEdge, pauseWhen, readyEventActiveLevel)
end

function CfgBurstHandshakingTimingExportClock(taskHandle::TaskHandle, sampleMode::Int32, sampsPerChan::Culonglong, sampleClkRate::Float64, sampleClkOutpTerm::String, sampleClkPulsePolarity::Int32, pauseWhen::Int32, readyEventActiveLevel::Int32)
    ccall((:DAQmxCfgBurstHandshakingTimingExportClock, :libnidaqmx), Cint, (TaskHandle, Cint, Culonglong, Cdouble, Ref{UInt8}, Cint, Cint, Cint), taskHandle, sampleMode, sampsPerChan, sampleClkRate, sampleClkOutpTerm, sampleClkPulsePolarity, pauseWhen, readyEventActiveLevel)
end

function CfgChangeDetectionTiming(taskHandle::TaskHandle, risingEdgeChan::String, fallingEdgeChan::String, sampleMode::Int32, sampsPerChan::Culonglong)
    ccall((:DAQmxCfgChangeDetectionTiming, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Culonglong), taskHandle, risingEdgeChan, fallingEdgeChan, sampleMode, sampsPerChan)
end

function CfgImplicitTiming(taskHandle::TaskHandle, sampleMode::Int32, sampsPerChan::Culonglong)
    ccall((:DAQmxCfgImplicitTiming, :libnidaqmx), Cint, (TaskHandle, Cint, Culonglong), taskHandle, sampleMode, sampsPerChan)
end

function CfgPipelinedSampClkTiming(taskHandle::TaskHandle, source::String, rate::Float64, activeEdge::Int32, sampleMode::Int32, sampsPerChan::Culonglong)
    ccall((:DAQmxCfgPipelinedSampClkTiming, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble, Cint, Cint, Culonglong), taskHandle, source, rate, activeEdge, sampleMode, sampsPerChan)
end

function GetTimingAttribute(taskHandle::TaskHandle, attribute::Int32, value::Ref{Cvoid})
    ccall((:DAQmxGetTimingAttribute, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{Cvoid}), taskHandle, attribute, value)
end

function SetTimingAttribute(taskHandle::TaskHandle, attribute::Int32)
    ccall((:DAQmxSetTimingAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ResetTimingAttribute(taskHandle::TaskHandle, attribute::Int32)
    ccall((:DAQmxResetTimingAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function GetTimingAttributeEx(taskHandle::TaskHandle, deviceNames::String, attribute::Int32, value::Ref{Cvoid})
    ccall((:DAQmxGetTimingAttributeEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint, Ref{Cvoid}), taskHandle, deviceNames, attribute, value)
end

function SetTimingAttributeEx(taskHandle::TaskHandle, deviceNames::String, attribute::Int32)
    ccall((:DAQmxSetTimingAttributeEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, deviceNames, attribute)
end

function ResetTimingAttributeEx(taskHandle::TaskHandle, deviceNames::String, attribute::Int32)
    ccall((:DAQmxResetTimingAttributeEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, deviceNames, attribute)
end

function DisableStartTrig(taskHandle::TaskHandle)
    ccall((:DAQmxDisableStartTrig, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function CfgDigEdgeStartTrig(taskHandle::TaskHandle, triggerSource::String, triggerEdge::Int32)
    ccall((:DAQmxCfgDigEdgeStartTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, triggerSource, triggerEdge)
end

function CfgAnlgEdgeStartTrig(taskHandle::TaskHandle, triggerSource::String, triggerSlope::Int32, triggerLevel::Float64)
    ccall((:DAQmxCfgAnlgEdgeStartTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint, Cdouble), taskHandle, triggerSource, triggerSlope, triggerLevel)
end

function CfgAnlgMultiEdgeStartTrig(taskHandle::TaskHandle, triggerSources::String, triggerSlopeArray::Ref{Int32}, triggerLevelArray::Ref{Cdouble}, arraySize::UInt32)
    ccall((:DAQmxCfgAnlgMultiEdgeStartTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}, Ref{Cdouble}, Cuint), taskHandle, triggerSources, triggerSlopeArray, triggerLevelArray, arraySize)
end

function CfgAnlgWindowStartTrig(taskHandle::TaskHandle, triggerSource::String, triggerWhen::Int32, windowTop::Float64, windowBottom::Float64)
    ccall((:DAQmxCfgAnlgWindowStartTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint, Cdouble, Cdouble), taskHandle, triggerSource, triggerWhen, windowTop, windowBottom)
end

function CfgTimeStartTrig(taskHandle::TaskHandle, when::CVIAbsoluteTime, timescale::Int32)
    ccall((:DAQmxCfgTimeStartTrig, :libnidaqmx), Cint, (TaskHandle, CVIAbsoluteTime, Cint), taskHandle, when, timescale)
end

function CfgDigPatternStartTrig(taskHandle::TaskHandle, triggerSource::String, triggerPattern::String, triggerWhen::Int32)
    ccall((:DAQmxCfgDigPatternStartTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint), taskHandle, triggerSource, triggerPattern, triggerWhen)
end

function DisableRefTrig(taskHandle::TaskHandle)
    ccall((:DAQmxDisableRefTrig, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function CfgDigEdgeRefTrig(taskHandle::TaskHandle, triggerSource::String, triggerEdge::Int32, pretriggerSamples::UInt32)
    ccall((:DAQmxCfgDigEdgeRefTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint, Cuint), taskHandle, triggerSource, triggerEdge, pretriggerSamples)
end

function CfgAnlgEdgeRefTrig(taskHandle::TaskHandle, triggerSource::String, triggerSlope::Int32, triggerLevel::Float64, pretriggerSamples::UInt32)
    ccall((:DAQmxCfgAnlgEdgeRefTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint, Cdouble, Cuint), taskHandle, triggerSource, triggerSlope, triggerLevel, pretriggerSamples)
end

function CfgAnlgMultiEdgeRefTrig(taskHandle::TaskHandle, triggerSources::String, triggerSlopeArray::Ref{Int32}, triggerLevelArray::Ref{Cdouble}, pretriggerSamples::UInt32, arraySize::UInt32)
    ccall((:DAQmxCfgAnlgMultiEdgeRefTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}, Ref{Cdouble}, Cuint, Cuint), taskHandle, triggerSources, triggerSlopeArray, triggerLevelArray, pretriggerSamples, arraySize)
end

function CfgAnlgWindowRefTrig(taskHandle::TaskHandle, triggerSource::String, triggerWhen::Int32, windowTop::Float64, windowBottom::Float64, pretriggerSamples::UInt32)
    ccall((:DAQmxCfgAnlgWindowRefTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint, Cdouble, Cdouble, Cuint), taskHandle, triggerSource, triggerWhen, windowTop, windowBottom, pretriggerSamples)
end

function CfgDigPatternRefTrig(taskHandle::TaskHandle, triggerSource::String, triggerPattern::String, triggerWhen::Int32, pretriggerSamples::UInt32)
    ccall((:DAQmxCfgDigPatternRefTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cuint), taskHandle, triggerSource, triggerPattern, triggerWhen, pretriggerSamples)
end

function GetTrigAttribute(taskHandle::TaskHandle, attribute::Int32, value::Ref{Cvoid})
    ccall((:DAQmxGetTrigAttribute, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{Cvoid}), taskHandle, attribute, value)
end

function SetTrigAttribute(taskHandle::TaskHandle, attribute::Int32)
    ccall((:DAQmxSetTrigAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ResetTrigAttribute(taskHandle::TaskHandle, attribute::Int32)
    ccall((:DAQmxResetTrigAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ReadAnalogF64(taskHandle::TaskHandle, numSampsPerChan::Int32, timeout::Float64, fillMode::UInt32, readArray::Ref{Cdouble}, arraySizeInSamps::UInt32, sampsPerChanRead::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxReadAnalogF64, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cdouble}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadAnalogScalarF64(taskHandle::TaskHandle, timeout::Float64, value::Ref{Cdouble}, reserved::Ref{UInt32})
    ccall((:DAQmxReadAnalogScalarF64, :libnidaqmx), Cint, (TaskHandle, Cdouble, Ref{Cdouble}, Ref{Cuint}), taskHandle, timeout, value, reserved)
end

function ReadBinaryI16(taskHandle::TaskHandle, numSampsPerChan::Int32, timeout::Float64, fillMode::UInt32, readArray::Ref{Cshort}, arraySizeInSamps::UInt32, sampsPerChanRead::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxReadBinaryI16, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cshort}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadBinaryU16(taskHandle::TaskHandle, numSampsPerChan::Int32, timeout::Float64, fillMode::UInt32, readArray::Ref{Cushort}, arraySizeInSamps::UInt32, sampsPerChanRead::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxReadBinaryU16, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cushort}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadBinaryI32(taskHandle::TaskHandle, numSampsPerChan::Int32, timeout::Float64, fillMode::UInt32, readArray::Ref{Int32}, arraySizeInSamps::UInt32, sampsPerChanRead::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxReadBinaryI32, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cint}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadBinaryU32(taskHandle::TaskHandle, numSampsPerChan::Int32, timeout::Float64, fillMode::UInt32, readArray::Ref{UInt32}, arraySizeInSamps::UInt32, sampsPerChanRead::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxReadBinaryU32, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cuint}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadDigitalU8(taskHandle::TaskHandle, numSampsPerChan::Int32, timeout::Float64, fillMode::UInt32, readArray::Ref{Cuchar}, arraySizeInSamps::UInt32, sampsPerChanRead::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxReadDigitalU8, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cuchar}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadDigitalU16(taskHandle::TaskHandle, numSampsPerChan::Int32, timeout::Float64, fillMode::UInt32, readArray::Ref{Cushort}, arraySizeInSamps::UInt32, sampsPerChanRead::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxReadDigitalU16, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cushort}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadDigitalU32(taskHandle::TaskHandle, numSampsPerChan::Int32, timeout::Float64, fillMode::UInt32, readArray::Ref{UInt32}, arraySizeInSamps::UInt32, sampsPerChanRead::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxReadDigitalU32, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cuint}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadDigitalScalarU32(taskHandle::TaskHandle, timeout::Float64, value::Ref{UInt32}, reserved::Ref{UInt32})
    ccall((:DAQmxReadDigitalScalarU32, :libnidaqmx), Cint, (TaskHandle, Cdouble, Ref{Cuint}, Ref{Cuint}), taskHandle, timeout, value, reserved)
end

function ReadDigitalLines(taskHandle::TaskHandle, numSampsPerChan::Int32, timeout::Float64, fillMode::UInt32, readArray::Ref{Cuchar}, arraySizeInBytes::UInt32, sampsPerChanRead::Ref{Int32}, numBytesPerSamp::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxReadDigitalLines, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cuchar}, Cuint, Ref{Cint}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInBytes, sampsPerChanRead, numBytesPerSamp, reserved)
end

function ReadCounterF64(taskHandle::TaskHandle, numSampsPerChan::Int32, timeout::Float64, readArray::Ref{Cdouble}, arraySizeInSamps::UInt32, sampsPerChanRead::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxReadCounterF64, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Ref{Cdouble}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadCounterU32(taskHandle::TaskHandle, numSampsPerChan::Int32, timeout::Float64, readArray::Ref{UInt32}, arraySizeInSamps::UInt32, sampsPerChanRead::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxReadCounterU32, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Ref{Cuint}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadCounterF64Ex(taskHandle::TaskHandle, numSampsPerChan::Int32, timeout::Float64, fillMode::UInt32, readArray::Ref{Cdouble}, arraySizeInSamps::UInt32, sampsPerChanRead::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxReadCounterF64Ex, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cdouble}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadCounterU32Ex(taskHandle::TaskHandle, numSampsPerChan::Int32, timeout::Float64, fillMode::UInt32, readArray::Ref{UInt32}, arraySizeInSamps::UInt32, sampsPerChanRead::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxReadCounterU32Ex, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cuint}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadCounterScalarF64(taskHandle::TaskHandle, timeout::Float64, value::Ref{Cdouble}, reserved::Ref{UInt32})
    ccall((:DAQmxReadCounterScalarF64, :libnidaqmx), Cint, (TaskHandle, Cdouble, Ref{Cdouble}, Ref{Cuint}), taskHandle, timeout, value, reserved)
end

function ReadCounterScalarU32(taskHandle::TaskHandle, timeout::Float64, value::Ref{UInt32}, reserved::Ref{UInt32})
    ccall((:DAQmxReadCounterScalarU32, :libnidaqmx), Cint, (TaskHandle, Cdouble, Ref{Cuint}, Ref{Cuint}), taskHandle, timeout, value, reserved)
end

function ReadCtrFreq(taskHandle::TaskHandle, numSampsPerChan::Int32, timeout::Float64, interleaved::UInt32, readArrayFrequency::Ref{Cdouble}, readArrayDutyCycle::Ref{Cdouble}, arraySizeInSamps::UInt32, sampsPerChanRead::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxReadCtrFreq, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cdouble}, Ref{Cdouble}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, interleaved, readArrayFrequency, readArrayDutyCycle, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadCtrTime(taskHandle::TaskHandle, numSampsPerChan::Int32, timeout::Float64, interleaved::UInt32, readArrayHighTime::Ref{Cdouble}, readArrayLowTime::Ref{Cdouble}, arraySizeInSamps::UInt32, sampsPerChanRead::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxReadCtrTime, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cdouble}, Ref{Cdouble}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, interleaved, readArrayHighTime, readArrayLowTime, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadCtrTicks(taskHandle::TaskHandle, numSampsPerChan::Int32, timeout::Float64, interleaved::UInt32, readArrayHighTicks::Ref{UInt32}, readArrayLowTicks::Ref{UInt32}, arraySizeInSamps::UInt32, sampsPerChanRead::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxReadCtrTicks, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cuint}, Ref{Cuint}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, interleaved, readArrayHighTicks, readArrayLowTicks, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadCtrFreqScalar(taskHandle::TaskHandle, timeout::Float64, frequency::Ref{Cdouble}, dutyCycle::Ref{Cdouble}, reserved::Ref{UInt32})
    ccall((:DAQmxReadCtrFreqScalar, :libnidaqmx), Cint, (TaskHandle, Cdouble, Ref{Cdouble}, Ref{Cdouble}, Ref{Cuint}), taskHandle, timeout, frequency, dutyCycle, reserved)
end

function ReadCtrTimeScalar(taskHandle::TaskHandle, timeout::Float64, highTime::Ref{Cdouble}, lowTime::Ref{Cdouble}, reserved::Ref{UInt32})
    ccall((:DAQmxReadCtrTimeScalar, :libnidaqmx), Cint, (TaskHandle, Cdouble, Ref{Cdouble}, Ref{Cdouble}, Ref{Cuint}), taskHandle, timeout, highTime, lowTime, reserved)
end

function ReadCtrTicksScalar(taskHandle::TaskHandle, timeout::Float64, highTicks::Ref{UInt32}, lowTicks::Ref{UInt32}, reserved::Ref{UInt32})
    ccall((:DAQmxReadCtrTicksScalar, :libnidaqmx), Cint, (TaskHandle, Cdouble, Ref{Cuint}, Ref{Cuint}, Ref{Cuint}), taskHandle, timeout, highTicks, lowTicks, reserved)
end

function ReadRaw(taskHandle::TaskHandle, numSampsPerChan::Int32, timeout::Float64, readArray::Ref{Cvoid}, arraySizeInBytes::UInt32, sampsRead::Ref{Int32}, numBytesPerSamp::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxReadRaw, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Ref{Cvoid}, Cuint, Ref{Cint}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, readArray, arraySizeInBytes, sampsRead, numBytesPerSamp, reserved)
end

function GetNthTaskReadChannel(taskHandle::TaskHandle, index::UInt32, buffer::Vector{UInt8}, bufferSize::Int32)
    ccall((:DAQmxGetNthTaskReadChannel, :libnidaqmx), Cint, (TaskHandle, Cuint, Ref{UInt8}, Cint), taskHandle, index, buffer, bufferSize)
end

function GetReadAttribute(taskHandle::TaskHandle, attribute::Int32, value::Ref{Cvoid})
    ccall((:DAQmxGetReadAttribute, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{Cvoid}), taskHandle, attribute, value)
end

function SetReadAttribute(taskHandle::TaskHandle, attribute::Int32)
    ccall((:DAQmxSetReadAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ResetReadAttribute(taskHandle::TaskHandle, attribute::Int32)
    ccall((:DAQmxResetReadAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ConfigureLogging(taskHandle::TaskHandle, filePath::String, loggingMode::Int32, groupName::String, operation::Int32)
    ccall((:DAQmxConfigureLogging, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint, Ref{UInt8}, Cint), taskHandle, filePath, loggingMode, groupName, operation)
end

function StartNewFile(taskHandle::TaskHandle, filePath::String)
    ccall((:DAQmxStartNewFile, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, filePath)
end

function WriteAnalogF64(taskHandle::TaskHandle, numSampsPerChan::Int32, autoStart::UInt32, timeout::Float64, dataLayout::UInt32, writeArray::Ref{Cdouble}, sampsPerChanWritten::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxWriteAnalogF64, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cdouble}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function WriteAnalogScalarF64(taskHandle::TaskHandle, autoStart::UInt32, timeout::Float64, value::Float64, reserved::Ref{UInt32})
    ccall((:DAQmxWriteAnalogScalarF64, :libnidaqmx), Cint, (TaskHandle, Cuint, Cdouble, Cdouble, Ref{Cuint}), taskHandle, autoStart, timeout, value, reserved)
end

function WriteBinaryI16(taskHandle::TaskHandle, numSampsPerChan::Int32, autoStart::UInt32, timeout::Float64, dataLayout::UInt32, writeArray::Ref{Cshort}, sampsPerChanWritten::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxWriteBinaryI16, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cshort}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function WriteBinaryU16(taskHandle::TaskHandle, numSampsPerChan::Int32, autoStart::UInt32, timeout::Float64, dataLayout::UInt32, writeArray::Ref{Cushort}, sampsPerChanWritten::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxWriteBinaryU16, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cushort}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function WriteBinaryI32(taskHandle::TaskHandle, numSampsPerChan::Int32, autoStart::UInt32, timeout::Float64, dataLayout::UInt32, writeArray::Ref{Int32}, sampsPerChanWritten::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxWriteBinaryI32, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cint}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function WriteBinaryU32(taskHandle::TaskHandle, numSampsPerChan::Int32, autoStart::UInt32, timeout::Float64, dataLayout::UInt32, writeArray::Ref{UInt32}, sampsPerChanWritten::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxWriteBinaryU32, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cuint}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function WriteDigitalU8(taskHandle::TaskHandle, numSampsPerChan::Int32, autoStart::UInt32, timeout::Float64, dataLayout::UInt32, writeArray::Ref{Cuchar}, sampsPerChanWritten::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxWriteDigitalU8, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cuchar}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function WriteDigitalU16(taskHandle::TaskHandle, numSampsPerChan::Int32, autoStart::UInt32, timeout::Float64, dataLayout::UInt32, writeArray::Ref{Cushort}, sampsPerChanWritten::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxWriteDigitalU16, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cushort}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function WriteDigitalU32(taskHandle::TaskHandle, numSampsPerChan::Int32, autoStart::UInt32, timeout::Float64, dataLayout::UInt32, writeArray::Ref{UInt32}, sampsPerChanWritten::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxWriteDigitalU32, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cuint}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function WriteDigitalScalarU32(taskHandle::TaskHandle, autoStart::UInt32, timeout::Float64, value::UInt32, reserved::Ref{UInt32})
    ccall((:DAQmxWriteDigitalScalarU32, :libnidaqmx), Cint, (TaskHandle, Cuint, Cdouble, Cuint, Ref{Cuint}), taskHandle, autoStart, timeout, value, reserved)
end

function WriteDigitalLines(taskHandle::TaskHandle, numSampsPerChan::Int32, autoStart::UInt32, timeout::Float64, dataLayout::UInt32, writeArray::Ref{Cuchar}, sampsPerChanWritten::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxWriteDigitalLines, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cuchar}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function WriteCtrFreq(taskHandle::TaskHandle, numSampsPerChan::Int32, autoStart::UInt32, timeout::Float64, dataLayout::UInt32, frequency::Ref{Cdouble}, dutyCycle::Ref{Cdouble}, numSampsPerChanWritten::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxWriteCtrFreq, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cdouble}, Ref{Cdouble}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, frequency, dutyCycle, numSampsPerChanWritten, reserved)
end

function WriteCtrFreqScalar(taskHandle::TaskHandle, autoStart::UInt32, timeout::Float64, frequency::Float64, dutyCycle::Float64, reserved::Ref{UInt32})
    ccall((:DAQmxWriteCtrFreqScalar, :libnidaqmx), Cint, (TaskHandle, Cuint, Cdouble, Cdouble, Cdouble, Ref{Cuint}), taskHandle, autoStart, timeout, frequency, dutyCycle, reserved)
end

function WriteCtrTime(taskHandle::TaskHandle, numSampsPerChan::Int32, autoStart::UInt32, timeout::Float64, dataLayout::UInt32, highTime::Ref{Cdouble}, lowTime::Ref{Cdouble}, numSampsPerChanWritten::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxWriteCtrTime, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cdouble}, Ref{Cdouble}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, highTime, lowTime, numSampsPerChanWritten, reserved)
end

function WriteCtrTimeScalar(taskHandle::TaskHandle, autoStart::UInt32, timeout::Float64, highTime::Float64, lowTime::Float64, reserved::Ref{UInt32})
    ccall((:DAQmxWriteCtrTimeScalar, :libnidaqmx), Cint, (TaskHandle, Cuint, Cdouble, Cdouble, Cdouble, Ref{Cuint}), taskHandle, autoStart, timeout, highTime, lowTime, reserved)
end

function WriteCtrTicks(taskHandle::TaskHandle, numSampsPerChan::Int32, autoStart::UInt32, timeout::Float64, dataLayout::UInt32, highTicks::Ref{UInt32}, lowTicks::Ref{UInt32}, numSampsPerChanWritten::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxWriteCtrTicks, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cuint}, Ref{Cuint}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, highTicks, lowTicks, numSampsPerChanWritten, reserved)
end

function WriteCtrTicksScalar(taskHandle::TaskHandle, autoStart::UInt32, timeout::Float64, highTicks::UInt32, lowTicks::UInt32, reserved::Ref{UInt32})
    ccall((:DAQmxWriteCtrTicksScalar, :libnidaqmx), Cint, (TaskHandle, Cuint, Cdouble, Cuint, Cuint, Ref{Cuint}), taskHandle, autoStart, timeout, highTicks, lowTicks, reserved)
end

function WriteRaw(taskHandle::TaskHandle, numSamps::Int32, autoStart::UInt32, timeout::Float64, writeArray::Ref{Cvoid}, sampsPerChanWritten::Ref{Int32}, reserved::Ref{UInt32})
    ccall((:DAQmxWriteRaw, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Ref{Cvoid}, Ref{Cint}, Ref{Cuint}), taskHandle, numSamps, autoStart, timeout, writeArray, sampsPerChanWritten, reserved)
end

function GetWriteAttribute(taskHandle::TaskHandle, attribute::Int32, value::Ref{Cvoid})
    ccall((:DAQmxGetWriteAttribute, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{Cvoid}), taskHandle, attribute, value)
end

function SetWriteAttribute(taskHandle::TaskHandle, attribute::Int32)
    ccall((:DAQmxSetWriteAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ResetWriteAttribute(taskHandle::TaskHandle, attribute::Int32)
    ccall((:DAQmxResetWriteAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ExportSignal(taskHandle::TaskHandle, signalID::Int32, outputTerminal::String)
    ccall((:DAQmxExportSignal, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{UInt8}), taskHandle, signalID, outputTerminal)
end

function GetExportedSignalAttribute(taskHandle::TaskHandle, attribute::Int32, value::Ref{Cvoid})
    ccall((:DAQmxGetExportedSignalAttribute, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{Cvoid}), taskHandle, attribute, value)
end

function SetExportedSignalAttribute(taskHandle::TaskHandle, attribute::Int32)
    ccall((:DAQmxSetExportedSignalAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ResetExportedSignalAttribute(taskHandle::TaskHandle, attribute::Int32)
    ccall((:DAQmxResetExportedSignalAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function CreateLinScale(name::String, slope::Float64, yIntercept::Float64, preScaledUnits::Int32, scaledUnits::String)
    ccall((:DAQmxCreateLinScale, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble, Cdouble, Cint, Ref{UInt8}), name, slope, yIntercept, preScaledUnits, scaledUnits)
end

function CreateMapScale(name::String, prescaledMin::Float64, prescaledMax::Float64, scaledMin::Float64, scaledMax::Float64, preScaledUnits::Int32, scaledUnits::String)
    ccall((:DAQmxCreateMapScale, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble, Cdouble, Cdouble, Cdouble, Cint, Ref{UInt8}), name, prescaledMin, prescaledMax, scaledMin, scaledMax, preScaledUnits, scaledUnits)
end

function CreatePolynomialScale(name::String, forwardCoeffs::Ref{Cdouble}, numForwardCoeffsIn::UInt32, reverseCoeffs::Ref{Cdouble}, numReverseCoeffsIn::UInt32, preScaledUnits::Int32, scaledUnits::String)
    ccall((:DAQmxCreatePolynomialScale, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint, Ref{Cdouble}, Cuint, Cint, Ref{UInt8}), name, forwardCoeffs, numForwardCoeffsIn, reverseCoeffs, numReverseCoeffsIn, preScaledUnits, scaledUnits)
end

function CreateTableScale(name::String, prescaledVals::Ref{Cdouble}, numPrescaledValsIn::UInt32, scaledVals::Ref{Cdouble}, numScaledValsIn::UInt32, preScaledUnits::Int32, scaledUnits::String)
    ccall((:DAQmxCreateTableScale, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint, Ref{Cdouble}, Cuint, Cint, Ref{UInt8}), name, prescaledVals, numPrescaledValsIn, scaledVals, numScaledValsIn, preScaledUnits, scaledUnits)
end

function CalculateReversePolyCoeff(forwardCoeffs::Ref{Cdouble}, numForwardCoeffsIn::UInt32, minValX::Float64, maxValX::Float64, numPointsToCompute::Int32, reversePolyOrder::Int32, reverseCoeffs::Ref{Cdouble})
    ccall((:DAQmxCalculateReversePolyCoeff, :libnidaqmx), Cint, (Ref{Cdouble}, Cuint, Cdouble, Cdouble, Cint, Cint, Ref{Cdouble}), forwardCoeffs, numForwardCoeffsIn, minValX, maxValX, numPointsToCompute, reversePolyOrder, reverseCoeffs)
end

function GetScaleAttribute(scaleName::String, attribute::Int32, value::Ref{Cvoid})
    ccall((:DAQmxGetScaleAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint, Ref{Cvoid}), scaleName, attribute, value)
end

function SetScaleAttribute(scaleName::String, attribute::Int32)
    ccall((:DAQmxSetScaleAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint), scaleName, attribute)
end

function CfgInputBuffer(taskHandle::TaskHandle, numSampsPerChan::UInt32)
    ccall((:DAQmxCfgInputBuffer, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, numSampsPerChan)
end

function CfgOutputBuffer(taskHandle::TaskHandle, numSampsPerChan::UInt32)
    ccall((:DAQmxCfgOutputBuffer, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, numSampsPerChan)
end

function GetBufferAttribute(taskHandle::TaskHandle, attribute::Int32, value::Ref{Cvoid})
    ccall((:DAQmxGetBufferAttribute, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{Cvoid}), taskHandle, attribute, value)
end

function SetBufferAttribute(taskHandle::TaskHandle, attribute::Int32)
    ccall((:DAQmxSetBufferAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ResetBufferAttribute(taskHandle::TaskHandle, attribute::Int32)
    ccall((:DAQmxResetBufferAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

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

function GetSwitchChanAttribute(switchChannelName::String, attribute::Int32, value::Ref{Cvoid})
    ccall((:DAQmxGetSwitchChanAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint, Ref{Cvoid}), switchChannelName, attribute, value)
end

function SetSwitchChanAttribute(switchChannelName::String, attribute::Int32)
    ccall((:DAQmxSetSwitchChanAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint), switchChannelName, attribute)
end

function GetSwitchDeviceAttribute(deviceName::String, attribute::Int32, value::Ref{Cvoid})
    ccall((:DAQmxGetSwitchDeviceAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint, Ref{Cvoid}), deviceName, attribute, value)
end

function SetSwitchDeviceAttribute(deviceName::String, attribute::Int32)
    ccall((:DAQmxSetSwitchDeviceAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint), deviceName, attribute)
end

function GetSwitchScanAttribute(taskHandle::TaskHandle, attribute::Int32, value::Ref{Cvoid})
    ccall((:DAQmxGetSwitchScanAttribute, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{Cvoid}), taskHandle, attribute, value)
end

function SetSwitchScanAttribute(taskHandle::TaskHandle, attribute::Int32)
    ccall((:DAQmxSetSwitchScanAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ResetSwitchScanAttribute(taskHandle::TaskHandle, attribute::Int32)
    ccall((:DAQmxResetSwitchScanAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function DisableAdvTrig(taskHandle::TaskHandle)
    ccall((:DAQmxDisableAdvTrig, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function CfgDigEdgeAdvTrig(taskHandle::TaskHandle, triggerSource::String, triggerEdge::Int32)
    ccall((:DAQmxCfgDigEdgeAdvTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, triggerSource, triggerEdge)
end

function SendSoftwareTrigger(taskHandle::TaskHandle, triggerID::Int32)
    ccall((:DAQmxSendSoftwareTrigger, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, triggerID)
end

function ConnectTerms(sourceTerminal::String, destinationTerminal::String, signalModifiers::Int32)
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

function GetDeviceAttribute(deviceName::String, attribute::Int32, value::Ref{Cvoid})
    ccall((:DAQmxGetDeviceAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint, Ref{Cvoid}), deviceName, attribute, value)
end

function CreateWatchdogTimerTask(deviceName::String, taskName::String, taskHandle::Ref{TaskHandle}, timeout::Float64, lines::String, expState::Int32)
    ccall((:DAQmxCreateWatchdogTimerTask, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Ref{TaskHandle}, Cdouble, Ref{UInt8}, Cint), deviceName, taskName, taskHandle, timeout, lines, expState)
end

function CreateWatchdogTimerTaskEx(deviceName::String, taskName::String, taskHandle::Ref{TaskHandle}, timeout::Float64)
    ccall((:DAQmxCreateWatchdogTimerTaskEx, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Ref{TaskHandle}, Cdouble), deviceName, taskName, taskHandle, timeout)
end

function ControlWatchdogTask(taskHandle::TaskHandle, action::Int32)
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

function GetWatchdogAttribute(taskHandle::TaskHandle, lines::String, attribute::Int32, value::Ref{Cvoid})
    ccall((:DAQmxGetWatchdogAttribute, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint, Ref{Cvoid}), taskHandle, lines, attribute, value)
end

function SetWatchdogAttribute(taskHandle::TaskHandle, lines::String, attribute::Int32)
    ccall((:DAQmxSetWatchdogAttribute, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, lines, attribute)
end

function ResetWatchdogAttribute(taskHandle::TaskHandle, lines::String, attribute::Int32)
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

function PerformStrainShuntCal(taskHandle::TaskHandle, channel::String, shuntResistorValue::Float64, shuntResistorLocation::Int32, skipUnsupportedChannels::UInt32)
    ccall((:DAQmxPerformStrainShuntCal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble, Cint, Cuint), taskHandle, channel, shuntResistorValue, shuntResistorLocation, skipUnsupportedChannels)
end

function PerformStrainShuntCalEx(taskHandle::TaskHandle, channel::String, shuntResistorValue::Float64, shuntResistorLocation::Int32, shuntResistorSelect::Int32, shuntResistorSource::Int32, skipUnsupportedChannels::UInt32)
    ccall((:DAQmxPerformStrainShuntCalEx, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble, Cint, Cint, Cint, Cuint), taskHandle, channel, shuntResistorValue, shuntResistorLocation, shuntResistorSelect, shuntResistorSource, skipUnsupportedChannels)
end

function PerformBridgeShuntCal(taskHandle::TaskHandle, channel::String, shuntResistorValue::Float64, shuntResistorLocation::Int32, bridgeResistance::Float64, skipUnsupportedChannels::UInt32)
    ccall((:DAQmxPerformBridgeShuntCal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble, Cint, Cdouble, Cuint), taskHandle, channel, shuntResistorValue, shuntResistorLocation, bridgeResistance, skipUnsupportedChannels)
end

function PerformBridgeShuntCalEx(taskHandle::TaskHandle, channel::String, shuntResistorValue::Float64, shuntResistorLocation::Int32, shuntResistorSelect::Int32, shuntResistorSource::Int32, bridgeResistance::Float64, skipUnsupportedChannels::UInt32)
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

function ESeriesCalAdjust(calHandle::CalHandle, referenceVoltage::Float64)
    ccall((:DAQmxESeriesCalAdjust, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, referenceVoltage)
end

function MSeriesCalAdjust(calHandle::CalHandle, referenceVoltage::Float64)
    ccall((:DAQmxMSeriesCalAdjust, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, referenceVoltage)
end

function SSeriesCalAdjust(calHandle::CalHandle, referenceVoltage::Float64)
    ccall((:DAQmxSSeriesCalAdjust, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, referenceVoltage)
end

function SCBaseboardCalAdjust(calHandle::CalHandle, referenceVoltage::Float64)
    ccall((:DAQmxSCBaseboardCalAdjust, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, referenceVoltage)
end

function AOSeriesCalAdjust(calHandle::CalHandle, referenceVoltage::Float64)
    ccall((:DAQmxAOSeriesCalAdjust, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, referenceVoltage)
end

function XSeriesCalAdjust(calHandle::CalHandle, referenceVoltage::Float64)
    ccall((:DAQmxXSeriesCalAdjust, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, referenceVoltage)
end

function DeviceSupportsCal(deviceName::String, calSupported::Ref{UInt32})
    ccall((:DAQmxDeviceSupportsCal, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, calSupported)
end

function GetCalInfoAttribute(deviceName::String, attribute::Int32, value::Ref{Cvoid})
    ccall((:DAQmxGetCalInfoAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint, Ref{Cvoid}), deviceName, attribute, value)
end

function SetCalInfoAttribute(deviceName::String, attribute::Int32)
    ccall((:DAQmxSetCalInfoAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint), deviceName, attribute)
end

function InitExtCal(deviceName::String, password::String, calHandle::Ref{CalHandle})
    ccall((:DAQmxInitExtCal, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Ref{CalHandle}), deviceName, password, calHandle)
end

function CloseExtCal(calHandle::CalHandle, action::Int32)
    ccall((:DAQmxCloseExtCal, :libnidaqmx), Cint, (CalHandle, Cint), calHandle, action)
end

function ChangeExtCalPassword(deviceName::String, password::String, newPassword::String)
    ccall((:DAQmxChangeExtCalPassword, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Ref{UInt8}), deviceName, password, newPassword)
end

function DSASetCalTemp(calHandle::CalHandle, temperature::Float64)
    ccall((:DAQmxDSASetCalTemp, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, temperature)
end

function AdjustDSAAICal(calHandle::CalHandle, referenceVoltage::Float64)
    ccall((:DAQmxAdjustDSAAICal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, referenceVoltage)
end

function AdjustDSAAICalEx(calHandle::CalHandle, referenceVoltage::Float64, inputsShorted::UInt32)
    ccall((:DAQmxAdjustDSAAICalEx, :libnidaqmx), Cint, (CalHandle, Cdouble, Cuint), calHandle, referenceVoltage, inputsShorted)
end

function AdjustDSAAICalWithGainAndCoupling(calHandle::CalHandle, coupling::Int32, gain::Float64, referenceVoltage::Float64)
    ccall((:DAQmxAdjustDSAAICalWithGainAndCoupling, :libnidaqmx), Cint, (CalHandle, Cint, Cdouble, Cdouble), calHandle, coupling, gain, referenceVoltage)
end

function AdjustDSAAOCal(calHandle::CalHandle, channel::UInt32, requestedLowVoltage::Float64, actualLowVoltage::Float64, requestedHighVoltage::Float64, actualHighVoltage::Float64, gainSetting::Float64)
    ccall((:DAQmxAdjustDSAAOCal, :libnidaqmx), Cint, (CalHandle, Cuint, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), calHandle, channel, requestedLowVoltage, actualLowVoltage, requestedHighVoltage, actualHighVoltage, gainSetting)
end

function Adjust4610Cal(calHandle::CalHandle, channelName::String, gain::Float64, offset::Float64)
    ccall((:DAQmxAdjust4610Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelName, gain, offset)
end

function AdjustDSATimebaseCal(calHandle::CalHandle, referenceFrequency::Float64)
    ccall((:DAQmxAdjustDSATimebaseCal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, referenceFrequency)
end

function AdjustDSAAOTimebaseCal(calHandle::CalHandle, measuredFrequency::Float64, calComplete::Ref{UInt32})
    ccall((:DAQmxAdjustDSAAOTimebaseCal, :libnidaqmx), Cint, (CalHandle, Cdouble, Ref{Cuint}), calHandle, measuredFrequency, calComplete)
end

function SetupDSAAOTimebaseCal(calHandle::CalHandle, expectedFrequency::Ref{Cdouble})
    ccall((:DAQmxSetupDSAAOTimebaseCal, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}), calHandle, expectedFrequency)
end

function Get4463AdjustPoints(calHandle::CalHandle, terminalConfig::Int32, gain::Float64, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet4463AdjustPoints, :libnidaqmx), Cint, (CalHandle, Cint, Cdouble, Ref{Cdouble}, Cuint), calHandle, terminalConfig, gain, adjustmentPoints, bufferSize)
end

function Adjust4463Cal(calHandle::CalHandle, channelNames::String, referenceVoltage::Float64)
    ccall((:DAQmxAdjust4463Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, referenceVoltage)
end

function Setup4463Cal(calHandle::CalHandle, channelNames::String, terminalConfig::Int32, gain::Float64, outputVoltage::Float64)
    ccall((:DAQmxSetup4463Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint, Cdouble, Cdouble), calHandle, channelNames, terminalConfig, gain, outputVoltage)
end

function Setup4480Cal(calHandle::CalHandle, channelNames::String, calMode::Int32)
    ccall((:DAQmxSetup4480Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint), calHandle, channelNames, calMode)
end

function AdjustTIOTimebaseCal(calHandle::CalHandle, referenceFrequency::Float64)
    ccall((:DAQmxAdjustTIOTimebaseCal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, referenceFrequency)
end

function Adjust4204Cal(calHandle::CalHandle, channelNames::String, lowPassFreq::Float64, trackHoldEnabled::UInt32, inputVal::Float64)
    ccall((:DAQmxAdjust4204Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cuint, Cdouble), calHandle, channelNames, lowPassFreq, trackHoldEnabled, inputVal)
end

function Adjust4220Cal(calHandle::CalHandle, channelNames::String, gain::Float64, inputVal::Float64)
    ccall((:DAQmxAdjust4220Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelNames, gain, inputVal)
end

function Adjust4224Cal(calHandle::CalHandle, channelNames::String, gain::Float64, inputVal::Float64)
    ccall((:DAQmxAdjust4224Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelNames, gain, inputVal)
end

function Adjust4225Cal(calHandle::CalHandle, channelNames::String, gain::Float64, inputVal::Float64)
    ccall((:DAQmxAdjust4225Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelNames, gain, inputVal)
end

function Setup433xCal(calHandle::CalHandle, channelNames::String, excitationVoltage::Float64)
    ccall((:DAQmxSetup433xCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, excitationVoltage)
end

function Adjust433xCal(calHandle::CalHandle, refVoltage::Float64, refExcitation::Float64, shuntLocation::Int32)
    ccall((:DAQmxAdjust433xCal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble, Cint), calHandle, refVoltage, refExcitation, shuntLocation)
end

function Setup4339Cal(calHandle::CalHandle, channelNames::String, calMode::Int32, rangeMax::Float64, rangeMin::Float64, excitationVoltage::Float64)
    ccall((:DAQmxSetup4339Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint, Cdouble, Cdouble, Cdouble), calHandle, channelNames, calMode, rangeMax, rangeMin, excitationVoltage)
end

function Adjust4339Cal(calHandle::CalHandle, refVoltage::Float64)
    ccall((:DAQmxAdjust4339Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, refVoltage)
end

function Get4339CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet4339CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust4300Cal(calHandle::CalHandle, refVoltage::Float64)
    ccall((:DAQmxAdjust4300Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, refVoltage)
end

function Setup4302Cal(calHandle::CalHandle, channelNames::String, rangeMin::Float64, rangeMax::Float64)
    ccall((:DAQmxSetup4302Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelNames, rangeMin, rangeMax)
end

function Get4302CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet4302CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust4302Cal(calHandle::CalHandle, refVoltage::Float64)
    ccall((:DAQmxAdjust4302Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, refVoltage)
end

function Setup4303Cal(calHandle::CalHandle, channelNames::String, rangeMin::Float64, rangeMax::Float64)
    ccall((:DAQmxSetup4303Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelNames, rangeMin, rangeMax)
end

function Get4303CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet4303CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust4303Cal(calHandle::CalHandle, refVoltage::Float64)
    ccall((:DAQmxAdjust4303Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, refVoltage)
end

function Setup4304Cal(calHandle::CalHandle, channelNames::String, rangeMin::Float64, rangeMax::Float64)
    ccall((:DAQmxSetup4304Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelNames, rangeMin, rangeMax)
end

function Get4304CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet4304CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust4304Cal(calHandle::CalHandle, refVoltage::Float64)
    ccall((:DAQmxAdjust4304Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, refVoltage)
end

function Setup4305Cal(calHandle::CalHandle, channelNames::String, rangeMin::Float64, rangeMax::Float64)
    ccall((:DAQmxSetup4305Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelNames, rangeMin, rangeMax)
end

function Get4305CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet4305CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust4305Cal(calHandle::CalHandle, refVoltage::Float64)
    ccall((:DAQmxAdjust4305Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, refVoltage)
end

function Adjust4309Cal(calHandle::CalHandle, refVoltage::Float64)
    ccall((:DAQmxAdjust4309Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, refVoltage)
end

function Adjust4310Cal(calHandle::CalHandle, refVoltage::Float64)
    ccall((:DAQmxAdjust4310Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, refVoltage)
end

function Adjust4353Cal(calHandle::CalHandle, channelNames::String, refVal::Float64)
    ccall((:DAQmxAdjust4353Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, refVal)
end

function Adjust4357Cal(calHandle::CalHandle, channelNames::String, refVals::Ref{Cdouble}, numRefVals::Int32)
    ccall((:DAQmxAdjust4357Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Ref{Cdouble}, Cint), calHandle, channelNames, refVals, numRefVals)
end

function Setup4322Cal(calHandle::CalHandle, channelNames::String, outputType::Int32, outputVal::Float64)
    ccall((:DAQmxSetup4322Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint, Cdouble), calHandle, channelNames, outputType, outputVal)
end

function Adjust4322Cal(calHandle::CalHandle, channelNames::String, refVal::Float64)
    ccall((:DAQmxAdjust4322Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, refVal)
end

function Get4322CalAdjustPoints(calHandle::CalHandle, outputType::Int32, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
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

function SetSCExpressCalAccBridgeOutput(calHandle::CalHandle, voltsPerVolt::Float64)
    ccall((:DAQmxSetSCExpressCalAccBridgeOutput, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, voltsPerVolt)
end

function FieldDAQSetCalTemp(calHandle::CalHandle, temperature::Float64)
    ccall((:DAQmxFieldDAQSetCalTemp, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, temperature)
end

function Get11603CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet11603CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust11603Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust11603Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get11613CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet11613CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust11613Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust11613Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get11614CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet11614CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust11614Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust11614Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Setup11634Cal(calHandle::CalHandle, rangeMin::Float64, rangeMax::Float64)
    ccall((:DAQmxSetup11634Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, rangeMin, rangeMax)
end

function Get11634CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet11634CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust11634Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust11634Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Setup11637Cal(calHandle::CalHandle, channelNames::String, bridgeConfig::Int32, voltageExcitation::Float64)
    ccall((:DAQmxSetup11637Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint, Cdouble), calHandle, channelNames, bridgeConfig, voltageExcitation)
end

function Adjust11637Cal(calHandle::CalHandle, value::Float64, actualReading::Ref{Cdouble}, asFoundGainError::Ref{Cdouble}, asFoundOffsetError::Ref{Cdouble})
    ccall((:DAQmxAdjust11637Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}), calHandle, value, actualReading, asFoundGainError, asFoundOffsetError)
end

function Get9201CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9201CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function CSeriesSetCalTemp(calHandle::CalHandle, temperature::Float64)
    ccall((:DAQmxCSeriesSetCalTemp, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, temperature)
end

function Adjust9201Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9201Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9202CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9202CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9202Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9202Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9203CalAdjustPoints(calHandle::CalHandle, rangeMin::Float64, rangeMax::Float64, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9203CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble, Ref{Cdouble}, Cuint), calHandle, rangeMin, rangeMax, adjustmentPoints, bufferSize)
end

function Adjust9203GainCal(calHandle::CalHandle, channelNames::String, rangeMin::Float64, rangeMax::Float64, value::Float64)
    ccall((:DAQmxAdjust9203GainCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble, Cdouble), calHandle, channelNames, rangeMin, rangeMax, value)
end

function Adjust9203OffsetCal(calHandle::CalHandle, channelNames::String, rangeMin::Float64, rangeMax::Float64)
    ccall((:DAQmxAdjust9203OffsetCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelNames, rangeMin, rangeMax)
end

function Adjust9205Cal(calHandle::CalHandle, value::Float64)
    ccall((:DAQmxAdjust9205Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, value)
end

function Adjust9206Cal(calHandle::CalHandle, value::Float64)
    ccall((:DAQmxAdjust9206Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, value)
end

function Get9207CalAdjustPoints(calHandle::CalHandle, channelNames::String, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9207CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), calHandle, channelNames, adjustmentPoints, bufferSize)
end

function Adjust9207GainCal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9207GainCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Adjust9207OffsetCal(calHandle::CalHandle, channelNames::String)
    ccall((:DAQmxAdjust9207OffsetCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}), calHandle, channelNames)
end

function Get9208CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9208CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9208GainCal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9208GainCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Adjust9208OffsetCal(calHandle::CalHandle, channelNames::String)
    ccall((:DAQmxAdjust9208OffsetCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}), calHandle, channelNames)
end

function Get9209CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9209CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9209GainCal(calHandle::CalHandle, channelNames::String, terminalConfig::Int32, value::Float64)
    ccall((:DAQmxAdjust9209GainCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint, Cdouble), calHandle, channelNames, terminalConfig, value)
end

function Adjust9209OffsetCal(calHandle::CalHandle, channelNames::String)
    ccall((:DAQmxAdjust9209OffsetCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}), calHandle, channelNames)
end

function Adjust9210Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9210Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Adjust9211Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9211Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9212CalAdjustPoints(calHandle::CalHandle, channelNames::String, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9212CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), calHandle, channelNames, adjustmentPoints, bufferSize)
end

function Adjust9212Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9212Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9213CalAdjustPoints(calHandle::CalHandle, rangeMin::Float64, rangeMax::Float64, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9213CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble, Ref{Cdouble}, Cuint), calHandle, rangeMin, rangeMax, adjustmentPoints, bufferSize)
end

function Adjust9213Cal(calHandle::CalHandle, channelNames::String, rangeMin::Float64, rangeMax::Float64, value::Float64)
    ccall((:DAQmxAdjust9213Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble, Cdouble), calHandle, channelNames, rangeMin, rangeMax, value)
end

function Get9214CalAdjustPoints(calHandle::CalHandle, channelNames::String, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9214CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), calHandle, channelNames, adjustmentPoints, bufferSize)
end

function Adjust9214Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9214Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9215CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9215CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9215Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9215Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9216CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9216CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9216Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9216Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9217CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9217CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9217Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9217Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Setup9218Cal(calHandle::CalHandle, channelNames::String, rangeMin::Float64, rangeMax::Float64, measType::Int32)
    ccall((:DAQmxSetup9218Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble, Cint), calHandle, channelNames, rangeMin, rangeMax, measType)
end

function Get9218CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9218CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9218Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9218Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Setup9219Cal(calHandle::CalHandle, channelNames::String, rangeMin::Float64, rangeMax::Float64, measType::Int32, bridgeConfig::Int32)
    ccall((:DAQmxSetup9219Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint), calHandle, channelNames, rangeMin, rangeMax, measType, bridgeConfig)
end

function Get9219CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9219CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9219Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9219Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9220CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9220CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9220Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9220Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9221CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9221CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9221Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9221Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9222CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9222CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9222Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9222Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9223CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9223CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9223Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9223Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9224CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9224CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9224Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9224Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9225CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9225CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9225Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9225Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9226CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9226CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9226Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9226Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9227CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9227CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9227Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9227Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9228CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9228CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9228Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9228Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9229CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9229CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9229Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9229Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9230CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9230CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9230Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9230Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9231CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9231CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9231Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9231Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9232CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9232CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9232Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9232Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9234CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9234CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9234GainCal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9234GainCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Adjust9234OffsetCal(calHandle::CalHandle, channelNames::String)
    ccall((:DAQmxAdjust9234OffsetCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}), calHandle, channelNames)
end

function Get9238CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9238CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9238Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9238Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9239CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9239CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9239Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9239Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9242CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9242CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Setup9242Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxSetup9242Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Adjust9242Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9242Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9244CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9244CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Setup9244Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxSetup9244Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Adjust9244Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9244Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9246CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9246CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9246Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9246Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9247CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9247CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9247Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9247Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9250CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9250CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9250Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9250Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9251CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9251CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9251Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9251Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9260CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Int32}, bufferSize::UInt32)
    ccall((:DAQmxGet9260CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cint}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Setup9260Cal(calHandle::CalHandle, channelNames::String, value::Int32)
    ccall((:DAQmxSetup9260Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint), calHandle, channelNames, value)
end

function Adjust9260Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9260Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9263CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Int32}, bufferSize::UInt32)
    ccall((:DAQmxGet9263CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cint}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Setup9263Cal(calHandle::CalHandle, channelNames::String, value::Int32)
    ccall((:DAQmxSetup9263Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint), calHandle, channelNames, value)
end

function Adjust9263Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9263Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9264CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Int32}, bufferSize::UInt32)
    ccall((:DAQmxGet9264CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cint}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Setup9264Cal(calHandle::CalHandle, channelNames::String, value::Int32)
    ccall((:DAQmxSetup9264Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint), calHandle, channelNames, value)
end

function Adjust9264Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9264Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9265CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Int32}, bufferSize::UInt32)
    ccall((:DAQmxGet9265CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cint}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Setup9265Cal(calHandle::CalHandle, channelNames::String, value::Int32)
    ccall((:DAQmxSetup9265Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint), calHandle, channelNames, value)
end

function Adjust9265Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9265Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9266CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Int32}, bufferSize::UInt32)
    ccall((:DAQmxGet9266CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cint}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Setup9266Cal(calHandle::CalHandle, channelNames::String, value::Int32)
    ccall((:DAQmxSetup9266Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint), calHandle, channelNames, value)
end

function Adjust9266Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9266Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9269CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Int32}, bufferSize::UInt32)
    ccall((:DAQmxGet9269CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cint}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Setup9269Cal(calHandle::CalHandle, channelNames::String, value::Int32)
    ccall((:DAQmxSetup9269Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint), calHandle, channelNames, value)
end

function Adjust9269Cal(calHandle::CalHandle, channelNames::String, value::Float64)
    ccall((:DAQmxAdjust9269Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9775CalAdjustPoints(calHandle::CalHandle, coupling::UInt32, adjustmentPoints::Ref{Cdouble}, bufferSize::UInt32)
    ccall((:DAQmxGet9775CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Cuint, Ref{Cdouble}, Cuint), calHandle, coupling, adjustmentPoints, bufferSize)
end

function Adjust9775Cal(calHandle::CalHandle, channelNames::String, value::Float64, coupling::UInt32)
    ccall((:DAQmxAdjust9775Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cuint), calHandle, channelNames, value, coupling)
end

function Setup1102Cal(calHandle::CalHandle, channelName::String, gain::Float64)
    ccall((:DAQmxSetup1102Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust1102Cal(calHandle::CalHandle, refVoltage::Float64, measOutput::Float64)
    ccall((:DAQmxAdjust1102Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1104Cal(calHandle::CalHandle, channelName::String)
    ccall((:DAQmxSetup1104Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}), calHandle, channelName)
end

function Adjust1104Cal(calHandle::CalHandle, refVoltage::Float64, measOutput::Float64)
    ccall((:DAQmxAdjust1104Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1112Cal(calHandle::CalHandle, channelName::String)
    ccall((:DAQmxSetup1112Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}), calHandle, channelName)
end

function Adjust1112Cal(calHandle::CalHandle, refVoltage::Float64, measOutput::Float64)
    ccall((:DAQmxAdjust1112Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1122Cal(calHandle::CalHandle, channelName::String, gain::Float64)
    ccall((:DAQmxSetup1122Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust1122Cal(calHandle::CalHandle, refVoltage::Float64, measOutput::Float64)
    ccall((:DAQmxAdjust1122Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1124Cal(calHandle::CalHandle, channelName::String, range::Int32, dacValue::UInt32)
    ccall((:DAQmxSetup1124Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint, Cuint), calHandle, channelName, range, dacValue)
end

function Adjust1124Cal(calHandle::CalHandle, measOutput::Float64)
    ccall((:DAQmxAdjust1124Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, measOutput)
end

function Setup1125Cal(calHandle::CalHandle, channelName::String, gain::Float64)
    ccall((:DAQmxSetup1125Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust1125Cal(calHandle::CalHandle, refVoltage::Float64, measOutput::Float64)
    ccall((:DAQmxAdjust1125Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1126Cal(calHandle::CalHandle, channelName::String, upperFreqLimit::Float64)
    ccall((:DAQmxSetup1126Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, upperFreqLimit)
end

function Adjust1126Cal(calHandle::CalHandle, refFreq::Float64, measOutput::Float64)
    ccall((:DAQmxAdjust1126Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refFreq, measOutput)
end

function Setup1141Cal(calHandle::CalHandle, channelName::String, gain::Float64)
    ccall((:DAQmxSetup1141Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust1141Cal(calHandle::CalHandle, refVoltage::Float64, measOutput::Float64)
    ccall((:DAQmxAdjust1141Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1142Cal(calHandle::CalHandle, channelName::String, gain::Float64)
    ccall((:DAQmxSetup1142Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust1142Cal(calHandle::CalHandle, refVoltage::Float64, measOutput::Float64)
    ccall((:DAQmxAdjust1142Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1143Cal(calHandle::CalHandle, channelName::String, gain::Float64)
    ccall((:DAQmxSetup1143Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust1143Cal(calHandle::CalHandle, refVoltage::Float64, measOutput::Float64)
    ccall((:DAQmxAdjust1143Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1502Cal(calHandle::CalHandle, channelName::String, gain::Float64)
    ccall((:DAQmxSetup1502Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust1502Cal(calHandle::CalHandle, refVoltage::Float64, measOutput::Float64)
    ccall((:DAQmxAdjust1502Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1503Cal(calHandle::CalHandle, channelName::String, gain::Float64)
    ccall((:DAQmxSetup1503Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust1503Cal(calHandle::CalHandle, refVoltage::Float64, measOutput::Float64)
    ccall((:DAQmxAdjust1503Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Adjust1503CurrentCal(calHandle::CalHandle, channelName::String, measCurrent::Float64)
    ccall((:DAQmxAdjust1503CurrentCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, measCurrent)
end

function Setup1520Cal(calHandle::CalHandle, channelName::String, gain::Float64)
    ccall((:DAQmxSetup1520Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust1520Cal(calHandle::CalHandle, refVoltage::Float64, measOutput::Float64)
    ccall((:DAQmxAdjust1520Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1521Cal(calHandle::CalHandle, channelName::String)
    ccall((:DAQmxSetup1521Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}), calHandle, channelName)
end

function Adjust1521Cal(calHandle::CalHandle, refVoltage::Float64, measOutput::Float64)
    ccall((:DAQmxAdjust1521Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup153xCal(calHandle::CalHandle, channelName::String, gain::Float64)
    ccall((:DAQmxSetup153xCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust153xCal(calHandle::CalHandle, refVoltage::Float64, measOutput::Float64)
    ccall((:DAQmxAdjust153xCal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1540Cal(calHandle::CalHandle, channelName::String, excitationVoltage::Float64, excitationFreq::Float64)
    ccall((:DAQmxSetup1540Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelName, excitationVoltage, excitationFreq)
end

function Adjust1540Cal(calHandle::CalHandle, refVoltage::Float64, measOutput::Float64, inputCalSource::Int32)
    ccall((:DAQmxAdjust1540Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble, Cint), calHandle, refVoltage, measOutput, inputCalSource)
end

function ConfigureTEDS(physicalChannel::String, filePath::String)
    ccall((:DAQmxConfigureTEDS, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}), physicalChannel, filePath)
end

function ClearTEDS(physicalChannel::String)
    ccall((:DAQmxClearTEDS, :libnidaqmx), Cint, (Ref{UInt8},), physicalChannel)
end

function WriteToTEDSFromArray(physicalChannel::String, bitStream::Ref{Cuchar}, arraySize::UInt32, basicTEDSOptions::Int32)
    ccall((:DAQmxWriteToTEDSFromArray, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuchar}, Cuint, Cint), physicalChannel, bitStream, arraySize, basicTEDSOptions)
end

function WriteToTEDSFromFile(physicalChannel::String, filePath::String, basicTEDSOptions::Int32)
    ccall((:DAQmxWriteToTEDSFromFile, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Cint), physicalChannel, filePath, basicTEDSOptions)
end

function GetPhysicalChanAttribute(physicalChannel::String, attribute::Int32, value::Ref{Cvoid})
    ccall((:DAQmxGetPhysicalChanAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint, Ref{Cvoid}), physicalChannel, attribute, value)
end

function WaitForNextSampleClock(taskHandle::TaskHandle, timeout::Float64, isLate::Ref{UInt32})
    ccall((:DAQmxWaitForNextSampleClock, :libnidaqmx), Cint, (TaskHandle, Cdouble, Ref{Cuint}), taskHandle, timeout, isLate)
end

function GetRealTimeAttribute(taskHandle::TaskHandle, attribute::Int32, value::Ref{Cvoid})
    ccall((:DAQmxGetRealTimeAttribute, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{Cvoid}), taskHandle, attribute, value)
end

function SetRealTimeAttribute(taskHandle::TaskHandle, attribute::Int32)
    ccall((:DAQmxSetRealTimeAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ResetRealTimeAttribute(taskHandle::TaskHandle, attribute::Int32)
    ccall((:DAQmxResetRealTimeAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function IsReadOrWriteLate(errorCode::Int32)
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

function GetPersistedTaskAttribute(taskName::String, attribute::Int32, value::Ref{Cvoid})
    ccall((:DAQmxGetPersistedTaskAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint, Ref{Cvoid}), taskName, attribute, value)
end

function GetPersistedChanAttribute(channel::String, attribute::Int32, value::Ref{Cvoid})
    ccall((:DAQmxGetPersistedChanAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint, Ref{Cvoid}), channel, attribute, value)
end

function GetPersistedScaleAttribute(scaleName::String, attribute::Int32, value::Ref{Cvoid})
    ccall((:DAQmxGetPersistedScaleAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint, Ref{Cvoid}), scaleName, attribute, value)
end

function GetSystemInfoAttribute(attribute::Int32, value::Ref{Cvoid})
    ccall((:DAQmxGetSystemInfoAttribute, :libnidaqmx), Cint, (Cint, Ref{Cvoid}), attribute, value)
end

function SetDigitalPowerUpStates(deviceName::String, channelNames::String, state::Int32)
    ccall((:DAQmxSetDigitalPowerUpStates, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Cint), deviceName, channelNames, state)
end

function GetDigitalPowerUpStates(deviceName::String, channelName::String, state::Ref{Int32})
    ccall((:DAQmxGetDigitalPowerUpStates, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Ref{Cint}), deviceName, channelName, state)
end

function SetDigitalPullUpPullDownStates(deviceName::String, channelName::String, state::Int32)
    ccall((:DAQmxSetDigitalPullUpPullDownStates, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Cint), deviceName, channelName, state)
end

function GetDigitalPullUpPullDownStates(deviceName::String, channelName::String, state::Ref{Int32})
    ccall((:DAQmxGetDigitalPullUpPullDownStates, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Ref{Cint}), deviceName, channelName, state)
end

function SetAnalogPowerUpStates(deviceName::String, channelNames::String, state::Float64, channelType::Int32)
    ccall((:DAQmxSetAnalogPowerUpStates, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Cdouble, Cint), deviceName, channelNames, state, channelType)
end

function SetAnalogPowerUpStatesWithOutputType(channelNames::String, stateArray::Ref{Cdouble}, channelTypeArray::Ref{Int32}, arraySize::UInt32)
    ccall((:DAQmxSetAnalogPowerUpStatesWithOutputType, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Ref{Cint}, Cuint), channelNames, stateArray, channelTypeArray, arraySize)
end

function GetAnalogPowerUpStates(deviceName::String, channelName::String, state::Ref{Cdouble}, channelType::Int32)
    ccall((:DAQmxGetAnalogPowerUpStates, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Ref{Cdouble}, Cint), deviceName, channelName, state, channelType)
end

function GetAnalogPowerUpStatesWithOutputType(channelNames::String, stateArray::Ref{Cdouble}, channelTypeArray::Ref{Int32}, arraySizePtr::Ref{UInt32})
    ccall((:DAQmxGetAnalogPowerUpStatesWithOutputType, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Ref{Cint}, Ref{Cuint}), channelNames, stateArray, channelTypeArray, arraySizePtr)
end

function SetDigitalLogicFamilyPowerUpState(deviceName::String, logicFamily::Int32)
    ccall((:DAQmxSetDigitalLogicFamilyPowerUpState, :libnidaqmx), Cint, (Ref{UInt8}, Cint), deviceName, logicFamily)
end

function GetDigitalLogicFamilyPowerUpState(deviceName::String, logicFamily::Ref{Int32})
    ccall((:DAQmxGetDigitalLogicFamilyPowerUpState, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), deviceName, logicFamily)
end

function AddNetworkDevice(IPAddress::String, deviceName::String, attemptReservation::UInt32, timeout::Float64, deviceNameOut::String, deviceNameOutBufferSize::UInt32)
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

function AutoConfigureCDAQSyncConnections(chassisDevicesPorts::String, timeout::Float64)
    ccall((:DAQmxAutoConfigureCDAQSyncConnections, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble), chassisDevicesPorts, timeout)
end

function GetAutoConfiguredCDAQSyncConnections(portList::String, portListSize::UInt32)
    ccall((:DAQmxGetAutoConfiguredCDAQSyncConnections, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), portList, portListSize)
end

function AreConfiguredCDAQSyncPortsDisconnected(chassisDevicesPorts::String, timeout::Float64, disconnectedPortsExist::Ref{UInt32})
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

function GetErrorString(errorCode::Int32, errorString::String, bufferSize::UInt32)
    ccall((:DAQmxGetErrorString, :libnidaqmx), Cint, (Cint, Ref{UInt8}, Cuint), errorCode, errorString, bufferSize)
end

function GetExtendedErrorInfo(errorString::String, bufferSize::UInt32)
    ccall((:DAQmxGetExtendedErrorInfo, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), errorString, bufferSize)
end

function GetBufInputBufSize(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetBufInputBufSize, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetBufInputBufSize(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetBufInputBufSize, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetBufInputBufSize(taskHandle::TaskHandle)
    ccall((:DAQmxResetBufInputBufSize, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetBufInputOnbrdBufSize(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetBufInputOnbrdBufSize, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetBufOutputBufSize(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetBufOutputBufSize, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetBufOutputBufSize(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetBufOutputBufSize, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetBufOutputBufSize(taskHandle::TaskHandle)
    ccall((:DAQmxResetBufOutputBufSize, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetBufOutputOnbrdBufSize(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetBufOutputOnbrdBufSize, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetBufOutputOnbrdBufSize(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetBufOutputOnbrdBufSize, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetBufOutputOnbrdBufSize(taskHandle::TaskHandle)
    ccall((:DAQmxResetBufOutputOnbrdBufSize, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSelfCalSupported(deviceName::String, data::UInt32)
    ccall((:DAQmxGetSelfCalSupported, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function GetSelfCalLastTemp(deviceName::String, data::Float64)
    ccall((:DAQmxGetSelfCalLastTemp, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), deviceName, data)
end

function GetExtCalRecommendedInterval(deviceName::String, data::UInt32)
    ccall((:DAQmxGetExtCalRecommendedInterval, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function GetExtCalLastTemp(deviceName::String, data::Float64)
    ccall((:DAQmxGetExtCalLastTemp, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), deviceName, data)
end

function GetCalUserDefinedInfo(deviceName::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCalUserDefinedInfo, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), deviceName, data, bufferSize)
end

function SetCalUserDefinedInfo(deviceName::String, data)
    ccall((:DAQmxSetCalUserDefinedInfo, :libnidaqmx), Cint, (Ref{UInt8}, Cstring), deviceName, data)
end

function GetCalUserDefinedInfoMaxSize(deviceName::String, data::UInt32)
    ccall((:DAQmxGetCalUserDefinedInfoMaxSize, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function GetCalDevTemp(deviceName::String, data::Float64)
    ccall((:DAQmxGetCalDevTemp, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), deviceName, data)
end

function GetCalAccConnectionCount(deviceName::String, data::UInt32)
    ccall((:DAQmxGetCalAccConnectionCount, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function SetCalAccConnectionCount(deviceName::String, data::UInt32)
    ccall((:DAQmxSetCalAccConnectionCount, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), deviceName, data)
end

function GetCalRecommendedAccConnectionCountLimit(deviceName::String, data::UInt32)
    ccall((:DAQmxGetCalRecommendedAccConnectionCountLimit, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function GetAIMax(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIMax, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIMax(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIMax, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIMax(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIMax, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIMin(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIMin, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIMin(taskHandle::TaskHandle, channel::String, data::Float64)
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

function GetAIMeasType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIMeasType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function GetAIVoltageUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIVoltageUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIVoltageUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIVoltageUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIVoltageUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIVoltageUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIVoltagedBRef(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIVoltagedBRef, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIVoltagedBRef(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIVoltagedBRef, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIVoltagedBRef(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIVoltagedBRef, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIVoltageACRMSUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIVoltageACRMSUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIVoltageACRMSUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIVoltageACRMSUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIVoltageACRMSUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIVoltageACRMSUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAITempUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAITempUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAITempUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAITempUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAITempUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAITempUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIThrmcplType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIThrmcplType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIThrmcplType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIThrmcplType, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIThrmcplType(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIThrmcplType, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIThrmcplScaleType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIThrmcplScaleType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIThrmcplScaleType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIThrmcplScaleType, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIThrmcplScaleType(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIThrmcplScaleType, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIThrmcplCJCSrc(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIThrmcplCJCSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function GetAIThrmcplCJCVal(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIThrmcplCJCVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIThrmcplCJCVal(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIThrmcplCJCVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIThrmcplCJCVal(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIThrmcplCJCVal, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIThrmcplCJCChan(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAIThrmcplCJCChan, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function GetAIRTDType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIRTDType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIRTDType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIRTDType, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIRTDType(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRTDType, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIRTDR0(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIRTDR0, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIRTDR0(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIRTDR0, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIRTDR0(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRTDR0, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIRTDA(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIRTDA, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIRTDA(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIRTDA, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIRTDA(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRTDA, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIRTDB(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIRTDB, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIRTDB(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIRTDB, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIRTDB(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRTDB, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIRTDC(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIRTDC, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIRTDC(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIRTDC, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIRTDC(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRTDC, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIThrmstrA(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIThrmstrA, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIThrmstrA(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIThrmstrA, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIThrmstrA(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIThrmstrA, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIThrmstrB(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIThrmstrB, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIThrmstrB(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIThrmstrB, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIThrmstrB(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIThrmstrB, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIThrmstrC(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIThrmstrC, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIThrmstrC(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIThrmstrC, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIThrmstrC(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIThrmstrC, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIThrmstrR1(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIThrmstrR1, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIThrmstrR1(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIThrmstrR1, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIThrmstrR1(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIThrmstrR1, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIForceReadFromChan(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAIForceReadFromChan, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIForceReadFromChan(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAIForceReadFromChan, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIForceReadFromChan(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIForceReadFromChan, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAICurrentUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAICurrentUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAICurrentUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAICurrentUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAICurrentUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAICurrentUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAICurrentACRMSUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAICurrentACRMSUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAICurrentACRMSUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAICurrentACRMSUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAICurrentACRMSUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAICurrentACRMSUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIStrainUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIStrainUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIStrainUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIStrainUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIStrainUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIStrainUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIStrainGageForceReadFromChan(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAIStrainGageForceReadFromChan, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIStrainGageForceReadFromChan(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAIStrainGageForceReadFromChan, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIStrainGageForceReadFromChan(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIStrainGageForceReadFromChan, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIStrainGageGageFactor(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIStrainGageGageFactor, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIStrainGageGageFactor(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIStrainGageGageFactor, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIStrainGageGageFactor(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIStrainGageGageFactor, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIStrainGagePoissonRatio(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIStrainGagePoissonRatio, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIStrainGagePoissonRatio(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIStrainGagePoissonRatio, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIStrainGagePoissonRatio(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIStrainGagePoissonRatio, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIStrainGageCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIStrainGageCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIStrainGageCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIStrainGageCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIStrainGageCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIStrainGageCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIRosetteStrainGageRosetteType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIRosetteStrainGageRosetteType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function GetAIRosetteStrainGageOrientation(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIRosetteStrainGageOrientation, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIRosetteStrainGageOrientation(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIRosetteStrainGageOrientation, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIRosetteStrainGageOrientation(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRosetteStrainGageOrientation, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIRosetteStrainGageStrainChans(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAIRosetteStrainGageStrainChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function GetAIRosetteStrainGageRosetteMeasType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIRosetteStrainGageRosetteMeasType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIRosetteStrainGageRosetteMeasType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIRosetteStrainGageRosetteMeasType, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIRosetteStrainGageRosetteMeasType(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRosetteStrainGageRosetteMeasType, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIResistanceUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIResistanceUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIResistanceUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIResistanceUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIResistanceUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIResistanceUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIFreqUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIFreqUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIFreqUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIFreqUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIFreqUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIFreqUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIFreqThreshVoltage(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIFreqThreshVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIFreqThreshVoltage(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIFreqThreshVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIFreqThreshVoltage(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIFreqThreshVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIFreqHyst(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIFreqHyst, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIFreqHyst(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIFreqHyst, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIFreqHyst(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIFreqHyst, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAILVDTUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAILVDTUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAILVDTUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAILVDTUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAILVDTUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAILVDTUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAILVDTSensitivity(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAILVDTSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAILVDTSensitivity(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAILVDTSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAILVDTSensitivity(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAILVDTSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAILVDTSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAILVDTSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAILVDTSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAILVDTSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAILVDTSensitivityUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAILVDTSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIRVDTUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIRVDTUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIRVDTUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIRVDTUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIRVDTUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRVDTUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIRVDTSensitivity(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIRVDTSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIRVDTSensitivity(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIRVDTSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIRVDTSensitivity(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRVDTSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIRVDTSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIRVDTSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIRVDTSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIRVDTSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIRVDTSensitivityUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRVDTSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIEddyCurrentProxProbeUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIEddyCurrentProxProbeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIEddyCurrentProxProbeUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIEddyCurrentProxProbeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIEddyCurrentProxProbeUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIEddyCurrentProxProbeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIEddyCurrentProxProbeSensitivity(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIEddyCurrentProxProbeSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIEddyCurrentProxProbeSensitivity(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIEddyCurrentProxProbeSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIEddyCurrentProxProbeSensitivity(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIEddyCurrentProxProbeSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIEddyCurrentProxProbeSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIEddyCurrentProxProbeSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIEddyCurrentProxProbeSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIEddyCurrentProxProbeSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIEddyCurrentProxProbeSensitivityUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIEddyCurrentProxProbeSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAISoundPressureMaxSoundPressureLvl(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAISoundPressureMaxSoundPressureLvl, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAISoundPressureMaxSoundPressureLvl(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAISoundPressureMaxSoundPressureLvl, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAISoundPressureMaxSoundPressureLvl(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAISoundPressureMaxSoundPressureLvl, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAISoundPressureUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAISoundPressureUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAISoundPressureUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAISoundPressureUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAISoundPressureUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAISoundPressureUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAISoundPressuredBRef(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAISoundPressuredBRef, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAISoundPressuredBRef(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAISoundPressuredBRef, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAISoundPressuredBRef(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAISoundPressuredBRef, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIMicrophoneSensitivity(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIMicrophoneSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIMicrophoneSensitivity(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIMicrophoneSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIMicrophoneSensitivity(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIMicrophoneSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIAccelUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIAccelUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIAccelUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIAccelUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIAccelUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIAccelUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIAcceldBRef(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIAcceldBRef, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIAcceldBRef(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIAcceldBRef, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIAcceldBRef(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIAcceldBRef, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIAccel4WireDCVoltageSensitivity(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIAccel4WireDCVoltageSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIAccel4WireDCVoltageSensitivity(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIAccel4WireDCVoltageSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIAccel4WireDCVoltageSensitivity(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIAccel4WireDCVoltageSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIAccel4WireDCVoltageSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIAccel4WireDCVoltageSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIAccel4WireDCVoltageSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIAccel4WireDCVoltageSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIAccel4WireDCVoltageSensitivityUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIAccel4WireDCVoltageSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIAccelSensitivity(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIAccelSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIAccelSensitivity(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIAccelSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIAccelSensitivity(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIAccelSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIAccelSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIAccelSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIAccelSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIAccelSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIAccelSensitivityUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIAccelSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIAccelChargeSensitivity(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIAccelChargeSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIAccelChargeSensitivity(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIAccelChargeSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIAccelChargeSensitivity(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIAccelChargeSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIAccelChargeSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIAccelChargeSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIAccelChargeSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIAccelChargeSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIAccelChargeSensitivityUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIAccelChargeSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIVelocityUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIVelocityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIVelocityUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIVelocityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIVelocityUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIVelocityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIVelocityIEPESensordBRef(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIVelocityIEPESensordBRef, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIVelocityIEPESensordBRef(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIVelocityIEPESensordBRef, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIVelocityIEPESensordBRef(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIVelocityIEPESensordBRef, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIVelocityIEPESensorSensitivity(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIVelocityIEPESensorSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIVelocityIEPESensorSensitivity(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIVelocityIEPESensorSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIVelocityIEPESensorSensitivity(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIVelocityIEPESensorSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIVelocityIEPESensorSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIVelocityIEPESensorSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIVelocityIEPESensorSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIVelocityIEPESensorSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIVelocityIEPESensorSensitivityUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIVelocityIEPESensorSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIForceUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIForceUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIForceUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIForceUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIForceUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIForceUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIForceIEPESensorSensitivity(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIForceIEPESensorSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIForceIEPESensorSensitivity(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIForceIEPESensorSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIForceIEPESensorSensitivity(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIForceIEPESensorSensitivity, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIForceIEPESensorSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIForceIEPESensorSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIForceIEPESensorSensitivityUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIForceIEPESensorSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIForceIEPESensorSensitivityUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIForceIEPESensorSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIPressureUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIPressureUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIPressureUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIPressureUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIPressureUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIPressureUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAITorqueUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAITorqueUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAITorqueUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAITorqueUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAITorqueUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAITorqueUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIBridgeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIBridgeUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIBridgeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIBridgeUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeElectricalUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIBridgeElectricalUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIBridgeElectricalUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIBridgeElectricalUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIBridgeElectricalUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeElectricalUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgePhysicalUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIBridgePhysicalUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIBridgePhysicalUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIBridgePhysicalUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIBridgePhysicalUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgePhysicalUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeScaleType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIBridgeScaleType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIBridgeScaleType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIBridgeScaleType, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIBridgeScaleType(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeScaleType, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeTwoPointLinFirstElectricalVal(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIBridgeTwoPointLinFirstElectricalVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeTwoPointLinFirstElectricalVal(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIBridgeTwoPointLinFirstElectricalVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeTwoPointLinFirstElectricalVal(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeTwoPointLinFirstElectricalVal, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeTwoPointLinFirstPhysicalVal(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIBridgeTwoPointLinFirstPhysicalVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeTwoPointLinFirstPhysicalVal(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIBridgeTwoPointLinFirstPhysicalVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeTwoPointLinFirstPhysicalVal(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeTwoPointLinFirstPhysicalVal, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeTwoPointLinSecondElectricalVal(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIBridgeTwoPointLinSecondElectricalVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeTwoPointLinSecondElectricalVal(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIBridgeTwoPointLinSecondElectricalVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeTwoPointLinSecondElectricalVal(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeTwoPointLinSecondElectricalVal, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeTwoPointLinSecondPhysicalVal(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIBridgeTwoPointLinSecondPhysicalVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeTwoPointLinSecondPhysicalVal(taskHandle::TaskHandle, channel::String, data::Float64)
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

function GetAIChargeUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIChargeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIChargeUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIChargeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIChargeUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIChargeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIIsTEDS(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAIIsTEDS, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function GetAITEDSUnits(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetAITEDSUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function GetAICoupling(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAICoupling, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAICoupling(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAICoupling, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAICoupling(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAICoupling, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIImpedance(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIImpedance, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIImpedance(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIImpedance, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIImpedance(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIImpedance, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAITermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAITermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAITermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
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

function GetAIResistanceCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIResistanceCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIResistanceCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIResistanceCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIResistanceCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIResistanceCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAILeadWireResistance(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAILeadWireResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAILeadWireResistance(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAILeadWireResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAILeadWireResistance(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAILeadWireResistance, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIBridgeCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIBridgeCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIBridgeCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIBridgeCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeNomResistance(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIBridgeNomResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeNomResistance(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIBridgeNomResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeNomResistance(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeNomResistance, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeInitialVoltage(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIBridgeInitialVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeInitialVoltage(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIBridgeInitialVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeInitialVoltage(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeInitialVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeInitialRatio(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIBridgeInitialRatio, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeInitialRatio(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIBridgeInitialRatio, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeInitialRatio(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeInitialRatio, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeShuntCalEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAIBridgeShuntCalEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIBridgeShuntCalEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAIBridgeShuntCalEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIBridgeShuntCalEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeShuntCalEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeShuntCalSelect(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIBridgeShuntCalSelect, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIBridgeShuntCalSelect(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIBridgeShuntCalSelect, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIBridgeShuntCalSelect(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeShuntCalSelect, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeShuntCalShuntCalASrc(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIBridgeShuntCalShuntCalASrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIBridgeShuntCalShuntCalASrc(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIBridgeShuntCalShuntCalASrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIBridgeShuntCalShuntCalASrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeShuntCalShuntCalASrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeShuntCalGainAdjust(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIBridgeShuntCalGainAdjust, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeShuntCalGainAdjust(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIBridgeShuntCalGainAdjust, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeShuntCalGainAdjust(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeShuntCalGainAdjust, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeShuntCalShuntCalAResistance(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIBridgeShuntCalShuntCalAResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeShuntCalShuntCalAResistance(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIBridgeShuntCalShuntCalAResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeShuntCalShuntCalAResistance(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeShuntCalShuntCalAResistance, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeShuntCalShuntCalAActualResistance(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIBridgeShuntCalShuntCalAActualResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeShuntCalShuntCalAActualResistance(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIBridgeShuntCalShuntCalAActualResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeShuntCalShuntCalAActualResistance(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeShuntCalShuntCalAActualResistance, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeShuntCalShuntCalBResistance(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIBridgeShuntCalShuntCalBResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeShuntCalShuntCalBResistance(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIBridgeShuntCalShuntCalBResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeShuntCalShuntCalBResistance(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeShuntCalShuntCalBResistance, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeShuntCalShuntCalBActualResistance(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIBridgeShuntCalShuntCalBActualResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeShuntCalShuntCalBActualResistance(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIBridgeShuntCalShuntCalBActualResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeShuntCalShuntCalBActualResistance(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeShuntCalShuntCalBActualResistance, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeBalanceCoarsePot(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIBridgeBalanceCoarsePot, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIBridgeBalanceCoarsePot(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIBridgeBalanceCoarsePot, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIBridgeBalanceCoarsePot(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeBalanceCoarsePot, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIBridgeBalanceFinePot(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIBridgeBalanceFinePot, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIBridgeBalanceFinePot(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIBridgeBalanceFinePot, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIBridgeBalanceFinePot(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIBridgeBalanceFinePot, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAICurrentShuntLoc(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAICurrentShuntLoc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAICurrentShuntLoc(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAICurrentShuntLoc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAICurrentShuntLoc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAICurrentShuntLoc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAICurrentShuntResistance(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAICurrentShuntResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAICurrentShuntResistance(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAICurrentShuntResistance, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAICurrentShuntResistance(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAICurrentShuntResistance, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIExcitSense(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIExcitSense, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIExcitSense(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIExcitSense, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIExcitSense(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIExcitSense, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIExcitSrc(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIExcitSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIExcitSrc(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIExcitSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIExcitSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIExcitSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIExcitVal(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIExcitVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIExcitVal(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIExcitVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIExcitVal(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIExcitVal, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIExcitUseForScaling(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAIExcitUseForScaling, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIExcitUseForScaling(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAIExcitUseForScaling, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIExcitUseForScaling(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIExcitUseForScaling, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIExcitUseMultiplexed(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAIExcitUseMultiplexed, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIExcitUseMultiplexed(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAIExcitUseMultiplexed, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIExcitUseMultiplexed(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIExcitUseMultiplexed, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIExcitActualVal(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIExcitActualVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIExcitActualVal(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIExcitActualVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIExcitActualVal(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIExcitActualVal, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIExcitDCorAC(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIExcitDCorAC, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIExcitDCorAC(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIExcitDCorAC, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIExcitDCorAC(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIExcitDCorAC, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIExcitVoltageOrCurrent(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIExcitVoltageOrCurrent, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIExcitVoltageOrCurrent(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIExcitVoltageOrCurrent, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIExcitVoltageOrCurrent(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIExcitVoltageOrCurrent, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIExcitIdleOutputBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIExcitIdleOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIExcitIdleOutputBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIExcitIdleOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIExcitIdleOutputBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIExcitIdleOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIACExcitFreq(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIACExcitFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIACExcitFreq(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIACExcitFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIACExcitFreq(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIACExcitFreq, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIACExcitSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAIACExcitSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIACExcitSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAIACExcitSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIACExcitSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIACExcitSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIACExcitWireMode(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIACExcitWireMode, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIACExcitWireMode(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIACExcitWireMode, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIACExcitWireMode(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIACExcitWireMode, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAISensorPowerVoltage(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAISensorPowerVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAISensorPowerVoltage(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAISensorPowerVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAISensorPowerVoltage(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAISensorPowerVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAISensorPowerCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAISensorPowerCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAISensorPowerCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAISensorPowerCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAISensorPowerCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAISensorPowerCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAISensorPowerType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAISensorPowerType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAISensorPowerType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAISensorPowerType, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAISensorPowerType(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAISensorPowerType, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIOpenThrmcplDetectEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAIOpenThrmcplDetectEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIOpenThrmcplDetectEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAIOpenThrmcplDetectEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIOpenThrmcplDetectEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIOpenThrmcplDetectEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIThrmcplLeadOffsetVoltage(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIThrmcplLeadOffsetVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIThrmcplLeadOffsetVoltage(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIThrmcplLeadOffsetVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIThrmcplLeadOffsetVoltage(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIThrmcplLeadOffsetVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIAtten(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIAtten, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIAtten(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIAtten, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIAtten(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIAtten, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIProbeAtten(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIProbeAtten, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIProbeAtten(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIProbeAtten, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIProbeAtten(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIProbeAtten, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAILowpassEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAILowpassEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAILowpassEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAILowpassEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAILowpassEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAILowpassEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAILowpassCutoffFreq(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAILowpassCutoffFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAILowpassCutoffFreq(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAILowpassCutoffFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAILowpassCutoffFreq(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAILowpassCutoffFreq, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAILowpassSwitchCapClkSrc(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAILowpassSwitchCapClkSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAILowpassSwitchCapClkSrc(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAILowpassSwitchCapClkSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAILowpassSwitchCapClkSrc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAILowpassSwitchCapClkSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAILowpassSwitchCapExtClkFreq(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAILowpassSwitchCapExtClkFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAILowpassSwitchCapExtClkFreq(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAILowpassSwitchCapExtClkFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAILowpassSwitchCapExtClkFreq(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAILowpassSwitchCapExtClkFreq, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAILowpassSwitchCapExtClkDiv(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAILowpassSwitchCapExtClkDiv, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAILowpassSwitchCapExtClkDiv(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAILowpassSwitchCapExtClkDiv, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAILowpassSwitchCapExtClkDiv(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAILowpassSwitchCapExtClkDiv, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAILowpassSwitchCapOutClkDiv(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAILowpassSwitchCapOutClkDiv, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAILowpassSwitchCapOutClkDiv(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAILowpassSwitchCapOutClkDiv, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAILowpassSwitchCapOutClkDiv(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAILowpassSwitchCapOutClkDiv, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAIDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAIDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDigFltrType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIDigFltrType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIDigFltrType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIDigFltrType, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIDigFltrType(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDigFltrType, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDigFltrResponse(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIDigFltrResponse, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIDigFltrResponse(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIDigFltrResponse, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIDigFltrResponse(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDigFltrResponse, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDigFltrOrder(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAIDigFltrOrder, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIDigFltrOrder(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAIDigFltrOrder, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIDigFltrOrder(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDigFltrOrder, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDigFltrLowpassCutoffFreq(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIDigFltrLowpassCutoffFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIDigFltrLowpassCutoffFreq(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIDigFltrLowpassCutoffFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIDigFltrLowpassCutoffFreq(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDigFltrLowpassCutoffFreq, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDigFltrHighpassCutoffFreq(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIDigFltrHighpassCutoffFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIDigFltrHighpassCutoffFreq(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIDigFltrHighpassCutoffFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIDigFltrHighpassCutoffFreq(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDigFltrHighpassCutoffFreq, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDigFltrBandpassCenterFreq(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIDigFltrBandpassCenterFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIDigFltrBandpassCenterFreq(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIDigFltrBandpassCenterFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIDigFltrBandpassCenterFreq(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDigFltrBandpassCenterFreq, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDigFltrBandpassWidth(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIDigFltrBandpassWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIDigFltrBandpassWidth(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIDigFltrBandpassWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIDigFltrBandpassWidth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDigFltrBandpassWidth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDigFltrNotchCenterFreq(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIDigFltrNotchCenterFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIDigFltrNotchCenterFreq(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIDigFltrNotchCenterFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIDigFltrNotchCenterFreq(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDigFltrNotchCenterFreq, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDigFltrNotchWidth(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIDigFltrNotchWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIDigFltrNotchWidth(taskHandle::TaskHandle, channel::String, data::Float64)
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

function GetAIFilterEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAIFilterEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIFilterEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAIFilterEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIFilterEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIFilterEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIFilterFreq(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIFilterFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIFilterFreq(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIFilterFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIFilterFreq(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIFilterFreq, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIFilterResponse(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIFilterResponse, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIFilterResponse(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIFilterResponse, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIFilterResponse(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIFilterResponse, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIFilterOrder(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAIFilterOrder, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIFilterOrder(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAIFilterOrder, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIFilterOrder(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIFilterOrder, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIFilterDelay(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIFilterDelay, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function GetAIFilterDelayUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIFilterDelayUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIFilterDelayUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIFilterDelayUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIFilterDelayUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIFilterDelayUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIRemoveFilterDelay(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAIRemoveFilterDelay, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIRemoveFilterDelay(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAIRemoveFilterDelay, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIRemoveFilterDelay(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRemoveFilterDelay, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIFilterDelayAdjustment(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIFilterDelayAdjustment, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIFilterDelayAdjustment(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIFilterDelayAdjustment, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIFilterDelayAdjustment(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIFilterDelayAdjustment, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIAveragingWinSize(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAIAveragingWinSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIAveragingWinSize(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAIAveragingWinSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIAveragingWinSize(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIAveragingWinSize, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIResolutionUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIResolutionUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function GetAIResolution(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIResolution, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function GetAIRawSampSize(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAIRawSampSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function GetAIRawSampJustification(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIRawSampJustification, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function GetAIADCTimingMode(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIADCTimingMode, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIADCTimingMode(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIADCTimingMode, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIADCTimingMode(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIADCTimingMode, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIADCCustomTimingMode(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAIADCCustomTimingMode, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIADCCustomTimingMode(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAIADCCustomTimingMode, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIADCCustomTimingMode(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIADCCustomTimingMode, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDitherEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAIDitherEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIDitherEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAIDitherEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIDitherEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDitherEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIChanCalHasValidCalInfo(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAIChanCalHasValidCalInfo, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function GetAIChanCalEnableCal(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAIChanCalEnableCal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIChanCalEnableCal(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAIChanCalEnableCal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIChanCalEnableCal(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIChanCalEnableCal, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIChanCalApplyCalIfExp(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAIChanCalApplyCalIfExp, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIChanCalApplyCalIfExp(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAIChanCalApplyCalIfExp, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIChanCalApplyCalIfExp(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIChanCalApplyCalIfExp, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIChanCalScaleType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIChanCalScaleType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIChanCalScaleType(taskHandle::TaskHandle, channel::String, data::Int32)
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

function GetAIRngHigh(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIRngHigh, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIRngHigh(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIRngHigh, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIRngHigh(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRngHigh, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIRngLow(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIRngLow, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIRngLow(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIRngLow, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIRngLow(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRngLow, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDCOffset(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIDCOffset, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIDCOffset(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIDCOffset, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIDCOffset(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDCOffset, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIGain(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIGain, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIGain(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIGain, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIGain(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIGain, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAISampAndHoldEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAISampAndHoldEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAISampAndHoldEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAISampAndHoldEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAISampAndHoldEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAISampAndHoldEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIAutoZeroMode(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIAutoZeroMode, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIAutoZeroMode(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIAutoZeroMode, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIAutoZeroMode(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIAutoZeroMode, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIChopEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAIChopEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIChopEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAIChopEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIChopEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIChopEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDataXferMaxRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAIDataXferMaxRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIDataXferMaxRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAIDataXferMaxRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAIDataXferMaxRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDataXferMaxRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDataXferMech(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIDataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIDataXferMech(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIDataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIDataXferMech(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDataXferReqCond(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIDataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIDataXferReqCond(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIDataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIDataXferReqCond(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDataXferCustomThreshold(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAIDataXferCustomThreshold, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIDataXferCustomThreshold(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAIDataXferCustomThreshold, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIDataXferCustomThreshold(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIDataXferCustomThreshold, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIUsbXferReqSize(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAIUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIUsbXferReqSize(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAIUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIUsbXferReqSize(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIUsbXferReqCount(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAIUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIUsbXferReqCount(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAIUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIUsbXferReqCount(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIMemMapEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAIMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIMemMapEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAIMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIMemMapEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIRawDataCompressionType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAIRawDataCompressionType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAIRawDataCompressionType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAIRawDataCompressionType, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAIRawDataCompressionType(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIRawDataCompressionType, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAILossyLSBRemovalCompressedSampSize(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAILossyLSBRemovalCompressedSampSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAILossyLSBRemovalCompressedSampSize(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAILossyLSBRemovalCompressedSampSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAILossyLSBRemovalCompressedSampSize(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAILossyLSBRemovalCompressedSampSize, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIDevScalingCoeff(taskHandle::TaskHandle, channel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetAIDevScalingCoeff, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function GetAIEnhancedAliasRejectionEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAIEnhancedAliasRejectionEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIEnhancedAliasRejectionEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAIEnhancedAliasRejectionEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIEnhancedAliasRejectionEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIEnhancedAliasRejectionEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAIOpenChanDetectEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAIOpenChanDetectEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIOpenChanDetectEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAIOpenChanDetectEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAIOpenChanDetectEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAIOpenChanDetectEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOMax(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAOMax, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOMax(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAOMax, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAOMax(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOMax, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOMin(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAOMin, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOMin(taskHandle::TaskHandle, channel::String, data::Float64)
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

function GetAOOutputType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAOOutputType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function GetAOVoltageUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAOVoltageUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAOVoltageUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAOVoltageUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAOVoltageUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOVoltageUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOVoltageCurrentLimit(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAOVoltageCurrentLimit, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOVoltageCurrentLimit(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAOVoltageCurrentLimit, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAOVoltageCurrentLimit(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOVoltageCurrentLimit, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOCurrentUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAOCurrentUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAOCurrentUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAOCurrentUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAOCurrentUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOCurrentUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOFuncGenType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAOFuncGenType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAOFuncGenType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAOFuncGenType, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAOFuncGenType(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOFuncGenType, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOFuncGenFreq(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAOFuncGenFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOFuncGenFreq(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAOFuncGenFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAOFuncGenFreq(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOFuncGenFreq, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOFuncGenAmplitude(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAOFuncGenAmplitude, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOFuncGenAmplitude(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAOFuncGenAmplitude, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAOFuncGenAmplitude(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOFuncGenAmplitude, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOFuncGenOffset(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAOFuncGenOffset, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOFuncGenOffset(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAOFuncGenOffset, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAOFuncGenOffset(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOFuncGenOffset, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOFuncGenSquareDutyCycle(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAOFuncGenSquareDutyCycle, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOFuncGenSquareDutyCycle(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAOFuncGenSquareDutyCycle, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAOFuncGenSquareDutyCycle(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOFuncGenSquareDutyCycle, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOFuncGenModulationType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAOFuncGenModulationType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAOFuncGenModulationType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAOFuncGenModulationType, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAOFuncGenModulationType(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOFuncGenModulationType, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOFuncGenFMDeviation(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAOFuncGenFMDeviation, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOFuncGenFMDeviation(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAOFuncGenFMDeviation, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAOFuncGenFMDeviation(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOFuncGenFMDeviation, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOOutputImpedance(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAOOutputImpedance, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOOutputImpedance(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAOOutputImpedance, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAOOutputImpedance(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOOutputImpedance, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOLoadImpedance(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAOLoadImpedance, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOLoadImpedance(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAOLoadImpedance, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAOLoadImpedance(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOLoadImpedance, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOIdleOutputBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAOIdleOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAOIdleOutputBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAOIdleOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAOIdleOutputBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOIdleOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAOTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAOTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAOTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAOTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOResolutionUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAOResolutionUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAOResolutionUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAOResolutionUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAOResolutionUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOResolutionUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOResolution(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAOResolution, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function GetAODACRngHigh(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAODACRngHigh, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAODACRngHigh(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAODACRngHigh, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAODACRngHigh(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAODACRngHigh, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAODACRngLow(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAODACRngLow, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAODACRngLow(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAODACRngLow, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAODACRngLow(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAODACRngLow, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAODACRefConnToGnd(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAODACRefConnToGnd, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAODACRefConnToGnd(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAODACRefConnToGnd, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAODACRefConnToGnd(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAODACRefConnToGnd, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAODACRefAllowConnToGnd(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAODACRefAllowConnToGnd, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAODACRefAllowConnToGnd(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAODACRefAllowConnToGnd, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAODACRefAllowConnToGnd(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAODACRefAllowConnToGnd, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAODACRefSrc(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAODACRefSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAODACRefSrc(taskHandle::TaskHandle, channel::String, data::Int32)
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

function GetAODACRefVal(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAODACRefVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAODACRefVal(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAODACRefVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAODACRefVal(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAODACRefVal, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAODACOffsetSrc(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAODACOffsetSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAODACOffsetSrc(taskHandle::TaskHandle, channel::String, data::Int32)
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

function GetAODACOffsetVal(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAODACOffsetVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAODACOffsetVal(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAODACOffsetVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAODACOffsetVal(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAODACOffsetVal, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOReglitchEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAOReglitchEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAOReglitchEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAOReglitchEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAOReglitchEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOReglitchEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOFilterDelay(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAOFilterDelay, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOFilterDelay(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAOFilterDelay, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAOFilterDelay(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOFilterDelay, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOFilterDelayUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAOFilterDelayUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAOFilterDelayUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAOFilterDelayUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAOFilterDelayUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOFilterDelayUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOFilterDelayAdjustment(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAOFilterDelayAdjustment, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOFilterDelayAdjustment(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAOFilterDelayAdjustment, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAOFilterDelayAdjustment(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOFilterDelayAdjustment, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOGain(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetAOGain, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOGain(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetAOGain, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetAOGain(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOGain, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOUseOnlyOnBrdMem(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAOUseOnlyOnBrdMem, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAOUseOnlyOnBrdMem(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAOUseOnlyOnBrdMem, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAOUseOnlyOnBrdMem(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOUseOnlyOnBrdMem, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAODataXferMech(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAODataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAODataXferMech(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAODataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAODataXferMech(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAODataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAODataXferReqCond(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetAODataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetAODataXferReqCond(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetAODataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetAODataXferReqCond(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAODataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOUsbXferReqSize(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAOUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAOUsbXferReqSize(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAOUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAOUsbXferReqSize(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOUsbXferReqCount(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAOUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAOUsbXferReqCount(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAOUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAOUsbXferReqCount(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAOMemMapEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAOMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAOMemMapEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAOMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAOMemMapEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetAODevScalingCoeff(taskHandle::TaskHandle, channel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetAODevScalingCoeff, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function GetAOEnhancedImageRejectionEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetAOEnhancedImageRejectionEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetAOEnhancedImageRejectionEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetAOEnhancedImageRejectionEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetAOEnhancedImageRejectionEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetAOEnhancedImageRejectionEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDIInvertLines(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetDIInvertLines, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDIInvertLines(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetDIInvertLines, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDIInvertLines(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDIInvertLines, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDINumLines(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetDINumLines, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function GetDIDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetDIDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDIDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetDIDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDIDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDIDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDIDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetDIDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetDIDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetDIDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetDIDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDIDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDIDigFltrEnableBusMode(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetDIDigFltrEnableBusMode, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDIDigFltrEnableBusMode(taskHandle::TaskHandle, channel::String, data::UInt32)
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

function GetDIDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetDIDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetDIDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetDIDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetDIDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDIDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDIDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetDIDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDIDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetDIDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDIDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDIDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDITristate(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetDITristate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDITristate(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetDITristate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDITristate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDITristate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDILogicFamily(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetDILogicFamily, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetDILogicFamily(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetDILogicFamily, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetDILogicFamily(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDILogicFamily, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDIDataXferMech(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetDIDataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetDIDataXferMech(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetDIDataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetDIDataXferMech(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDIDataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDIDataXferReqCond(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetDIDataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetDIDataXferReqCond(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetDIDataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetDIDataXferReqCond(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDIDataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDIUsbXferReqSize(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetDIUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDIUsbXferReqSize(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetDIUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDIUsbXferReqSize(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDIUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDIUsbXferReqCount(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetDIUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDIUsbXferReqCount(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetDIUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDIUsbXferReqCount(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDIUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDIMemMapEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetDIMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDIMemMapEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetDIMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDIMemMapEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDIMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDIAcquireOn(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetDIAcquireOn, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetDIAcquireOn(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetDIAcquireOn, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetDIAcquireOn(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDIAcquireOn, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOOutputDriveType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetDOOutputDriveType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetDOOutputDriveType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetDOOutputDriveType, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetDOOutputDriveType(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOOutputDriveType, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOInvertLines(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetDOInvertLines, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDOInvertLines(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetDOInvertLines, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDOInvertLines(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOInvertLines, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDONumLines(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetDONumLines, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function GetDOTristate(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetDOTristate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDOTristate(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetDOTristate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDOTristate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOTristate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOLineStatesStartState(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetDOLineStatesStartState, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetDOLineStatesStartState(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetDOLineStatesStartState, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetDOLineStatesStartState(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOLineStatesStartState, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOLineStatesPausedState(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetDOLineStatesPausedState, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetDOLineStatesPausedState(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetDOLineStatesPausedState, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetDOLineStatesPausedState(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOLineStatesPausedState, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOLineStatesDoneState(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetDOLineStatesDoneState, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetDOLineStatesDoneState(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetDOLineStatesDoneState, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetDOLineStatesDoneState(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOLineStatesDoneState, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOLogicFamily(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetDOLogicFamily, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetDOLogicFamily(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetDOLogicFamily, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetDOLogicFamily(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOLogicFamily, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOOvercurrentLimit(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetDOOvercurrentLimit, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetDOOvercurrentLimit(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetDOOvercurrentLimit, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetDOOvercurrentLimit(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOOvercurrentLimit, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOOvercurrentAutoReenable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetDOOvercurrentAutoReenable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDOOvercurrentAutoReenable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetDOOvercurrentAutoReenable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDOOvercurrentAutoReenable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOOvercurrentAutoReenable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOOvercurrentReenablePeriod(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetDOOvercurrentReenablePeriod, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetDOOvercurrentReenablePeriod(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetDOOvercurrentReenablePeriod, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetDOOvercurrentReenablePeriod(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOOvercurrentReenablePeriod, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOUseOnlyOnBrdMem(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetDOUseOnlyOnBrdMem, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDOUseOnlyOnBrdMem(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetDOUseOnlyOnBrdMem, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDOUseOnlyOnBrdMem(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOUseOnlyOnBrdMem, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDODataXferMech(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetDODataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetDODataXferMech(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetDODataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetDODataXferMech(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDODataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDODataXferReqCond(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetDODataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetDODataXferReqCond(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetDODataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetDODataXferReqCond(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDODataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOUsbXferReqSize(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetDOUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDOUsbXferReqSize(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetDOUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDOUsbXferReqSize(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOUsbXferReqCount(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetDOUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDOUsbXferReqCount(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetDOUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDOUsbXferReqCount(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOMemMapEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetDOMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetDOMemMapEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetDOMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetDOMemMapEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDOGenerateOn(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetDOGenerateOn, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetDOGenerateOn(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetDOGenerateOn, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetDOGenerateOn(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetDOGenerateOn, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIMax(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIMax, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIMax(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCIMax, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIMax(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIMax, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIMin(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIMin, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIMin(taskHandle::TaskHandle, channel::String, data::Float64)
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

function GetCIMeasType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIMeasType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function GetCIFreqUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIFreqUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIFreqUnits(taskHandle::TaskHandle, channel::String, data::Int32)
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

function GetCIFreqTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIFreqTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIFreqTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIFreqTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIFreqTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIFreqTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIFreqLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIFreqLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIFreqLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIFreqLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIFreqLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIFreqLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIFreqDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIFreqDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIFreqDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIFreqDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIFreqDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIFreqDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIFreqDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIFreqDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIFreqDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
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

function GetCIFreqDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIFreqDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIFreqDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCIFreqDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIFreqDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIFreqDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIFreqDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIFreqDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIFreqDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIFreqDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIFreqDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIFreqDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIFreqStartingEdge(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIFreqStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIFreqStartingEdge(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIFreqStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIFreqStartingEdge(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIFreqStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIFreqMeasMeth(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIFreqMeasMeth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIFreqMeasMeth(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIFreqMeasMeth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIFreqMeasMeth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIFreqMeasMeth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIFreqEnableAveraging(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIFreqEnableAveraging, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIFreqEnableAveraging(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIFreqEnableAveraging, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIFreqEnableAveraging(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIFreqEnableAveraging, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIFreqMeasTime(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIFreqMeasTime, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIFreqMeasTime(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCIFreqMeasTime, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIFreqMeasTime(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIFreqMeasTime, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIFreqDiv(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIFreqDiv, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIFreqDiv(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIFreqDiv, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIFreqDiv(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIFreqDiv, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPeriodUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIPeriodUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPeriodUnits(taskHandle::TaskHandle, channel::String, data::Int32)
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

function GetCIPeriodTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIPeriodTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPeriodTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIPeriodTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPeriodTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPeriodTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPeriodLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIPeriodLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPeriodLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIPeriodLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPeriodLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPeriodLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPeriodDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIPeriodDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPeriodDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIPeriodDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIPeriodDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPeriodDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPeriodDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIPeriodDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPeriodDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
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

function GetCIPeriodDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIPeriodDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPeriodDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCIPeriodDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIPeriodDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPeriodDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPeriodDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIPeriodDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPeriodDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIPeriodDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIPeriodDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPeriodDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPeriodStartingEdge(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIPeriodStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPeriodStartingEdge(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIPeriodStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPeriodStartingEdge(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPeriodStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPeriodMeasMeth(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIPeriodMeasMeth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPeriodMeasMeth(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIPeriodMeasMeth, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPeriodMeasMeth(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPeriodMeasMeth, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPeriodEnableAveraging(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIPeriodEnableAveraging, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPeriodEnableAveraging(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIPeriodEnableAveraging, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIPeriodEnableAveraging(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPeriodEnableAveraging, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPeriodMeasTime(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIPeriodMeasTime, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPeriodMeasTime(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCIPeriodMeasTime, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIPeriodMeasTime(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPeriodMeasTime, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPeriodDiv(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIPeriodDiv, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPeriodDiv(taskHandle::TaskHandle, channel::String, data::UInt32)
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

function GetCICountEdgesTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCICountEdgesTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCICountEdgesTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCICountEdgesLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCICountEdgesLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCICountEdgesDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCICountEdgesDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCICountEdgesDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICountEdgesDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
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

function GetCICountEdgesDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCICountEdgesDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICountEdgesDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCICountEdgesDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCICountEdgesDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCICountEdgesDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCICountEdgesDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesDir(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCICountEdgesDir, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesDir(taskHandle::TaskHandle, channel::String, data::Int32)
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

function GetCICountEdgesCountDirTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCICountEdgesCountDirTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesCountDirTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCICountEdgesCountDirTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesCountDirTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountDirTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountDirLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCICountEdgesCountDirLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesCountDirLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCICountEdgesCountDirLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesCountDirLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountDirLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountDirDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCICountEdgesCountDirDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesCountDirDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCICountEdgesCountDirDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesCountDirDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountDirDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountDirDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCICountEdgesCountDirDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICountEdgesCountDirDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
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

function GetCICountEdgesCountDirDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCICountEdgesCountDirDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICountEdgesCountDirDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCICountEdgesCountDirDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCICountEdgesCountDirDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountDirDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountDirDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCICountEdgesCountDirDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesCountDirDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCICountEdgesCountDirDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesCountDirDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountDirDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesInitialCnt(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCICountEdgesInitialCnt, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesInitialCnt(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCICountEdgesInitialCnt, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesInitialCnt(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesInitialCnt, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesActiveEdge(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCICountEdgesActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesActiveEdge(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCICountEdgesActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesActiveEdge(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountResetEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCICountEdgesCountResetEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesCountResetEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCICountEdgesCountResetEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountResetEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountResetResetCount(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCICountEdgesCountResetResetCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesCountResetResetCount(taskHandle::TaskHandle, channel::String, data::UInt32)
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

function GetCICountEdgesCountResetTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCICountEdgesCountResetTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesCountResetTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCICountEdgesCountResetTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountResetTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountResetLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCICountEdgesCountResetLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesCountResetLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCICountEdgesCountResetLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountResetLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountResetDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCICountEdgesCountResetDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesCountResetDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCICountEdgesCountResetDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountResetDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountResetDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCICountEdgesCountResetDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICountEdgesCountResetDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
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

function GetCICountEdgesCountResetDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCICountEdgesCountResetDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICountEdgesCountResetDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCICountEdgesCountResetDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountResetDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountResetDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCICountEdgesCountResetDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesCountResetDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCICountEdgesCountResetDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountResetDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesCountResetActiveEdge(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCICountEdgesCountResetActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesCountResetActiveEdge(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCICountEdgesCountResetActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetActiveEdge(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesCountResetActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesGateEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCICountEdgesGateEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesGateEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
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

function GetCICountEdgesGateTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCICountEdgesGateTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesGateTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCICountEdgesGateTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesGateTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesGateTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesGateLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCICountEdgesGateLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesGateLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCICountEdgesGateLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesGateLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesGateLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesGateDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCICountEdgesGateDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesGateDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCICountEdgesGateDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesGateDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesGateDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesGateDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCICountEdgesGateDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICountEdgesGateDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
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

function GetCICountEdgesGateDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCICountEdgesGateDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICountEdgesGateDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCICountEdgesGateDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCICountEdgesGateDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICountEdgesGateDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICountEdgesGateWhen(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCICountEdgesGateWhen, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesGateWhen(taskHandle::TaskHandle, channel::String, data::Int32)
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

function GetCIDutyCycleTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIDutyCycleTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIDutyCycleTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIDutyCycleTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIDutyCycleTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIDutyCycleTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIDutyCycleLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIDutyCycleLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIDutyCycleLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIDutyCycleLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIDutyCycleLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIDutyCycleLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIDutyCycleDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIDutyCycleDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIDutyCycleDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIDutyCycleDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIDutyCycleDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIDutyCycleDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIDutyCycleDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIDutyCycleDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIDutyCycleDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
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

function GetCIDutyCycleDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIDutyCycleDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIDutyCycleDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCIDutyCycleDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIDutyCycleDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIDutyCycleDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIDutyCycleStartingEdge(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIDutyCycleStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIDutyCycleStartingEdge(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIDutyCycleStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIDutyCycleStartingEdge(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIDutyCycleStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIAngEncoderUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIAngEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIAngEncoderUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIAngEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIAngEncoderUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIAngEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIAngEncoderPulsesPerRev(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIAngEncoderPulsesPerRev, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIAngEncoderPulsesPerRev(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIAngEncoderPulsesPerRev, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIAngEncoderPulsesPerRev(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIAngEncoderPulsesPerRev, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIAngEncoderInitialAngle(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIAngEncoderInitialAngle, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIAngEncoderInitialAngle(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCIAngEncoderInitialAngle, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIAngEncoderInitialAngle(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIAngEncoderInitialAngle, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCILinEncoderUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCILinEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCILinEncoderUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCILinEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCILinEncoderUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCILinEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCILinEncoderDistPerPulse(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCILinEncoderDistPerPulse, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCILinEncoderDistPerPulse(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCILinEncoderDistPerPulse, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCILinEncoderDistPerPulse(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCILinEncoderDistPerPulse, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCILinEncoderInitialPos(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCILinEncoderInitialPos, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCILinEncoderInitialPos(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCILinEncoderInitialPos, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCILinEncoderInitialPos(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCILinEncoderInitialPos, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderDecodingType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIEncoderDecodingType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIEncoderDecodingType(taskHandle::TaskHandle, channel::String, data::Int32)
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

function GetCIEncoderAInputTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIEncoderAInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIEncoderAInputTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIEncoderAInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIEncoderAInputTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderAInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderAInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIEncoderAInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIEncoderAInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIEncoderAInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIEncoderAInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderAInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderAInputDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIEncoderAInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIEncoderAInputDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIEncoderAInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIEncoderAInputDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderAInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderAInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIEncoderAInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIEncoderAInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
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

function GetCIEncoderAInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIEncoderAInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIEncoderAInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCIEncoderAInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIEncoderAInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderAInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderAInputDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIEncoderAInputDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIEncoderAInputDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
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

function GetCIEncoderBInputTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIEncoderBInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIEncoderBInputTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIEncoderBInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIEncoderBInputTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderBInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderBInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIEncoderBInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIEncoderBInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIEncoderBInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIEncoderBInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderBInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderBInputDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIEncoderBInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIEncoderBInputDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIEncoderBInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIEncoderBInputDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderBInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderBInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIEncoderBInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIEncoderBInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
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

function GetCIEncoderBInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIEncoderBInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIEncoderBInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCIEncoderBInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIEncoderBInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderBInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderBInputDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIEncoderBInputDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIEncoderBInputDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
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

function GetCIEncoderZInputTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIEncoderZInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIEncoderZInputTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIEncoderZInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIEncoderZInputTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderZInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderZInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIEncoderZInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIEncoderZInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIEncoderZInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIEncoderZInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderZInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderZInputDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIEncoderZInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIEncoderZInputDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIEncoderZInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIEncoderZInputDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderZInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderZInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIEncoderZInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIEncoderZInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
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

function GetCIEncoderZInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIEncoderZInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIEncoderZInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCIEncoderZInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIEncoderZInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderZInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderZInputDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIEncoderZInputDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIEncoderZInputDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIEncoderZInputDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIEncoderZInputDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderZInputDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderZIndexEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIEncoderZIndexEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIEncoderZIndexEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIEncoderZIndexEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIEncoderZIndexEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderZIndexEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderZIndexVal(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIEncoderZIndexVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIEncoderZIndexVal(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCIEncoderZIndexVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIEncoderZIndexVal(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderZIndexVal, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIEncoderZIndexPhase(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIEncoderZIndexPhase, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIEncoderZIndexPhase(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIEncoderZIndexPhase, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIEncoderZIndexPhase(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIEncoderZIndexPhase, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseWidthUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIPulseWidthUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseWidthUnits(taskHandle::TaskHandle, channel::String, data::Int32)
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

function GetCIPulseWidthTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIPulseWidthTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseWidthTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIPulseWidthTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPulseWidthTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseWidthTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseWidthLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIPulseWidthLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseWidthLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIPulseWidthLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPulseWidthLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseWidthLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseWidthDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIPulseWidthDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPulseWidthDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIPulseWidthDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIPulseWidthDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseWidthDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseWidthDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIPulseWidthDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPulseWidthDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
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

function GetCIPulseWidthDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIPulseWidthDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPulseWidthDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCIPulseWidthDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIPulseWidthDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseWidthDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseWidthDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIPulseWidthDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPulseWidthDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIPulseWidthDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIPulseWidthDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseWidthDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseWidthStartingEdge(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIPulseWidthStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseWidthStartingEdge(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIPulseWidthStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPulseWidthStartingEdge(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseWidthStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITimestampUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCITimestampUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCITimestampUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCITimestampUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCITimestampUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITimestampUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITimestampInitialSeconds(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCITimestampInitialSeconds, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCITimestampInitialSeconds(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCITimestampInitialSeconds, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCITimestampInitialSeconds(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITimestampInitialSeconds, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIGPSSyncMethod(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIGPSSyncMethod, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIGPSSyncMethod(taskHandle::TaskHandle, channel::String, data::Int32)
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

function GetCIVelocityAngEncoderUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIVelocityAngEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIVelocityAngEncoderUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIVelocityAngEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIVelocityAngEncoderUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityAngEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityAngEncoderPulsesPerRev(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIVelocityAngEncoderPulsesPerRev, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIVelocityAngEncoderPulsesPerRev(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIVelocityAngEncoderPulsesPerRev, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIVelocityAngEncoderPulsesPerRev(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityAngEncoderPulsesPerRev, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityLinEncoderUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIVelocityLinEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIVelocityLinEncoderUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIVelocityLinEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIVelocityLinEncoderUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityLinEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityLinEncoderDistPerPulse(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIVelocityLinEncoderDistPerPulse, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIVelocityLinEncoderDistPerPulse(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCIVelocityLinEncoderDistPerPulse, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIVelocityLinEncoderDistPerPulse(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityLinEncoderDistPerPulse, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityEncoderDecodingType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIVelocityEncoderDecodingType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIVelocityEncoderDecodingType(taskHandle::TaskHandle, channel::String, data::Int32)
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

function GetCIVelocityEncoderAInputTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIVelocityEncoderAInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIVelocityEncoderAInputTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIVelocityEncoderAInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIVelocityEncoderAInputTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityEncoderAInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityEncoderAInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIVelocityEncoderAInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIVelocityEncoderAInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIVelocityEncoderAInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIVelocityEncoderAInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityEncoderAInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityEncoderAInputDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIVelocityEncoderAInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIVelocityEncoderAInputDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIVelocityEncoderAInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIVelocityEncoderAInputDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityEncoderAInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityEncoderAInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIVelocityEncoderAInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIVelocityEncoderAInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
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

function GetCIVelocityEncoderAInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIVelocityEncoderAInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIVelocityEncoderAInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
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

function GetCIVelocityEncoderBInputTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIVelocityEncoderBInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIVelocityEncoderBInputTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIVelocityEncoderBInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIVelocityEncoderBInputTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityEncoderBInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityEncoderBInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIVelocityEncoderBInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIVelocityEncoderBInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIVelocityEncoderBInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIVelocityEncoderBInputLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityEncoderBInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityEncoderBInputDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIVelocityEncoderBInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIVelocityEncoderBInputDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIVelocityEncoderBInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIVelocityEncoderBInputDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityEncoderBInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityEncoderBInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIVelocityEncoderBInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIVelocityEncoderBInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
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

function GetCIVelocityEncoderBInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIVelocityEncoderBInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIVelocityEncoderBInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCIVelocityEncoderBInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIVelocityEncoderBInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityEncoderBInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityMeasTime(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIVelocityMeasTime, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIVelocityMeasTime(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCIVelocityMeasTime, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIVelocityMeasTime(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityMeasTime, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIVelocityDiv(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIVelocityDiv, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIVelocityDiv(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIVelocityDiv, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIVelocityDiv(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIVelocityDiv, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCITwoEdgeSepUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepUnits(taskHandle::TaskHandle, channel::String, data::Int32)
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

function GetCITwoEdgeSepFirstTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCITwoEdgeSepFirstTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepFirstTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCITwoEdgeSepFirstTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepFirstTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepFirstTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepFirstLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCITwoEdgeSepFirstLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepFirstLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCITwoEdgeSepFirstLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepFirstLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepFirstLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepFirstDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCITwoEdgeSepFirstDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepFirstDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCITwoEdgeSepFirstDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepFirstDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepFirstDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepFirstDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCITwoEdgeSepFirstDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCITwoEdgeSepFirstDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
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

function GetCITwoEdgeSepFirstDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCITwoEdgeSepFirstDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCITwoEdgeSepFirstDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCITwoEdgeSepFirstDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCITwoEdgeSepFirstDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepFirstDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepFirstDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCITwoEdgeSepFirstDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepFirstDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCITwoEdgeSepFirstDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepFirstDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepFirstDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepFirstEdge(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCITwoEdgeSepFirstEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepFirstEdge(taskHandle::TaskHandle, channel::String, data::Int32)
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

function GetCITwoEdgeSepSecondTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCITwoEdgeSepSecondTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepSecondTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCITwoEdgeSepSecondTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepSecondTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepSecondTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepSecondLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCITwoEdgeSepSecondLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepSecondLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCITwoEdgeSepSecondLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepSecondLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepSecondLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepSecondDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCITwoEdgeSepSecondDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepSecondDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCITwoEdgeSepSecondDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepSecondDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepSecondDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepSecondDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCITwoEdgeSepSecondDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCITwoEdgeSepSecondDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
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

function GetCITwoEdgeSepSecondDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCITwoEdgeSepSecondDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCITwoEdgeSepSecondDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCITwoEdgeSepSecondDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCITwoEdgeSepSecondDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepSecondDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepSecondDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCITwoEdgeSepSecondDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepSecondDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCITwoEdgeSepSecondDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepSecondDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepSecondDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCITwoEdgeSepSecondEdge(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCITwoEdgeSepSecondEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepSecondEdge(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCITwoEdgeSepSecondEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepSecondEdge(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCITwoEdgeSepSecondEdge, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCISemiPeriodUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCISemiPeriodUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCISemiPeriodUnits(taskHandle::TaskHandle, channel::String, data::Int32)
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

function GetCISemiPeriodTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCISemiPeriodTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCISemiPeriodTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCISemiPeriodTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCISemiPeriodTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCISemiPeriodTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCISemiPeriodLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCISemiPeriodLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCISemiPeriodLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCISemiPeriodLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCISemiPeriodLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCISemiPeriodLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCISemiPeriodDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCISemiPeriodDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCISemiPeriodDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCISemiPeriodDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCISemiPeriodDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCISemiPeriodDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCISemiPeriodDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCISemiPeriodDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCISemiPeriodDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
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

function GetCISemiPeriodDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCISemiPeriodDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCISemiPeriodDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCISemiPeriodDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCISemiPeriodDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCISemiPeriodDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCISemiPeriodDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCISemiPeriodDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCISemiPeriodDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCISemiPeriodDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCISemiPeriodDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCISemiPeriodDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCISemiPeriodStartingEdge(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCISemiPeriodStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCISemiPeriodStartingEdge(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCISemiPeriodStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCISemiPeriodStartingEdge(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCISemiPeriodStartingEdge, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseFreqUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIPulseFreqUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseFreqUnits(taskHandle::TaskHandle, channel::String, data::Int32)
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

function GetCIPulseFreqTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIPulseFreqTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseFreqTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIPulseFreqTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPulseFreqTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseFreqTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseFreqLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIPulseFreqLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseFreqLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIPulseFreqLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPulseFreqLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseFreqLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseFreqDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIPulseFreqDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPulseFreqDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIPulseFreqDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIPulseFreqDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseFreqDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseFreqDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIPulseFreqDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPulseFreqDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
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

function GetCIPulseFreqDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIPulseFreqDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPulseFreqDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCIPulseFreqDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIPulseFreqDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseFreqDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseFreqDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIPulseFreqDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPulseFreqDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIPulseFreqDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIPulseFreqDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseFreqDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseFreqStartEdge(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIPulseFreqStartEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseFreqStartEdge(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIPulseFreqStartEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPulseFreqStartEdge(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseFreqStartEdge, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTimeUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIPulseTimeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseTimeUnits(taskHandle::TaskHandle, channel::String, data::Int32)
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

function GetCIPulseTimeTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIPulseTimeTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseTimeTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIPulseTimeTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPulseTimeTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTimeTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTimeLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIPulseTimeLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseTimeLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIPulseTimeLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPulseTimeLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTimeLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTimeDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIPulseTimeDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPulseTimeDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIPulseTimeDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIPulseTimeDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTimeDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTimeDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIPulseTimeDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPulseTimeDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
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

function GetCIPulseTimeDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIPulseTimeDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPulseTimeDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCIPulseTimeDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIPulseTimeDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTimeDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTimeDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIPulseTimeDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPulseTimeDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIPulseTimeDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIPulseTimeDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTimeDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTimeStartEdge(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIPulseTimeStartEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseTimeStartEdge(taskHandle::TaskHandle, channel::String, data::Int32)
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

function GetCIPulseTicksTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIPulseTicksTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseTicksTermCfg(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIPulseTicksTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPulseTicksTermCfg(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTicksTermCfg, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTicksLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIPulseTicksLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseTicksLogicLvlBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIPulseTicksLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIPulseTicksLogicLvlBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTicksLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTicksDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIPulseTicksDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPulseTicksDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIPulseTicksDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIPulseTicksDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTicksDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTicksDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIPulseTicksDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPulseTicksDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
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

function GetCIPulseTicksDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIPulseTicksDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPulseTicksDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCIPulseTicksDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIPulseTicksDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTicksDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTicksDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIPulseTicksDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPulseTicksDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIPulseTicksDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIPulseTicksDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPulseTicksDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPulseTicksStartEdge(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIPulseTicksStartEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseTicksStartEdge(taskHandle::TaskHandle, channel::String, data::Int32)
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

function GetCICtrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCICtrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICtrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCICtrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCICtrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICtrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICtrTimebaseActiveEdge(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCICtrTimebaseActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCICtrTimebaseActiveEdge(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCICtrTimebaseActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCICtrTimebaseActiveEdge(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICtrTimebaseActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICtrTimebaseDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCICtrTimebaseDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICtrTimebaseDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCICtrTimebaseDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCICtrTimebaseDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICtrTimebaseDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICtrTimebaseDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCICtrTimebaseDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICtrTimebaseDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
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

function GetCICtrTimebaseDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCICtrTimebaseDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICtrTimebaseDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCICtrTimebaseDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCICtrTimebaseDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICtrTimebaseDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICtrTimebaseDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCICtrTimebaseDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICtrTimebaseDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCICtrTimebaseDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCICtrTimebaseDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICtrTimebaseDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIThreshVoltage(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIThreshVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIThreshVoltage(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCIThreshVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIThreshVoltage(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIThreshVoltage, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCICount(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCICount, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function GetCIOutputState(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIOutputState, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function GetCITCReached(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCITCReached, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function GetCICtrTimebaseMasterTimebaseDiv(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCICtrTimebaseMasterTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICtrTimebaseMasterTimebaseDiv(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCICtrTimebaseMasterTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCICtrTimebaseMasterTimebaseDiv(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCICtrTimebaseMasterTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCISampClkOverrunBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCISampClkOverrunBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCISampClkOverrunBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCISampClkOverrunBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCISampClkOverrunBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCISampClkOverrunBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCISampClkOverrunSentinelVal(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCISampClkOverrunSentinelVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCISampClkOverrunSentinelVal(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCISampClkOverrunSentinelVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCISampClkOverrunSentinelVal(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCISampClkOverrunSentinelVal, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIDataXferMech(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIDataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIDataXferMech(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIDataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIDataXferMech(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIDataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIDataXferReqCond(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCIDataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCIDataXferReqCond(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCIDataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCIDataXferReqCond(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIDataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIUsbXferReqSize(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIUsbXferReqSize(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIUsbXferReqSize(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIUsbXferReqCount(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIUsbXferReqCount(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIUsbXferReqCount(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIMemMapEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIMemMapEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIMemMapEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCINumPossiblyInvalidSamps(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCINumPossiblyInvalidSamps, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function GetCIDupCountPrevent(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIDupCountPrevent, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIDupCountPrevent(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIDupCountPrevent, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIDupCountPrevent(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIDupCountPrevent, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIPrescaler(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCIPrescaler, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPrescaler(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCIPrescaler, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCIPrescaler(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIPrescaler, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCIMaxMeasPeriod(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCIMaxMeasPeriod, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIMaxMeasPeriod(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCIMaxMeasPeriod, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCIMaxMeasPeriod(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCIMaxMeasPeriod, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOOutputType(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCOOutputType, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function GetCOPulseIdleState(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCOPulseIdleState, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCOPulseIdleState(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCOPulseIdleState, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCOPulseIdleState(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOPulseIdleState, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPulseTerm(taskHandle::TaskHandle, channel::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetCOPulseTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{UInt8}, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCOPulseTerm(taskHandle::TaskHandle, channel::String, data)
    ccall((:DAQmxSetCOPulseTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cstring), taskHandle, channel, data)
end

function ResetCOPulseTerm(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOPulseTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPulseTimeUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCOPulseTimeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCOPulseTimeUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCOPulseTimeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCOPulseTimeUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOPulseTimeUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPulseHighTime(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCOPulseHighTime, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCOPulseHighTime(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCOPulseHighTime, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCOPulseHighTime(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOPulseHighTime, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPulseLowTime(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCOPulseLowTime, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCOPulseLowTime(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCOPulseLowTime, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCOPulseLowTime(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOPulseLowTime, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPulseTimeInitialDelay(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCOPulseTimeInitialDelay, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCOPulseTimeInitialDelay(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCOPulseTimeInitialDelay, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCOPulseTimeInitialDelay(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOPulseTimeInitialDelay, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPulseDutyCyc(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCOPulseDutyCyc, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCOPulseDutyCyc(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCOPulseDutyCyc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCOPulseDutyCyc(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOPulseDutyCyc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPulseFreqUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCOPulseFreqUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCOPulseFreqUnits(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCOPulseFreqUnits, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCOPulseFreqUnits(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOPulseFreqUnits, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPulseFreq(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCOPulseFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCOPulseFreq(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCOPulseFreq, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCOPulseFreq(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOPulseFreq, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPulseFreqInitialDelay(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCOPulseFreqInitialDelay, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCOPulseFreqInitialDelay(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCOPulseFreqInitialDelay, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCOPulseFreqInitialDelay(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOPulseFreqInitialDelay, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPulseHighTicks(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCOPulseHighTicks, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOPulseHighTicks(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCOPulseHighTicks, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCOPulseHighTicks(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOPulseHighTicks, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPulseLowTicks(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCOPulseLowTicks, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOPulseLowTicks(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCOPulseLowTicks, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCOPulseLowTicks(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOPulseLowTicks, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPulseTicksInitialDelay(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCOPulseTicksInitialDelay, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOPulseTicksInitialDelay(taskHandle::TaskHandle, channel::String, data::UInt32)
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

function GetCOCtrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCOCtrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCOCtrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCOCtrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCOCtrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOCtrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOCtrTimebaseActiveEdge(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCOCtrTimebaseActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCOCtrTimebaseActiveEdge(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCOCtrTimebaseActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCOCtrTimebaseActiveEdge(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOCtrTimebaseActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOCtrTimebaseDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCOCtrTimebaseDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOCtrTimebaseDigFltrEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCOCtrTimebaseDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCOCtrTimebaseDigFltrEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOCtrTimebaseDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOCtrTimebaseDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCOCtrTimebaseDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCOCtrTimebaseDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::String, data::Float64)
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

function GetCOCtrTimebaseDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxGetCOCtrTimebaseDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCOCtrTimebaseDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String, data::Float64)
    ccall((:DAQmxSetCOCtrTimebaseDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring, Cdouble), taskHandle, channel, data)
end

function ResetCOCtrTimebaseDigFltrTimebaseRate(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOCtrTimebaseDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOCtrTimebaseDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCOCtrTimebaseDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOCtrTimebaseDigSyncEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCOCtrTimebaseDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCOCtrTimebaseDigSyncEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOCtrTimebaseDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOCount(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCOCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function GetCOOutputState(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCOOutputState, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function GetCOAutoIncrCnt(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCOAutoIncrCnt, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOAutoIncrCnt(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCOAutoIncrCnt, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCOAutoIncrCnt(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOAutoIncrCnt, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOCtrTimebaseMasterTimebaseDiv(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCOCtrTimebaseMasterTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOCtrTimebaseMasterTimebaseDiv(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCOCtrTimebaseMasterTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCOCtrTimebaseMasterTimebaseDiv(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOCtrTimebaseMasterTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPulseDone(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCOPulseDone, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function GetCOEnableInitialDelayOnRetrigger(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCOEnableInitialDelayOnRetrigger, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOEnableInitialDelayOnRetrigger(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCOEnableInitialDelayOnRetrigger, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCOEnableInitialDelayOnRetrigger(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOEnableInitialDelayOnRetrigger, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOConstrainedGenMode(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCOConstrainedGenMode, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCOConstrainedGenMode(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCOConstrainedGenMode, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCOConstrainedGenMode(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOConstrainedGenMode, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOUseOnlyOnBrdMem(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCOUseOnlyOnBrdMem, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOUseOnlyOnBrdMem(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCOUseOnlyOnBrdMem, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCOUseOnlyOnBrdMem(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOUseOnlyOnBrdMem, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCODataXferMech(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCODataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCODataXferMech(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCODataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCODataXferMech(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCODataXferMech, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCODataXferReqCond(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetCODataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetCODataXferReqCond(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetCODataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetCODataXferReqCond(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCODataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOUsbXferReqSize(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCOUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOUsbXferReqSize(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCOUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCOUsbXferReqSize(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOUsbXferReqCount(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCOUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOUsbXferReqCount(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCOUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCOUsbXferReqCount(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOMemMapEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCOMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOMemMapEnable(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCOMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCOMemMapEnable(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCOPrescaler(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCOPrescaler, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOPrescaler(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxSetCOPrescaler, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, channel, data)
end

function ResetCOPrescaler(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetCOPrescaler, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetCORdyForNewVal(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetCORdyForNewVal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function GetChanType(taskHandle::TaskHandle, channel::String, data::Int32)
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

function GetChanIsGlobal(taskHandle::TaskHandle, channel::String, data::UInt32)
    ccall((:DAQmxGetChanIsGlobal, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cuint}), taskHandle, channel, data)
end

function GetChanSyncUnlockBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxGetChanSyncUnlockBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Ref{Cint}), taskHandle, channel, data)
end

function SetChanSyncUnlockBehavior(taskHandle::TaskHandle, channel::String, data::Int32)
    ccall((:DAQmxSetChanSyncUnlockBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring, Cint), taskHandle, channel, data)
end

function ResetChanSyncUnlockBehavior(taskHandle::TaskHandle, channel::String)
    ccall((:DAQmxResetChanSyncUnlockBehavior, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, channel)
end

function GetDevIsSimulated(device::String, data::UInt32)
    ccall((:DAQmxGetDevIsSimulated, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevProductCategory(device::String, data::Int32)
    ccall((:DAQmxGetDevProductCategory, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), device, data)
end

function GetDevProductType(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevProductType, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), device, data, bufferSize)
end

function GetDevProductNum(device::String, data::UInt32)
    ccall((:DAQmxGetDevProductNum, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevSerialNum(device::String, data::UInt32)
    ccall((:DAQmxGetDevSerialNum, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevAccessoryProductTypes(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevAccessoryProductTypes, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), device, data, bufferSize)
end

function GetDevAccessoryProductNums(device::String, data::Vector{UInt32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAccessoryProductNums, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}, Cuint), device, data, arraySizeInElements)
end

function GetDevAccessorySerialNums(device::String, data::Vector{UInt32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAccessorySerialNums, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}, Cuint), device, data, arraySizeInElements)
end

function GetCarrierSerialNum(device::String, data::UInt32)
    ccall((:DAQmxGetCarrierSerialNum, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
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

function GetDevAnlgTrigSupported(device::String, data::UInt32)
    ccall((:DAQmxGetDevAnlgTrigSupported, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevDigTrigSupported(device::String, data::UInt32)
    ccall((:DAQmxGetDevDigTrigSupported, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevTimeTrigSupported(device::String, data::UInt32)
    ccall((:DAQmxGetDevTimeTrigSupported, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevAIPhysicalChans(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevAIPhysicalChans, :libnidaqmx), Cint, (Cstring, Ref{Cuchar}, Cuint), device, data, bufferSize)
end

function GetDevAISupportedMeasTypes(device::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAISupportedMeasTypes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIMaxSingleChanRate(device::String, data::Float64)
    ccall((:DAQmxGetDevAIMaxSingleChanRate, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), device, data)
end

function GetDevAIMaxMultiChanRate(device::String, data::Float64)
    ccall((:DAQmxGetDevAIMaxMultiChanRate, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), device, data)
end

function GetDevAIMinRate(device::String, data::Float64)
    ccall((:DAQmxGetDevAIMinRate, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), device, data)
end

function GetDevAISimultaneousSamplingSupported(device::String, data::UInt32)
    ccall((:DAQmxGetDevAISimultaneousSamplingSupported, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevAINumSampTimingEngines(device::String, data::UInt32)
    ccall((:DAQmxGetDevAINumSampTimingEngines, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevAISampModes(device::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAISampModes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), device, data, arraySizeInElements)
end

function GetDevAINumSyncPulseSrcs(device::String, data::UInt32)
    ccall((:DAQmxGetDevAINumSyncPulseSrcs, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevAITrigUsage(device::String, data::Int32)
    ccall((:DAQmxGetDevAITrigUsage, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), device, data)
end

function GetDevAIVoltageRngs(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAIVoltageRngs, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIVoltageIntExcitDiscreteVals(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAIVoltageIntExcitDiscreteVals, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIVoltageIntExcitRangeVals(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAIVoltageIntExcitRangeVals, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIChargeRngs(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAIChargeRngs, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAICurrentRngs(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAICurrentRngs, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAICurrentIntExcitDiscreteVals(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAICurrentIntExcitDiscreteVals, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIBridgeRngs(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAIBridgeRngs, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIResistanceRngs(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAIResistanceRngs, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIFreqRngs(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAIFreqRngs, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIGains(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAIGains, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAICouplings(device::String, data::Int32)
    ccall((:DAQmxGetDevAICouplings, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), device, data)
end

function GetDevAILowpassCutoffFreqDiscreteVals(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAILowpassCutoffFreqDiscreteVals, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAILowpassCutoffFreqRangeVals(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAILowpassCutoffFreqRangeVals, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetAIDigFltrTypes(device::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetAIDigFltrTypes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIDigFltrLowpassCutoffFreqDiscreteVals(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAIDigFltrLowpassCutoffFreqDiscreteVals, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIDigFltrLowpassCutoffFreqRangeVals(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAIDigFltrLowpassCutoffFreqRangeVals, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAOPhysicalChans(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevAOPhysicalChans, :libnidaqmx), Cint, (Cstring, Ref{Cuchar}, Cuint), device, data, bufferSize)
end

function GetDevAOSupportedOutputTypes(device::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAOSupportedOutputTypes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), device, data, arraySizeInElements)
end

function GetDevAOMaxRate(device::String, data::Float64)
    ccall((:DAQmxGetDevAOMaxRate, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), device, data)
end

function GetDevAOMinRate(device::String, data::Float64)
    ccall((:DAQmxGetDevAOMinRate, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), device, data)
end

function GetDevAOSampClkSupported(device::String, data::UInt32)
    ccall((:DAQmxGetDevAOSampClkSupported, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevAONumSampTimingEngines(device::String, data::UInt32)
    ccall((:DAQmxGetDevAONumSampTimingEngines, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevAOSampModes(device::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAOSampModes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), device, data, arraySizeInElements)
end

function GetDevAONumSyncPulseSrcs(device::String, data::UInt32)
    ccall((:DAQmxGetDevAONumSyncPulseSrcs, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevAOTrigUsage(device::String, data::Int32)
    ccall((:DAQmxGetDevAOTrigUsage, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), device, data)
end

function GetDevAOVoltageRngs(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAOVoltageRngs, :libnidaqmx), Cint, (Cstring, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAOCurrentRngs(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAOCurrentRngs, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAOGains(device::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevAOGains, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevDILines(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevDILines, :libnidaqmx), Cint, (Cstring, Ref{Cuchar}, Cuint), device, data, bufferSize)
end

function GetDevDIPorts(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevDIPorts, :libnidaqmx), Cint, (Cstring, Ref{Cuchar}, Cuint), device, data, bufferSize)
end

function GetDevDIMaxRate(device::String, data::Float64)
    ccall((:DAQmxGetDevDIMaxRate, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), device, data)
end

function GetDevDINumSampTimingEngines(device::String, data::UInt32)
    ccall((:DAQmxGetDevDINumSampTimingEngines, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevDITrigUsage(device::String, data::Int32)
    ccall((:DAQmxGetDevDITrigUsage, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), device, data)
end

function GetDevDOLines(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevDOLines, :libnidaqmx), Cint, (Cstring, Ref{Cuchar}, Cuint), device, data, bufferSize)
end

function GetDevDOPorts(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevDOPorts, :libnidaqmx), Cint, (Cstring, Ref{Cuchar}, Cuint), device, data, bufferSize)
end

function GetDevDOMaxRate(device::String, data::Float64)
    ccall((:DAQmxGetDevDOMaxRate, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), device, data)
end

function GetDevDONumSampTimingEngines(device::String, data::UInt32)
    ccall((:DAQmxGetDevDONumSampTimingEngines, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevDOTrigUsage(device::String, data::Int32)
    ccall((:DAQmxGetDevDOTrigUsage, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), device, data)
end

function GetDevCIPhysicalChans(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevCIPhysicalChans, :libnidaqmx), Cint, (Cstring, Ref{Cuchar}, Cuint), device, data, bufferSize)
end

function GetDevCISupportedMeasTypes(device::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevCISupportedMeasTypes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), device, data, arraySizeInElements)
end

function GetDevCITrigUsage(device::String, data::Int32)
    ccall((:DAQmxGetDevCITrigUsage, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), device, data)
end

function GetDevCISampClkSupported(device::String, data::UInt32)
    ccall((:DAQmxGetDevCISampClkSupported, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevCISampModes(device::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevCISampModes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), device, data, arraySizeInElements)
end

function GetDevCIMaxSize(device::String, data::UInt32)
    ccall((:DAQmxGetDevCIMaxSize, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevCIMaxTimebase(device::String, data::Float64)
    ccall((:DAQmxGetDevCIMaxTimebase, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), device, data)
end

function GetDevCOPhysicalChans(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevCOPhysicalChans, :libnidaqmx), Cint, (Cstring, Ref{Cuchar}, Cuint), device, data, bufferSize)
end

function GetDevCOSupportedOutputTypes(device::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevCOSupportedOutputTypes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), device, data, arraySizeInElements)
end

function GetDevCOSampClkSupported(device::String, data::UInt32)
    ccall((:DAQmxGetDevCOSampClkSupported, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevCOSampModes(device::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetDevCOSampModes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), device, data, arraySizeInElements)
end

function GetDevCOTrigUsage(device::String, data::Int32)
    ccall((:DAQmxGetDevCOTrigUsage, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), device, data)
end

function GetDevCOMaxSize(device::String, data::UInt32)
    ccall((:DAQmxGetDevCOMaxSize, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevCOMaxTimebase(device::String, data::Float64)
    ccall((:DAQmxGetDevCOMaxTimebase, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), device, data)
end

function GetDevTEDSHWTEDSSupported(device::String, data::UInt32)
    ccall((:DAQmxGetDevTEDSHWTEDSSupported, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevNumDMAChans(device::String, data::UInt32)
    ccall((:DAQmxGetDevNumDMAChans, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevBusType(device::String, data::Int32)
    ccall((:DAQmxGetDevBusType, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), device, data)
end

function GetDevPCIBusNum(device::String, data::UInt32)
    ccall((:DAQmxGetDevPCIBusNum, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevPCIDevNum(device::String, data::UInt32)
    ccall((:DAQmxGetDevPCIDevNum, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevPXIChassisNum(device::String, data::UInt32)
    ccall((:DAQmxGetDevPXIChassisNum, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevPXISlotNum(device::String, data::UInt32)
    ccall((:DAQmxGetDevPXISlotNum, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevCompactDAQChassisDevName(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevCompactDAQChassisDevName, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), device, data, bufferSize)
end

function GetDevCompactDAQSlotNum(device::String, data::UInt32)
    ccall((:DAQmxGetDevCompactDAQSlotNum, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevCompactRIOChassisDevName(device::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetDevCompactRIOChassisDevName, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), device, data, bufferSize)
end

function GetDevCompactRIOSlotNum(device::String, data::UInt32)
    ccall((:DAQmxGetDevCompactRIOSlotNum, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
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

function GetDevNumTimeTrigs(device::String, data::UInt32)
    ccall((:DAQmxGetDevNumTimeTrigs, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevNumTimestampEngines(device::String, data::UInt32)
    ccall((:DAQmxGetDevNumTimestampEngines, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
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

function GetExportedAIConvClkPulsePolarity(taskHandle::TaskHandle, data::Int32)
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

function GetExportedSampClkOutputBehavior(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetExportedSampClkOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedSampClkOutputBehavior(taskHandle::TaskHandle, data::Int32)
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

function GetExportedSampClkDelayOffset(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetExportedSampClkDelayOffset, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetExportedSampClkDelayOffset(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetExportedSampClkDelayOffset, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetExportedSampClkDelayOffset(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedSampClkDelayOffset, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedSampClkPulsePolarity(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetExportedSampClkPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedSampClkPulsePolarity(taskHandle::TaskHandle, data::Int32)
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

function GetExportedAdvTrigPulsePolarity(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetExportedAdvTrigPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function GetExportedAdvTrigPulseWidthUnits(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetExportedAdvTrigPulseWidthUnits, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedAdvTrigPulseWidthUnits(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetExportedAdvTrigPulseWidthUnits, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedAdvTrigPulseWidthUnits(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedAdvTrigPulseWidthUnits, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedAdvTrigPulseWidth(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetExportedAdvTrigPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetExportedAdvTrigPulseWidth(taskHandle::TaskHandle, data::Float64)
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

function GetExportedPauseTrigLvlActiveLvl(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetExportedPauseTrigLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedPauseTrigLvlActiveLvl(taskHandle::TaskHandle, data::Int32)
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

function GetExportedRefTrigPulsePolarity(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetExportedRefTrigPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedRefTrigPulsePolarity(taskHandle::TaskHandle, data::Int32)
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

function GetExportedStartTrigPulsePolarity(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetExportedStartTrigPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedStartTrigPulsePolarity(taskHandle::TaskHandle, data::Int32)
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

function GetExportedAdvCmpltEventDelay(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetExportedAdvCmpltEventDelay, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetExportedAdvCmpltEventDelay(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetExportedAdvCmpltEventDelay, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetExportedAdvCmpltEventDelay(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedAdvCmpltEventDelay, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedAdvCmpltEventPulsePolarity(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetExportedAdvCmpltEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedAdvCmpltEventPulsePolarity(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetExportedAdvCmpltEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedAdvCmpltEventPulsePolarity(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedAdvCmpltEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedAdvCmpltEventPulseWidth(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetExportedAdvCmpltEventPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetExportedAdvCmpltEventPulseWidth(taskHandle::TaskHandle, data::Float64)
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

function GetExportedAIHoldCmpltEventPulsePolarity(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetExportedAIHoldCmpltEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedAIHoldCmpltEventPulsePolarity(taskHandle::TaskHandle, data::Int32)
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

function GetExportedChangeDetectEventPulsePolarity(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetExportedChangeDetectEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedChangeDetectEventPulsePolarity(taskHandle::TaskHandle, data::Int32)
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

function GetExportedCtrOutEventOutputBehavior(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetExportedCtrOutEventOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedCtrOutEventOutputBehavior(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetExportedCtrOutEventOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedCtrOutEventOutputBehavior(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedCtrOutEventOutputBehavior, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedCtrOutEventPulsePolarity(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetExportedCtrOutEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedCtrOutEventPulsePolarity(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetExportedCtrOutEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedCtrOutEventPulsePolarity(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedCtrOutEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedCtrOutEventToggleIdleState(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetExportedCtrOutEventToggleIdleState, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedCtrOutEventToggleIdleState(taskHandle::TaskHandle, data::Int32)
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

function GetExportedHshkEventOutputBehavior(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetExportedHshkEventOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedHshkEventOutputBehavior(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetExportedHshkEventOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedHshkEventOutputBehavior(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedHshkEventOutputBehavior, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedHshkEventDelay(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetExportedHshkEventDelay, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetExportedHshkEventDelay(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetExportedHshkEventDelay, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetExportedHshkEventDelay(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedHshkEventDelay, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedHshkEventInterlockedAssertedLvl(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetExportedHshkEventInterlockedAssertedLvl, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedHshkEventInterlockedAssertedLvl(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetExportedHshkEventInterlockedAssertedLvl, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedHshkEventInterlockedAssertedLvl(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedHshkEventInterlockedAssertedLvl, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedHshkEventInterlockedAssertOnStart(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetExportedHshkEventInterlockedAssertOnStart, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetExportedHshkEventInterlockedAssertOnStart(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetExportedHshkEventInterlockedAssertOnStart, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetExportedHshkEventInterlockedAssertOnStart(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedHshkEventInterlockedAssertOnStart, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedHshkEventInterlockedDeassertDelay(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetExportedHshkEventInterlockedDeassertDelay, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetExportedHshkEventInterlockedDeassertDelay(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetExportedHshkEventInterlockedDeassertDelay, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetExportedHshkEventInterlockedDeassertDelay(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedHshkEventInterlockedDeassertDelay, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedHshkEventPulsePolarity(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetExportedHshkEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedHshkEventPulsePolarity(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetExportedHshkEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedHshkEventPulsePolarity(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedHshkEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedHshkEventPulseWidth(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetExportedHshkEventPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetExportedHshkEventPulseWidth(taskHandle::TaskHandle, data::Float64)
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

function GetExportedRdyForXferEventLvlActiveLvl(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetExportedRdyForXferEventLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedRdyForXferEventLvlActiveLvl(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetExportedRdyForXferEventLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedRdyForXferEventLvlActiveLvl(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedRdyForXferEventLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedRdyForXferEventDeassertCond(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetExportedRdyForXferEventDeassertCond, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedRdyForXferEventDeassertCond(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetExportedRdyForXferEventDeassertCond, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedRdyForXferEventDeassertCond(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedRdyForXferEventDeassertCond, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedRdyForXferEventDeassertCondCustomThreshold(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetExportedRdyForXferEventDeassertCondCustomThreshold, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetExportedRdyForXferEventDeassertCondCustomThreshold(taskHandle::TaskHandle, data::UInt32)
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

function GetExportedDataActiveEventLvlActiveLvl(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetExportedDataActiveEventLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedDataActiveEventLvlActiveLvl(taskHandle::TaskHandle, data::Int32)
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

function GetExportedRdyForStartEventLvlActiveLvl(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetExportedRdyForStartEventLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedRdyForStartEventLvlActiveLvl(taskHandle::TaskHandle, data::Int32)
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

function GetPersistedChanAllowInteractiveEditing(channel::String, data::UInt32)
    ccall((:DAQmxGetPersistedChanAllowInteractiveEditing, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), channel, data)
end

function GetPersistedChanAllowInteractiveDeletion(channel::String, data::UInt32)
    ccall((:DAQmxGetPersistedChanAllowInteractiveDeletion, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), channel, data)
end

function GetPersistedScaleAuthor(scaleName::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetPersistedScaleAuthor, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), scaleName, data, bufferSize)
end

function GetPersistedScaleAllowInteractiveEditing(scaleName::String, data::UInt32)
    ccall((:DAQmxGetPersistedScaleAllowInteractiveEditing, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), scaleName, data)
end

function GetPersistedScaleAllowInteractiveDeletion(scaleName::String, data::UInt32)
    ccall((:DAQmxGetPersistedScaleAllowInteractiveDeletion, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), scaleName, data)
end

function GetPersistedTaskAuthor(taskName::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetPersistedTaskAuthor, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), taskName, data, bufferSize)
end

function GetPersistedTaskAllowInteractiveEditing(taskName::String, data::UInt32)
    ccall((:DAQmxGetPersistedTaskAllowInteractiveEditing, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), taskName, data)
end

function GetPersistedTaskAllowInteractiveDeletion(taskName::String, data::UInt32)
    ccall((:DAQmxGetPersistedTaskAllowInteractiveDeletion, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), taskName, data)
end

function GetPhysicalChanAISupportedMeasTypes(physicalChannel::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetPhysicalChanAISupportedMeasTypes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetPhysicalChanAITermCfgs(physicalChannel::String, data::Int32)
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

function GetPhysicalChanAIPowerControlVoltage(physicalChannel::String, data::Float64)
    ccall((:DAQmxGetPhysicalChanAIPowerControlVoltage, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), physicalChannel, data)
end

function SetPhysicalChanAIPowerControlVoltage(physicalChannel::String, data::Float64)
    ccall((:DAQmxSetPhysicalChanAIPowerControlVoltage, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble), physicalChannel, data)
end

function ResetPhysicalChanAIPowerControlVoltage(physicalChannel::String)
    ccall((:DAQmxResetPhysicalChanAIPowerControlVoltage, :libnidaqmx), Cint, (Ref{UInt8},), physicalChannel)
end

function GetPhysicalChanAIPowerControlEnable(physicalChannel::String, data::UInt32)
    ccall((:DAQmxGetPhysicalChanAIPowerControlEnable, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function SetPhysicalChanAIPowerControlEnable(physicalChannel::String, data::UInt32)
    ccall((:DAQmxSetPhysicalChanAIPowerControlEnable, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), physicalChannel, data)
end

function ResetPhysicalChanAIPowerControlEnable(physicalChannel::String)
    ccall((:DAQmxResetPhysicalChanAIPowerControlEnable, :libnidaqmx), Cint, (Ref{UInt8},), physicalChannel)
end

function GetPhysicalChanAIPowerControlType(physicalChannel::String, data::Int32)
    ccall((:DAQmxGetPhysicalChanAIPowerControlType, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), physicalChannel, data)
end

function SetPhysicalChanAIPowerControlType(physicalChannel::String, data::Int32)
    ccall((:DAQmxSetPhysicalChanAIPowerControlType, :libnidaqmx), Cint, (Ref{UInt8}, Cint), physicalChannel, data)
end

function ResetPhysicalChanAIPowerControlType(physicalChannel::String)
    ccall((:DAQmxResetPhysicalChanAIPowerControlType, :libnidaqmx), Cint, (Ref{UInt8},), physicalChannel)
end

function GetPhysicalChanAISensorPowerOpenChan(physicalChannel::String, data::UInt32)
    ccall((:DAQmxGetPhysicalChanAISensorPowerOpenChan, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanAISensorPowerOvercurrent(physicalChannel::String, data::UInt32)
    ccall((:DAQmxGetPhysicalChanAISensorPowerOvercurrent, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanAOSupportedOutputTypes(physicalChannel::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetPhysicalChanAOSupportedOutputTypes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetPhysicalChanAOSupportedPowerUpOutputTypes(physicalChannel::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetPhysicalChanAOSupportedPowerUpOutputTypes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetPhysicalChanAOTermCfgs(physicalChannel::String, data::Int32)
    ccall((:DAQmxGetPhysicalChanAOTermCfgs, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), physicalChannel, data)
end

function GetPhysicalChanAOManualControlEnable(physicalChannel::String, data::UInt32)
    ccall((:DAQmxGetPhysicalChanAOManualControlEnable, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function SetPhysicalChanAOManualControlEnable(physicalChannel::String, data::UInt32)
    ccall((:DAQmxSetPhysicalChanAOManualControlEnable, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), physicalChannel, data)
end

function ResetPhysicalChanAOManualControlEnable(physicalChannel::String)
    ccall((:DAQmxResetPhysicalChanAOManualControlEnable, :libnidaqmx), Cint, (Ref{UInt8},), physicalChannel)
end

function GetPhysicalChanAOManualControlShortDetected(physicalChannel::String, data::UInt32)
    ccall((:DAQmxGetPhysicalChanAOManualControlShortDetected, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanAOManualControlAmplitude(physicalChannel::String, data::Float64)
    ccall((:DAQmxGetPhysicalChanAOManualControlAmplitude, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), physicalChannel, data)
end

function GetPhysicalChanAOManualControlFreq(physicalChannel::String, data::Float64)
    ccall((:DAQmxGetPhysicalChanAOManualControlFreq, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), physicalChannel, data)
end

function GetAOPowerAmpChannelEnable(physicalChannel::String, data::UInt32)
    ccall((:DAQmxGetAOPowerAmpChannelEnable, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function SetAOPowerAmpChannelEnable(physicalChannel::String, data::UInt32)
    ccall((:DAQmxSetAOPowerAmpChannelEnable, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), physicalChannel, data)
end

function ResetAOPowerAmpChannelEnable(physicalChannel::String)
    ccall((:DAQmxResetAOPowerAmpChannelEnable, :libnidaqmx), Cint, (Ref{UInt8},), physicalChannel)
end

function GetAOPowerAmpScalingCoeff(physicalChannel::String, data::Vector{Float64}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetAOPowerAmpScalingCoeff, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetAOPowerAmpOvercurrent(physicalChannel::String, data::UInt32)
    ccall((:DAQmxGetAOPowerAmpOvercurrent, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetAOPowerAmpGain(physicalChannel::String, data::Float64)
    ccall((:DAQmxGetAOPowerAmpGain, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), physicalChannel, data)
end

function GetAOPowerAmpOffset(physicalChannel::String, data::Float64)
    ccall((:DAQmxGetAOPowerAmpOffset, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), physicalChannel, data)
end

function GetPhysicalChanDIPortWidth(physicalChannel::String, data::UInt32)
    ccall((:DAQmxGetPhysicalChanDIPortWidth, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanDISampClkSupported(physicalChannel::String, data::UInt32)
    ccall((:DAQmxGetPhysicalChanDISampClkSupported, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanDISampModes(physicalChannel::String, data::Vector{Int32}, arraySizeInElements::UInt32)
    ccall((:DAQmxGetPhysicalChanDISampModes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetPhysicalChanDIChangeDetectSupported(physicalChannel::String, data::UInt32)
    ccall((:DAQmxGetPhysicalChanDIChangeDetectSupported, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanDOPortWidth(physicalChannel::String, data::UInt32)
    ccall((:DAQmxGetPhysicalChanDOPortWidth, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanDOSampClkSupported(physicalChannel::String, data::UInt32)
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

function GetPhysicalChanTEDSMfgID(physicalChannel::String, data::UInt32)
    ccall((:DAQmxGetPhysicalChanTEDSMfgID, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanTEDSModelNum(physicalChannel::String, data::UInt32)
    ccall((:DAQmxGetPhysicalChanTEDSModelNum, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanTEDSSerialNum(physicalChannel::String, data::UInt32)
    ccall((:DAQmxGetPhysicalChanTEDSSerialNum, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanTEDSVersionNum(physicalChannel::String, data::UInt32)
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

function GetReadRelativeTo(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetReadRelativeTo, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetReadRelativeTo(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetReadRelativeTo, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetReadRelativeTo(taskHandle::TaskHandle)
    ccall((:DAQmxResetReadRelativeTo, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetReadOffset(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetReadOffset, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetReadOffset(taskHandle::TaskHandle, data::Int32)
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

function GetReadReadAllAvailSamp(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetReadReadAllAvailSamp, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetReadReadAllAvailSamp(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetReadReadAllAvailSamp, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetReadReadAllAvailSamp(taskHandle::TaskHandle)
    ccall((:DAQmxResetReadReadAllAvailSamp, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetReadAutoStart(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetReadAutoStart, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetReadAutoStart(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetReadAutoStart, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetReadAutoStart(taskHandle::TaskHandle)
    ccall((:DAQmxResetReadAutoStart, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetReadOverWrite(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetReadOverWrite, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetReadOverWrite(taskHandle::TaskHandle, data::Int32)
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

function GetLoggingMode(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetLoggingMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetLoggingMode(taskHandle::TaskHandle, data::Int32)
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

function GetLoggingTDMSOperation(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetLoggingTDMSOperation, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetLoggingTDMSOperation(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetLoggingTDMSOperation, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetLoggingTDMSOperation(taskHandle::TaskHandle)
    ccall((:DAQmxResetLoggingTDMSOperation, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetLoggingPause(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetLoggingPause, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetLoggingPause(taskHandle::TaskHandle, data::UInt32)
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

function GetLoggingFileWriteSize(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetLoggingFileWriteSize, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetLoggingFileWriteSize(taskHandle::TaskHandle, data::UInt32)
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

function GetReadAvailSampPerChan(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetReadAvailSampPerChan, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadTotalSampPerChanAcquired(taskHandle::TaskHandle, data::Vector{Culonglong})
    ccall((:DAQmxGetReadTotalSampPerChanAcquired, :libnidaqmx), Cint, (TaskHandle, Ref{Culonglong}), taskHandle, data)
end

function GetReadCommonModeRangeErrorChansExist(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetReadCommonModeRangeErrorChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadCommonModeRangeErrorChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetReadCommonModeRangeErrorChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadExcitFaultChansExist(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetReadExcitFaultChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadExcitFaultChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetReadExcitFaultChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadOvercurrentChansExist(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetReadOvercurrentChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadOvercurrentChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetReadOvercurrentChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadOvertemperatureChansExist(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetReadOvertemperatureChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadOvertemperatureChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetReadOvertemperatureChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadOpenChansExist(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetReadOpenChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadOpenChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetReadOpenChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadOpenChansDetails(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetReadOpenChansDetails, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadOpenCurrentLoopChansExist(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetReadOpenCurrentLoopChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadOpenCurrentLoopChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetReadOpenCurrentLoopChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadOpenThrmcplChansExist(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetReadOpenThrmcplChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadOpenThrmcplChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetReadOpenThrmcplChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadOverloadedChansExist(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetReadOverloadedChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadOverloadedChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetReadOverloadedChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadPLLUnlockedChansExist(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetReadPLLUnlockedChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadPLLUnlockedChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetReadPLLUnlockedChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadSyncUnlockedChansExist(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetReadSyncUnlockedChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadSyncUnlockedChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetReadSyncUnlockedChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadAccessoryInsertionOrRemovalDetected(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetReadAccessoryInsertionOrRemovalDetected, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadDevsWithInsertedOrRemovedAccessories(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetReadDevsWithInsertedOrRemovedAccessories, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadChangeDetectHasOverflowed(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetReadChangeDetectHasOverflowed, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadRawDataWidth(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetReadRawDataWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadNumChans(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetReadNumChans, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadDigitalLinesBytesPerChan(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetReadDigitalLinesBytesPerChan, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadWaitMode(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetReadWaitMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetReadWaitMode(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetReadWaitMode, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetReadWaitMode(taskHandle::TaskHandle)
    ccall((:DAQmxResetReadWaitMode, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetReadSleepTime(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetReadSleepTime, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetReadSleepTime(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetReadSleepTime, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetReadSleepTime(taskHandle::TaskHandle)
    ccall((:DAQmxResetReadSleepTime, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRealTimeConvLateErrorsToWarnings(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetRealTimeConvLateErrorsToWarnings, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetRealTimeConvLateErrorsToWarnings(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetRealTimeConvLateErrorsToWarnings, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetRealTimeConvLateErrorsToWarnings(taskHandle::TaskHandle)
    ccall((:DAQmxResetRealTimeConvLateErrorsToWarnings, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRealTimeNumOfWarmupIters(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetRealTimeNumOfWarmupIters, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetRealTimeNumOfWarmupIters(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetRealTimeNumOfWarmupIters, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetRealTimeNumOfWarmupIters(taskHandle::TaskHandle)
    ccall((:DAQmxResetRealTimeNumOfWarmupIters, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRealTimeWaitForNextSampClkWaitMode(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetRealTimeWaitForNextSampClkWaitMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetRealTimeWaitForNextSampClkWaitMode(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetRealTimeWaitForNextSampClkWaitMode, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetRealTimeWaitForNextSampClkWaitMode(taskHandle::TaskHandle)
    ccall((:DAQmxResetRealTimeWaitForNextSampClkWaitMode, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRealTimeReportMissedSamp(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetRealTimeReportMissedSamp, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetRealTimeReportMissedSamp(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetRealTimeReportMissedSamp, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetRealTimeReportMissedSamp(taskHandle::TaskHandle)
    ccall((:DAQmxResetRealTimeReportMissedSamp, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRealTimeWriteRecoveryMode(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetRealTimeWriteRecoveryMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetRealTimeWriteRecoveryMode(taskHandle::TaskHandle, data::Int32)
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

function GetScalePreScaledUnits(scaleName::String, data::Int32)
    ccall((:DAQmxGetScalePreScaledUnits, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), scaleName, data)
end

function SetScalePreScaledUnits(scaleName::String, data::Int32)
    ccall((:DAQmxSetScalePreScaledUnits, :libnidaqmx), Cint, (Ref{UInt8}, Cint), scaleName, data)
end

function GetScaleType(scaleName::String, data::Int32)
    ccall((:DAQmxGetScaleType, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), scaleName, data)
end

function GetScaleLinSlope(scaleName::String, data::Float64)
    ccall((:DAQmxGetScaleLinSlope, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), scaleName, data)
end

function SetScaleLinSlope(scaleName::String, data::Float64)
    ccall((:DAQmxSetScaleLinSlope, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble), scaleName, data)
end

function GetScaleLinYIntercept(scaleName::String, data::Float64)
    ccall((:DAQmxGetScaleLinYIntercept, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), scaleName, data)
end

function SetScaleLinYIntercept(scaleName::String, data::Float64)
    ccall((:DAQmxSetScaleLinYIntercept, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble), scaleName, data)
end

function GetScaleMapScaledMax(scaleName::String, data::Float64)
    ccall((:DAQmxGetScaleMapScaledMax, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), scaleName, data)
end

function SetScaleMapScaledMax(scaleName::String, data::Float64)
    ccall((:DAQmxSetScaleMapScaledMax, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble), scaleName, data)
end

function GetScaleMapPreScaledMax(scaleName::String, data::Float64)
    ccall((:DAQmxGetScaleMapPreScaledMax, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), scaleName, data)
end

function SetScaleMapPreScaledMax(scaleName::String, data::Float64)
    ccall((:DAQmxSetScaleMapPreScaledMax, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble), scaleName, data)
end

function GetScaleMapScaledMin(scaleName::String, data::Float64)
    ccall((:DAQmxGetScaleMapScaledMin, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), scaleName, data)
end

function SetScaleMapScaledMin(scaleName::String, data::Float64)
    ccall((:DAQmxSetScaleMapScaledMin, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble), scaleName, data)
end

function GetScaleMapPreScaledMin(scaleName::String, data::Float64)
    ccall((:DAQmxGetScaleMapPreScaledMin, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), scaleName, data)
end

function SetScaleMapPreScaledMin(scaleName::String, data::Float64)
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

function GetSwitchChanUsage(switchChannelName::String, data::Int32)
    ccall((:DAQmxGetSwitchChanUsage, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), switchChannelName, data)
end

function SetSwitchChanUsage(switchChannelName::String, data::Int32)
    ccall((:DAQmxSetSwitchChanUsage, :libnidaqmx), Cint, (Ref{UInt8}, Cint), switchChannelName, data)
end

function GetSwitchChanAnlgBusSharingEnable(switchChannelName::String, data::UInt32)
    ccall((:DAQmxGetSwitchChanAnlgBusSharingEnable, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), switchChannelName, data)
end

function SetSwitchChanAnlgBusSharingEnable(switchChannelName::String, data::UInt32)
    ccall((:DAQmxSetSwitchChanAnlgBusSharingEnable, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), switchChannelName, data)
end

function GetSwitchChanMaxACCarryCurrent(switchChannelName::String, data::Float64)
    ccall((:DAQmxGetSwitchChanMaxACCarryCurrent, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanMaxACSwitchCurrent(switchChannelName::String, data::Float64)
    ccall((:DAQmxGetSwitchChanMaxACSwitchCurrent, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanMaxACCarryPwr(switchChannelName::String, data::Float64)
    ccall((:DAQmxGetSwitchChanMaxACCarryPwr, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanMaxACSwitchPwr(switchChannelName::String, data::Float64)
    ccall((:DAQmxGetSwitchChanMaxACSwitchPwr, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanMaxDCCarryCurrent(switchChannelName::String, data::Float64)
    ccall((:DAQmxGetSwitchChanMaxDCCarryCurrent, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanMaxDCSwitchCurrent(switchChannelName::String, data::Float64)
    ccall((:DAQmxGetSwitchChanMaxDCSwitchCurrent, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanMaxDCCarryPwr(switchChannelName::String, data::Float64)
    ccall((:DAQmxGetSwitchChanMaxDCCarryPwr, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanMaxDCSwitchPwr(switchChannelName::String, data::Float64)
    ccall((:DAQmxGetSwitchChanMaxDCSwitchPwr, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanMaxACVoltage(switchChannelName::String, data::Float64)
    ccall((:DAQmxGetSwitchChanMaxACVoltage, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanMaxDCVoltage(switchChannelName::String, data::Float64)
    ccall((:DAQmxGetSwitchChanMaxDCVoltage, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanWireMode(switchChannelName::String, data::UInt32)
    ccall((:DAQmxGetSwitchChanWireMode, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), switchChannelName, data)
end

function GetSwitchChanBandwidth(switchChannelName::String, data::Float64)
    ccall((:DAQmxGetSwitchChanBandwidth, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanImpedance(switchChannelName::String, data::Float64)
    ccall((:DAQmxGetSwitchChanImpedance, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchDevSettlingTime(deviceName::String, data::Float64)
    ccall((:DAQmxGetSwitchDevSettlingTime, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), deviceName, data)
end

function SetSwitchDevSettlingTime(deviceName::String, data::Float64)
    ccall((:DAQmxSetSwitchDevSettlingTime, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble), deviceName, data)
end

function GetSwitchDevAutoConnAnlgBus(deviceName::String, data::UInt32)
    ccall((:DAQmxGetSwitchDevAutoConnAnlgBus, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function SetSwitchDevAutoConnAnlgBus(deviceName::String, data::UInt32)
    ccall((:DAQmxSetSwitchDevAutoConnAnlgBus, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), deviceName, data)
end

function GetSwitchDevPwrDownLatchRelaysAfterSettling(deviceName::String, data::UInt32)
    ccall((:DAQmxGetSwitchDevPwrDownLatchRelaysAfterSettling, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function SetSwitchDevPwrDownLatchRelaysAfterSettling(deviceName::String, data::UInt32)
    ccall((:DAQmxSetSwitchDevPwrDownLatchRelaysAfterSettling, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), deviceName, data)
end

function GetSwitchDevSettled(deviceName::String, data::UInt32)
    ccall((:DAQmxGetSwitchDevSettled, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function GetSwitchDevRelayList(deviceName::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetSwitchDevRelayList, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), deviceName, data, bufferSize)
end

function GetSwitchDevNumRelays(deviceName::String, data::UInt32)
    ccall((:DAQmxGetSwitchDevNumRelays, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function GetSwitchDevSwitchChanList(deviceName::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetSwitchDevSwitchChanList, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), deviceName, data, bufferSize)
end

function GetSwitchDevNumSwitchChans(deviceName::String, data::UInt32)
    ccall((:DAQmxGetSwitchDevNumSwitchChans, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function GetSwitchDevNumRows(deviceName::String, data::UInt32)
    ccall((:DAQmxGetSwitchDevNumRows, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function GetSwitchDevNumColumns(deviceName::String, data::UInt32)
    ccall((:DAQmxGetSwitchDevNumColumns, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function GetSwitchDevTopology(deviceName::String, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetSwitchDevTopology, :libnidaqmx), Cint, (Cstring, Ref{UInt8}, Cuint), deviceName, data, bufferSize)
end

function GetSwitchDevTemperature(deviceName::String, data::Float64)
    ccall((:DAQmxGetSwitchDevTemperature, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), deviceName, data)
end

function GetSwitchScanBreakMode(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetSwitchScanBreakMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSwitchScanBreakMode(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetSwitchScanBreakMode, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSwitchScanBreakMode(taskHandle::TaskHandle)
    ccall((:DAQmxResetSwitchScanBreakMode, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSwitchScanRepeatMode(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetSwitchScanRepeatMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSwitchScanRepeatMode(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetSwitchScanRepeatMode, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSwitchScanRepeatMode(taskHandle::TaskHandle)
    ccall((:DAQmxResetSwitchScanRepeatMode, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSwitchScanWaitingForAdv(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetSwitchScanWaitingForAdv, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetSysGlobalChans(data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetSysGlobalChans, :libnidaqmx), Cint, (Cstring, Cuint), data, bufferSize)
end

function GetSysScales(data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetSysScales, :libnidaqmx), Cint, (Cstring, Cuint), data, bufferSize)
end

function GetSysTasks(data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetSysTasks, :libnidaqmx), Cint, (Ptr{Cuint}, Cuint), data, bufferSize)
end

function GetSysDevNames(data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetSysDevNames, :libnidaqmx), Cint, (Ref{Cuchar}, Cuint), data, bufferSize)
end

function GetSysNIDAQMajorVersion(data::UInt32)
    ccall((:DAQmxGetSysNIDAQMajorVersion, :libnidaqmx), Cint, (Ref{Cuint},), data)
end

function GetSysNIDAQMinorVersion(data::UInt32)
    ccall((:DAQmxGetSysNIDAQMinorVersion, :libnidaqmx), Cint, (Ref{Cuint},), data)
end

function GetSysNIDAQUpdateVersion(data::UInt32)
    ccall((:DAQmxGetSysNIDAQUpdateVersion, :libnidaqmx), Cint, (Ref{Cuint},), data)
end

function GetTaskName(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetTaskName, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetTaskChannels(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetTaskChannels, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetTaskNumChans(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetTaskNumChans, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetTaskDevices(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetTaskDevices, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetTaskNumDevices(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetTaskNumDevices, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetTaskComplete(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetTaskComplete, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetSampQuantSampMode(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetSampQuantSampMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSampQuantSampMode(taskHandle::TaskHandle, data::Int32)
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

function GetSampTimingType(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetSampTimingType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSampTimingType(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetSampTimingType, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSampTimingType(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampTimingType, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetSampClkRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetSampClkRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetSampClkRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetSampClkRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkMaxRate(taskHandle::TaskHandle, data::Float64)
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

function GetSampClkActiveEdge(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetSampClkActiveEdge, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSampClkActiveEdge(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetSampClkActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSampClkActiveEdge(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkActiveEdge, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkOverrunBehavior(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetSampClkOverrunBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSampClkOverrunBehavior(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetSampClkOverrunBehavior, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSampClkOverrunBehavior(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkOverrunBehavior, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkUnderflowBehavior(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetSampClkUnderflowBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSampClkUnderflowBehavior(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetSampClkUnderflowBehavior, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSampClkUnderflowBehavior(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkUnderflowBehavior, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkTimebaseDiv(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetSampClkTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetSampClkTimebaseDiv(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetSampClkTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetSampClkTimebaseDiv(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkTimebaseDiv, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetSampClkTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetSampClkTimebaseRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetSampClkTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetSampClkTimebaseRate(taskHandle::TaskHandle, data::Float64)
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

function GetSampClkTimebaseActiveEdge(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetSampClkTimebaseActiveEdge, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSampClkTimebaseActiveEdge(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetSampClkTimebaseActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSampClkTimebaseActiveEdge(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkTimebaseActiveEdge, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkTimebaseMasterTimebaseDiv(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetSampClkTimebaseMasterTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetSampClkTimebaseMasterTimebaseDiv(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetSampClkTimebaseMasterTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetSampClkTimebaseMasterTimebaseDiv(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkTimebaseMasterTimebaseDiv, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkTimebaseTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetSampClkTimebaseTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetSampClkDigFltrEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetSampClkDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetSampClkDigFltrEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetSampClkDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetSampClkDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetSampClkDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetSampClkDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Float64)
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

function GetSampClkDigFltrTimebaseRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetSampClkDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetSampClkDigFltrTimebaseRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetSampClkDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetSampClkDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkDigSyncEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetSampClkDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetSampClkDigSyncEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetSampClkDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetSampClkDigSyncEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkDigSyncEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkWriteWfmUseInitialWfmDT(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetSampClkWriteWfmUseInitialWfmDT, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetSampClkWriteWfmUseInitialWfmDT(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetSampClkWriteWfmUseInitialWfmDT, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetSampClkWriteWfmUseInitialWfmDT(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkWriteWfmUseInitialWfmDT, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetHshkDelayAfterXfer(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetHshkDelayAfterXfer, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetHshkDelayAfterXfer(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetHshkDelayAfterXfer, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetHshkDelayAfterXfer(taskHandle::TaskHandle)
    ccall((:DAQmxResetHshkDelayAfterXfer, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetHshkStartCond(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetHshkStartCond, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetHshkStartCond(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetHshkStartCond, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetHshkStartCond(taskHandle::TaskHandle)
    ccall((:DAQmxResetHshkStartCond, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetHshkSampleInputDataWhen(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetHshkSampleInputDataWhen, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetHshkSampleInputDataWhen(taskHandle::TaskHandle, data::Int32)
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

function GetChangeDetectDITristate(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetChangeDetectDITristate, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetChangeDetectDITristate(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetChangeDetectDITristate, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetChangeDetectDITristate(taskHandle::TaskHandle)
    ccall((:DAQmxResetChangeDetectDITristate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetOnDemandSimultaneousAOEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetOnDemandSimultaneousAOEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetOnDemandSimultaneousAOEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetOnDemandSimultaneousAOEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetOnDemandSimultaneousAOEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetOnDemandSimultaneousAOEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetImplicitUnderflowBehavior(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetImplicitUnderflowBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetImplicitUnderflowBehavior(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetImplicitUnderflowBehavior, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetImplicitUnderflowBehavior(taskHandle::TaskHandle)
    ccall((:DAQmxResetImplicitUnderflowBehavior, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAIConvRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAIConvRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetAIConvRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAIConvRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvRateEx(taskHandle::TaskHandle, deviceNames::String, data::Float64)
    ccall((:DAQmxGetAIConvRateEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, deviceNames, data)
end

function SetAIConvRateEx(taskHandle::TaskHandle, deviceNames::String, data::Float64)
    ccall((:DAQmxSetAIConvRateEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, deviceNames, data)
end

function ResetAIConvRateEx(taskHandle::TaskHandle, deviceNames::String)
    ccall((:DAQmxResetAIConvRateEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetAIConvMaxRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAIConvMaxRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function GetAIConvMaxRateEx(taskHandle::TaskHandle, deviceNames::String, data::Float64)
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

function GetAIConvActiveEdge(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetAIConvActiveEdge, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAIConvActiveEdge(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetAIConvActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAIConvActiveEdge(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvActiveEdge, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvActiveEdgeEx(taskHandle::TaskHandle, deviceNames::String, data::Int32)
    ccall((:DAQmxGetAIConvActiveEdgeEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, deviceNames, data)
end

function SetAIConvActiveEdgeEx(taskHandle::TaskHandle, deviceNames::String, data::Int32)
    ccall((:DAQmxSetAIConvActiveEdgeEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, deviceNames, data)
end

function ResetAIConvActiveEdgeEx(taskHandle::TaskHandle, deviceNames::String)
    ccall((:DAQmxResetAIConvActiveEdgeEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetAIConvTimebaseDiv(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetAIConvTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAIConvTimebaseDiv(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetAIConvTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAIConvTimebaseDiv(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvTimebaseDiv, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvTimebaseDivEx(taskHandle::TaskHandle, deviceNames::String, data::UInt32)
    ccall((:DAQmxGetAIConvTimebaseDivEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, deviceNames, data)
end

function SetAIConvTimebaseDivEx(taskHandle::TaskHandle, deviceNames::String, data::UInt32)
    ccall((:DAQmxSetAIConvTimebaseDivEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, deviceNames, data)
end

function ResetAIConvTimebaseDivEx(taskHandle::TaskHandle, deviceNames::String)
    ccall((:DAQmxResetAIConvTimebaseDivEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetAIConvTimebaseSrc(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetAIConvTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAIConvTimebaseSrc(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetAIConvTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAIConvTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvTimebaseSrcEx(taskHandle::TaskHandle, deviceNames::String, data::Int32)
    ccall((:DAQmxGetAIConvTimebaseSrcEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, deviceNames, data)
end

function SetAIConvTimebaseSrcEx(taskHandle::TaskHandle, deviceNames::String, data::Int32)
    ccall((:DAQmxSetAIConvTimebaseSrcEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, deviceNames, data)
end

function ResetAIConvTimebaseSrcEx(taskHandle::TaskHandle, deviceNames::String)
    ccall((:DAQmxResetAIConvTimebaseSrcEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetDelayFromSampClkDelayUnits(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetDelayFromSampClkDelayUnits, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDelayFromSampClkDelayUnits(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetDelayFromSampClkDelayUnits, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDelayFromSampClkDelayUnits(taskHandle::TaskHandle)
    ccall((:DAQmxResetDelayFromSampClkDelayUnits, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDelayFromSampClkDelayUnitsEx(taskHandle::TaskHandle, deviceNames::String, data::Int32)
    ccall((:DAQmxGetDelayFromSampClkDelayUnitsEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, deviceNames, data)
end

function SetDelayFromSampClkDelayUnitsEx(taskHandle::TaskHandle, deviceNames::String, data::Int32)
    ccall((:DAQmxSetDelayFromSampClkDelayUnitsEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, deviceNames, data)
end

function ResetDelayFromSampClkDelayUnitsEx(taskHandle::TaskHandle, deviceNames::String)
    ccall((:DAQmxResetDelayFromSampClkDelayUnitsEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetDelayFromSampClkDelay(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetDelayFromSampClkDelay, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetDelayFromSampClkDelay(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetDelayFromSampClkDelay, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetDelayFromSampClkDelay(taskHandle::TaskHandle)
    ccall((:DAQmxResetDelayFromSampClkDelay, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDelayFromSampClkDelayEx(taskHandle::TaskHandle, deviceNames::String, data::Float64)
    ccall((:DAQmxGetDelayFromSampClkDelayEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, deviceNames, data)
end

function SetDelayFromSampClkDelayEx(taskHandle::TaskHandle, deviceNames::String, data::Float64)
    ccall((:DAQmxSetDelayFromSampClkDelayEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, deviceNames, data)
end

function ResetDelayFromSampClkDelayEx(taskHandle::TaskHandle, deviceNames::String)
    ccall((:DAQmxResetDelayFromSampClkDelayEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetAIConvDigFltrEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetAIConvDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAIConvDigFltrEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetAIConvDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAIConvDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvDigFltrEnableEx(taskHandle::TaskHandle, deviceNames::String, data::UInt32)
    ccall((:DAQmxGetAIConvDigFltrEnableEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, deviceNames, data)
end

function SetAIConvDigFltrEnableEx(taskHandle::TaskHandle, deviceNames::String, data::UInt32)
    ccall((:DAQmxSetAIConvDigFltrEnableEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, deviceNames, data)
end

function ResetAIConvDigFltrEnableEx(taskHandle::TaskHandle, deviceNames::String)
    ccall((:DAQmxResetAIConvDigFltrEnableEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetAIConvDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAIConvDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAIConvDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetAIConvDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAIConvDigFltrMinPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvDigFltrMinPulseWidthEx(taskHandle::TaskHandle, deviceNames::String, data::Float64)
    ccall((:DAQmxGetAIConvDigFltrMinPulseWidthEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, deviceNames, data)
end

function SetAIConvDigFltrMinPulseWidthEx(taskHandle::TaskHandle, deviceNames::String, data::Float64)
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

function GetAIConvDigFltrTimebaseRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAIConvDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAIConvDigFltrTimebaseRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetAIConvDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAIConvDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvDigFltrTimebaseRateEx(taskHandle::TaskHandle, deviceNames::String, data::Float64)
    ccall((:DAQmxGetAIConvDigFltrTimebaseRateEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, deviceNames, data)
end

function SetAIConvDigFltrTimebaseRateEx(taskHandle::TaskHandle, deviceNames::String, data::Float64)
    ccall((:DAQmxSetAIConvDigFltrTimebaseRateEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, deviceNames, data)
end

function ResetAIConvDigFltrTimebaseRateEx(taskHandle::TaskHandle, deviceNames::String)
    ccall((:DAQmxResetAIConvDigFltrTimebaseRateEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetAIConvDigSyncEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetAIConvDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAIConvDigSyncEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetAIConvDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAIConvDigSyncEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvDigSyncEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvDigSyncEnableEx(taskHandle::TaskHandle, deviceNames::String, data::UInt32)
    ccall((:DAQmxGetAIConvDigSyncEnableEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, deviceNames, data)
end

function SetAIConvDigSyncEnableEx(taskHandle::TaskHandle, deviceNames::String, data::UInt32)
    ccall((:DAQmxSetAIConvDigSyncEnableEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, deviceNames, data)
end

function ResetAIConvDigSyncEnableEx(taskHandle::TaskHandle, deviceNames::String)
    ccall((:DAQmxResetAIConvDigSyncEnableEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetMasterTimebaseRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetMasterTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetMasterTimebaseRate(taskHandle::TaskHandle, data::Float64)
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

function GetRefClkRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetRefClkRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetRefClkRate(taskHandle::TaskHandle, data::Float64)
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

function GetSyncPulseType(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetSyncPulseType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSyncPulseType(taskHandle::TaskHandle, data::Int32)
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

function GetSyncPulseTimeTimescale(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetSyncPulseTimeTimescale, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSyncPulseTimeTimescale(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetSyncPulseTimeTimescale, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSyncPulseTimeTimescale(taskHandle::TaskHandle)
    ccall((:DAQmxResetSyncPulseTimeTimescale, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSyncPulseSyncTime(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetSyncPulseSyncTime, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function GetSyncPulseMinDelayToStart(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetSyncPulseMinDelayToStart, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetSyncPulseMinDelayToStart(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetSyncPulseMinDelayToStart, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetSyncPulseMinDelayToStart(taskHandle::TaskHandle)
    ccall((:DAQmxResetSyncPulseMinDelayToStart, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSyncPulseResetTime(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetSyncPulseResetTime, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function GetSyncPulseResetDelay(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetSyncPulseResetDelay, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetSyncPulseResetDelay(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetSyncPulseResetDelay, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetSyncPulseResetDelay(taskHandle::TaskHandle)
    ccall((:DAQmxResetSyncPulseResetDelay, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSyncPulseTerm(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetSyncPulseTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetSyncClkInterval(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetSyncClkInterval, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetSyncClkInterval(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetSyncClkInterval, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetSyncClkInterval(taskHandle::TaskHandle)
    ccall((:DAQmxResetSyncClkInterval, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampTimingEngine(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetSampTimingEngine, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetSampTimingEngine(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetSampTimingEngine, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetSampTimingEngine(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampTimingEngine, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetFirstSampTimestampEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetFirstSampTimestampEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetFirstSampTimestampEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetFirstSampTimestampEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetFirstSampTimestampEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetFirstSampTimestampEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetFirstSampTimestampTimescale(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetFirstSampTimestampTimescale, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetFirstSampTimestampTimescale(taskHandle::TaskHandle, data::Int32)
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

function GetFirstSampClkTimescale(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetFirstSampClkTimescale, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetFirstSampClkTimescale(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetFirstSampClkTimescale, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetFirstSampClkTimescale(taskHandle::TaskHandle)
    ccall((:DAQmxResetFirstSampClkTimescale, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigType(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetStartTrigType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetStartTrigType(taskHandle::TaskHandle, data::Int32)
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

function GetDigEdgeStartTrigEdge(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetDigEdgeStartTrigEdge, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDigEdgeStartTrigEdge(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetDigEdgeStartTrigEdge, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDigEdgeStartTrigEdge(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigEdge, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeStartTrigDigFltrEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetDigEdgeStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetDigEdgeStartTrigDigFltrEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetDigEdgeStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetDigEdgeStartTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetDigEdgeStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetDigEdgeStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Float64)
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

function GetDigEdgeStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetDigEdgeStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetDigEdgeStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetDigEdgeStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetDigEdgeStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeStartTrigDigSyncEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetDigEdgeStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetDigEdgeStartTrigDigSyncEnable(taskHandle::TaskHandle, data::UInt32)
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

function GetDigPatternStartTrigWhen(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetDigPatternStartTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDigPatternStartTrigWhen(taskHandle::TaskHandle, data::Int32)
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

function GetAnlgEdgeStartTrigSlope(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetAnlgEdgeStartTrigSlope, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgEdgeStartTrigSlope(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetAnlgEdgeStartTrigSlope, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgEdgeStartTrigSlope(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigSlope, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeStartTrigLvl(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAnlgEdgeStartTrigLvl, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgEdgeStartTrigLvl(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetAnlgEdgeStartTrigLvl, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgEdgeStartTrigLvl(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigLvl, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeStartTrigHyst(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAnlgEdgeStartTrigHyst, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgEdgeStartTrigHyst(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetAnlgEdgeStartTrigHyst, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgEdgeStartTrigHyst(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigHyst, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeStartTrigCoupling(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetAnlgEdgeStartTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgEdgeStartTrigCoupling(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetAnlgEdgeStartTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgEdgeStartTrigCoupling(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigCoupling, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeStartTrigDigFltrEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetAnlgEdgeStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgEdgeStartTrigDigFltrEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetAnlgEdgeStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgEdgeStartTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAnlgEdgeStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgEdgeStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Float64)
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

function GetAnlgEdgeStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAnlgEdgeStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgEdgeStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetAnlgEdgeStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgEdgeStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeStartTrigDigSyncEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetAnlgEdgeStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgEdgeStartTrigDigSyncEnable(taskHandle::TaskHandle, data::UInt32)
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

function GetAnlgWinStartTrigWhen(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetAnlgWinStartTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgWinStartTrigWhen(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetAnlgWinStartTrigWhen, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgWinStartTrigWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinStartTrigTop(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAnlgWinStartTrigTop, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinStartTrigTop(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetAnlgWinStartTrigTop, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinStartTrigTop(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigTop, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinStartTrigBtm(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAnlgWinStartTrigBtm, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinStartTrigBtm(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetAnlgWinStartTrigBtm, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinStartTrigBtm(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigBtm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinStartTrigCoupling(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetAnlgWinStartTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgWinStartTrigCoupling(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetAnlgWinStartTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgWinStartTrigCoupling(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigCoupling, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinStartTrigDigFltrEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetAnlgWinStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgWinStartTrigDigFltrEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetAnlgWinStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgWinStartTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAnlgWinStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Float64)
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

function GetAnlgWinStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAnlgWinStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetAnlgWinStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinStartTrigDigSyncEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetAnlgWinStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgWinStartTrigDigSyncEnable(taskHandle::TaskHandle, data::UInt32)
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

function GetStartTrigTimescale(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetStartTrigTimescale, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetStartTrigTimescale(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetStartTrigTimescale, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetStartTrigTimescale(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigTimescale, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigTimestampEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetStartTrigTimestampEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetStartTrigTimestampEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetStartTrigTimestampEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetStartTrigTimestampEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigTimestampEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigTimestampTimescale(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetStartTrigTimestampTimescale, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetStartTrigTimestampTimescale(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetStartTrigTimestampTimescale, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetStartTrigTimestampTimescale(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigTimestampTimescale, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigTimestampVal(taskHandle::TaskHandle, data::Vector{CVIAbsoluteTime})
    ccall((:DAQmxGetStartTrigTimestampVal, :libnidaqmx), Cint, (TaskHandle, Ref{CVIAbsoluteTime}), taskHandle, data)
end

function GetStartTrigDelay(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetStartTrigDelay, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetStartTrigDelay(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetStartTrigDelay, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetStartTrigDelay(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigDelay, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigDelayUnits(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetStartTrigDelayUnits, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetStartTrigDelayUnits(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetStartTrigDelayUnits, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetStartTrigDelayUnits(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigDelayUnits, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigRetriggerable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetStartTrigRetriggerable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetStartTrigRetriggerable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetStartTrigRetriggerable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetStartTrigRetriggerable(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigRetriggerable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigTrigWin(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetStartTrigTrigWin, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetStartTrigTrigWin(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetStartTrigTrigWin, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetStartTrigTrigWin(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigTrigWin, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigRetriggerWin(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetStartTrigRetriggerWin, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetStartTrigRetriggerWin(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetStartTrigRetriggerWin, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetStartTrigRetriggerWin(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigRetriggerWin, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigMaxNumTrigsToDetect(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetStartTrigMaxNumTrigsToDetect, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetStartTrigMaxNumTrigsToDetect(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetStartTrigMaxNumTrigsToDetect, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetStartTrigMaxNumTrigsToDetect(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigMaxNumTrigsToDetect, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigType(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetRefTrigType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetRefTrigType(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetRefTrigType, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetRefTrigType(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigType, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigPretrigSamples(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetRefTrigPretrigSamples, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetRefTrigPretrigSamples(taskHandle::TaskHandle, data::UInt32)
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

function GetDigEdgeRefTrigEdge(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetDigEdgeRefTrigEdge, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDigEdgeRefTrigEdge(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetDigEdgeRefTrigEdge, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDigEdgeRefTrigEdge(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigEdge, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeRefTrigDigFltrEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetDigEdgeRefTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetDigEdgeRefTrigDigFltrEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetDigEdgeRefTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetDigEdgeRefTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeRefTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetDigEdgeRefTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetDigEdgeRefTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Float64)
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

function GetDigEdgeRefTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetDigEdgeRefTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetDigEdgeRefTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetDigEdgeRefTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetDigEdgeRefTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeRefTrigDigSyncEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetDigEdgeRefTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetDigEdgeRefTrigDigSyncEnable(taskHandle::TaskHandle, data::UInt32)
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

function GetDigPatternRefTrigWhen(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetDigPatternRefTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDigPatternRefTrigWhen(taskHandle::TaskHandle, data::Int32)
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

function GetAnlgEdgeRefTrigSlope(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetAnlgEdgeRefTrigSlope, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgEdgeRefTrigSlope(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetAnlgEdgeRefTrigSlope, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgEdgeRefTrigSlope(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigSlope, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeRefTrigLvl(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAnlgEdgeRefTrigLvl, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgEdgeRefTrigLvl(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetAnlgEdgeRefTrigLvl, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgEdgeRefTrigLvl(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigLvl, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeRefTrigHyst(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAnlgEdgeRefTrigHyst, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgEdgeRefTrigHyst(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetAnlgEdgeRefTrigHyst, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgEdgeRefTrigHyst(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigHyst, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeRefTrigCoupling(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetAnlgEdgeRefTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgEdgeRefTrigCoupling(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetAnlgEdgeRefTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgEdgeRefTrigCoupling(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigCoupling, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeRefTrigDigFltrEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetAnlgEdgeRefTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgEdgeRefTrigDigFltrEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetAnlgEdgeRefTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgEdgeRefTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeRefTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAnlgEdgeRefTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgEdgeRefTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Float64)
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

function GetAnlgEdgeRefTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAnlgEdgeRefTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgEdgeRefTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetAnlgEdgeRefTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgEdgeRefTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeRefTrigDigSyncEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetAnlgEdgeRefTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgEdgeRefTrigDigSyncEnable(taskHandle::TaskHandle, data::UInt32)
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

function GetAnlgWinRefTrigWhen(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetAnlgWinRefTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgWinRefTrigWhen(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetAnlgWinRefTrigWhen, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgWinRefTrigWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinRefTrigTop(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAnlgWinRefTrigTop, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinRefTrigTop(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetAnlgWinRefTrigTop, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinRefTrigTop(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigTop, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinRefTrigBtm(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAnlgWinRefTrigBtm, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinRefTrigBtm(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetAnlgWinRefTrigBtm, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinRefTrigBtm(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigBtm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinRefTrigCoupling(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetAnlgWinRefTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgWinRefTrigCoupling(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetAnlgWinRefTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgWinRefTrigCoupling(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigCoupling, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinRefTrigDigFltrEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetAnlgWinRefTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgWinRefTrigDigFltrEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetAnlgWinRefTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgWinRefTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinRefTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAnlgWinRefTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinRefTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Float64)
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

function GetAnlgWinRefTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAnlgWinRefTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinRefTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetAnlgWinRefTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinRefTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinRefTrigDigSyncEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetAnlgWinRefTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgWinRefTrigDigSyncEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetAnlgWinRefTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgWinRefTrigDigSyncEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigAutoTrigEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetRefTrigAutoTrigEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetRefTrigAutoTrigEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetRefTrigAutoTrigEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetRefTrigAutoTrigEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigAutoTrigEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigAutoTriggered(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetRefTrigAutoTriggered, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetRefTrigTimestampEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetRefTrigTimestampEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetRefTrigTimestampEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetRefTrigTimestampEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetRefTrigTimestampEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigTimestampEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigTimestampTimescale(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetRefTrigTimestampTimescale, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetRefTrigTimestampTimescale(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetRefTrigTimestampTimescale, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetRefTrigTimestampTimescale(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigTimestampTimescale, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigTimestampVal(taskHandle::TaskHandle, data::Vector{CVIAbsoluteTime})
    ccall((:DAQmxGetRefTrigTimestampVal, :libnidaqmx), Cint, (TaskHandle, Ref{CVIAbsoluteTime}), taskHandle, data)
end

function GetRefTrigDelay(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetRefTrigDelay, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetRefTrigDelay(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetRefTrigDelay, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetRefTrigDelay(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigDelay, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigRetriggerable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetRefTrigRetriggerable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetRefTrigRetriggerable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetRefTrigRetriggerable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetRefTrigRetriggerable(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigRetriggerable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigTrigWin(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetRefTrigTrigWin, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetRefTrigTrigWin(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetRefTrigTrigWin, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetRefTrigTrigWin(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigTrigWin, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigRetriggerWin(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetRefTrigRetriggerWin, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetRefTrigRetriggerWin(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetRefTrigRetriggerWin, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetRefTrigRetriggerWin(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigRetriggerWin, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigMaxNumTrigsToDetect(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetRefTrigMaxNumTrigsToDetect, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetRefTrigMaxNumTrigsToDetect(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetRefTrigMaxNumTrigsToDetect, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetRefTrigMaxNumTrigsToDetect(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigMaxNumTrigsToDetect, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAdvTrigType(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetAdvTrigType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAdvTrigType(taskHandle::TaskHandle, data::Int32)
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

function GetDigEdgeAdvTrigEdge(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetDigEdgeAdvTrigEdge, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDigEdgeAdvTrigEdge(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetDigEdgeAdvTrigEdge, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDigEdgeAdvTrigEdge(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeAdvTrigEdge, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeAdvTrigDigFltrEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetDigEdgeAdvTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetDigEdgeAdvTrigDigFltrEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetDigEdgeAdvTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetDigEdgeAdvTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeAdvTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetHshkTrigType(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetHshkTrigType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetHshkTrigType(taskHandle::TaskHandle, data::Int32)
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

function GetInterlockedHshkTrigAssertedLvl(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetInterlockedHshkTrigAssertedLvl, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetInterlockedHshkTrigAssertedLvl(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetInterlockedHshkTrigAssertedLvl, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetInterlockedHshkTrigAssertedLvl(taskHandle::TaskHandle)
    ccall((:DAQmxResetInterlockedHshkTrigAssertedLvl, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetPauseTrigType(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetPauseTrigType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetPauseTrigType(taskHandle::TaskHandle, data::Int32)
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

function GetAnlgLvlPauseTrigWhen(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetAnlgLvlPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgLvlPauseTrigWhen(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetAnlgLvlPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgLvlPauseTrigWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgLvlPauseTrigLvl(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAnlgLvlPauseTrigLvl, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgLvlPauseTrigLvl(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetAnlgLvlPauseTrigLvl, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgLvlPauseTrigLvl(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigLvl, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgLvlPauseTrigHyst(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAnlgLvlPauseTrigHyst, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgLvlPauseTrigHyst(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetAnlgLvlPauseTrigHyst, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgLvlPauseTrigHyst(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigHyst, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgLvlPauseTrigCoupling(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetAnlgLvlPauseTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgLvlPauseTrigCoupling(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetAnlgLvlPauseTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgLvlPauseTrigCoupling(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigCoupling, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgLvlPauseTrigDigFltrEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetAnlgLvlPauseTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgLvlPauseTrigDigFltrEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetAnlgLvlPauseTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgLvlPauseTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgLvlPauseTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAnlgLvlPauseTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgLvlPauseTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Float64)
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

function GetAnlgLvlPauseTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAnlgLvlPauseTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgLvlPauseTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetAnlgLvlPauseTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgLvlPauseTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgLvlPauseTrigDigSyncEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetAnlgLvlPauseTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgLvlPauseTrigDigSyncEnable(taskHandle::TaskHandle, data::UInt32)
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

function GetAnlgWinPauseTrigWhen(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetAnlgWinPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgWinPauseTrigWhen(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetAnlgWinPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgWinPauseTrigWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinPauseTrigTop(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAnlgWinPauseTrigTop, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinPauseTrigTop(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetAnlgWinPauseTrigTop, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinPauseTrigTop(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigTop, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinPauseTrigBtm(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAnlgWinPauseTrigBtm, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinPauseTrigBtm(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetAnlgWinPauseTrigBtm, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinPauseTrigBtm(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigBtm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinPauseTrigCoupling(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetAnlgWinPauseTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgWinPauseTrigCoupling(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetAnlgWinPauseTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgWinPauseTrigCoupling(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigCoupling, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinPauseTrigDigFltrEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetAnlgWinPauseTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgWinPauseTrigDigFltrEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetAnlgWinPauseTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgWinPauseTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinPauseTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAnlgWinPauseTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinPauseTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Float64)
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

function GetAnlgWinPauseTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetAnlgWinPauseTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinPauseTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetAnlgWinPauseTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinPauseTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinPauseTrigDigSyncEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetAnlgWinPauseTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgWinPauseTrigDigSyncEnable(taskHandle::TaskHandle, data::UInt32)
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

function GetDigLvlPauseTrigWhen(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetDigLvlPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDigLvlPauseTrigWhen(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetDigLvlPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDigLvlPauseTrigWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigLvlPauseTrigDigFltrEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetDigLvlPauseTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetDigLvlPauseTrigDigFltrEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetDigLvlPauseTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetDigLvlPauseTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigLvlPauseTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetDigLvlPauseTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetDigLvlPauseTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Float64)
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

function GetDigLvlPauseTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetDigLvlPauseTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetDigLvlPauseTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetDigLvlPauseTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetDigLvlPauseTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigLvlPauseTrigDigSyncEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetDigLvlPauseTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetDigLvlPauseTrigDigSyncEnable(taskHandle::TaskHandle, data::UInt32)
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

function GetDigPatternPauseTrigWhen(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetDigPatternPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDigPatternPauseTrigWhen(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetDigPatternPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDigPatternPauseTrigWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigPatternPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetArmStartTrigType(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetArmStartTrigType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetArmStartTrigType(taskHandle::TaskHandle, data::Int32)
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

function GetDigEdgeArmStartTrigEdge(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetDigEdgeArmStartTrigEdge, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDigEdgeArmStartTrigEdge(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetDigEdgeArmStartTrigEdge, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDigEdgeArmStartTrigEdge(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigEdge, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeArmStartTrigDigFltrEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetDigEdgeArmStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetDigEdgeArmStartTrigDigFltrEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetDigEdgeArmStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetDigEdgeArmStartTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeArmStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetDigEdgeArmStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetDigEdgeArmStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Float64)
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

function GetDigEdgeArmStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetDigEdgeArmStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetDigEdgeArmStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetDigEdgeArmStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetDigEdgeArmStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeArmStartTrigDigSyncEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetDigEdgeArmStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetDigEdgeArmStartTrigDigSyncEnable(taskHandle::TaskHandle, data::UInt32)
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

function GetArmStartTrigTimescale(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetArmStartTrigTimescale, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetArmStartTrigTimescale(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetArmStartTrigTimescale, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetArmStartTrigTimescale(taskHandle::TaskHandle)
    ccall((:DAQmxResetArmStartTrigTimescale, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetArmStartTrigTimestampEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetArmStartTrigTimestampEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetArmStartTrigTimestampEnable(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxSetArmStartTrigTimestampEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetArmStartTrigTimestampEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetArmStartTrigTimestampEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetArmStartTrigTimestampTimescale(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetArmStartTrigTimestampTimescale, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetArmStartTrigTimestampTimescale(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetArmStartTrigTimestampTimescale, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetArmStartTrigTimestampTimescale(taskHandle::TaskHandle)
    ccall((:DAQmxResetArmStartTrigTimestampTimescale, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetArmStartTrigTimestampVal(taskHandle::TaskHandle, data::Vector{CVIAbsoluteTime})
    ccall((:DAQmxGetArmStartTrigTimestampVal, :libnidaqmx), Cint, (TaskHandle, Ref{CVIAbsoluteTime}), taskHandle, data)
end

function GetTriggerSyncType(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetTriggerSyncType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetTriggerSyncType(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetTriggerSyncType, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetTriggerSyncType(taskHandle::TaskHandle)
    ccall((:DAQmxResetTriggerSyncType, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetWatchdogTimeout(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetWatchdogTimeout, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetWatchdogTimeout(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetWatchdogTimeout, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetWatchdogTimeout(taskHandle::TaskHandle)
    ccall((:DAQmxResetWatchdogTimeout, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetWatchdogExpirTrigType(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetWatchdogExpirTrigType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetWatchdogExpirTrigType(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetWatchdogExpirTrigType, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetWatchdogExpirTrigType(taskHandle::TaskHandle)
    ccall((:DAQmxResetWatchdogExpirTrigType, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetWatchdogExpirTrigTrigOnNetworkConnLoss(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetWatchdogExpirTrigTrigOnNetworkConnLoss, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetWatchdogExpirTrigTrigOnNetworkConnLoss(taskHandle::TaskHandle, data::UInt32)
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

function GetDigEdgeWatchdogExpirTrigEdge(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetDigEdgeWatchdogExpirTrigEdge, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDigEdgeWatchdogExpirTrigEdge(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetDigEdgeWatchdogExpirTrigEdge, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDigEdgeWatchdogExpirTrigEdge(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeWatchdogExpirTrigEdge, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetWatchdogDOExpirState(taskHandle::TaskHandle, lines::String, data::Int32)
    ccall((:DAQmxGetWatchdogDOExpirState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, lines, data)
end

function SetWatchdogDOExpirState(taskHandle::TaskHandle, lines::String, data::Int32)
    ccall((:DAQmxSetWatchdogDOExpirState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, lines, data)
end

function ResetWatchdogDOExpirState(taskHandle::TaskHandle, lines::String)
    ccall((:DAQmxResetWatchdogDOExpirState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, lines)
end

function GetWatchdogAOOutputType(taskHandle::TaskHandle, lines::String, data::Int32)
    ccall((:DAQmxGetWatchdogAOOutputType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, lines, data)
end

function SetWatchdogAOOutputType(taskHandle::TaskHandle, lines::String, data::Int32)
    ccall((:DAQmxSetWatchdogAOOutputType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, lines, data)
end

function ResetWatchdogAOOutputType(taskHandle::TaskHandle, lines::String)
    ccall((:DAQmxResetWatchdogAOOutputType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, lines)
end

function GetWatchdogAOExpirState(taskHandle::TaskHandle, lines::String, data::Float64)
    ccall((:DAQmxGetWatchdogAOExpirState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, lines, data)
end

function SetWatchdogAOExpirState(taskHandle::TaskHandle, lines::String, data::Float64)
    ccall((:DAQmxSetWatchdogAOExpirState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, lines, data)
end

function ResetWatchdogAOExpirState(taskHandle::TaskHandle, lines::String)
    ccall((:DAQmxResetWatchdogAOExpirState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, lines)
end

function GetWatchdogCOExpirState(taskHandle::TaskHandle, lines::String, data::Int32)
    ccall((:DAQmxGetWatchdogCOExpirState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, lines, data)
end

function SetWatchdogCOExpirState(taskHandle::TaskHandle, lines::String, data::Int32)
    ccall((:DAQmxSetWatchdogCOExpirState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, lines, data)
end

function ResetWatchdogCOExpirState(taskHandle::TaskHandle, lines::String)
    ccall((:DAQmxResetWatchdogCOExpirState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, lines)
end

function GetWatchdogHasExpired(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetWatchdogHasExpired, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteRelativeTo(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetWriteRelativeTo, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetWriteRelativeTo(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetWriteRelativeTo, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetWriteRelativeTo(taskHandle::TaskHandle)
    ccall((:DAQmxResetWriteRelativeTo, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetWriteOffset(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetWriteOffset, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetWriteOffset(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetWriteOffset, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetWriteOffset(taskHandle::TaskHandle)
    ccall((:DAQmxResetWriteOffset, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetWriteRegenMode(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetWriteRegenMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetWriteRegenMode(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetWriteRegenMode, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetWriteRegenMode(taskHandle::TaskHandle)
    ccall((:DAQmxResetWriteRegenMode, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetWriteCurrWritePos(taskHandle::TaskHandle, data::Vector{Culonglong})
    ccall((:DAQmxGetWriteCurrWritePos, :libnidaqmx), Cint, (TaskHandle, Ref{Culonglong}), taskHandle, data)
end

function GetWriteOvercurrentChansExist(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetWriteOvercurrentChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteOvercurrentChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetWriteOvercurrentChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetWriteOvertemperatureChansExist(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetWriteOvertemperatureChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteOvertemperatureChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetWriteOvertemperatureChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetWriteExternalOvervoltageChansExist(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetWriteExternalOvervoltageChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteExternalOvervoltageChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetWriteExternalOvervoltageChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetWriteOverloadedChansExist(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetWriteOverloadedChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteOverloadedChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetWriteOverloadedChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetWriteOpenCurrentLoopChansExist(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetWriteOpenCurrentLoopChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteOpenCurrentLoopChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetWriteOpenCurrentLoopChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetWritePowerSupplyFaultChansExist(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetWritePowerSupplyFaultChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWritePowerSupplyFaultChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetWritePowerSupplyFaultChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetWriteSyncUnlockedChansExist(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetWriteSyncUnlockedChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteSyncUnlockedChans(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetWriteSyncUnlockedChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetWriteSpaceAvail(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetWriteSpaceAvail, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteTotalSampPerChanGenerated(taskHandle::TaskHandle, data::Vector{Culonglong})
    ccall((:DAQmxGetWriteTotalSampPerChanGenerated, :libnidaqmx), Cint, (TaskHandle, Ref{Culonglong}), taskHandle, data)
end

function GetWriteAccessoryInsertionOrRemovalDetected(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetWriteAccessoryInsertionOrRemovalDetected, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteDevsWithInsertedOrRemovedAccessories(taskHandle::TaskHandle, data::Vector{UInt8}, bufferSize::UInt32)
    ccall((:DAQmxGetWriteDevsWithInsertedOrRemovedAccessories, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetWriteRawDataWidth(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetWriteRawDataWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteNumChans(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetWriteNumChans, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteWaitMode(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetWriteWaitMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetWriteWaitMode(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetWriteWaitMode, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetWriteWaitMode(taskHandle::TaskHandle)
    ccall((:DAQmxResetWriteWaitMode, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetWriteSleepTime(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxGetWriteSleepTime, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetWriteSleepTime(taskHandle::TaskHandle, data::Float64)
    ccall((:DAQmxSetWriteSleepTime, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetWriteSleepTime(taskHandle::TaskHandle)
    ccall((:DAQmxResetWriteSleepTime, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetWriteDigitalLinesBytesPerChan(taskHandle::TaskHandle, data::UInt32)
    ccall((:DAQmxGetWriteDigitalLinesBytesPerChan, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetSampClkTimingResponseMode(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxGetSampClkTimingResponseMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSampClkTimingResponseMode(taskHandle::TaskHandle, data::Int32)
    ccall((:DAQmxSetSampClkTimingResponseMode, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSampClkTimingResponseMode(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkTimingResponseMode, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end
