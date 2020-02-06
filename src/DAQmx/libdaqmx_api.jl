
# Task functions

function LoadTask(taskName::Ref{UInt8}, taskHandle::Ref{TaskHandle})
    ccall((:DAQmxLoadTask, :libnidaqmx), Cint, (Ref{UInt8}, Ref{TaskHandle}), taskName, taskHandle)
end

function CreateTask(taskName::String, taskHandle::Ref{TaskHandle})
    ccall((:DAQmxCreateTask, :libnidaqmx), Cint, (Cstring, Ref{TaskHandle}), taskName, taskHandle)
end

function AddGlobalChansToTask(taskHandle::TaskHandle, channelNames::Ref{UInt8})
    ccall((:DAQmxAddGlobalChansToTask, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channelNames)
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

function WaitUntilTaskDone(taskHandle::TaskHandle, timeToWait::Cdouble)
    ccall((:DAQmxWaitUntilTaskDone, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, timeToWait)
end

function WaitForValidTimestamp(taskHandle::TaskHandle, timestampEvent::Cint, timeout::Cdouble, timestamp::Ref{CVIAbsoluteTime})
    ccall((:DAQmxWaitForValidTimestamp, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Ref{CVIAbsoluteTime}), taskHandle, timestampEvent, timeout, timestamp)
end

function IsTaskDone(taskHandle::TaskHandle, isTaskDone::Ref{Cuint})
    ccall((:DAQmxIsTaskDone, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, isTaskDone)
end

function TaskControl(taskHandle::TaskHandle, action::Cint)
    ccall((:DAQmxTaskControl, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, action)
end

function GetNthTaskChannel(taskHandle::TaskHandle, index::Cuint, buffer::Ref{UInt8}, bufferSize::Cint)
    ccall((:DAQmxGetNthTaskChannel, :libnidaqmx), Cint, (TaskHandle, Cuint, Ref{UInt8}, Cint), taskHandle, index, buffer, bufferSize)
end

function GetNthTaskDevice(taskHandle::TaskHandle, index::Cuint, buffer::Ref{UInt8}, bufferSize::Cint)
    ccall((:DAQmxGetNthTaskDevice, :libnidaqmx), Cint, (TaskHandle, Cuint, Ref{UInt8}, Cint), taskHandle, index, buffer, bufferSize)
end

function GetTaskAttribute(taskHandle::TaskHandle, attribute::Cint, value::Ref{Cvoid})
    ccall((:DAQmxGetTaskAttribute, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{Cvoid}), taskHandle, attribute, value)
end

function RegisterEveryNSamplesEvent(task::TaskHandle, everyNsamplesEventType::Cint, nSamples::Cuint, options::Cuint, callbackFunction::EveryNSamplesEventCallbackPtr, callbackData::Ref{Cvoid})
    ccall((:DAQmxRegisterEveryNSamplesEvent, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cuint, EveryNSamplesEventCallbackPtr, Ref{Cvoid}), task, everyNsamplesEventType, nSamples, options, callbackFunction, callbackData)
end

function RegisterDoneEvent(task::TaskHandle, options::Cuint, callbackFunction::DoneEventCallbackPtr, callbackData::Ref{Cvoid})
    ccall((:DAQmxRegisterDoneEvent, :libnidaqmx), Cint, (TaskHandle, Cuint, DoneEventCallbackPtr, Ref{Cvoid}), task, options, callbackFunction, callbackData)
end

function RegisterSignalEvent(task::TaskHandle, signalID::Cint, options::Cuint, callbackFunction::SignalEventCallbackPtr, callbackData::Ref{Cvoid})
    ccall((:DAQmxRegisterSignalEvent, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, SignalEventCallbackPtr, Ref{Cvoid}), task, signalID, options, callbackFunction, callbackData)
end

#### Channel functions ####
# Channel creation

function CreateAIVoltageChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, terminalConfig::Cint, minVal::Cdouble, maxVal::Cdouble, units::Cint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAIVoltageChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
end

function CreateAICurrentChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, terminalConfig::Cint, minVal::Cdouble, maxVal::Cdouble, units::Cint, shuntResistorLoc::Cint, extShuntResistorVal::Cdouble, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAICurrentChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName)
end

function CreateAIVoltageRMSChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, terminalConfig::Cint, minVal::Cdouble, maxVal::Cdouble, units::Cint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAIVoltageRMSChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
end

function CreateAICurrentRMSChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, terminalConfig::Cint, minVal::Cdouble, maxVal::Cdouble, units::Cint, shuntResistorLoc::Cint, extShuntResistorVal::Cdouble, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAICurrentRMSChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName)
end

function CreateAIThrmcplChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, thermocoupleType::Cint, cjcSource::Cint, cjcVal::Cdouble, cjcChannel::Ref{UInt8})
    ccall((:DAQmxCreateAIThrmcplChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, thermocoupleType, cjcSource, cjcVal, cjcChannel)
end

function CreateAIRTDChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, rtdType::Cint, resistanceConfig::Cint, currentExcitSource::Cint, currentExcitVal::Cdouble, r0::Cdouble)
    ccall((:DAQmxCreateAIRTDChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cint, Cdouble, Cdouble), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, rtdType, resistanceConfig, currentExcitSource, currentExcitVal, r0)
end

function CreateAIThrmstrChanIex(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, resistanceConfig::Cint, currentExcitSource::Cint, currentExcitVal::Cdouble, a::Cdouble, b::Cdouble, c::Cdouble)
    ccall((:DAQmxCreateAIThrmstrChanIex, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Cdouble, Cdouble), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal, a, b, c)
end

function CreateAIThrmstrChanVex(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, resistanceConfig::Cint, voltageExcitSource::Cint, voltageExcitVal::Cdouble, a::Cdouble, b::Cdouble, c::Cdouble, r1::Cdouble)
    ccall((:DAQmxCreateAIThrmstrChanVex, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, voltageExcitSource, voltageExcitVal, a, b, c, r1)
end

function CreateAIFreqVoltageChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, thresholdLevel::Cdouble, hysteresis::Cdouble, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAIFreqVoltageChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cdouble, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, thresholdLevel, hysteresis, customScaleName)
end

function CreateAIResistanceChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, resistanceConfig::Cint, currentExcitSource::Cint, currentExcitVal::Cdouble, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAIResistanceChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal, customScaleName)
end

function CreateAIStrainGageChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, strainConfig::Cint, voltageExcitSource::Cint, voltageExcitVal::Cdouble, gageFactor::Cdouble, initialBridgeVoltage::Cdouble, nominalGageResistance::Cdouble, poissonRatio::Cdouble, leadWireResistance::Cdouble, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAIStrainGageChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, strainConfig, voltageExcitSource, voltageExcitVal, gageFactor, initialBridgeVoltage, nominalGageResistance, poissonRatio, leadWireResistance, customScaleName)
end

function CreateAIRosetteStrainGageChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, rosetteType::Cint, gageOrientation::Cdouble, rosetteMeasTypes::Ref{Cint}, numRosetteMeasTypes::Cuint, strainConfig::Cint, voltageExcitSource::Cint, voltageExcitVal::Cdouble, gageFactor::Cdouble, nominalGageResistance::Cdouble, poissonRatio::Cdouble, leadWireResistance::Cdouble)
    ccall((:DAQmxCreateAIRosetteStrainGageChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cdouble, Ref{Cint}, Cuint, Cint, Cint, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, rosetteType, gageOrientation, rosetteMeasTypes, numRosetteMeasTypes, strainConfig, voltageExcitSource, voltageExcitVal, gageFactor, nominalGageResistance, poissonRatio, leadWireResistance)
end

function CreateAIForceBridgeTwoPointLinChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, bridgeConfig::Cint, voltageExcitSource::Cint, voltageExcitVal::Cdouble, nominalBridgeResistance::Cdouble, firstElectricalVal::Cdouble, secondElectricalVal::Cdouble, electricalUnits::Cint, firstPhysicalVal::Cdouble, secondPhysicalVal::Cdouble, physicalUnits::Cint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAIForceBridgeTwoPointLinChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Cdouble, Cdouble, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, firstElectricalVal, secondElectricalVal, electricalUnits, firstPhysicalVal, secondPhysicalVal, physicalUnits, customScaleName)
end

function CreateAIForceBridgeTableChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, bridgeConfig::Cint, voltageExcitSource::Cint, voltageExcitVal::Cdouble, nominalBridgeResistance::Cdouble, electricalVals::Ref{Cdouble}, numElectricalVals::Cuint, electricalUnits::Cint, physicalVals::Ref{Cdouble}, numPhysicalVals::Cuint, physicalUnits::Cint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAIForceBridgeTableChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Ref{Cdouble}, Cuint, Cint, Ref{Cdouble}, Cuint, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, electricalVals, numElectricalVals, electricalUnits, physicalVals, numPhysicalVals, physicalUnits, customScaleName)
end

function CreateAIForceBridgePolynomialChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, bridgeConfig::Cint, voltageExcitSource::Cint, voltageExcitVal::Cdouble, nominalBridgeResistance::Cdouble, forwardCoeffs::Ref{Cdouble}, numForwardCoeffs::Cuint, reverseCoeffs::Ref{Cdouble}, numReverseCoeffs::Cuint, electricalUnits::Cint, physicalUnits::Cint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAIForceBridgePolynomialChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Ref{Cdouble}, Cuint, Ref{Cdouble}, Cuint, Cint, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, forwardCoeffs, numForwardCoeffs, reverseCoeffs, numReverseCoeffs, electricalUnits, physicalUnits, customScaleName)
end

function CreateAIPressureBridgeTwoPointLinChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, bridgeConfig::Cint, voltageExcitSource::Cint, voltageExcitVal::Cdouble, nominalBridgeResistance::Cdouble, firstElectricalVal::Cdouble, secondElectricalVal::Cdouble, electricalUnits::Cint, firstPhysicalVal::Cdouble, secondPhysicalVal::Cdouble, physicalUnits::Cint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAIPressureBridgeTwoPointLinChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Cdouble, Cdouble, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, firstElectricalVal, secondElectricalVal, electricalUnits, firstPhysicalVal, secondPhysicalVal, physicalUnits, customScaleName)
end

function CreateAIPressureBridgeTableChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, bridgeConfig::Cint, voltageExcitSource::Cint, voltageExcitVal::Cdouble, nominalBridgeResistance::Cdouble, electricalVals::Ref{Cdouble}, numElectricalVals::Cuint, electricalUnits::Cint, physicalVals::Ref{Cdouble}, numPhysicalVals::Cuint, physicalUnits::Cint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAIPressureBridgeTableChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Ref{Cdouble}, Cuint, Cint, Ref{Cdouble}, Cuint, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, electricalVals, numElectricalVals, electricalUnits, physicalVals, numPhysicalVals, physicalUnits, customScaleName)
end

function CreateAIPressureBridgePolynomialChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, bridgeConfig::Cint, voltageExcitSource::Cint, voltageExcitVal::Cdouble, nominalBridgeResistance::Cdouble, forwardCoeffs::Ref{Cdouble}, numForwardCoeffs::Cuint, reverseCoeffs::Ref{Cdouble}, numReverseCoeffs::Cuint, electricalUnits::Cint, physicalUnits::Cint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAIPressureBridgePolynomialChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Ref{Cdouble}, Cuint, Ref{Cdouble}, Cuint, Cint, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, forwardCoeffs, numForwardCoeffs, reverseCoeffs, numReverseCoeffs, electricalUnits, physicalUnits, customScaleName)
end

function CreateAITorqueBridgeTwoPointLinChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, bridgeConfig::Cint, voltageExcitSource::Cint, voltageExcitVal::Cdouble, nominalBridgeResistance::Cdouble, firstElectricalVal::Cdouble, secondElectricalVal::Cdouble, electricalUnits::Cint, firstPhysicalVal::Cdouble, secondPhysicalVal::Cdouble, physicalUnits::Cint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAITorqueBridgeTwoPointLinChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Cdouble, Cdouble, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, firstElectricalVal, secondElectricalVal, electricalUnits, firstPhysicalVal, secondPhysicalVal, physicalUnits, customScaleName)
end

function CreateAITorqueBridgeTableChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, bridgeConfig::Cint, voltageExcitSource::Cint, voltageExcitVal::Cdouble, nominalBridgeResistance::Cdouble, electricalVals::Ref{Cdouble}, numElectricalVals::Cuint, electricalUnits::Cint, physicalVals::Ref{Cdouble}, numPhysicalVals::Cuint, physicalUnits::Cint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAITorqueBridgeTableChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Ref{Cdouble}, Cuint, Cint, Ref{Cdouble}, Cuint, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, electricalVals, numElectricalVals, electricalUnits, physicalVals, numPhysicalVals, physicalUnits, customScaleName)
end

function CreateAITorqueBridgePolynomialChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, bridgeConfig::Cint, voltageExcitSource::Cint, voltageExcitVal::Cdouble, nominalBridgeResistance::Cdouble, forwardCoeffs::Ref{Cdouble}, numForwardCoeffs::Cuint, reverseCoeffs::Ref{Cdouble}, numReverseCoeffs::Cuint, electricalUnits::Cint, physicalUnits::Cint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAITorqueBridgePolynomialChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Ref{Cdouble}, Cuint, Ref{Cdouble}, Cuint, Cint, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, forwardCoeffs, numForwardCoeffs, reverseCoeffs, numReverseCoeffs, electricalUnits, physicalUnits, customScaleName)
end

function CreateAIBridgeChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, bridgeConfig::Cint, voltageExcitSource::Cint, voltageExcitVal::Cdouble, nominalBridgeResistance::Cdouble, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAIBridgeChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, customScaleName)
end

function CreateAIVoltageChanWithExcit(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, terminalConfig::Cint, minVal::Cdouble, maxVal::Cdouble, units::Cint, bridgeConfig::Cint, voltageExcitSource::Cint, voltageExcitVal::Cdouble, useExcitForScaling::Cuint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAIVoltageChanWithExcit, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cuint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, useExcitForScaling, customScaleName)
end

function CreateAITempBuiltInSensorChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, units::Cint)
    ccall((:DAQmxCreateAITempBuiltInSensorChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint), taskHandle, physicalChannel, nameToAssignToChannel, units)
end

function CreateAIAccelChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, terminalConfig::Cint, minVal::Cdouble, maxVal::Cdouble, units::Cint, sensitivity::Cdouble, sensitivityUnits::Cint, currentExcitSource::Cint, currentExcitVal::Cdouble, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAIAccelChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, currentExcitSource, currentExcitVal, customScaleName)
end

function CreateAIVelocityIEPEChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, terminalConfig::Cint, minVal::Cdouble, maxVal::Cdouble, units::Cint, sensitivity::Cdouble, sensitivityUnits::Cint, currentExcitSource::Cint, currentExcitVal::Cdouble, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAIVelocityIEPEChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, currentExcitSource, currentExcitVal, customScaleName)
end

function CreateAIForceIEPEChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, terminalConfig::Cint, minVal::Cdouble, maxVal::Cdouble, units::Cint, sensitivity::Cdouble, sensitivityUnits::Cint, currentExcitSource::Cint, currentExcitVal::Cdouble, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAIForceIEPEChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, currentExcitSource, currentExcitVal, customScaleName)
end

function CreateAIMicrophoneChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, terminalConfig::Cint, units::Cint, micSensitivity::Cdouble, maxSndPressLevel::Cdouble, currentExcitSource::Cint, currentExcitVal::Cdouble, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAIMicrophoneChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cint, Cdouble, Cdouble, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, units, micSensitivity, maxSndPressLevel, currentExcitSource, currentExcitVal, customScaleName)
end

function CreateAIChargeChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, terminalConfig::Cint, minVal::Cdouble, maxVal::Cdouble, units::Cint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAIChargeChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
end

function CreateAIAccelChargeChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, terminalConfig::Cint, minVal::Cdouble, maxVal::Cdouble, units::Cint, sensitivity::Cdouble, sensitivityUnits::Cint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAIAccelChargeChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, customScaleName)
end

function CreateAIAccel4WireDCVoltageChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, terminalConfig::Cint, minVal::Cdouble, maxVal::Cdouble, units::Cint, sensitivity::Cdouble, sensitivityUnits::Cint, voltageExcitSource::Cint, voltageExcitVal::Cdouble, useExcitForScaling::Cuint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAIAccel4WireDCVoltageChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cdouble, Cint, Cint, Cdouble, Cuint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, voltageExcitSource, voltageExcitVal, useExcitForScaling, customScaleName)
end

function CreateAIPosLVDTChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, sensitivity::Cdouble, sensitivityUnits::Cint, voltageExcitSource::Cint, voltageExcitVal::Cdouble, voltageExcitFreq::Cdouble, ACExcitWireMode::Cint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAIPosLVDTChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cdouble, Cint, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, sensitivity, sensitivityUnits, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
end

function CreateAIPosRVDTChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, sensitivity::Cdouble, sensitivityUnits::Cint, voltageExcitSource::Cint, voltageExcitVal::Cdouble, voltageExcitFreq::Cdouble, ACExcitWireMode::Cint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAIPosRVDTChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cdouble, Cint, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, sensitivity, sensitivityUnits, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
end

function CreateAIPosEddyCurrProxProbeChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, sensitivity::Cdouble, sensitivityUnits::Cint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAIPosEddyCurrProxProbeChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, sensitivity, sensitivityUnits, customScaleName)
end

function CreateAIDeviceTempChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, units::Cint)
    ccall((:DAQmxCreateAIDeviceTempChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint), taskHandle, physicalChannel, nameToAssignToChannel, units)
end

function CreateTEDSAIVoltageChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, terminalConfig::Cint, minVal::Cdouble, maxVal::Cdouble, units::Cint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateTEDSAIVoltageChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
end

function CreateTEDSAICurrentChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, terminalConfig::Cint, minVal::Cdouble, maxVal::Cdouble, units::Cint, shuntResistorLoc::Cint, extShuntResistorVal::Cdouble, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateTEDSAICurrentChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName)
end

function CreateTEDSAIThrmcplChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, cjcSource::Cint, cjcVal::Cdouble, cjcChannel::Ref{UInt8})
    ccall((:DAQmxCreateTEDSAIThrmcplChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, cjcSource, cjcVal, cjcChannel)
end

function CreateTEDSAIRTDChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, resistanceConfig::Cint, currentExcitSource::Cint, currentExcitVal::Cdouble)
    ccall((:DAQmxCreateTEDSAIRTDChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal)
end

function CreateTEDSAIThrmstrChanIex(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, resistanceConfig::Cint, currentExcitSource::Cint, currentExcitVal::Cdouble)
    ccall((:DAQmxCreateTEDSAIThrmstrChanIex, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal)
end

function CreateTEDSAIThrmstrChanVex(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, resistanceConfig::Cint, voltageExcitSource::Cint, voltageExcitVal::Cdouble, r1::Cdouble)
    ccall((:DAQmxCreateTEDSAIThrmstrChanVex, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cdouble), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, voltageExcitSource, voltageExcitVal, r1)
end

function CreateTEDSAIResistanceChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, resistanceConfig::Cint, currentExcitSource::Cint, currentExcitVal::Cdouble, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateTEDSAIResistanceChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal, customScaleName)
end

function CreateTEDSAIStrainGageChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, voltageExcitSource::Cint, voltageExcitVal::Cdouble, initialBridgeVoltage::Cdouble, leadWireResistance::Cdouble, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateTEDSAIStrainGageChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cdouble, Cdouble, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, initialBridgeVoltage, leadWireResistance, customScaleName)
end

function CreateTEDSAIForceBridgeChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, voltageExcitSource::Cint, voltageExcitVal::Cdouble, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateTEDSAIForceBridgeChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
end

function CreateTEDSAIPressureBridgeChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, voltageExcitSource::Cint, voltageExcitVal::Cdouble, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateTEDSAIPressureBridgeChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
end

function CreateTEDSAITorqueBridgeChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, voltageExcitSource::Cint, voltageExcitVal::Cdouble, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateTEDSAITorqueBridgeChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
end

function CreateTEDSAIBridgeChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, voltageExcitSource::Cint, voltageExcitVal::Cdouble, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateTEDSAIBridgeChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
end

function CreateTEDSAIVoltageChanWithExcit(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, terminalConfig::Cint, minVal::Cdouble, maxVal::Cdouble, units::Cint, voltageExcitSource::Cint, voltageExcitVal::Cdouble, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateTEDSAIVoltageChanWithExcit, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
end

function CreateTEDSAIAccelChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, terminalConfig::Cint, minVal::Cdouble, maxVal::Cdouble, units::Cint, currentExcitSource::Cint, currentExcitVal::Cdouble, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateTEDSAIAccelChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, currentExcitSource, currentExcitVal, customScaleName)
end

function CreateTEDSAIForceIEPEChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, terminalConfig::Cint, minVal::Cdouble, maxVal::Cdouble, units::Cint, currentExcitSource::Cint, currentExcitVal::Cdouble, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateTEDSAIForceIEPEChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, currentExcitSource, currentExcitVal, customScaleName)
end

function CreateTEDSAIMicrophoneChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, terminalConfig::Cint, units::Cint, maxSndPressLevel::Cdouble, currentExcitSource::Cint, currentExcitVal::Cdouble, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateTEDSAIMicrophoneChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cint, Cdouble, Cint, Cdouble, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, units, maxSndPressLevel, currentExcitSource, currentExcitVal, customScaleName)
end

function CreateTEDSAIPosLVDTChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, voltageExcitSource::Cint, voltageExcitVal::Cdouble, voltageExcitFreq::Cdouble, ACExcitWireMode::Cint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateTEDSAIPosLVDTChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
end

function CreateTEDSAIPosRVDTChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, voltageExcitSource::Cint, voltageExcitVal::Cdouble, voltageExcitFreq::Cdouble, ACExcitWireMode::Cint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateTEDSAIPosRVDTChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
end

function CreateAOVoltageChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAOVoltageChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, customScaleName)
end

function CreateAOCurrentChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateAOCurrentChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, customScaleName)
end

function CreateAOFuncGenChan(taskHandle::TaskHandle, physicalChannel::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, type::Cint, freq::Cdouble, amplitude::Cdouble, offset::Cdouble)
    ccall((:DAQmxCreateAOFuncGenChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cdouble, Cdouble, Cdouble), taskHandle, physicalChannel, nameToAssignToChannel, type, freq, amplitude, offset)
end

function CreateDIChan(taskHandle::TaskHandle, lines::Ref{UInt8}, nameToAssignToLines::Ref{UInt8}, lineGrouping::Cint)
    ccall((:DAQmxCreateDIChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint), taskHandle, lines, nameToAssignToLines, lineGrouping)
end

function CreateDOChan(taskHandle::TaskHandle, lines::Ref{UInt8}, nameToAssignToLines::Ref{UInt8}, lineGrouping::Cint)
    ccall((:DAQmxCreateDOChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint), taskHandle, lines, nameToAssignToLines, lineGrouping)
end

function CreateCIFreqChan(taskHandle::TaskHandle, counter::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, edge::Cint, measMethod::Cint, measTime::Cdouble, divisor::Cuint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateCIFreqChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cuint, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, edge, measMethod, measTime, divisor, customScaleName)
end

function CreateCIPeriodChan(taskHandle::TaskHandle, counter::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, edge::Cint, measMethod::Cint, measTime::Cdouble, divisor::Cuint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateCIPeriodChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Cdouble, Cuint, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, edge, measMethod, measTime, divisor, customScaleName)
end

function CreateCICountEdgesChan(taskHandle::TaskHandle, counter::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, edge::Cint, initialCount::Cuint, countDirection::Cint)
    ccall((:DAQmxCreateCICountEdgesChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cuint, Cint), taskHandle, counter, nameToAssignToChannel, edge, initialCount, countDirection)
end

function CreateCIDutyCycleChan(taskHandle::TaskHandle, counter::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minFreq::Cdouble, maxFreq::Cdouble, edge::Cint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateCIDutyCycleChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, minFreq, maxFreq, edge, customScaleName)
end

function CreateCIPulseWidthChan(taskHandle::TaskHandle, counter::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, startingEdge::Cint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateCIPulseWidthChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, startingEdge, customScaleName)
end

function CreateCISemiPeriodChan(taskHandle::TaskHandle, counter::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateCISemiPeriodChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, customScaleName)
end

function CreateCITwoEdgeSepChan(taskHandle::TaskHandle, counter::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint, firstEdge::Cint, secondEdge::Cint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateCITwoEdgeSepChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cint, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, firstEdge, secondEdge, customScaleName)
end

function CreateCIPulseChanFreq(taskHandle::TaskHandle, counter::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint)
    ccall((:DAQmxCreateCIPulseChanFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units)
end

function CreateCIPulseChanTime(taskHandle::TaskHandle, counter::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, units::Cint)
    ccall((:DAQmxCreateCIPulseChanTime, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units)
end

function CreateCIPulseChanTicks(taskHandle::TaskHandle, counter::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, sourceTerminal::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble)
    ccall((:DAQmxCreateCIPulseChanTicks, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble), taskHandle, counter, nameToAssignToChannel, sourceTerminal, minVal, maxVal)
end

function CreateCILinEncoderChan(taskHandle::TaskHandle, counter::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, decodingType::Cint, ZidxEnable::Cuint, ZidxVal::Cdouble, ZidxPhase::Cint, units::Cint, distPerPulse::Cdouble, initialPos::Cdouble, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateCILinEncoderChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cuint, Cdouble, Cint, Cint, Cdouble, Cdouble, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, decodingType, ZidxEnable, ZidxVal, ZidxPhase, units, distPerPulse, initialPos, customScaleName)
end

function CreateCIAngEncoderChan(taskHandle::TaskHandle, counter::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, decodingType::Cint, ZidxEnable::Cuint, ZidxVal::Cdouble, ZidxPhase::Cint, units::Cint, pulsesPerRev::Cuint, initialAngle::Cdouble, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateCIAngEncoderChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cuint, Cdouble, Cint, Cint, Cuint, Cdouble, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, decodingType, ZidxEnable, ZidxVal, ZidxPhase, units, pulsesPerRev, initialAngle, customScaleName)
end

function CreateCILinVelocityChan(taskHandle::TaskHandle, counter::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, decodingType::Cint, units::Cint, distPerPulse::Cdouble, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateCILinVelocityChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cdouble, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, decodingType, units, distPerPulse, customScaleName)
end

function CreateCIAngVelocityChan(taskHandle::TaskHandle, counter::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, minVal::Cdouble, maxVal::Cdouble, decodingType::Cint, units::Cint, pulsesPerRev::Cuint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateCIAngVelocityChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint, Cuint, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, decodingType, units, pulsesPerRev, customScaleName)
end

function CreateCIGPSTimestampChan(taskHandle::TaskHandle, counter::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, units::Cint, syncMethod::Cint, customScaleName::Ref{UInt8})
    ccall((:DAQmxCreateCIGPSTimestampChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cint, Ref{UInt8}), taskHandle, counter, nameToAssignToChannel, units, syncMethod, customScaleName)
end

function CreateCOPulseChanFreq(taskHandle::TaskHandle, counter::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, units::Cint, idleState::Cint, initialDelay::Cdouble, freq::Cdouble, dutyCycle::Cdouble)
    ccall((:DAQmxCreateCOPulseChanFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cint, Cdouble, Cdouble, Cdouble), taskHandle, counter, nameToAssignToChannel, units, idleState, initialDelay, freq, dutyCycle)
end

function CreateCOPulseChanTime(taskHandle::TaskHandle, counter::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, units::Cint, idleState::Cint, initialDelay::Cdouble, lowTime::Cdouble, highTime::Cdouble)
    ccall((:DAQmxCreateCOPulseChanTime, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cint, Cdouble, Cdouble, Cdouble), taskHandle, counter, nameToAssignToChannel, units, idleState, initialDelay, lowTime, highTime)
end

function CreateCOPulseChanTicks(taskHandle::TaskHandle, counter::Ref{UInt8}, nameToAssignToChannel::Ref{UInt8}, sourceTerminal::Ref{UInt8}, idleState::Cint, initialDelay::Cint, lowTicks::Cint, highTicks::Cint)
    ccall((:DAQmxCreateCOPulseChanTicks, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Ref{UInt8}, Cint, Cint, Cint, Cint), taskHandle, counter, nameToAssignToChannel, sourceTerminal, idleState, initialDelay, lowTicks, highTicks)
end

# get/set channel

function GetAIChanCalCalDate(taskHandle::TaskHandle, channelName::Ref{UInt8}, year::Ref{Cuint}, month::Ref{Cuint}, day::Ref{Cuint}, hour::Ref{Cuint}, minute::Ref{Cuint})
    ccall((:DAQmxGetAIChanCalCalDate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}, Ref{Cuint}, Ref{Cuint}, Ref{Cuint}, Ref{Cuint}), taskHandle, channelName, year, month, day, hour, minute)
end

function SetAIChanCalCalDate(taskHandle::TaskHandle, channelName::Ref{UInt8}, year::Cuint, month::Cuint, day::Cuint, hour::Cuint, minute::Cuint)
    ccall((:DAQmxSetAIChanCalCalDate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint, Cuint, Cuint, Cuint, Cuint), taskHandle, channelName, year, month, day, hour, minute)
end

function GetAIChanCalExpDate(taskHandle::TaskHandle, channelName::Ref{UInt8}, year::Ref{Cuint}, month::Ref{Cuint}, day::Ref{Cuint}, hour::Ref{Cuint}, minute::Ref{Cuint})
    ccall((:DAQmxGetAIChanCalExpDate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}, Ref{Cuint}, Ref{Cuint}, Ref{Cuint}, Ref{Cuint}), taskHandle, channelName, year, month, day, hour, minute)
end

function SetAIChanCalExpDate(taskHandle::TaskHandle, channelName::Ref{UInt8}, year::Cuint, month::Cuint, day::Cuint, hour::Cuint, minute::Cuint)
    ccall((:DAQmxSetAIChanCalExpDate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint, Cuint, Cuint, Cuint, Cuint), taskHandle, channelName, year, month, day, hour, minute)
end

function GetChanAttribute(taskHandle::TaskHandle, channel::Ref{UInt8}, attribute::Cint, value::Ref{Cvoid})
    ccall((:DAQmxGetChanAttribute, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint, Ref{Cvoid}), taskHandle, channel, attribute, value)
end

function SetChanAttribute(taskHandle::TaskHandle, channel::Ref{UInt8}, attribute::Cint)
    ccall((:DAQmxSetChanAttribute, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, attribute)
end

function ResetChanAttribute(taskHandle::TaskHandle, channel::Ref{UInt8}, attribute::Cint)
    ccall((:DAQmxResetChanAttribute, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, attribute)
end

function CfgSampClkTiming(taskHandle::TaskHandle, source::Ref{UInt8}, rate::Cdouble, activeEdge::Cint, sampleMode::Cint, sampsPerChan::Culonglong)
    ccall((:DAQmxCfgSampClkTiming, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble, Cint, Cint, Culonglong), taskHandle, source, rate, activeEdge, sampleMode, sampsPerChan)
end

function CfgHandshakingTiming(taskHandle::TaskHandle, sampleMode::Cint, sampsPerChan::Culonglong)
    ccall((:DAQmxCfgHandshakingTiming, :libnidaqmx), Cint, (TaskHandle, Cint, Culonglong), taskHandle, sampleMode, sampsPerChan)
end

function CfgBurstHandshakingTimingImportClock(taskHandle::TaskHandle, sampleMode::Cint, sampsPerChan::Culonglong, sampleClkRate::Cdouble, sampleClkSrc::Ref{UInt8}, sampleClkActiveEdge::Cint, pauseWhen::Cint, readyEventActiveLevel::Cint)
    ccall((:DAQmxCfgBurstHandshakingTimingImportClock, :libnidaqmx), Cint, (TaskHandle, Cint, Culonglong, Cdouble, Ref{UInt8}, Cint, Cint, Cint), taskHandle, sampleMode, sampsPerChan, sampleClkRate, sampleClkSrc, sampleClkActiveEdge, pauseWhen, readyEventActiveLevel)
end

function CfgBurstHandshakingTimingExportClock(taskHandle::TaskHandle, sampleMode::Cint, sampsPerChan::Culonglong, sampleClkRate::Cdouble, sampleClkOutpTerm::Ref{UInt8}, sampleClkPulsePolarity::Cint, pauseWhen::Cint, readyEventActiveLevel::Cint)
    ccall((:DAQmxCfgBurstHandshakingTimingExportClock, :libnidaqmx), Cint, (TaskHandle, Cint, Culonglong, Cdouble, Ref{UInt8}, Cint, Cint, Cint), taskHandle, sampleMode, sampsPerChan, sampleClkRate, sampleClkOutpTerm, sampleClkPulsePolarity, pauseWhen, readyEventActiveLevel)
end

function CfgChangeDetectionTiming(taskHandle::TaskHandle, risingEdgeChan::Ref{UInt8}, fallingEdgeChan::Ref{UInt8}, sampleMode::Cint, sampsPerChan::Culonglong)
    ccall((:DAQmxCfgChangeDetectionTiming, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Culonglong), taskHandle, risingEdgeChan, fallingEdgeChan, sampleMode, sampsPerChan)
end

function CfgImplicitTiming(taskHandle::TaskHandle, sampleMode::Cint, sampsPerChan::Culonglong)
    ccall((:DAQmxCfgImplicitTiming, :libnidaqmx), Cint, (TaskHandle, Cint, Culonglong), taskHandle, sampleMode, sampsPerChan)
end

function CfgPipelinedSampClkTiming(taskHandle::TaskHandle, source::Ref{UInt8}, rate::Cdouble, activeEdge::Cint, sampleMode::Cint, sampsPerChan::Culonglong)
    ccall((:DAQmxCfgPipelinedSampClkTiming, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble, Cint, Cint, Culonglong), taskHandle, source, rate, activeEdge, sampleMode, sampsPerChan)
end

function GetTimingAttribute(taskHandle::TaskHandle, attribute::Cint, value::Ref{Cvoid})
    ccall((:DAQmxGetTimingAttribute, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{Cvoid}), taskHandle, attribute, value)
end

function SetTimingAttribute(taskHandle::TaskHandle, attribute::Cint)
    ccall((:DAQmxSetTimingAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ResetTimingAttribute(taskHandle::TaskHandle, attribute::Cint)
    ccall((:DAQmxResetTimingAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function GetTimingAttributeEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, attribute::Cint, value::Ref{Cvoid})
    ccall((:DAQmxGetTimingAttributeEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint, Ref{Cvoid}), taskHandle, deviceNames, attribute, value)
end

function SetTimingAttributeEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, attribute::Cint)
    ccall((:DAQmxSetTimingAttributeEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, deviceNames, attribute)
end

function ResetTimingAttributeEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, attribute::Cint)
    ccall((:DAQmxResetTimingAttributeEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, deviceNames, attribute)
end

function DisableStartTrig(taskHandle::TaskHandle)
    ccall((:DAQmxDisableStartTrig, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function CfgDigEdgeStartTrig(taskHandle::TaskHandle, triggerSource::Ref{UInt8}, triggerEdge::Cint)
    ccall((:DAQmxCfgDigEdgeStartTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, triggerSource, triggerEdge)
end

function CfgAnlgEdgeStartTrig(taskHandle::TaskHandle, triggerSource::Ref{UInt8}, triggerSlope::Cint, triggerLevel::Cdouble)
    ccall((:DAQmxCfgAnlgEdgeStartTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint, Cdouble), taskHandle, triggerSource, triggerSlope, triggerLevel)
end

function CfgAnlgMultiEdgeStartTrig(taskHandle::TaskHandle, triggerSources::Ref{UInt8}, triggerSlopeArray::Ref{Cint}, triggerLevelArray::Ref{Cdouble}, arraySize::Cuint)
    ccall((:DAQmxCfgAnlgMultiEdgeStartTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}, Ref{Cdouble}, Cuint), taskHandle, triggerSources, triggerSlopeArray, triggerLevelArray, arraySize)
end

function CfgAnlgWindowStartTrig(taskHandle::TaskHandle, triggerSource::Ref{UInt8}, triggerWhen::Cint, windowTop::Cdouble, windowBottom::Cdouble)
    ccall((:DAQmxCfgAnlgWindowStartTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint, Cdouble, Cdouble), taskHandle, triggerSource, triggerWhen, windowTop, windowBottom)
end

function CfgTimeStartTrig(taskHandle::TaskHandle, when::CVIAbsoluteTime, timescale::Cint)
    ccall((:DAQmxCfgTimeStartTrig, :libnidaqmx), Cint, (TaskHandle, CVIAbsoluteTime, Cint), taskHandle, when, timescale)
end

function CfgDigPatternStartTrig(taskHandle::TaskHandle, triggerSource::Ref{UInt8}, triggerPattern::Ref{UInt8}, triggerWhen::Cint)
    ccall((:DAQmxCfgDigPatternStartTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint), taskHandle, triggerSource, triggerPattern, triggerWhen)
end

function DisableRefTrig(taskHandle::TaskHandle)
    ccall((:DAQmxDisableRefTrig, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function CfgDigEdgeRefTrig(taskHandle::TaskHandle, triggerSource::Ref{UInt8}, triggerEdge::Cint, pretriggerSamples::Cuint)
    ccall((:DAQmxCfgDigEdgeRefTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint, Cuint), taskHandle, triggerSource, triggerEdge, pretriggerSamples)
end

function CfgAnlgEdgeRefTrig(taskHandle::TaskHandle, triggerSource::Ref{UInt8}, triggerSlope::Cint, triggerLevel::Cdouble, pretriggerSamples::Cuint)
    ccall((:DAQmxCfgAnlgEdgeRefTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint, Cdouble, Cuint), taskHandle, triggerSource, triggerSlope, triggerLevel, pretriggerSamples)
end

function CfgAnlgMultiEdgeRefTrig(taskHandle::TaskHandle, triggerSources::Ref{UInt8}, triggerSlopeArray::Ref{Cint}, triggerLevelArray::Ref{Cdouble}, pretriggerSamples::Cuint, arraySize::Cuint)
    ccall((:DAQmxCfgAnlgMultiEdgeRefTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}, Ref{Cdouble}, Cuint, Cuint), taskHandle, triggerSources, triggerSlopeArray, triggerLevelArray, pretriggerSamples, arraySize)
end

function CfgAnlgWindowRefTrig(taskHandle::TaskHandle, triggerSource::Ref{UInt8}, triggerWhen::Cint, windowTop::Cdouble, windowBottom::Cdouble, pretriggerSamples::Cuint)
    ccall((:DAQmxCfgAnlgWindowRefTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint, Cdouble, Cdouble, Cuint), taskHandle, triggerSource, triggerWhen, windowTop, windowBottom, pretriggerSamples)
end

function CfgDigPatternRefTrig(taskHandle::TaskHandle, triggerSource::Ref{UInt8}, triggerPattern::Ref{UInt8}, triggerWhen::Cint, pretriggerSamples::Cuint)
    ccall((:DAQmxCfgDigPatternRefTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cint, Cuint), taskHandle, triggerSource, triggerPattern, triggerWhen, pretriggerSamples)
end

function GetTrigAttribute(taskHandle::TaskHandle, attribute::Cint, value::Ref{Cvoid})
    ccall((:DAQmxGetTrigAttribute, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{Cvoid}), taskHandle, attribute, value)
end

function SetTrigAttribute(taskHandle::TaskHandle, attribute::Cint)
    ccall((:DAQmxSetTrigAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ResetTrigAttribute(taskHandle::TaskHandle, attribute::Cint)
    ccall((:DAQmxResetTrigAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ReadAnalogF64(taskHandle::TaskHandle, numSampsPerChan::Cint, timeout::Cdouble, fillMode::Cuint, readArray::Ref{Cdouble}, arraySizeInSamps::Cuint, sampsPerChanRead::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxReadAnalogF64, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cdouble}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadAnalogScalarF64(taskHandle::TaskHandle, timeout::Cdouble, value::Ref{Cdouble}, reserved::Ref{Cuint})
    ccall((:DAQmxReadAnalogScalarF64, :libnidaqmx), Cint, (TaskHandle, Cdouble, Ref{Cdouble}, Ref{Cuint}), taskHandle, timeout, value, reserved)
end

function ReadBinaryI16(taskHandle::TaskHandle, numSampsPerChan::Cint, timeout::Cdouble, fillMode::Cuint, readArray::Ref{Cshort}, arraySizeInSamps::Cuint, sampsPerChanRead::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxReadBinaryI16, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cshort}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadBinaryU16(taskHandle::TaskHandle, numSampsPerChan::Cint, timeout::Cdouble, fillMode::Cuint, readArray::Ref{Cushort}, arraySizeInSamps::Cuint, sampsPerChanRead::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxReadBinaryU16, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cushort}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadBinaryI32(taskHandle::TaskHandle, numSampsPerChan::Cint, timeout::Cdouble, fillMode::Cuint, readArray::Ref{Cint}, arraySizeInSamps::Cuint, sampsPerChanRead::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxReadBinaryI32, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cint}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadBinaryU32(taskHandle::TaskHandle, numSampsPerChan::Cint, timeout::Cdouble, fillMode::Cuint, readArray::Ref{Cuint}, arraySizeInSamps::Cuint, sampsPerChanRead::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxReadBinaryU32, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cuint}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadDigitalU8(taskHandle::TaskHandle, numSampsPerChan::Cint, timeout::Cdouble, fillMode::Cuint, readArray::Ref{Cuchar}, arraySizeInSamps::Cuint, sampsPerChanRead::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxReadDigitalU8, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cuchar}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadDigitalU16(taskHandle::TaskHandle, numSampsPerChan::Cint, timeout::Cdouble, fillMode::Cuint, readArray::Ref{Cushort}, arraySizeInSamps::Cuint, sampsPerChanRead::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxReadDigitalU16, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cushort}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadDigitalU32(taskHandle::TaskHandle, numSampsPerChan::Cint, timeout::Cdouble, fillMode::Cuint, readArray::Ref{Cuint}, arraySizeInSamps::Cuint, sampsPerChanRead::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxReadDigitalU32, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cuint}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadDigitalScalarU32(taskHandle::TaskHandle, timeout::Cdouble, value::Ref{Cuint}, reserved::Ref{Cuint})
    ccall((:DAQmxReadDigitalScalarU32, :libnidaqmx), Cint, (TaskHandle, Cdouble, Ref{Cuint}, Ref{Cuint}), taskHandle, timeout, value, reserved)
end

function ReadDigitalLines(taskHandle::TaskHandle, numSampsPerChan::Cint, timeout::Cdouble, fillMode::Cuint, readArray::Ref{Cuchar}, arraySizeInBytes::Cuint, sampsPerChanRead::Ref{Cint}, numBytesPerSamp::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxReadDigitalLines, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cuchar}, Cuint, Ref{Cint}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInBytes, sampsPerChanRead, numBytesPerSamp, reserved)
end

function ReadCounterF64(taskHandle::TaskHandle, numSampsPerChan::Cint, timeout::Cdouble, readArray::Ref{Cdouble}, arraySizeInSamps::Cuint, sampsPerChanRead::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxReadCounterF64, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Ref{Cdouble}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadCounterU32(taskHandle::TaskHandle, numSampsPerChan::Cint, timeout::Cdouble, readArray::Ref{Cuint}, arraySizeInSamps::Cuint, sampsPerChanRead::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxReadCounterU32, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Ref{Cuint}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadCounterF64Ex(taskHandle::TaskHandle, numSampsPerChan::Cint, timeout::Cdouble, fillMode::Cuint, readArray::Ref{Cdouble}, arraySizeInSamps::Cuint, sampsPerChanRead::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxReadCounterF64Ex, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cdouble}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadCounterU32Ex(taskHandle::TaskHandle, numSampsPerChan::Cint, timeout::Cdouble, fillMode::Cuint, readArray::Ref{Cuint}, arraySizeInSamps::Cuint, sampsPerChanRead::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxReadCounterU32Ex, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cuint}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadCounterScalarF64(taskHandle::TaskHandle, timeout::Cdouble, value::Ref{Cdouble}, reserved::Ref{Cuint})
    ccall((:DAQmxReadCounterScalarF64, :libnidaqmx), Cint, (TaskHandle, Cdouble, Ref{Cdouble}, Ref{Cuint}), taskHandle, timeout, value, reserved)
end

function ReadCounterScalarU32(taskHandle::TaskHandle, timeout::Cdouble, value::Ref{Cuint}, reserved::Ref{Cuint})
    ccall((:DAQmxReadCounterScalarU32, :libnidaqmx), Cint, (TaskHandle, Cdouble, Ref{Cuint}, Ref{Cuint}), taskHandle, timeout, value, reserved)
end

function ReadCtrFreq(taskHandle::TaskHandle, numSampsPerChan::Cint, timeout::Cdouble, interleaved::Cuint, readArrayFrequency::Ref{Cdouble}, readArrayDutyCycle::Ref{Cdouble}, arraySizeInSamps::Cuint, sampsPerChanRead::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxReadCtrFreq, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cdouble}, Ref{Cdouble}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, interleaved, readArrayFrequency, readArrayDutyCycle, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadCtrTime(taskHandle::TaskHandle, numSampsPerChan::Cint, timeout::Cdouble, interleaved::Cuint, readArrayHighTime::Ref{Cdouble}, readArrayLowTime::Ref{Cdouble}, arraySizeInSamps::Cuint, sampsPerChanRead::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxReadCtrTime, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cdouble}, Ref{Cdouble}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, interleaved, readArrayHighTime, readArrayLowTime, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadCtrTicks(taskHandle::TaskHandle, numSampsPerChan::Cint, timeout::Cdouble, interleaved::Cuint, readArrayHighTicks::Ref{Cuint}, readArrayLowTicks::Ref{Cuint}, arraySizeInSamps::Cuint, sampsPerChanRead::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxReadCtrTicks, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Cuint, Ref{Cuint}, Ref{Cuint}, Cuint, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, interleaved, readArrayHighTicks, readArrayLowTicks, arraySizeInSamps, sampsPerChanRead, reserved)
end

function ReadCtrFreqScalar(taskHandle::TaskHandle, timeout::Cdouble, frequency::Ref{Cdouble}, dutyCycle::Ref{Cdouble}, reserved::Ref{Cuint})
    ccall((:DAQmxReadCtrFreqScalar, :libnidaqmx), Cint, (TaskHandle, Cdouble, Ref{Cdouble}, Ref{Cdouble}, Ref{Cuint}), taskHandle, timeout, frequency, dutyCycle, reserved)
end

function ReadCtrTimeScalar(taskHandle::TaskHandle, timeout::Cdouble, highTime::Ref{Cdouble}, lowTime::Ref{Cdouble}, reserved::Ref{Cuint})
    ccall((:DAQmxReadCtrTimeScalar, :libnidaqmx), Cint, (TaskHandle, Cdouble, Ref{Cdouble}, Ref{Cdouble}, Ref{Cuint}), taskHandle, timeout, highTime, lowTime, reserved)
end

function ReadCtrTicksScalar(taskHandle::TaskHandle, timeout::Cdouble, highTicks::Ref{Cuint}, lowTicks::Ref{Cuint}, reserved::Ref{Cuint})
    ccall((:DAQmxReadCtrTicksScalar, :libnidaqmx), Cint, (TaskHandle, Cdouble, Ref{Cuint}, Ref{Cuint}, Ref{Cuint}), taskHandle, timeout, highTicks, lowTicks, reserved)
end

function ReadRaw(taskHandle::TaskHandle, numSampsPerChan::Cint, timeout::Cdouble, readArray::Ref{Cvoid}, arraySizeInBytes::Cuint, sampsRead::Ref{Cint}, numBytesPerSamp::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxReadRaw, :libnidaqmx), Cint, (TaskHandle, Cint, Cdouble, Ref{Cvoid}, Cuint, Ref{Cint}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, timeout, readArray, arraySizeInBytes, sampsRead, numBytesPerSamp, reserved)
end

function GetNthTaskReadChannel(taskHandle::TaskHandle, index::Cuint, buffer::Ref{UInt8}, bufferSize::Cint)
    ccall((:DAQmxGetNthTaskReadChannel, :libnidaqmx), Cint, (TaskHandle, Cuint, Ref{UInt8}, Cint), taskHandle, index, buffer, bufferSize)
end

function GetReadAttribute(taskHandle::TaskHandle, attribute::Cint, value::Ref{Cvoid})
    ccall((:DAQmxGetReadAttribute, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{Cvoid}), taskHandle, attribute, value)
end

function SetReadAttribute(taskHandle::TaskHandle, attribute::Cint)
    ccall((:DAQmxSetReadAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ResetReadAttribute(taskHandle::TaskHandle, attribute::Cint)
    ccall((:DAQmxResetReadAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ConfigureLogging(taskHandle::TaskHandle, filePath::Ref{UInt8}, loggingMode::Cint, groupName::Ref{UInt8}, operation::Cint)
    ccall((:DAQmxConfigureLogging, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint, Ref{UInt8}, Cint), taskHandle, filePath, loggingMode, groupName, operation)
end

function StartNewFile(taskHandle::TaskHandle, filePath::Ref{UInt8})
    ccall((:DAQmxStartNewFile, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, filePath)
end

function WriteAnalogF64(taskHandle::TaskHandle, numSampsPerChan::Cint, autoStart::Cuint, timeout::Cdouble, dataLayout::Cuint, writeArray::Ref{Cdouble}, sampsPerChanWritten::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxWriteAnalogF64, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cdouble}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function WriteAnalogScalarF64(taskHandle::TaskHandle, autoStart::Cuint, timeout::Cdouble, value::Cdouble, reserved::Ref{Cuint})
    ccall((:DAQmxWriteAnalogScalarF64, :libnidaqmx), Cint, (TaskHandle, Cuint, Cdouble, Cdouble, Ref{Cuint}), taskHandle, autoStart, timeout, value, reserved)
end

function WriteBinaryI16(taskHandle::TaskHandle, numSampsPerChan::Cint, autoStart::Cuint, timeout::Cdouble, dataLayout::Cuint, writeArray::Ref{Cshort}, sampsPerChanWritten::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxWriteBinaryI16, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cshort}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function WriteBinaryU16(taskHandle::TaskHandle, numSampsPerChan::Cint, autoStart::Cuint, timeout::Cdouble, dataLayout::Cuint, writeArray::Ref{Cushort}, sampsPerChanWritten::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxWriteBinaryU16, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cushort}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function WriteBinaryI32(taskHandle::TaskHandle, numSampsPerChan::Cint, autoStart::Cuint, timeout::Cdouble, dataLayout::Cuint, writeArray::Ref{Cint}, sampsPerChanWritten::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxWriteBinaryI32, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cint}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function WriteBinaryU32(taskHandle::TaskHandle, numSampsPerChan::Cint, autoStart::Cuint, timeout::Cdouble, dataLayout::Cuint, writeArray::Ref{Cuint}, sampsPerChanWritten::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxWriteBinaryU32, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cuint}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function WriteDigitalU8(taskHandle::TaskHandle, numSampsPerChan::Cint, autoStart::Cuint, timeout::Cdouble, dataLayout::Cuint, writeArray::Ref{Cuchar}, sampsPerChanWritten::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxWriteDigitalU8, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cuchar}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function WriteDigitalU16(taskHandle::TaskHandle, numSampsPerChan::Cint, autoStart::Cuint, timeout::Cdouble, dataLayout::Cuint, writeArray::Ref{Cushort}, sampsPerChanWritten::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxWriteDigitalU16, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cushort}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function WriteDigitalU32(taskHandle::TaskHandle, numSampsPerChan::Cint, autoStart::Cuint, timeout::Cdouble, dataLayout::Cuint, writeArray::Ref{Cuint}, sampsPerChanWritten::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxWriteDigitalU32, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cuint}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function WriteDigitalScalarU32(taskHandle::TaskHandle, autoStart::Cuint, timeout::Cdouble, value::Cuint, reserved::Ref{Cuint})
    ccall((:DAQmxWriteDigitalScalarU32, :libnidaqmx), Cint, (TaskHandle, Cuint, Cdouble, Cuint, Ref{Cuint}), taskHandle, autoStart, timeout, value, reserved)
end

function WriteDigitalLines(taskHandle::TaskHandle, numSampsPerChan::Cint, autoStart::Cuint, timeout::Cdouble, dataLayout::Cuint, writeArray::Ref{Cuchar}, sampsPerChanWritten::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxWriteDigitalLines, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cuchar}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function WriteCtrFreq(taskHandle::TaskHandle, numSampsPerChan::Cint, autoStart::Cuint, timeout::Cdouble, dataLayout::Cuint, frequency::Ref{Cdouble}, dutyCycle::Ref{Cdouble}, numSampsPerChanWritten::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxWriteCtrFreq, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cdouble}, Ref{Cdouble}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, frequency, dutyCycle, numSampsPerChanWritten, reserved)
end

function WriteCtrFreqScalar(taskHandle::TaskHandle, autoStart::Cuint, timeout::Cdouble, frequency::Cdouble, dutyCycle::Cdouble, reserved::Ref{Cuint})
    ccall((:DAQmxWriteCtrFreqScalar, :libnidaqmx), Cint, (TaskHandle, Cuint, Cdouble, Cdouble, Cdouble, Ref{Cuint}), taskHandle, autoStart, timeout, frequency, dutyCycle, reserved)
end

function WriteCtrTime(taskHandle::TaskHandle, numSampsPerChan::Cint, autoStart::Cuint, timeout::Cdouble, dataLayout::Cuint, highTime::Ref{Cdouble}, lowTime::Ref{Cdouble}, numSampsPerChanWritten::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxWriteCtrTime, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cdouble}, Ref{Cdouble}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, highTime, lowTime, numSampsPerChanWritten, reserved)
end

function WriteCtrTimeScalar(taskHandle::TaskHandle, autoStart::Cuint, timeout::Cdouble, highTime::Cdouble, lowTime::Cdouble, reserved::Ref{Cuint})
    ccall((:DAQmxWriteCtrTimeScalar, :libnidaqmx), Cint, (TaskHandle, Cuint, Cdouble, Cdouble, Cdouble, Ref{Cuint}), taskHandle, autoStart, timeout, highTime, lowTime, reserved)
end

function WriteCtrTicks(taskHandle::TaskHandle, numSampsPerChan::Cint, autoStart::Cuint, timeout::Cdouble, dataLayout::Cuint, highTicks::Ref{Cuint}, lowTicks::Ref{Cuint}, numSampsPerChanWritten::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxWriteCtrTicks, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Cuint, Ref{Cuint}, Ref{Cuint}, Ref{Cint}, Ref{Cuint}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, highTicks, lowTicks, numSampsPerChanWritten, reserved)
end

function WriteCtrTicksScalar(taskHandle::TaskHandle, autoStart::Cuint, timeout::Cdouble, highTicks::Cuint, lowTicks::Cuint, reserved::Ref{Cuint})
    ccall((:DAQmxWriteCtrTicksScalar, :libnidaqmx), Cint, (TaskHandle, Cuint, Cdouble, Cuint, Cuint, Ref{Cuint}), taskHandle, autoStart, timeout, highTicks, lowTicks, reserved)
end

function WriteRaw(taskHandle::TaskHandle, numSamps::Cint, autoStart::Cuint, timeout::Cdouble, writeArray::Ref{Cvoid}, sampsPerChanWritten::Ref{Cint}, reserved::Ref{Cuint})
    ccall((:DAQmxWriteRaw, :libnidaqmx), Cint, (TaskHandle, Cint, Cuint, Cdouble, Ref{Cvoid}, Ref{Cint}, Ref{Cuint}), taskHandle, numSamps, autoStart, timeout, writeArray, sampsPerChanWritten, reserved)
end

function GetWriteAttribute(taskHandle::TaskHandle, attribute::Cint, value::Ref{Cvoid})
    ccall((:DAQmxGetWriteAttribute, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{Cvoid}), taskHandle, attribute, value)
end

function SetWriteAttribute(taskHandle::TaskHandle, attribute::Cint)
    ccall((:DAQmxSetWriteAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ResetWriteAttribute(taskHandle::TaskHandle, attribute::Cint)
    ccall((:DAQmxResetWriteAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ExportSignal(taskHandle::TaskHandle, signalID::Cint, outputTerminal::Ref{UInt8})
    ccall((:DAQmxExportSignal, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{UInt8}), taskHandle, signalID, outputTerminal)
end

function GetExportedSignalAttribute(taskHandle::TaskHandle, attribute::Cint, value::Ref{Cvoid})
    ccall((:DAQmxGetExportedSignalAttribute, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{Cvoid}), taskHandle, attribute, value)
end

function SetExportedSignalAttribute(taskHandle::TaskHandle, attribute::Cint)
    ccall((:DAQmxSetExportedSignalAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ResetExportedSignalAttribute(taskHandle::TaskHandle, attribute::Cint)
    ccall((:DAQmxResetExportedSignalAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function CreateLinScale(name::Ref{UInt8}, slope::Cdouble, yIntercept::Cdouble, preScaledUnits::Cint, scaledUnits::Ref{UInt8})
    ccall((:DAQmxCreateLinScale, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble, Cdouble, Cint, Ref{UInt8}), name, slope, yIntercept, preScaledUnits, scaledUnits)
end

function CreateMapScale(name::Ref{UInt8}, prescaledMin::Cdouble, prescaledMax::Cdouble, scaledMin::Cdouble, scaledMax::Cdouble, preScaledUnits::Cint, scaledUnits::Ref{UInt8})
    ccall((:DAQmxCreateMapScale, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble, Cdouble, Cdouble, Cdouble, Cint, Ref{UInt8}), name, prescaledMin, prescaledMax, scaledMin, scaledMax, preScaledUnits, scaledUnits)
end

function CreatePolynomialScale(name::Ref{UInt8}, forwardCoeffs::Ref{Cdouble}, numForwardCoeffsIn::Cuint, reverseCoeffs::Ref{Cdouble}, numReverseCoeffsIn::Cuint, preScaledUnits::Cint, scaledUnits::Ref{UInt8})
    ccall((:DAQmxCreatePolynomialScale, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint, Ref{Cdouble}, Cuint, Cint, Ref{UInt8}), name, forwardCoeffs, numForwardCoeffsIn, reverseCoeffs, numReverseCoeffsIn, preScaledUnits, scaledUnits)
end

function CreateTableScale(name::Ref{UInt8}, prescaledVals::Ref{Cdouble}, numPrescaledValsIn::Cuint, scaledVals::Ref{Cdouble}, numScaledValsIn::Cuint, preScaledUnits::Cint, scaledUnits::Ref{UInt8})
    ccall((:DAQmxCreateTableScale, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint, Ref{Cdouble}, Cuint, Cint, Ref{UInt8}), name, prescaledVals, numPrescaledValsIn, scaledVals, numScaledValsIn, preScaledUnits, scaledUnits)
end

function CalculateReversePolyCoeff(forwardCoeffs::Ref{Cdouble}, numForwardCoeffsIn::Cuint, minValX::Cdouble, maxValX::Cdouble, numPointsToCompute::Cint, reversePolyOrder::Cint, reverseCoeffs::Ref{Cdouble})
    ccall((:DAQmxCalculateReversePolyCoeff, :libnidaqmx), Cint, (Ref{Cdouble}, Cuint, Cdouble, Cdouble, Cint, Cint, Ref{Cdouble}), forwardCoeffs, numForwardCoeffsIn, minValX, maxValX, numPointsToCompute, reversePolyOrder, reverseCoeffs)
end

function GetScaleAttribute(scaleName::Ref{UInt8}, attribute::Cint, value::Ref{Cvoid})
    ccall((:DAQmxGetScaleAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint, Ref{Cvoid}), scaleName, attribute, value)
end

function SetScaleAttribute(scaleName::Ref{UInt8}, attribute::Cint)
    ccall((:DAQmxSetScaleAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint), scaleName, attribute)
end

function CfgInputBuffer(taskHandle::TaskHandle, numSampsPerChan::Cuint)
    ccall((:DAQmxCfgInputBuffer, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, numSampsPerChan)
end

function CfgOutputBuffer(taskHandle::TaskHandle, numSampsPerChan::Cuint)
    ccall((:DAQmxCfgOutputBuffer, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, numSampsPerChan)
end

function GetBufferAttribute(taskHandle::TaskHandle, attribute::Cint, value::Ref{Cvoid})
    ccall((:DAQmxGetBufferAttribute, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{Cvoid}), taskHandle, attribute, value)
end

function SetBufferAttribute(taskHandle::TaskHandle, attribute::Cint)
    ccall((:DAQmxSetBufferAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ResetBufferAttribute(taskHandle::TaskHandle, attribute::Cint)
    ccall((:DAQmxResetBufferAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function SwitchCreateScanList(scanList::Ref{UInt8}, taskHandle::Ref{TaskHandle})
    ccall((:DAQmxSwitchCreateScanList, :libnidaqmx), Cint, (Ref{UInt8}, Ref{TaskHandle}), scanList, taskHandle)
end

function SwitchConnect(switchChannel1::Ref{UInt8}, switchChannel2::Ref{UInt8}, waitForSettling::Cuint)
    ccall((:DAQmxSwitchConnect, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Cuint), switchChannel1, switchChannel2, waitForSettling)
end

function SwitchConnectMulti(connectionList::Ref{UInt8}, waitForSettling::Cuint)
    ccall((:DAQmxSwitchConnectMulti, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), connectionList, waitForSettling)
end

function SwitchDisconnect(switchChannel1::Ref{UInt8}, switchChannel2::Ref{UInt8}, waitForSettling::Cuint)
    ccall((:DAQmxSwitchDisconnect, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Cuint), switchChannel1, switchChannel2, waitForSettling)
end

function SwitchDisconnectMulti(connectionList::Ref{UInt8}, waitForSettling::Cuint)
    ccall((:DAQmxSwitchDisconnectMulti, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), connectionList, waitForSettling)
end

function SwitchDisconnectAll(deviceName::Ref{UInt8}, waitForSettling::Cuint)
    ccall((:DAQmxSwitchDisconnectAll, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), deviceName, waitForSettling)
end

function SwitchSetTopologyAndReset(deviceName::Ref{UInt8}, newTopology::Ref{UInt8})
    ccall((:DAQmxSwitchSetTopologyAndReset, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}), deviceName, newTopology)
end

function SwitchFindPath(switchChannel1::Ref{UInt8}, switchChannel2::Ref{UInt8}, path::Ref{UInt8}, pathBufferSize::Cuint, pathStatus::Ref{Cint})
    ccall((:DAQmxSwitchFindPath, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Ref{UInt8}, Cuint, Ref{Cint}), switchChannel1, switchChannel2, path, pathBufferSize, pathStatus)
end

function SwitchOpenRelays(relayList::Ref{UInt8}, waitForSettling::Cuint)
    ccall((:DAQmxSwitchOpenRelays, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), relayList, waitForSettling)
end

function SwitchCloseRelays(relayList::Ref{UInt8}, waitForSettling::Cuint)
    ccall((:DAQmxSwitchCloseRelays, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), relayList, waitForSettling)
end

function SwitchGetSingleRelayCount(relayName::Ref{UInt8}, count::Ref{Cuint})
    ccall((:DAQmxSwitchGetSingleRelayCount, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), relayName, count)
end

function SwitchGetMultiRelayCount(relayList::Ref{UInt8}, count::Ref{Cuint}, countArraySize::Cuint, numRelayCountsRead::Ref{Cuint})
    ccall((:DAQmxSwitchGetMultiRelayCount, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}, Cuint, Ref{Cuint}), relayList, count, countArraySize, numRelayCountsRead)
end

function SwitchGetSingleRelayPos(relayName::Ref{UInt8}, relayPos::Ref{Cuint})
    ccall((:DAQmxSwitchGetSingleRelayPos, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), relayName, relayPos)
end

function SwitchGetMultiRelayPos(relayList::Ref{UInt8}, relayPos::Ref{Cuint}, relayPosArraySize::Cuint, numRelayPossRead::Ref{Cuint})
    ccall((:DAQmxSwitchGetMultiRelayPos, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}, Cuint, Ref{Cuint}), relayList, relayPos, relayPosArraySize, numRelayPossRead)
end

function SwitchWaitForSettling(deviceName::Ref{UInt8})
    ccall((:DAQmxSwitchWaitForSettling, :libnidaqmx), Cint, (Ref{UInt8},), deviceName)
end

function GetSwitchChanAttribute(switchChannelName::Ref{UInt8}, attribute::Cint, value::Ref{Cvoid})
    ccall((:DAQmxGetSwitchChanAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint, Ref{Cvoid}), switchChannelName, attribute, value)
end

function SetSwitchChanAttribute(switchChannelName::Ref{UInt8}, attribute::Cint)
    ccall((:DAQmxSetSwitchChanAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint), switchChannelName, attribute)
end

function GetSwitchDeviceAttribute(deviceName::Ref{UInt8}, attribute::Cint, value::Ref{Cvoid})
    ccall((:DAQmxGetSwitchDeviceAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint, Ref{Cvoid}), deviceName, attribute, value)
end

function SetSwitchDeviceAttribute(deviceName::Ref{UInt8}, attribute::Cint)
    ccall((:DAQmxSetSwitchDeviceAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint), deviceName, attribute)
end

function GetSwitchScanAttribute(taskHandle::TaskHandle, attribute::Cint, value::Ref{Cvoid})
    ccall((:DAQmxGetSwitchScanAttribute, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{Cvoid}), taskHandle, attribute, value)
end

function SetSwitchScanAttribute(taskHandle::TaskHandle, attribute::Cint)
    ccall((:DAQmxSetSwitchScanAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ResetSwitchScanAttribute(taskHandle::TaskHandle, attribute::Cint)
    ccall((:DAQmxResetSwitchScanAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function DisableAdvTrig(taskHandle::TaskHandle)
    ccall((:DAQmxDisableAdvTrig, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function CfgDigEdgeAdvTrig(taskHandle::TaskHandle, triggerSource::Ref{UInt8}, triggerEdge::Cint)
    ccall((:DAQmxCfgDigEdgeAdvTrig, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, triggerSource, triggerEdge)
end

function SendSoftwareTrigger(taskHandle::TaskHandle, triggerID::Cint)
    ccall((:DAQmxSendSoftwareTrigger, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, triggerID)
end

function ConnectTerms(sourceTerminal::Ref{UInt8}, destinationTerminal::Ref{UInt8}, signalModifiers::Cint)
    ccall((:DAQmxConnectTerms, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Cint), sourceTerminal, destinationTerminal, signalModifiers)
end

function DisconnectTerms(sourceTerminal::Ref{UInt8}, destinationTerminal::Ref{UInt8})
    ccall((:DAQmxDisconnectTerms, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}), sourceTerminal, destinationTerminal)
end

function TristateOutputTerm(outputTerminal::Ref{UInt8})
    ccall((:DAQmxTristateOutputTerm, :libnidaqmx), Cint, (Ref{UInt8},), outputTerminal)
end

function ResetDevice(deviceName::Ref{UInt8})
    ccall((:DAQmxResetDevice, :libnidaqmx), Cint, (Ref{UInt8},), deviceName)
end

function SelfTestDevice(deviceName::Ref{UInt8})
    ccall((:DAQmxSelfTestDevice, :libnidaqmx), Cint, (Ref{UInt8},), deviceName)
end

function GetDeviceAttribute(deviceName::Ref{UInt8}, attribute::Cint, value::Ref{Cvoid})
    ccall((:DAQmxGetDeviceAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint, Ref{Cvoid}), deviceName, attribute, value)
end

function CreateWatchdogTimerTask(deviceName::Ref{UInt8}, taskName::Ref{UInt8}, taskHandle::Ref{TaskHandle}, timeout::Cdouble, lines::Ref{UInt8}, expState::Cint)
    ccall((:DAQmxCreateWatchdogTimerTask, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Ref{TaskHandle}, Cdouble, Ref{UInt8}, Cint), deviceName, taskName, taskHandle, timeout, lines, expState)
end

function CreateWatchdogTimerTaskEx(deviceName::Ref{UInt8}, taskName::Ref{UInt8}, taskHandle::Ref{TaskHandle}, timeout::Cdouble)
    ccall((:DAQmxCreateWatchdogTimerTaskEx, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Ref{TaskHandle}, Cdouble), deviceName, taskName, taskHandle, timeout)
end

function ControlWatchdogTask(taskHandle::TaskHandle, action::Cint)
    ccall((:DAQmxControlWatchdogTask, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, action)
end

function CfgWatchdogAOExpirStates(taskHandle::TaskHandle, channelNames::Ref{UInt8}, expirStateArray::Ref{Cdouble}, outputTypeArray::Ref{Cint}, arraySize::Cuint)
    ccall((:DAQmxCfgWatchdogAOExpirStates, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}, Ref{Cint}, Cuint), taskHandle, channelNames, expirStateArray, outputTypeArray, arraySize)
end

function CfgWatchdogCOExpirStates(taskHandle::TaskHandle, channelNames::Ref{UInt8}, expirStateArray::Ref{Cint}, arraySize::Cuint)
    ccall((:DAQmxCfgWatchdogCOExpirStates, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}, Cuint), taskHandle, channelNames, expirStateArray, arraySize)
end

function CfgWatchdogDOExpirStates(taskHandle::TaskHandle, channelNames::Ref{UInt8}, expirStateArray::Ref{Cint}, arraySize::Cuint)
    ccall((:DAQmxCfgWatchdogDOExpirStates, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}, Cuint), taskHandle, channelNames, expirStateArray, arraySize)
end

function GetWatchdogAttribute(taskHandle::TaskHandle, lines::Ref{UInt8}, attribute::Cint, value::Ref{Cvoid})
    ccall((:DAQmxGetWatchdogAttribute, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint, Ref{Cvoid}), taskHandle, lines, attribute, value)
end

function SetWatchdogAttribute(taskHandle::TaskHandle, lines::Ref{UInt8}, attribute::Cint)
    ccall((:DAQmxSetWatchdogAttribute, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, lines, attribute)
end

function ResetWatchdogAttribute(taskHandle::TaskHandle, lines::Ref{UInt8}, attribute::Cint)
    ccall((:DAQmxResetWatchdogAttribute, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, lines, attribute)
end

function SelfCal(deviceName::Ref{UInt8})
    ccall((:DAQmxSelfCal, :libnidaqmx), Cint, (Ref{UInt8},), deviceName)
end

function PerformBridgeOffsetNullingCal(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxPerformBridgeOffsetNullingCal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function PerformBridgeOffsetNullingCalEx(taskHandle::TaskHandle, channel::Ref{UInt8}, skipUnsupportedChannels::Cuint)
    ccall((:DAQmxPerformBridgeOffsetNullingCalEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, skipUnsupportedChannels)
end

function PerformThrmcplLeadOffsetNullingCal(taskHandle::TaskHandle, channel::Ref{UInt8}, skipUnsupportedChannels::Cuint)
    ccall((:DAQmxPerformThrmcplLeadOffsetNullingCal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, skipUnsupportedChannels)
end

function PerformStrainShuntCal(taskHandle::TaskHandle, channel::Ref{UInt8}, shuntResistorValue::Cdouble, shuntResistorLocation::Cint, skipUnsupportedChannels::Cuint)
    ccall((:DAQmxPerformStrainShuntCal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble, Cint, Cuint), taskHandle, channel, shuntResistorValue, shuntResistorLocation, skipUnsupportedChannels)
end

function PerformStrainShuntCalEx(taskHandle::TaskHandle, channel::Ref{UInt8}, shuntResistorValue::Cdouble, shuntResistorLocation::Cint, shuntResistorSelect::Cint, shuntResistorSource::Cint, skipUnsupportedChannels::Cuint)
    ccall((:DAQmxPerformStrainShuntCalEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble, Cint, Cint, Cint, Cuint), taskHandle, channel, shuntResistorValue, shuntResistorLocation, shuntResistorSelect, shuntResistorSource, skipUnsupportedChannels)
end

function PerformBridgeShuntCal(taskHandle::TaskHandle, channel::Ref{UInt8}, shuntResistorValue::Cdouble, shuntResistorLocation::Cint, bridgeResistance::Cdouble, skipUnsupportedChannels::Cuint)
    ccall((:DAQmxPerformBridgeShuntCal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble, Cint, Cdouble, Cuint), taskHandle, channel, shuntResistorValue, shuntResistorLocation, bridgeResistance, skipUnsupportedChannels)
end

function PerformBridgeShuntCalEx(taskHandle::TaskHandle, channel::Ref{UInt8}, shuntResistorValue::Cdouble, shuntResistorLocation::Cint, shuntResistorSelect::Cint, shuntResistorSource::Cint, bridgeResistance::Cdouble, skipUnsupportedChannels::Cuint)
    ccall((:DAQmxPerformBridgeShuntCalEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble, Cint, Cint, Cint, Cdouble, Cuint), taskHandle, channel, shuntResistorValue, shuntResistorLocation, shuntResistorSelect, shuntResistorSource, bridgeResistance, skipUnsupportedChannels)
end

function GetSelfCalLastDateAndTime(deviceName::Ref{UInt8}, year::Ref{Cuint}, month::Ref{Cuint}, day::Ref{Cuint}, hour::Ref{Cuint}, minute::Ref{Cuint})
    ccall((:DAQmxGetSelfCalLastDateAndTime, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}, Ref{Cuint}, Ref{Cuint}, Ref{Cuint}, Ref{Cuint}), deviceName, year, month, day, hour, minute)
end

function GetExtCalLastDateAndTime(deviceName::Ref{UInt8}, year::Ref{Cuint}, month::Ref{Cuint}, day::Ref{Cuint}, hour::Ref{Cuint}, minute::Ref{Cuint})
    ccall((:DAQmxGetExtCalLastDateAndTime, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}, Ref{Cuint}, Ref{Cuint}, Ref{Cuint}, Ref{Cuint}), deviceName, year, month, day, hour, minute)
end

function RestoreLastExtCalConst(deviceName::Ref{UInt8})
    ccall((:DAQmxRestoreLastExtCalConst, :libnidaqmx), Cint, (Ref{UInt8},), deviceName)
end

function ESeriesCalAdjust(calHandle::CalHandle, referenceVoltage::Cdouble)
    ccall((:DAQmxESeriesCalAdjust, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, referenceVoltage)
end

function MSeriesCalAdjust(calHandle::CalHandle, referenceVoltage::Cdouble)
    ccall((:DAQmxMSeriesCalAdjust, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, referenceVoltage)
end

function SSeriesCalAdjust(calHandle::CalHandle, referenceVoltage::Cdouble)
    ccall((:DAQmxSSeriesCalAdjust, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, referenceVoltage)
end

function SCBaseboardCalAdjust(calHandle::CalHandle, referenceVoltage::Cdouble)
    ccall((:DAQmxSCBaseboardCalAdjust, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, referenceVoltage)
end

function AOSeriesCalAdjust(calHandle::CalHandle, referenceVoltage::Cdouble)
    ccall((:DAQmxAOSeriesCalAdjust, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, referenceVoltage)
end

function XSeriesCalAdjust(calHandle::CalHandle, referenceVoltage::Cdouble)
    ccall((:DAQmxXSeriesCalAdjust, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, referenceVoltage)
end

function DeviceSupportsCal(deviceName::Ref{UInt8}, calSupported::Ref{Cuint})
    ccall((:DAQmxDeviceSupportsCal, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, calSupported)
end

function GetCalInfoAttribute(deviceName::Ref{UInt8}, attribute::Cint, value::Ref{Cvoid})
    ccall((:DAQmxGetCalInfoAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint, Ref{Cvoid}), deviceName, attribute, value)
end

function SetCalInfoAttribute(deviceName::Ref{UInt8}, attribute::Cint)
    ccall((:DAQmxSetCalInfoAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint), deviceName, attribute)
end

function InitExtCal(deviceName::Ref{UInt8}, password::Ref{UInt8}, calHandle::Ref{CalHandle})
    ccall((:DAQmxInitExtCal, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Ref{CalHandle}), deviceName, password, calHandle)
end

function CloseExtCal(calHandle::CalHandle, action::Cint)
    ccall((:DAQmxCloseExtCal, :libnidaqmx), Cint, (CalHandle, Cint), calHandle, action)
end

function ChangeExtCalPassword(deviceName::Ref{UInt8}, password::Ref{UInt8}, newPassword::Ref{UInt8})
    ccall((:DAQmxChangeExtCalPassword, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Ref{UInt8}), deviceName, password, newPassword)
end

function DSASetCalTemp(calHandle::CalHandle, temperature::Cdouble)
    ccall((:DAQmxDSASetCalTemp, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, temperature)
end

function AdjustDSAAICal(calHandle::CalHandle, referenceVoltage::Cdouble)
    ccall((:DAQmxAdjustDSAAICal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, referenceVoltage)
end

function AdjustDSAAICalEx(calHandle::CalHandle, referenceVoltage::Cdouble, inputsShorted::Cuint)
    ccall((:DAQmxAdjustDSAAICalEx, :libnidaqmx), Cint, (CalHandle, Cdouble, Cuint), calHandle, referenceVoltage, inputsShorted)
end

function AdjustDSAAICalWithGainAndCoupling(calHandle::CalHandle, coupling::Cint, gain::Cdouble, referenceVoltage::Cdouble)
    ccall((:DAQmxAdjustDSAAICalWithGainAndCoupling, :libnidaqmx), Cint, (CalHandle, Cint, Cdouble, Cdouble), calHandle, coupling, gain, referenceVoltage)
end

function AdjustDSAAOCal(calHandle::CalHandle, channel::Cuint, requestedLowVoltage::Cdouble, actualLowVoltage::Cdouble, requestedHighVoltage::Cdouble, actualHighVoltage::Cdouble, gainSetting::Cdouble)
    ccall((:DAQmxAdjustDSAAOCal, :libnidaqmx), Cint, (CalHandle, Cuint, Cdouble, Cdouble, Cdouble, Cdouble, Cdouble), calHandle, channel, requestedLowVoltage, actualLowVoltage, requestedHighVoltage, actualHighVoltage, gainSetting)
end

function Adjust4610Cal(calHandle::CalHandle, channelName::Ref{UInt8}, gain::Cdouble, offset::Cdouble)
    ccall((:DAQmxAdjust4610Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelName, gain, offset)
end

function AdjustDSATimebaseCal(calHandle::CalHandle, referenceFrequency::Cdouble)
    ccall((:DAQmxAdjustDSATimebaseCal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, referenceFrequency)
end

function AdjustDSAAOTimebaseCal(calHandle::CalHandle, measuredFrequency::Cdouble, calComplete::Ref{Cuint})
    ccall((:DAQmxAdjustDSAAOTimebaseCal, :libnidaqmx), Cint, (CalHandle, Cdouble, Ref{Cuint}), calHandle, measuredFrequency, calComplete)
end

function SetupDSAAOTimebaseCal(calHandle::CalHandle, expectedFrequency::Ref{Cdouble})
    ccall((:DAQmxSetupDSAAOTimebaseCal, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}), calHandle, expectedFrequency)
end

function Get4463AdjustPoints(calHandle::CalHandle, terminalConfig::Cint, gain::Cdouble, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet4463AdjustPoints, :libnidaqmx), Cint, (CalHandle, Cint, Cdouble, Ref{Cdouble}, Cuint), calHandle, terminalConfig, gain, adjustmentPoints, bufferSize)
end

function Adjust4463Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, referenceVoltage::Cdouble)
    ccall((:DAQmxAdjust4463Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, referenceVoltage)
end

function Setup4463Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, terminalConfig::Cint, gain::Cdouble, outputVoltage::Cdouble)
    ccall((:DAQmxSetup4463Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint, Cdouble, Cdouble), calHandle, channelNames, terminalConfig, gain, outputVoltage)
end

function Setup4480Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, calMode::Cint)
    ccall((:DAQmxSetup4480Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint), calHandle, channelNames, calMode)
end

function AdjustTIOTimebaseCal(calHandle::CalHandle, referenceFrequency::Cdouble)
    ccall((:DAQmxAdjustTIOTimebaseCal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, referenceFrequency)
end

function Adjust4204Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, lowPassFreq::Cdouble, trackHoldEnabled::Cuint, inputVal::Cdouble)
    ccall((:DAQmxAdjust4204Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cuint, Cdouble), calHandle, channelNames, lowPassFreq, trackHoldEnabled, inputVal)
end

function Adjust4220Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, gain::Cdouble, inputVal::Cdouble)
    ccall((:DAQmxAdjust4220Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelNames, gain, inputVal)
end

function Adjust4224Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, gain::Cdouble, inputVal::Cdouble)
    ccall((:DAQmxAdjust4224Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelNames, gain, inputVal)
end

function Adjust4225Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, gain::Cdouble, inputVal::Cdouble)
    ccall((:DAQmxAdjust4225Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelNames, gain, inputVal)
end

function Setup433xCal(calHandle::CalHandle, channelNames::Ref{UInt8}, excitationVoltage::Cdouble)
    ccall((:DAQmxSetup433xCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, excitationVoltage)
end

function Adjust433xCal(calHandle::CalHandle, refVoltage::Cdouble, refExcitation::Cdouble, shuntLocation::Cint)
    ccall((:DAQmxAdjust433xCal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble, Cint), calHandle, refVoltage, refExcitation, shuntLocation)
end

function Setup4339Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, calMode::Cint, rangeMax::Cdouble, rangeMin::Cdouble, excitationVoltage::Cdouble)
    ccall((:DAQmxSetup4339Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint, Cdouble, Cdouble, Cdouble), calHandle, channelNames, calMode, rangeMax, rangeMin, excitationVoltage)
end

function Adjust4339Cal(calHandle::CalHandle, refVoltage::Cdouble)
    ccall((:DAQmxAdjust4339Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, refVoltage)
end

function Get4339CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet4339CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust4300Cal(calHandle::CalHandle, refVoltage::Cdouble)
    ccall((:DAQmxAdjust4300Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, refVoltage)
end

function Setup4302Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, rangeMin::Cdouble, rangeMax::Cdouble)
    ccall((:DAQmxSetup4302Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelNames, rangeMin, rangeMax)
end

function Get4302CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet4302CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust4302Cal(calHandle::CalHandle, refVoltage::Cdouble)
    ccall((:DAQmxAdjust4302Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, refVoltage)
end

function Setup4303Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, rangeMin::Cdouble, rangeMax::Cdouble)
    ccall((:DAQmxSetup4303Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelNames, rangeMin, rangeMax)
end

function Get4303CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet4303CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust4303Cal(calHandle::CalHandle, refVoltage::Cdouble)
    ccall((:DAQmxAdjust4303Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, refVoltage)
end

function Setup4304Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, rangeMin::Cdouble, rangeMax::Cdouble)
    ccall((:DAQmxSetup4304Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelNames, rangeMin, rangeMax)
end

function Get4304CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet4304CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust4304Cal(calHandle::CalHandle, refVoltage::Cdouble)
    ccall((:DAQmxAdjust4304Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, refVoltage)
end

function Setup4305Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, rangeMin::Cdouble, rangeMax::Cdouble)
    ccall((:DAQmxSetup4305Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelNames, rangeMin, rangeMax)
end

function Get4305CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet4305CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust4305Cal(calHandle::CalHandle, refVoltage::Cdouble)
    ccall((:DAQmxAdjust4305Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, refVoltage)
end

function Adjust4309Cal(calHandle::CalHandle, refVoltage::Cdouble)
    ccall((:DAQmxAdjust4309Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, refVoltage)
end

function Adjust4310Cal(calHandle::CalHandle, refVoltage::Cdouble)
    ccall((:DAQmxAdjust4310Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, refVoltage)
end

function Adjust4353Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, refVal::Cdouble)
    ccall((:DAQmxAdjust4353Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, refVal)
end

function Adjust4357Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, refVals::Ref{Cdouble}, numRefVals::Cint)
    ccall((:DAQmxAdjust4357Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Ref{Cdouble}, Cint), calHandle, channelNames, refVals, numRefVals)
end

function Setup4322Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, outputType::Cint, outputVal::Cdouble)
    ccall((:DAQmxSetup4322Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint, Cdouble), calHandle, channelNames, outputType, outputVal)
end

function Adjust4322Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, refVal::Cdouble)
    ccall((:DAQmxAdjust4322Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, refVal)
end

function Get4322CalAdjustPoints(calHandle::CalHandle, outputType::Cint, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet4322CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Cint, Ref{Cdouble}, Cuint), calHandle, outputType, adjustmentPoints, bufferSize)
end

function ConnectSCExpressCalAccChans(calHandle::CalHandle, channelNames::Ref{UInt8}, connection::Ref{UInt8})
    ccall((:DAQmxConnectSCExpressCalAccChans, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Ref{UInt8}), calHandle, channelNames, connection)
end

function DisconnectSCExpressCalAccChans(calHandle::CalHandle)
    ccall((:DAQmxDisconnectSCExpressCalAccChans, :libnidaqmx), Cint, (CalHandle,), calHandle)
end

function GetPossibleSCExpressCalAccConnections(deviceName::Ref{UInt8}, channelNames::Ref{UInt8}, connections, connectionsBufferSize::Cuint)
    ccall((:DAQmxGetPossibleSCExpressCalAccConnections, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Cstring, Cuint), deviceName, channelNames, connections, connectionsBufferSize)
end

function SetSCExpressCalAccBridgeOutput(calHandle::CalHandle, voltsPerVolt::Cdouble)
    ccall((:DAQmxSetSCExpressCalAccBridgeOutput, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, voltsPerVolt)
end

function FieldDAQSetCalTemp(calHandle::CalHandle, temperature::Cdouble)
    ccall((:DAQmxFieldDAQSetCalTemp, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, temperature)
end

function Get11603CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet11603CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust11603Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust11603Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get11613CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet11613CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust11613Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust11613Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get11614CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet11614CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust11614Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust11614Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Setup11634Cal(calHandle::CalHandle, rangeMin::Cdouble, rangeMax::Cdouble)
    ccall((:DAQmxSetup11634Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, rangeMin, rangeMax)
end

function Get11634CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet11634CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust11634Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust11634Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Setup11637Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, bridgeConfig::Cint, voltageExcitation::Cdouble)
    ccall((:DAQmxSetup11637Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint, Cdouble), calHandle, channelNames, bridgeConfig, voltageExcitation)
end

function Adjust11637Cal(calHandle::CalHandle, value::Cdouble, actualReading::Ref{Cdouble}, asFoundGainError::Ref{Cdouble}, asFoundOffsetError::Ref{Cdouble})
    ccall((:DAQmxAdjust11637Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}), calHandle, value, actualReading, asFoundGainError, asFoundOffsetError)
end

function Get9201CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9201CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function CSeriesSetCalTemp(calHandle::CalHandle, temperature::Cdouble)
    ccall((:DAQmxCSeriesSetCalTemp, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, temperature)
end

function Adjust9201Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9201Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9202CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9202CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9202Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9202Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9203CalAdjustPoints(calHandle::CalHandle, rangeMin::Cdouble, rangeMax::Cdouble, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9203CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble, Ref{Cdouble}, Cuint), calHandle, rangeMin, rangeMax, adjustmentPoints, bufferSize)
end

function Adjust9203GainCal(calHandle::CalHandle, channelNames::Ref{UInt8}, rangeMin::Cdouble, rangeMax::Cdouble, value::Cdouble)
    ccall((:DAQmxAdjust9203GainCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble, Cdouble), calHandle, channelNames, rangeMin, rangeMax, value)
end

function Adjust9203OffsetCal(calHandle::CalHandle, channelNames::Ref{UInt8}, rangeMin::Cdouble, rangeMax::Cdouble)
    ccall((:DAQmxAdjust9203OffsetCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelNames, rangeMin, rangeMax)
end

function Adjust9205Cal(calHandle::CalHandle, value::Cdouble)
    ccall((:DAQmxAdjust9205Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, value)
end

function Adjust9206Cal(calHandle::CalHandle, value::Cdouble)
    ccall((:DAQmxAdjust9206Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, value)
end

function Get9207CalAdjustPoints(calHandle::CalHandle, channelNames::Ref{UInt8}, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9207CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), calHandle, channelNames, adjustmentPoints, bufferSize)
end

function Adjust9207GainCal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9207GainCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Adjust9207OffsetCal(calHandle::CalHandle, channelNames::Ref{UInt8})
    ccall((:DAQmxAdjust9207OffsetCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}), calHandle, channelNames)
end

function Get9208CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9208CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9208GainCal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9208GainCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Adjust9208OffsetCal(calHandle::CalHandle, channelNames::Ref{UInt8})
    ccall((:DAQmxAdjust9208OffsetCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}), calHandle, channelNames)
end

function Get9209CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9209CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9209GainCal(calHandle::CalHandle, channelNames::Ref{UInt8}, terminalConfig::Cint, value::Cdouble)
    ccall((:DAQmxAdjust9209GainCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint, Cdouble), calHandle, channelNames, terminalConfig, value)
end

function Adjust9209OffsetCal(calHandle::CalHandle, channelNames::Ref{UInt8})
    ccall((:DAQmxAdjust9209OffsetCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}), calHandle, channelNames)
end

function Adjust9210Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9210Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Adjust9211Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9211Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9212CalAdjustPoints(calHandle::CalHandle, channelNames::Ref{UInt8}, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9212CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), calHandle, channelNames, adjustmentPoints, bufferSize)
end

function Adjust9212Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9212Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9213CalAdjustPoints(calHandle::CalHandle, rangeMin::Cdouble, rangeMax::Cdouble, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9213CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble, Ref{Cdouble}, Cuint), calHandle, rangeMin, rangeMax, adjustmentPoints, bufferSize)
end

function Adjust9213Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, rangeMin::Cdouble, rangeMax::Cdouble, value::Cdouble)
    ccall((:DAQmxAdjust9213Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble, Cdouble), calHandle, channelNames, rangeMin, rangeMax, value)
end

function Get9214CalAdjustPoints(calHandle::CalHandle, channelNames::Ref{UInt8}, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9214CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), calHandle, channelNames, adjustmentPoints, bufferSize)
end

function Adjust9214Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9214Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9215CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9215CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9215Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9215Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9216CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9216CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9216Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9216Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9217CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9217CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9217Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9217Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Setup9218Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, rangeMin::Cdouble, rangeMax::Cdouble, measType::Cint)
    ccall((:DAQmxSetup9218Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble, Cint), calHandle, channelNames, rangeMin, rangeMax, measType)
end

function Get9218CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9218CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9218Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9218Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Setup9219Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, rangeMin::Cdouble, rangeMax::Cdouble, measType::Cint, bridgeConfig::Cint)
    ccall((:DAQmxSetup9219Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble, Cint, Cint), calHandle, channelNames, rangeMin, rangeMax, measType, bridgeConfig)
end

function Get9219CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9219CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9219Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9219Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9220CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9220CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9220Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9220Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9221CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9221CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9221Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9221Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9222CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9222CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9222Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9222Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9223CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9223CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9223Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9223Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9224CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9224CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9224Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9224Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9225CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9225CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9225Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9225Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9226CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9226CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9226Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9226Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9227CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9227CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9227Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9227Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9228CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9228CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9228Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9228Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9229CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9229CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9229Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9229Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9230CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9230CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9230Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9230Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9231CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9231CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9231Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9231Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9232CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9232CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9232Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9232Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9234CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9234CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9234GainCal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9234GainCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Adjust9234OffsetCal(calHandle::CalHandle, channelNames::Ref{UInt8})
    ccall((:DAQmxAdjust9234OffsetCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}), calHandle, channelNames)
end

function Get9238CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9238CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9238Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9238Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9239CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9239CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9239Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9239Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9242CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9242CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Setup9242Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxSetup9242Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Adjust9242Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9242Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9244CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9244CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Setup9244Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxSetup9244Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Adjust9244Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9244Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9246CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9246CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9246Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9246Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9247CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9247CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9247Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9247Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9250CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9250CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9250Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9250Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9251CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9251CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cdouble}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Adjust9251Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9251Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9260CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cint}, bufferSize::Cuint)
    ccall((:DAQmxGet9260CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cint}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Setup9260Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cint)
    ccall((:DAQmxSetup9260Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint), calHandle, channelNames, value)
end

function Adjust9260Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9260Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9263CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cint}, bufferSize::Cuint)
    ccall((:DAQmxGet9263CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cint}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Setup9263Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cint)
    ccall((:DAQmxSetup9263Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint), calHandle, channelNames, value)
end

function Adjust9263Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9263Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9264CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cint}, bufferSize::Cuint)
    ccall((:DAQmxGet9264CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cint}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Setup9264Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cint)
    ccall((:DAQmxSetup9264Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint), calHandle, channelNames, value)
end

function Adjust9264Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9264Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9265CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cint}, bufferSize::Cuint)
    ccall((:DAQmxGet9265CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cint}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Setup9265Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cint)
    ccall((:DAQmxSetup9265Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint), calHandle, channelNames, value)
end

function Adjust9265Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9265Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9266CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cint}, bufferSize::Cuint)
    ccall((:DAQmxGet9266CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cint}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Setup9266Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cint)
    ccall((:DAQmxSetup9266Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint), calHandle, channelNames, value)
end

function Adjust9266Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9266Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9269CalAdjustPoints(calHandle::CalHandle, adjustmentPoints::Ref{Cint}, bufferSize::Cuint)
    ccall((:DAQmxGet9269CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Ref{Cint}, Cuint), calHandle, adjustmentPoints, bufferSize)
end

function Setup9269Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cint)
    ccall((:DAQmxSetup9269Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint), calHandle, channelNames, value)
end

function Adjust9269Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble)
    ccall((:DAQmxAdjust9269Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelNames, value)
end

function Get9775CalAdjustPoints(calHandle::CalHandle, coupling::Cuint, adjustmentPoints::Ref{Cdouble}, bufferSize::Cuint)
    ccall((:DAQmxGet9775CalAdjustPoints, :libnidaqmx), Cint, (CalHandle, Cuint, Ref{Cdouble}, Cuint), calHandle, coupling, adjustmentPoints, bufferSize)
end

function Adjust9775Cal(calHandle::CalHandle, channelNames::Ref{UInt8}, value::Cdouble, coupling::Cuint)
    ccall((:DAQmxAdjust9775Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cuint), calHandle, channelNames, value, coupling)
end

function Setup1102Cal(calHandle::CalHandle, channelName::Ref{UInt8}, gain::Cdouble)
    ccall((:DAQmxSetup1102Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust1102Cal(calHandle::CalHandle, refVoltage::Cdouble, measOutput::Cdouble)
    ccall((:DAQmxAdjust1102Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1104Cal(calHandle::CalHandle, channelName::Ref{UInt8})
    ccall((:DAQmxSetup1104Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}), calHandle, channelName)
end

function Adjust1104Cal(calHandle::CalHandle, refVoltage::Cdouble, measOutput::Cdouble)
    ccall((:DAQmxAdjust1104Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1112Cal(calHandle::CalHandle, channelName::Ref{UInt8})
    ccall((:DAQmxSetup1112Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}), calHandle, channelName)
end

function Adjust1112Cal(calHandle::CalHandle, refVoltage::Cdouble, measOutput::Cdouble)
    ccall((:DAQmxAdjust1112Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1122Cal(calHandle::CalHandle, channelName::Ref{UInt8}, gain::Cdouble)
    ccall((:DAQmxSetup1122Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust1122Cal(calHandle::CalHandle, refVoltage::Cdouble, measOutput::Cdouble)
    ccall((:DAQmxAdjust1122Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1124Cal(calHandle::CalHandle, channelName::Ref{UInt8}, range::Cint, dacValue::Cuint)
    ccall((:DAQmxSetup1124Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cint, Cuint), calHandle, channelName, range, dacValue)
end

function Adjust1124Cal(calHandle::CalHandle, measOutput::Cdouble)
    ccall((:DAQmxAdjust1124Cal, :libnidaqmx), Cint, (CalHandle, Cdouble), calHandle, measOutput)
end

function Setup1125Cal(calHandle::CalHandle, channelName::Ref{UInt8}, gain::Cdouble)
    ccall((:DAQmxSetup1125Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust1125Cal(calHandle::CalHandle, refVoltage::Cdouble, measOutput::Cdouble)
    ccall((:DAQmxAdjust1125Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1126Cal(calHandle::CalHandle, channelName::Ref{UInt8}, upperFreqLimit::Cdouble)
    ccall((:DAQmxSetup1126Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, upperFreqLimit)
end

function Adjust1126Cal(calHandle::CalHandle, refFreq::Cdouble, measOutput::Cdouble)
    ccall((:DAQmxAdjust1126Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refFreq, measOutput)
end

function Setup1141Cal(calHandle::CalHandle, channelName::Ref{UInt8}, gain::Cdouble)
    ccall((:DAQmxSetup1141Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust1141Cal(calHandle::CalHandle, refVoltage::Cdouble, measOutput::Cdouble)
    ccall((:DAQmxAdjust1141Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1142Cal(calHandle::CalHandle, channelName::Ref{UInt8}, gain::Cdouble)
    ccall((:DAQmxSetup1142Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust1142Cal(calHandle::CalHandle, refVoltage::Cdouble, measOutput::Cdouble)
    ccall((:DAQmxAdjust1142Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1143Cal(calHandle::CalHandle, channelName::Ref{UInt8}, gain::Cdouble)
    ccall((:DAQmxSetup1143Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust1143Cal(calHandle::CalHandle, refVoltage::Cdouble, measOutput::Cdouble)
    ccall((:DAQmxAdjust1143Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1502Cal(calHandle::CalHandle, channelName::Ref{UInt8}, gain::Cdouble)
    ccall((:DAQmxSetup1502Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust1502Cal(calHandle::CalHandle, refVoltage::Cdouble, measOutput::Cdouble)
    ccall((:DAQmxAdjust1502Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1503Cal(calHandle::CalHandle, channelName::Ref{UInt8}, gain::Cdouble)
    ccall((:DAQmxSetup1503Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust1503Cal(calHandle::CalHandle, refVoltage::Cdouble, measOutput::Cdouble)
    ccall((:DAQmxAdjust1503Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Adjust1503CurrentCal(calHandle::CalHandle, channelName::Ref{UInt8}, measCurrent::Cdouble)
    ccall((:DAQmxAdjust1503CurrentCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, measCurrent)
end

function Setup1520Cal(calHandle::CalHandle, channelName::Ref{UInt8}, gain::Cdouble)
    ccall((:DAQmxSetup1520Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust1520Cal(calHandle::CalHandle, refVoltage::Cdouble, measOutput::Cdouble)
    ccall((:DAQmxAdjust1520Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1521Cal(calHandle::CalHandle, channelName::Ref{UInt8})
    ccall((:DAQmxSetup1521Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}), calHandle, channelName)
end

function Adjust1521Cal(calHandle::CalHandle, refVoltage::Cdouble, measOutput::Cdouble)
    ccall((:DAQmxAdjust1521Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup153xCal(calHandle::CalHandle, channelName::Ref{UInt8}, gain::Cdouble)
    ccall((:DAQmxSetup153xCal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble), calHandle, channelName, gain)
end

function Adjust153xCal(calHandle::CalHandle, refVoltage::Cdouble, measOutput::Cdouble)
    ccall((:DAQmxAdjust153xCal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble), calHandle, refVoltage, measOutput)
end

function Setup1540Cal(calHandle::CalHandle, channelName::Ref{UInt8}, excitationVoltage::Cdouble, excitationFreq::Cdouble)
    ccall((:DAQmxSetup1540Cal, :libnidaqmx), Cint, (CalHandle, Ref{UInt8}, Cdouble, Cdouble), calHandle, channelName, excitationVoltage, excitationFreq)
end

function Adjust1540Cal(calHandle::CalHandle, refVoltage::Cdouble, measOutput::Cdouble, inputCalSource::Cint)
    ccall((:DAQmxAdjust1540Cal, :libnidaqmx), Cint, (CalHandle, Cdouble, Cdouble, Cint), calHandle, refVoltage, measOutput, inputCalSource)
end

function ConfigureTEDS(physicalChannel::Ref{UInt8}, filePath::Ref{UInt8})
    ccall((:DAQmxConfigureTEDS, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}), physicalChannel, filePath)
end

function ClearTEDS(physicalChannel::Ref{UInt8})
    ccall((:DAQmxClearTEDS, :libnidaqmx), Cint, (Ref{UInt8},), physicalChannel)
end

function WriteToTEDSFromArray(physicalChannel::Ref{UInt8}, bitStream::Ref{Cuchar}, arraySize::Cuint, basicTEDSOptions::Cint)
    ccall((:DAQmxWriteToTEDSFromArray, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuchar}, Cuint, Cint), physicalChannel, bitStream, arraySize, basicTEDSOptions)
end

function WriteToTEDSFromFile(physicalChannel::Ref{UInt8}, filePath::Ref{UInt8}, basicTEDSOptions::Cint)
    ccall((:DAQmxWriteToTEDSFromFile, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Cint), physicalChannel, filePath, basicTEDSOptions)
end

function GetPhysicalChanAttribute(physicalChannel::Ref{UInt8}, attribute::Cint, value::Ref{Cvoid})
    ccall((:DAQmxGetPhysicalChanAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint, Ref{Cvoid}), physicalChannel, attribute, value)
end

function WaitForNextSampleClock(taskHandle::TaskHandle, timeout::Cdouble, isLate::Ref{Cuint})
    ccall((:DAQmxWaitForNextSampleClock, :libnidaqmx), Cint, (TaskHandle, Cdouble, Ref{Cuint}), taskHandle, timeout, isLate)
end

function GetRealTimeAttribute(taskHandle::TaskHandle, attribute::Cint, value::Ref{Cvoid})
    ccall((:DAQmxGetRealTimeAttribute, :libnidaqmx), Cint, (TaskHandle, Cint, Ref{Cvoid}), taskHandle, attribute, value)
end

function SetRealTimeAttribute(taskHandle::TaskHandle, attribute::Cint)
    ccall((:DAQmxSetRealTimeAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function ResetRealTimeAttribute(taskHandle::TaskHandle, attribute::Cint)
    ccall((:DAQmxResetRealTimeAttribute, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, attribute)
end

function IsReadOrWriteLate(errorCode::Cint)
    ccall((:DAQmxIsReadOrWriteLate, :libnidaqmx), Cint, (Cint,), errorCode)
end

function SaveTask(taskHandle::TaskHandle, saveAs::Ref{UInt8}, author::Ref{UInt8}, options::Cuint)
    ccall((:DAQmxSaveTask, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Cuint), taskHandle, saveAs, author, options)
end

function SaveGlobalChan(taskHandle::TaskHandle, channelName::Ref{UInt8}, saveAs::Ref{UInt8}, author::Ref{UInt8}, options::Cuint)
    ccall((:DAQmxSaveGlobalChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{UInt8}, Ref{UInt8}, Cuint), taskHandle, channelName, saveAs, author, options)
end

function SaveScale(scaleName::Ref{UInt8}, saveAs::Ref{UInt8}, author::Ref{UInt8}, options::Cuint)
    ccall((:DAQmxSaveScale, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Ref{UInt8}, Cuint), scaleName, saveAs, author, options)
end

function DeleteSavedTask(taskName::Ref{UInt8})
    ccall((:DAQmxDeleteSavedTask, :libnidaqmx), Cint, (Ref{UInt8},), taskName)
end

function DeleteSavedGlobalChan(channelName::Ref{UInt8})
    ccall((:DAQmxDeleteSavedGlobalChan, :libnidaqmx), Cint, (Ref{UInt8},), channelName)
end

function DeleteSavedScale(scaleName::Ref{UInt8})
    ccall((:DAQmxDeleteSavedScale, :libnidaqmx), Cint, (Ref{UInt8},), scaleName)
end

function GetPersistedTaskAttribute(taskName::Ref{UInt8}, attribute::Cint, value::Ref{Cvoid})
    ccall((:DAQmxGetPersistedTaskAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint, Ref{Cvoid}), taskName, attribute, value)
end

function GetPersistedChanAttribute(channel::Ref{UInt8}, attribute::Cint, value::Ref{Cvoid})
    ccall((:DAQmxGetPersistedChanAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint, Ref{Cvoid}), channel, attribute, value)
end

function GetPersistedScaleAttribute(scaleName::Ref{UInt8}, attribute::Cint, value::Ref{Cvoid})
    ccall((:DAQmxGetPersistedScaleAttribute, :libnidaqmx), Cint, (Ref{UInt8}, Cint, Ref{Cvoid}), scaleName, attribute, value)
end

function GetSystemInfoAttribute(attribute::Cint, value::Ref{Cvoid})
    ccall((:DAQmxGetSystemInfoAttribute, :libnidaqmx), Cint, (Cint, Ref{Cvoid}), attribute, value)
end

function SetDigitalPowerUpStates(deviceName::Ref{UInt8}, channelNames::Ref{UInt8}, state::Cint)
    ccall((:DAQmxSetDigitalPowerUpStates, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Cint), deviceName, channelNames, state)
end

function GetDigitalPowerUpStates(deviceName::Ref{UInt8}, channelName::Ref{UInt8}, state::Ref{Cint})
    ccall((:DAQmxGetDigitalPowerUpStates, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Ref{Cint}), deviceName, channelName, state)
end

function SetDigitalPullUpPullDownStates(deviceName::Ref{UInt8}, channelName::Ref{UInt8}, state::Cint)
    ccall((:DAQmxSetDigitalPullUpPullDownStates, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Cint), deviceName, channelName, state)
end

function GetDigitalPullUpPullDownStates(deviceName::Ref{UInt8}, channelName::Ref{UInt8}, state::Ref{Cint})
    ccall((:DAQmxGetDigitalPullUpPullDownStates, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Ref{Cint}), deviceName, channelName, state)
end

function SetAnalogPowerUpStates(deviceName::Ref{UInt8}, channelNames::Ref{UInt8}, state::Cdouble, channelType::Cint)
    ccall((:DAQmxSetAnalogPowerUpStates, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Cdouble, Cint), deviceName, channelNames, state, channelType)
end

function SetAnalogPowerUpStatesWithOutputType(channelNames::Ref{UInt8}, stateArray::Ref{Cdouble}, channelTypeArray::Ref{Cint}, arraySize::Cuint)
    ccall((:DAQmxSetAnalogPowerUpStatesWithOutputType, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Ref{Cint}, Cuint), channelNames, stateArray, channelTypeArray, arraySize)
end

function GetAnalogPowerUpStates(deviceName::Ref{UInt8}, channelName::Ref{UInt8}, state::Ref{Cdouble}, channelType::Cint)
    ccall((:DAQmxGetAnalogPowerUpStates, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Ref{Cdouble}, Cint), deviceName, channelName, state, channelType)
end

function GetAnalogPowerUpStatesWithOutputType(channelNames::Ref{UInt8}, stateArray::Ref{Cdouble}, channelTypeArray::Ref{Cint}, arraySizePtr::Ref{Cuint})
    ccall((:DAQmxGetAnalogPowerUpStatesWithOutputType, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Ref{Cint}, Ref{Cuint}), channelNames, stateArray, channelTypeArray, arraySizePtr)
end

function SetDigitalLogicFamilyPowerUpState(deviceName::Ref{UInt8}, logicFamily::Cint)
    ccall((:DAQmxSetDigitalLogicFamilyPowerUpState, :libnidaqmx), Cint, (Ref{UInt8}, Cint), deviceName, logicFamily)
end

function GetDigitalLogicFamilyPowerUpState(deviceName::Ref{UInt8}, logicFamily::Ref{Cint})
    ccall((:DAQmxGetDigitalLogicFamilyPowerUpState, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), deviceName, logicFamily)
end

function AddNetworkDevice(IPAddress::Ref{UInt8}, deviceName::Ref{UInt8}, attemptReservation::Cuint, timeout::Cdouble, deviceNameOut::Ref{UInt8}, deviceNameOutBufferSize::Cuint)
    ccall((:DAQmxAddNetworkDevice, :libnidaqmx), Cint, (Ref{UInt8}, Ref{UInt8}, Cuint, Cdouble, Ref{UInt8}, Cuint), IPAddress, deviceName, attemptReservation, timeout, deviceNameOut, deviceNameOutBufferSize)
end

function DeleteNetworkDevice(deviceName::Ref{UInt8})
    ccall((:DAQmxDeleteNetworkDevice, :libnidaqmx), Cint, (Ref{UInt8},), deviceName)
end

function ReserveNetworkDevice(deviceName::Ref{UInt8}, overrideReservation::Cuint)
    ccall((:DAQmxReserveNetworkDevice, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), deviceName, overrideReservation)
end

function UnreserveNetworkDevice(deviceName::Ref{UInt8})
    ccall((:DAQmxUnreserveNetworkDevice, :libnidaqmx), Cint, (Ref{UInt8},), deviceName)
end

function AutoConfigureCDAQSyncConnections(chassisDevicesPorts::Ref{UInt8}, timeout::Cdouble)
    ccall((:DAQmxAutoConfigureCDAQSyncConnections, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble), chassisDevicesPorts, timeout)
end

function GetAutoConfiguredCDAQSyncConnections(portList::Ref{UInt8}, portListSize::Cuint)
    ccall((:DAQmxGetAutoConfiguredCDAQSyncConnections, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), portList, portListSize)
end

function AreConfiguredCDAQSyncPortsDisconnected(chassisDevicesPorts::Ref{UInt8}, timeout::Cdouble, disconnectedPortsExist::Ref{Cuint})
    ccall((:DAQmxAreConfiguredCDAQSyncPortsDisconnected, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble, Ref{Cuint}), chassisDevicesPorts, timeout, disconnectedPortsExist)
end

function GetDisconnectedCDAQSyncPorts(portList::Ref{UInt8}, portListSize::Cuint)
    ccall((:DAQmxGetDisconnectedCDAQSyncPorts, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), portList, portListSize)
end

function AddCDAQSyncConnection(portList::Ref{UInt8})
    ccall((:DAQmxAddCDAQSyncConnection, :libnidaqmx), Cint, (Ref{UInt8},), portList)
end

function RemoveCDAQSyncConnection(portList::Ref{UInt8})
    ccall((:DAQmxRemoveCDAQSyncConnection, :libnidaqmx), Cint, (Ref{UInt8},), portList)
end

function GetErrorString(errorCode::Cint, errorString::Ref{UInt8}, bufferSize::Cuint)
    ccall((:DAQmxGetErrorString, :libnidaqmx), Cint, (Cint, Ref{UInt8}, Cuint), errorCode, errorString, bufferSize)
end

function GetExtendedErrorInfo(errorString::Ref{UInt8}, bufferSize::Cuint)
    ccall((:DAQmxGetExtendedErrorInfo, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), errorString, bufferSize)
end

function GetBufInputBufSize(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetBufInputBufSize, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetBufInputBufSize(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetBufInputBufSize, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetBufInputBufSize(taskHandle::TaskHandle)
    ccall((:DAQmxResetBufInputBufSize, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetBufInputOnbrdBufSize(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetBufInputOnbrdBufSize, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetBufOutputBufSize(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetBufOutputBufSize, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetBufOutputBufSize(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetBufOutputBufSize, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetBufOutputBufSize(taskHandle::TaskHandle)
    ccall((:DAQmxResetBufOutputBufSize, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetBufOutputOnbrdBufSize(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetBufOutputOnbrdBufSize, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetBufOutputOnbrdBufSize(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetBufOutputOnbrdBufSize, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetBufOutputOnbrdBufSize(taskHandle::TaskHandle)
    ccall((:DAQmxResetBufOutputOnbrdBufSize, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSelfCalSupported(deviceName::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetSelfCalSupported, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function GetSelfCalLastTemp(deviceName::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetSelfCalLastTemp, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), deviceName, data)
end

function GetExtCalRecommendedInterval(deviceName::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetExtCalRecommendedInterval, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function GetExtCalLastTemp(deviceName::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetExtCalLastTemp, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), deviceName, data)
end

function GetCalUserDefinedInfo(deviceName::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCalUserDefinedInfo, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), deviceName, data, bufferSize)
end

function SetCalUserDefinedInfo(deviceName::Ref{UInt8}, data)
    ccall((:DAQmxSetCalUserDefinedInfo, :libnidaqmx), Cint, (Ref{UInt8}, Cstring), deviceName, data)
end

function GetCalUserDefinedInfoMaxSize(deviceName::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCalUserDefinedInfoMaxSize, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function GetCalDevTemp(deviceName::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCalDevTemp, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), deviceName, data)
end

function GetCalAccConnectionCount(deviceName::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCalAccConnectionCount, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function SetCalAccConnectionCount(deviceName::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCalAccConnectionCount, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), deviceName, data)
end

function GetCalRecommendedAccConnectionCountLimit(deviceName::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCalRecommendedAccConnectionCountLimit, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function GetAIMax(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIMax, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIMax(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIMax, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIMax(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIMax, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIMin(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIMin, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIMin(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIMin, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIMin(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIMin, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAICustomScaleName(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetAICustomScaleName, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetAICustomScaleName(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetAICustomScaleName, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetAICustomScaleName(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAICustomScaleName, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIMeasType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIMeasType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function GetAIVoltageUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIVoltageUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIVoltageUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIVoltageUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIVoltageUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIVoltageUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIVoltagedBRef(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIVoltagedBRef, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIVoltagedBRef(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIVoltagedBRef, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIVoltagedBRef(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIVoltagedBRef, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIVoltageACRMSUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIVoltageACRMSUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIVoltageACRMSUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIVoltageACRMSUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIVoltageACRMSUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIVoltageACRMSUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAITempUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAITempUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAITempUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAITempUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAITempUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAITempUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIThrmcplType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIThrmcplType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIThrmcplType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIThrmcplType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIThrmcplType(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIThrmcplType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIThrmcplScaleType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIThrmcplScaleType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIThrmcplScaleType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIThrmcplScaleType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIThrmcplScaleType(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIThrmcplScaleType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIThrmcplCJCSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIThrmcplCJCSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function GetAIThrmcplCJCVal(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIThrmcplCJCVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIThrmcplCJCVal(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIThrmcplCJCVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIThrmcplCJCVal(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIThrmcplCJCVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIThrmcplCJCChan(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetAIThrmcplCJCChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function GetAIRTDType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIRTDType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIRTDType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIRTDType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIRTDType(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIRTDType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIRTDR0(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIRTDR0, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIRTDR0(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIRTDR0, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIRTDR0(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIRTDR0, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIRTDA(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIRTDA, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIRTDA(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIRTDA, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIRTDA(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIRTDA, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIRTDB(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIRTDB, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIRTDB(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIRTDB, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIRTDB(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIRTDB, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIRTDC(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIRTDC, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIRTDC(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIRTDC, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIRTDC(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIRTDC, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIThrmstrA(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIThrmstrA, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIThrmstrA(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIThrmstrA, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIThrmstrA(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIThrmstrA, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIThrmstrB(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIThrmstrB, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIThrmstrB(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIThrmstrB, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIThrmstrB(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIThrmstrB, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIThrmstrC(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIThrmstrC, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIThrmstrC(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIThrmstrC, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIThrmstrC(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIThrmstrC, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIThrmstrR1(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIThrmstrR1, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIThrmstrR1(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIThrmstrR1, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIThrmstrR1(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIThrmstrR1, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIForceReadFromChan(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIForceReadFromChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIForceReadFromChan(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAIForceReadFromChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAIForceReadFromChan(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIForceReadFromChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAICurrentUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAICurrentUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAICurrentUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAICurrentUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAICurrentUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAICurrentUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAICurrentACRMSUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAICurrentACRMSUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAICurrentACRMSUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAICurrentACRMSUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAICurrentACRMSUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAICurrentACRMSUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIStrainUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIStrainUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIStrainUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIStrainUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIStrainUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIStrainUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIStrainGageForceReadFromChan(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIStrainGageForceReadFromChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIStrainGageForceReadFromChan(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAIStrainGageForceReadFromChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAIStrainGageForceReadFromChan(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIStrainGageForceReadFromChan, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIStrainGageGageFactor(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIStrainGageGageFactor, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIStrainGageGageFactor(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIStrainGageGageFactor, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIStrainGageGageFactor(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIStrainGageGageFactor, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIStrainGagePoissonRatio(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIStrainGagePoissonRatio, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIStrainGagePoissonRatio(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIStrainGagePoissonRatio, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIStrainGagePoissonRatio(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIStrainGagePoissonRatio, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIStrainGageCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIStrainGageCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIStrainGageCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIStrainGageCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIStrainGageCfg(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIStrainGageCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIRosetteStrainGageRosetteType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIRosetteStrainGageRosetteType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function GetAIRosetteStrainGageOrientation(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIRosetteStrainGageOrientation, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIRosetteStrainGageOrientation(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIRosetteStrainGageOrientation, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIRosetteStrainGageOrientation(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIRosetteStrainGageOrientation, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIRosetteStrainGageStrainChans(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetAIRosetteStrainGageStrainChans, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function GetAIRosetteStrainGageRosetteMeasType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIRosetteStrainGageRosetteMeasType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIRosetteStrainGageRosetteMeasType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIRosetteStrainGageRosetteMeasType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIRosetteStrainGageRosetteMeasType(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIRosetteStrainGageRosetteMeasType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIResistanceUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIResistanceUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIResistanceUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIResistanceUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIResistanceUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIResistanceUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIFreqUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIFreqUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIFreqUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIFreqUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIFreqUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIFreqUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIFreqThreshVoltage(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIFreqThreshVoltage, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIFreqThreshVoltage(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIFreqThreshVoltage, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIFreqThreshVoltage(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIFreqThreshVoltage, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIFreqHyst(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIFreqHyst, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIFreqHyst(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIFreqHyst, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIFreqHyst(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIFreqHyst, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAILVDTUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAILVDTUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAILVDTUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAILVDTUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAILVDTUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAILVDTUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAILVDTSensitivity(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAILVDTSensitivity, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAILVDTSensitivity(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAILVDTSensitivity, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAILVDTSensitivity(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAILVDTSensitivity, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAILVDTSensitivityUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAILVDTSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAILVDTSensitivityUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAILVDTSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAILVDTSensitivityUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAILVDTSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIRVDTUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIRVDTUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIRVDTUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIRVDTUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIRVDTUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIRVDTUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIRVDTSensitivity(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIRVDTSensitivity, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIRVDTSensitivity(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIRVDTSensitivity, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIRVDTSensitivity(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIRVDTSensitivity, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIRVDTSensitivityUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIRVDTSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIRVDTSensitivityUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIRVDTSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIRVDTSensitivityUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIRVDTSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIEddyCurrentProxProbeUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIEddyCurrentProxProbeUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIEddyCurrentProxProbeUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIEddyCurrentProxProbeUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIEddyCurrentProxProbeUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIEddyCurrentProxProbeUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIEddyCurrentProxProbeSensitivity(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIEddyCurrentProxProbeSensitivity, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIEddyCurrentProxProbeSensitivity(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIEddyCurrentProxProbeSensitivity, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIEddyCurrentProxProbeSensitivity(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIEddyCurrentProxProbeSensitivity, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIEddyCurrentProxProbeSensitivityUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIEddyCurrentProxProbeSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIEddyCurrentProxProbeSensitivityUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIEddyCurrentProxProbeSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIEddyCurrentProxProbeSensitivityUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIEddyCurrentProxProbeSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAISoundPressureMaxSoundPressureLvl(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAISoundPressureMaxSoundPressureLvl, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAISoundPressureMaxSoundPressureLvl(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAISoundPressureMaxSoundPressureLvl, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAISoundPressureMaxSoundPressureLvl(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAISoundPressureMaxSoundPressureLvl, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAISoundPressureUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAISoundPressureUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAISoundPressureUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAISoundPressureUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAISoundPressureUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAISoundPressureUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAISoundPressuredBRef(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAISoundPressuredBRef, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAISoundPressuredBRef(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAISoundPressuredBRef, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAISoundPressuredBRef(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAISoundPressuredBRef, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIMicrophoneSensitivity(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIMicrophoneSensitivity, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIMicrophoneSensitivity(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIMicrophoneSensitivity, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIMicrophoneSensitivity(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIMicrophoneSensitivity, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIAccelUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIAccelUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIAccelUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIAccelUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIAccelUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIAccelUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIAcceldBRef(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIAcceldBRef, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIAcceldBRef(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIAcceldBRef, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIAcceldBRef(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIAcceldBRef, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIAccel4WireDCVoltageSensitivity(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIAccel4WireDCVoltageSensitivity, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIAccel4WireDCVoltageSensitivity(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIAccel4WireDCVoltageSensitivity, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIAccel4WireDCVoltageSensitivity(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIAccel4WireDCVoltageSensitivity, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIAccel4WireDCVoltageSensitivityUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIAccel4WireDCVoltageSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIAccel4WireDCVoltageSensitivityUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIAccel4WireDCVoltageSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIAccel4WireDCVoltageSensitivityUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIAccel4WireDCVoltageSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIAccelSensitivity(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIAccelSensitivity, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIAccelSensitivity(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIAccelSensitivity, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIAccelSensitivity(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIAccelSensitivity, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIAccelSensitivityUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIAccelSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIAccelSensitivityUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIAccelSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIAccelSensitivityUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIAccelSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIAccelChargeSensitivity(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIAccelChargeSensitivity, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIAccelChargeSensitivity(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIAccelChargeSensitivity, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIAccelChargeSensitivity(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIAccelChargeSensitivity, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIAccelChargeSensitivityUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIAccelChargeSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIAccelChargeSensitivityUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIAccelChargeSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIAccelChargeSensitivityUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIAccelChargeSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIVelocityUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIVelocityUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIVelocityUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIVelocityUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIVelocityUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIVelocityUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIVelocityIEPESensordBRef(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIVelocityIEPESensordBRef, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIVelocityIEPESensordBRef(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIVelocityIEPESensordBRef, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIVelocityIEPESensordBRef(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIVelocityIEPESensordBRef, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIVelocityIEPESensorSensitivity(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIVelocityIEPESensorSensitivity, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIVelocityIEPESensorSensitivity(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIVelocityIEPESensorSensitivity, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIVelocityIEPESensorSensitivity(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIVelocityIEPESensorSensitivity, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIVelocityIEPESensorSensitivityUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIVelocityIEPESensorSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIVelocityIEPESensorSensitivityUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIVelocityIEPESensorSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIVelocityIEPESensorSensitivityUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIVelocityIEPESensorSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIForceUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIForceUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIForceUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIForceUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIForceUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIForceUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIForceIEPESensorSensitivity(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIForceIEPESensorSensitivity, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIForceIEPESensorSensitivity(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIForceIEPESensorSensitivity, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIForceIEPESensorSensitivity(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIForceIEPESensorSensitivity, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIForceIEPESensorSensitivityUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIForceIEPESensorSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIForceIEPESensorSensitivityUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIForceIEPESensorSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIForceIEPESensorSensitivityUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIForceIEPESensorSensitivityUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIPressureUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIPressureUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIPressureUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIPressureUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIPressureUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIPressureUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAITorqueUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAITorqueUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAITorqueUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAITorqueUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAITorqueUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAITorqueUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIBridgeUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIBridgeUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIBridgeUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIBridgeUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIBridgeUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIBridgeUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIBridgeElectricalUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIBridgeElectricalUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIBridgeElectricalUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIBridgeElectricalUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIBridgeElectricalUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIBridgeElectricalUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIBridgePhysicalUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIBridgePhysicalUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIBridgePhysicalUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIBridgePhysicalUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIBridgePhysicalUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIBridgePhysicalUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIBridgeScaleType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIBridgeScaleType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIBridgeScaleType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIBridgeScaleType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIBridgeScaleType(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIBridgeScaleType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIBridgeTwoPointLinFirstElectricalVal(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIBridgeTwoPointLinFirstElectricalVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeTwoPointLinFirstElectricalVal(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIBridgeTwoPointLinFirstElectricalVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeTwoPointLinFirstElectricalVal(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIBridgeTwoPointLinFirstElectricalVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIBridgeTwoPointLinFirstPhysicalVal(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIBridgeTwoPointLinFirstPhysicalVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeTwoPointLinFirstPhysicalVal(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIBridgeTwoPointLinFirstPhysicalVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeTwoPointLinFirstPhysicalVal(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIBridgeTwoPointLinFirstPhysicalVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIBridgeTwoPointLinSecondElectricalVal(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIBridgeTwoPointLinSecondElectricalVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeTwoPointLinSecondElectricalVal(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIBridgeTwoPointLinSecondElectricalVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeTwoPointLinSecondElectricalVal(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIBridgeTwoPointLinSecondElectricalVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIBridgeTwoPointLinSecondPhysicalVal(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIBridgeTwoPointLinSecondPhysicalVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeTwoPointLinSecondPhysicalVal(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIBridgeTwoPointLinSecondPhysicalVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeTwoPointLinSecondPhysicalVal(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIBridgeTwoPointLinSecondPhysicalVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIBridgeTableElectricalVals(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetAIBridgeTableElectricalVals, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function SetAIBridgeTableElectricalVals(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxSetAIBridgeTableElectricalVals, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function ResetAIBridgeTableElectricalVals(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIBridgeTableElectricalVals, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIBridgeTablePhysicalVals(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetAIBridgeTablePhysicalVals, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function SetAIBridgeTablePhysicalVals(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxSetAIBridgeTablePhysicalVals, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function ResetAIBridgeTablePhysicalVals(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIBridgeTablePhysicalVals, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIBridgePolyForwardCoeff(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetAIBridgePolyForwardCoeff, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function SetAIBridgePolyForwardCoeff(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxSetAIBridgePolyForwardCoeff, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function ResetAIBridgePolyForwardCoeff(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIBridgePolyForwardCoeff, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIBridgePolyReverseCoeff(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetAIBridgePolyReverseCoeff, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function SetAIBridgePolyReverseCoeff(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxSetAIBridgePolyReverseCoeff, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function ResetAIBridgePolyReverseCoeff(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIBridgePolyReverseCoeff, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIChargeUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIChargeUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIChargeUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIChargeUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIChargeUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIChargeUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIIsTEDS(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIIsTEDS, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function GetAITEDSUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetAITEDSUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function GetAICoupling(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAICoupling, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAICoupling(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAICoupling, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAICoupling(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAICoupling, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIImpedance(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIImpedance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIImpedance(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIImpedance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIImpedance(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIImpedance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAITermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAITermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAITermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAITermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAITermCfg(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAITermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIInputSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetAIInputSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetAIInputSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetAIInputSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetAIInputSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIInputSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIResistanceCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIResistanceCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIResistanceCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIResistanceCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIResistanceCfg(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIResistanceCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAILeadWireResistance(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAILeadWireResistance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAILeadWireResistance(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAILeadWireResistance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAILeadWireResistance(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAILeadWireResistance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIBridgeCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIBridgeCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIBridgeCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIBridgeCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIBridgeCfg(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIBridgeCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIBridgeNomResistance(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIBridgeNomResistance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeNomResistance(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIBridgeNomResistance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeNomResistance(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIBridgeNomResistance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIBridgeInitialVoltage(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIBridgeInitialVoltage, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeInitialVoltage(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIBridgeInitialVoltage, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeInitialVoltage(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIBridgeInitialVoltage, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIBridgeInitialRatio(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIBridgeInitialRatio, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeInitialRatio(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIBridgeInitialRatio, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeInitialRatio(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIBridgeInitialRatio, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIBridgeShuntCalEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIBridgeShuntCalEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIBridgeShuntCalEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAIBridgeShuntCalEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAIBridgeShuntCalEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIBridgeShuntCalEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIBridgeShuntCalSelect(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIBridgeShuntCalSelect, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIBridgeShuntCalSelect(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIBridgeShuntCalSelect, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIBridgeShuntCalSelect(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIBridgeShuntCalSelect, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIBridgeShuntCalShuntCalASrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIBridgeShuntCalShuntCalASrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIBridgeShuntCalShuntCalASrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIBridgeShuntCalShuntCalASrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIBridgeShuntCalShuntCalASrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIBridgeShuntCalShuntCalASrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIBridgeShuntCalGainAdjust(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIBridgeShuntCalGainAdjust, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeShuntCalGainAdjust(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIBridgeShuntCalGainAdjust, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeShuntCalGainAdjust(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIBridgeShuntCalGainAdjust, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIBridgeShuntCalShuntCalAResistance(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIBridgeShuntCalShuntCalAResistance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeShuntCalShuntCalAResistance(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIBridgeShuntCalShuntCalAResistance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeShuntCalShuntCalAResistance(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIBridgeShuntCalShuntCalAResistance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIBridgeShuntCalShuntCalAActualResistance(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIBridgeShuntCalShuntCalAActualResistance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeShuntCalShuntCalAActualResistance(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIBridgeShuntCalShuntCalAActualResistance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeShuntCalShuntCalAActualResistance(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIBridgeShuntCalShuntCalAActualResistance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIBridgeShuntCalShuntCalBResistance(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIBridgeShuntCalShuntCalBResistance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeShuntCalShuntCalBResistance(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIBridgeShuntCalShuntCalBResistance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeShuntCalShuntCalBResistance(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIBridgeShuntCalShuntCalBResistance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIBridgeShuntCalShuntCalBActualResistance(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIBridgeShuntCalShuntCalBActualResistance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIBridgeShuntCalShuntCalBActualResistance(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIBridgeShuntCalShuntCalBActualResistance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIBridgeShuntCalShuntCalBActualResistance(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIBridgeShuntCalShuntCalBActualResistance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIBridgeBalanceCoarsePot(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIBridgeBalanceCoarsePot, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIBridgeBalanceCoarsePot(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIBridgeBalanceCoarsePot, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIBridgeBalanceCoarsePot(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIBridgeBalanceCoarsePot, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIBridgeBalanceFinePot(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIBridgeBalanceFinePot, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIBridgeBalanceFinePot(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIBridgeBalanceFinePot, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIBridgeBalanceFinePot(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIBridgeBalanceFinePot, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAICurrentShuntLoc(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAICurrentShuntLoc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAICurrentShuntLoc(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAICurrentShuntLoc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAICurrentShuntLoc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAICurrentShuntLoc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAICurrentShuntResistance(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAICurrentShuntResistance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAICurrentShuntResistance(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAICurrentShuntResistance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAICurrentShuntResistance(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAICurrentShuntResistance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIExcitSense(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIExcitSense, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIExcitSense(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIExcitSense, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIExcitSense(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIExcitSense, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIExcitSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIExcitSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIExcitSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIExcitSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIExcitSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIExcitSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIExcitVal(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIExcitVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIExcitVal(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIExcitVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIExcitVal(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIExcitVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIExcitUseForScaling(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIExcitUseForScaling, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIExcitUseForScaling(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAIExcitUseForScaling, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAIExcitUseForScaling(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIExcitUseForScaling, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIExcitUseMultiplexed(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIExcitUseMultiplexed, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIExcitUseMultiplexed(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAIExcitUseMultiplexed, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAIExcitUseMultiplexed(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIExcitUseMultiplexed, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIExcitActualVal(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIExcitActualVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIExcitActualVal(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIExcitActualVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIExcitActualVal(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIExcitActualVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIExcitDCorAC(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIExcitDCorAC, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIExcitDCorAC(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIExcitDCorAC, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIExcitDCorAC(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIExcitDCorAC, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIExcitVoltageOrCurrent(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIExcitVoltageOrCurrent, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIExcitVoltageOrCurrent(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIExcitVoltageOrCurrent, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIExcitVoltageOrCurrent(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIExcitVoltageOrCurrent, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIExcitIdleOutputBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIExcitIdleOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIExcitIdleOutputBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIExcitIdleOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIExcitIdleOutputBehavior(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIExcitIdleOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIACExcitFreq(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIACExcitFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIACExcitFreq(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIACExcitFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIACExcitFreq(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIACExcitFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIACExcitSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIACExcitSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIACExcitSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAIACExcitSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAIACExcitSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIACExcitSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIACExcitWireMode(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIACExcitWireMode, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIACExcitWireMode(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIACExcitWireMode, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIACExcitWireMode(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIACExcitWireMode, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAISensorPowerVoltage(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAISensorPowerVoltage, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAISensorPowerVoltage(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAISensorPowerVoltage, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAISensorPowerVoltage(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAISensorPowerVoltage, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAISensorPowerCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAISensorPowerCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAISensorPowerCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAISensorPowerCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAISensorPowerCfg(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAISensorPowerCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAISensorPowerType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAISensorPowerType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAISensorPowerType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAISensorPowerType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAISensorPowerType(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAISensorPowerType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIOpenThrmcplDetectEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIOpenThrmcplDetectEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIOpenThrmcplDetectEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAIOpenThrmcplDetectEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAIOpenThrmcplDetectEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIOpenThrmcplDetectEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIThrmcplLeadOffsetVoltage(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIThrmcplLeadOffsetVoltage, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIThrmcplLeadOffsetVoltage(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIThrmcplLeadOffsetVoltage, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIThrmcplLeadOffsetVoltage(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIThrmcplLeadOffsetVoltage, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIAtten(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIAtten, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIAtten(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIAtten, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIAtten(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIAtten, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIProbeAtten(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIProbeAtten, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIProbeAtten(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIProbeAtten, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIProbeAtten(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIProbeAtten, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAILowpassEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAILowpassEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAILowpassEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAILowpassEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAILowpassEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAILowpassEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAILowpassCutoffFreq(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAILowpassCutoffFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAILowpassCutoffFreq(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAILowpassCutoffFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAILowpassCutoffFreq(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAILowpassCutoffFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAILowpassSwitchCapClkSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAILowpassSwitchCapClkSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAILowpassSwitchCapClkSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAILowpassSwitchCapClkSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAILowpassSwitchCapClkSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAILowpassSwitchCapClkSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAILowpassSwitchCapExtClkFreq(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAILowpassSwitchCapExtClkFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAILowpassSwitchCapExtClkFreq(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAILowpassSwitchCapExtClkFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAILowpassSwitchCapExtClkFreq(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAILowpassSwitchCapExtClkFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAILowpassSwitchCapExtClkDiv(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAILowpassSwitchCapExtClkDiv, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAILowpassSwitchCapExtClkDiv(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAILowpassSwitchCapExtClkDiv, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAILowpassSwitchCapExtClkDiv(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAILowpassSwitchCapExtClkDiv, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAILowpassSwitchCapOutClkDiv(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAILowpassSwitchCapOutClkDiv, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAILowpassSwitchCapOutClkDiv(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAILowpassSwitchCapOutClkDiv, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAILowpassSwitchCapOutClkDiv(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAILowpassSwitchCapOutClkDiv, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAIDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAIDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIDigFltrType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIDigFltrType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIDigFltrType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIDigFltrType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIDigFltrType(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIDigFltrType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIDigFltrResponse(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIDigFltrResponse, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIDigFltrResponse(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIDigFltrResponse, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIDigFltrResponse(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIDigFltrResponse, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIDigFltrOrder(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIDigFltrOrder, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIDigFltrOrder(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAIDigFltrOrder, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAIDigFltrOrder(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIDigFltrOrder, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIDigFltrLowpassCutoffFreq(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIDigFltrLowpassCutoffFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIDigFltrLowpassCutoffFreq(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIDigFltrLowpassCutoffFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIDigFltrLowpassCutoffFreq(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIDigFltrLowpassCutoffFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIDigFltrHighpassCutoffFreq(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIDigFltrHighpassCutoffFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIDigFltrHighpassCutoffFreq(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIDigFltrHighpassCutoffFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIDigFltrHighpassCutoffFreq(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIDigFltrHighpassCutoffFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIDigFltrBandpassCenterFreq(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIDigFltrBandpassCenterFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIDigFltrBandpassCenterFreq(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIDigFltrBandpassCenterFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIDigFltrBandpassCenterFreq(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIDigFltrBandpassCenterFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIDigFltrBandpassWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIDigFltrBandpassWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIDigFltrBandpassWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIDigFltrBandpassWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIDigFltrBandpassWidth(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIDigFltrBandpassWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIDigFltrNotchCenterFreq(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIDigFltrNotchCenterFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIDigFltrNotchCenterFreq(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIDigFltrNotchCenterFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIDigFltrNotchCenterFreq(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIDigFltrNotchCenterFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIDigFltrNotchWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIDigFltrNotchWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIDigFltrNotchWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIDigFltrNotchWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIDigFltrNotchWidth(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIDigFltrNotchWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIDigFltrCoeff(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetAIDigFltrCoeff, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function SetAIDigFltrCoeff(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxSetAIDigFltrCoeff, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function ResetAIDigFltrCoeff(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIDigFltrCoeff, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIFilterEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIFilterEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIFilterEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAIFilterEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAIFilterEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIFilterEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIFilterFreq(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIFilterFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIFilterFreq(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIFilterFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIFilterFreq(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIFilterFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIFilterResponse(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIFilterResponse, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIFilterResponse(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIFilterResponse, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIFilterResponse(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIFilterResponse, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIFilterOrder(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIFilterOrder, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIFilterOrder(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAIFilterOrder, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAIFilterOrder(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIFilterOrder, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIFilterDelay(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIFilterDelay, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function GetAIFilterDelayUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIFilterDelayUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIFilterDelayUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIFilterDelayUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIFilterDelayUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIFilterDelayUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIRemoveFilterDelay(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIRemoveFilterDelay, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIRemoveFilterDelay(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAIRemoveFilterDelay, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAIRemoveFilterDelay(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIRemoveFilterDelay, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIFilterDelayAdjustment(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIFilterDelayAdjustment, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIFilterDelayAdjustment(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIFilterDelayAdjustment, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIFilterDelayAdjustment(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIFilterDelayAdjustment, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIAveragingWinSize(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIAveragingWinSize, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIAveragingWinSize(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAIAveragingWinSize, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAIAveragingWinSize(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIAveragingWinSize, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIResolutionUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIResolutionUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function GetAIResolution(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIResolution, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function GetAIRawSampSize(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIRawSampSize, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function GetAIRawSampJustification(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIRawSampJustification, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function GetAIADCTimingMode(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIADCTimingMode, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIADCTimingMode(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIADCTimingMode, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIADCTimingMode(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIADCTimingMode, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIADCCustomTimingMode(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIADCCustomTimingMode, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIADCCustomTimingMode(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAIADCCustomTimingMode, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAIADCCustomTimingMode(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIADCCustomTimingMode, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIDitherEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIDitherEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIDitherEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAIDitherEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAIDitherEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIDitherEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIChanCalHasValidCalInfo(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIChanCalHasValidCalInfo, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function GetAIChanCalEnableCal(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIChanCalEnableCal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIChanCalEnableCal(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAIChanCalEnableCal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAIChanCalEnableCal(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIChanCalEnableCal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIChanCalApplyCalIfExp(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIChanCalApplyCalIfExp, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIChanCalApplyCalIfExp(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAIChanCalApplyCalIfExp, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAIChanCalApplyCalIfExp(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIChanCalApplyCalIfExp, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIChanCalScaleType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIChanCalScaleType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIChanCalScaleType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIChanCalScaleType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIChanCalScaleType(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIChanCalScaleType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIChanCalTablePreScaledVals(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetAIChanCalTablePreScaledVals, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function SetAIChanCalTablePreScaledVals(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxSetAIChanCalTablePreScaledVals, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function ResetAIChanCalTablePreScaledVals(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIChanCalTablePreScaledVals, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIChanCalTableScaledVals(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetAIChanCalTableScaledVals, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function SetAIChanCalTableScaledVals(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxSetAIChanCalTableScaledVals, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function ResetAIChanCalTableScaledVals(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIChanCalTableScaledVals, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIChanCalPolyForwardCoeff(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetAIChanCalPolyForwardCoeff, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function SetAIChanCalPolyForwardCoeff(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxSetAIChanCalPolyForwardCoeff, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function ResetAIChanCalPolyForwardCoeff(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIChanCalPolyForwardCoeff, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIChanCalPolyReverseCoeff(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetAIChanCalPolyReverseCoeff, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function SetAIChanCalPolyReverseCoeff(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxSetAIChanCalPolyReverseCoeff, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function ResetAIChanCalPolyReverseCoeff(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIChanCalPolyReverseCoeff, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIChanCalOperatorName(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetAIChanCalOperatorName, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetAIChanCalOperatorName(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetAIChanCalOperatorName, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetAIChanCalOperatorName(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIChanCalOperatorName, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIChanCalDesc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetAIChanCalDesc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetAIChanCalDesc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetAIChanCalDesc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetAIChanCalDesc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIChanCalDesc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIChanCalVerifRefVals(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetAIChanCalVerifRefVals, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function SetAIChanCalVerifRefVals(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxSetAIChanCalVerifRefVals, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function ResetAIChanCalVerifRefVals(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIChanCalVerifRefVals, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIChanCalVerifAcqVals(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetAIChanCalVerifAcqVals, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function SetAIChanCalVerifAcqVals(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxSetAIChanCalVerifAcqVals, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function ResetAIChanCalVerifAcqVals(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIChanCalVerifAcqVals, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIRngHigh(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIRngHigh, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIRngHigh(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIRngHigh, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIRngHigh(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIRngHigh, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIRngLow(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIRngLow, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIRngLow(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIRngLow, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIRngLow(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIRngLow, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIDCOffset(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIDCOffset, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIDCOffset(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIDCOffset, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIDCOffset(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIDCOffset, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIGain(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIGain, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIGain(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIGain, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIGain(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIGain, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAISampAndHoldEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAISampAndHoldEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAISampAndHoldEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAISampAndHoldEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAISampAndHoldEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAISampAndHoldEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIAutoZeroMode(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIAutoZeroMode, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIAutoZeroMode(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIAutoZeroMode, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIAutoZeroMode(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIAutoZeroMode, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIChopEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIChopEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIChopEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAIChopEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAIChopEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIChopEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIDataXferMaxRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIDataXferMaxRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAIDataXferMaxRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIDataXferMaxRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAIDataXferMaxRate(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIDataXferMaxRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIDataXferMech(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIDataXferMech, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIDataXferMech(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIDataXferMech, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIDataXferMech(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIDataXferMech, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIDataXferReqCond(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIDataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIDataXferReqCond(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIDataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIDataXferReqCond(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIDataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIDataXferCustomThreshold(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIDataXferCustomThreshold, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIDataXferCustomThreshold(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAIDataXferCustomThreshold, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAIDataXferCustomThreshold(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIDataXferCustomThreshold, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIUsbXferReqSize(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIUsbXferReqSize(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAIUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAIUsbXferReqSize(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIUsbXferReqCount(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIUsbXferReqCount(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAIUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAIUsbXferReqCount(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIMemMapEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIMemMapEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAIMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAIMemMapEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIRawDataCompressionType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIRawDataCompressionType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAIRawDataCompressionType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIRawDataCompressionType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAIRawDataCompressionType(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIRawDataCompressionType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAILossyLSBRemovalCompressedSampSize(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAILossyLSBRemovalCompressedSampSize, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAILossyLSBRemovalCompressedSampSize(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAILossyLSBRemovalCompressedSampSize, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAILossyLSBRemovalCompressedSampSize(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAILossyLSBRemovalCompressedSampSize, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIDevScalingCoeff(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetAIDevScalingCoeff, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function GetAIEnhancedAliasRejectionEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIEnhancedAliasRejectionEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIEnhancedAliasRejectionEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAIEnhancedAliasRejectionEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAIEnhancedAliasRejectionEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIEnhancedAliasRejectionEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAIOpenChanDetectEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIOpenChanDetectEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAIOpenChanDetectEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAIOpenChanDetectEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAIOpenChanDetectEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAIOpenChanDetectEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOMax(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAOMax, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOMax(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAOMax, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAOMax(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOMax, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOMin(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAOMin, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOMin(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAOMin, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAOMin(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOMin, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOCustomScaleName(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetAOCustomScaleName, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetAOCustomScaleName(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetAOCustomScaleName, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetAOCustomScaleName(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOCustomScaleName, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOOutputType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAOOutputType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function GetAOVoltageUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAOVoltageUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAOVoltageUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAOVoltageUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAOVoltageUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOVoltageUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOVoltageCurrentLimit(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAOVoltageCurrentLimit, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOVoltageCurrentLimit(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAOVoltageCurrentLimit, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAOVoltageCurrentLimit(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOVoltageCurrentLimit, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOCurrentUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAOCurrentUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAOCurrentUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAOCurrentUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAOCurrentUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOCurrentUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOFuncGenType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAOFuncGenType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAOFuncGenType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAOFuncGenType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAOFuncGenType(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOFuncGenType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOFuncGenFreq(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAOFuncGenFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOFuncGenFreq(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAOFuncGenFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAOFuncGenFreq(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOFuncGenFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOFuncGenAmplitude(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAOFuncGenAmplitude, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOFuncGenAmplitude(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAOFuncGenAmplitude, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAOFuncGenAmplitude(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOFuncGenAmplitude, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOFuncGenOffset(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAOFuncGenOffset, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOFuncGenOffset(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAOFuncGenOffset, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAOFuncGenOffset(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOFuncGenOffset, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOFuncGenSquareDutyCycle(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAOFuncGenSquareDutyCycle, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOFuncGenSquareDutyCycle(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAOFuncGenSquareDutyCycle, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAOFuncGenSquareDutyCycle(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOFuncGenSquareDutyCycle, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOFuncGenModulationType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAOFuncGenModulationType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAOFuncGenModulationType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAOFuncGenModulationType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAOFuncGenModulationType(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOFuncGenModulationType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOFuncGenFMDeviation(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAOFuncGenFMDeviation, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOFuncGenFMDeviation(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAOFuncGenFMDeviation, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAOFuncGenFMDeviation(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOFuncGenFMDeviation, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOOutputImpedance(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAOOutputImpedance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOOutputImpedance(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAOOutputImpedance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAOOutputImpedance(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOOutputImpedance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOLoadImpedance(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAOLoadImpedance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOLoadImpedance(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAOLoadImpedance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAOLoadImpedance(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOLoadImpedance, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOIdleOutputBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAOIdleOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAOIdleOutputBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAOIdleOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAOIdleOutputBehavior(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOIdleOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAOTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAOTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAOTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAOTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOResolutionUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAOResolutionUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAOResolutionUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAOResolutionUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAOResolutionUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOResolutionUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOResolution(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAOResolution, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function GetAODACRngHigh(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAODACRngHigh, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAODACRngHigh(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAODACRngHigh, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAODACRngHigh(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAODACRngHigh, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAODACRngLow(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAODACRngLow, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAODACRngLow(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAODACRngLow, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAODACRngLow(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAODACRngLow, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAODACRefConnToGnd(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAODACRefConnToGnd, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAODACRefConnToGnd(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAODACRefConnToGnd, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAODACRefConnToGnd(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAODACRefConnToGnd, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAODACRefAllowConnToGnd(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAODACRefAllowConnToGnd, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAODACRefAllowConnToGnd(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAODACRefAllowConnToGnd, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAODACRefAllowConnToGnd(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAODACRefAllowConnToGnd, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAODACRefSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAODACRefSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAODACRefSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAODACRefSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAODACRefSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAODACRefSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAODACRefExtSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetAODACRefExtSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetAODACRefExtSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetAODACRefExtSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetAODACRefExtSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAODACRefExtSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAODACRefVal(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAODACRefVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAODACRefVal(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAODACRefVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAODACRefVal(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAODACRefVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAODACOffsetSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAODACOffsetSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAODACOffsetSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAODACOffsetSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAODACOffsetSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAODACOffsetSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAODACOffsetExtSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetAODACOffsetExtSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetAODACOffsetExtSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetAODACOffsetExtSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetAODACOffsetExtSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAODACOffsetExtSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAODACOffsetVal(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAODACOffsetVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAODACOffsetVal(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAODACOffsetVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAODACOffsetVal(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAODACOffsetVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOReglitchEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAOReglitchEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAOReglitchEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAOReglitchEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAOReglitchEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOReglitchEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOFilterDelay(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAOFilterDelay, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOFilterDelay(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAOFilterDelay, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAOFilterDelay(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOFilterDelay, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOFilterDelayUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAOFilterDelayUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAOFilterDelayUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAOFilterDelayUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAOFilterDelayUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOFilterDelayUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOFilterDelayAdjustment(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAOFilterDelayAdjustment, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOFilterDelayAdjustment(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAOFilterDelayAdjustment, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAOFilterDelayAdjustment(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOFilterDelayAdjustment, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOGain(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAOGain, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetAOGain(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAOGain, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetAOGain(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOGain, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOUseOnlyOnBrdMem(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAOUseOnlyOnBrdMem, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAOUseOnlyOnBrdMem(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAOUseOnlyOnBrdMem, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAOUseOnlyOnBrdMem(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOUseOnlyOnBrdMem, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAODataXferMech(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAODataXferMech, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAODataXferMech(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAODataXferMech, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAODataXferMech(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAODataXferMech, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAODataXferReqCond(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAODataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetAODataXferReqCond(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAODataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetAODataXferReqCond(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAODataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOUsbXferReqSize(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAOUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAOUsbXferReqSize(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAOUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAOUsbXferReqSize(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOUsbXferReqCount(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAOUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAOUsbXferReqCount(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAOUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAOUsbXferReqCount(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAOMemMapEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAOMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAOMemMapEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAOMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAOMemMapEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetAODevScalingCoeff(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetAODevScalingCoeff, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}, Cuint), taskHandle, channel, data, arraySizeInElements)
end

function GetAOEnhancedImageRejectionEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAOEnhancedImageRejectionEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetAOEnhancedImageRejectionEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAOEnhancedImageRejectionEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetAOEnhancedImageRejectionEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetAOEnhancedImageRejectionEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDIInvertLines(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDIInvertLines, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetDIInvertLines(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetDIInvertLines, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetDIInvertLines(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDIInvertLines, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDINumLines(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDINumLines, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function GetDIDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDIDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetDIDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetDIDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetDIDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDIDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDIDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetDIDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetDIDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetDIDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetDIDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDIDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDIDigFltrEnableBusMode(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDIDigFltrEnableBusMode, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetDIDigFltrEnableBusMode(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetDIDigFltrEnableBusMode, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetDIDigFltrEnableBusMode(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDIDigFltrEnableBusMode, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDIDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetDIDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetDIDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetDIDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetDIDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDIDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDIDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetDIDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetDIDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetDIDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetDIDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDIDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDIDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDIDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetDIDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetDIDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetDIDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDIDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDITristate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDITristate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetDITristate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetDITristate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetDITristate(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDITristate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDILogicFamily(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetDILogicFamily, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetDILogicFamily(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetDILogicFamily, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetDILogicFamily(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDILogicFamily, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDIDataXferMech(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetDIDataXferMech, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetDIDataXferMech(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetDIDataXferMech, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetDIDataXferMech(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDIDataXferMech, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDIDataXferReqCond(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetDIDataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetDIDataXferReqCond(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetDIDataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetDIDataXferReqCond(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDIDataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDIUsbXferReqSize(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDIUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetDIUsbXferReqSize(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetDIUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetDIUsbXferReqSize(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDIUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDIUsbXferReqCount(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDIUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetDIUsbXferReqCount(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetDIUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetDIUsbXferReqCount(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDIUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDIMemMapEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDIMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetDIMemMapEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetDIMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetDIMemMapEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDIMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDIAcquireOn(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetDIAcquireOn, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetDIAcquireOn(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetDIAcquireOn, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetDIAcquireOn(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDIAcquireOn, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDOOutputDriveType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetDOOutputDriveType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetDOOutputDriveType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetDOOutputDriveType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetDOOutputDriveType(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDOOutputDriveType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDOInvertLines(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDOInvertLines, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetDOInvertLines(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetDOInvertLines, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetDOInvertLines(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDOInvertLines, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDONumLines(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDONumLines, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function GetDOTristate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDOTristate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetDOTristate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetDOTristate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetDOTristate(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDOTristate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDOLineStatesStartState(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetDOLineStatesStartState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetDOLineStatesStartState(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetDOLineStatesStartState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetDOLineStatesStartState(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDOLineStatesStartState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDOLineStatesPausedState(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetDOLineStatesPausedState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetDOLineStatesPausedState(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetDOLineStatesPausedState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetDOLineStatesPausedState(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDOLineStatesPausedState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDOLineStatesDoneState(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetDOLineStatesDoneState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetDOLineStatesDoneState(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetDOLineStatesDoneState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetDOLineStatesDoneState(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDOLineStatesDoneState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDOLogicFamily(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetDOLogicFamily, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetDOLogicFamily(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetDOLogicFamily, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetDOLogicFamily(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDOLogicFamily, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDOOvercurrentLimit(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetDOOvercurrentLimit, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetDOOvercurrentLimit(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetDOOvercurrentLimit, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetDOOvercurrentLimit(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDOOvercurrentLimit, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDOOvercurrentAutoReenable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDOOvercurrentAutoReenable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetDOOvercurrentAutoReenable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetDOOvercurrentAutoReenable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetDOOvercurrentAutoReenable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDOOvercurrentAutoReenable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDOOvercurrentReenablePeriod(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetDOOvercurrentReenablePeriod, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetDOOvercurrentReenablePeriod(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetDOOvercurrentReenablePeriod, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetDOOvercurrentReenablePeriod(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDOOvercurrentReenablePeriod, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDOUseOnlyOnBrdMem(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDOUseOnlyOnBrdMem, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetDOUseOnlyOnBrdMem(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetDOUseOnlyOnBrdMem, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetDOUseOnlyOnBrdMem(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDOUseOnlyOnBrdMem, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDODataXferMech(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetDODataXferMech, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetDODataXferMech(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetDODataXferMech, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetDODataXferMech(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDODataXferMech, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDODataXferReqCond(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetDODataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetDODataXferReqCond(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetDODataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetDODataXferReqCond(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDODataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDOUsbXferReqSize(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDOUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetDOUsbXferReqSize(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetDOUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetDOUsbXferReqSize(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDOUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDOUsbXferReqCount(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDOUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetDOUsbXferReqCount(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetDOUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetDOUsbXferReqCount(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDOUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDOMemMapEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDOMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetDOMemMapEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetDOMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetDOMemMapEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDOMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDOGenerateOn(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetDOGenerateOn, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetDOGenerateOn(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetDOGenerateOn, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetDOGenerateOn(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetDOGenerateOn, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIMax(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIMax, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIMax(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIMax, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIMax(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIMax, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIMin(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIMin, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIMin(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIMin, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIMin(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIMin, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICustomScaleName(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCICustomScaleName, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCICustomScaleName(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCICustomScaleName, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCICustomScaleName(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICustomScaleName, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIMeasType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIMeasType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function GetCIFreqUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIFreqUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIFreqUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIFreqUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIFreqUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIFreqUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIFreqTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCIFreqTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIFreqTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCIFreqTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCIFreqTerm(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIFreqTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIFreqTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIFreqTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIFreqTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIFreqTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIFreqTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIFreqTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIFreqLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIFreqLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIFreqLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIFreqLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIFreqLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIFreqLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIFreqDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIFreqDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIFreqDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIFreqDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIFreqDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIFreqDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIFreqDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIFreqDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIFreqDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIFreqDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIFreqDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIFreqDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIFreqDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCIFreqDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIFreqDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCIFreqDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCIFreqDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIFreqDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIFreqDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIFreqDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIFreqDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIFreqDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIFreqDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIFreqDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIFreqDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIFreqDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIFreqDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIFreqDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIFreqDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIFreqDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIFreqStartingEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIFreqStartingEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIFreqStartingEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIFreqStartingEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIFreqStartingEdge(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIFreqStartingEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIFreqMeasMeth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIFreqMeasMeth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIFreqMeasMeth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIFreqMeasMeth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIFreqMeasMeth(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIFreqMeasMeth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIFreqEnableAveraging(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIFreqEnableAveraging, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIFreqEnableAveraging(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIFreqEnableAveraging, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIFreqEnableAveraging(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIFreqEnableAveraging, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIFreqMeasTime(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIFreqMeasTime, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIFreqMeasTime(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIFreqMeasTime, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIFreqMeasTime(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIFreqMeasTime, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIFreqDiv(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIFreqDiv, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIFreqDiv(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIFreqDiv, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIFreqDiv(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIFreqDiv, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPeriodUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIPeriodUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPeriodUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIPeriodUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIPeriodUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPeriodUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPeriodTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCIPeriodTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIPeriodTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCIPeriodTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCIPeriodTerm(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPeriodTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPeriodTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIPeriodTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPeriodTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIPeriodTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIPeriodTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPeriodTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPeriodLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIPeriodLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPeriodLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIPeriodLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIPeriodLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPeriodLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPeriodDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIPeriodDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPeriodDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIPeriodDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIPeriodDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPeriodDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPeriodDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIPeriodDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPeriodDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIPeriodDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIPeriodDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPeriodDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPeriodDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCIPeriodDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIPeriodDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCIPeriodDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCIPeriodDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPeriodDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPeriodDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIPeriodDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPeriodDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIPeriodDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIPeriodDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPeriodDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPeriodDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIPeriodDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPeriodDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIPeriodDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIPeriodDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPeriodDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPeriodStartingEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIPeriodStartingEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPeriodStartingEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIPeriodStartingEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIPeriodStartingEdge(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPeriodStartingEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPeriodMeasMeth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIPeriodMeasMeth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPeriodMeasMeth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIPeriodMeasMeth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIPeriodMeasMeth(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPeriodMeasMeth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPeriodEnableAveraging(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIPeriodEnableAveraging, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPeriodEnableAveraging(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIPeriodEnableAveraging, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIPeriodEnableAveraging(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPeriodEnableAveraging, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPeriodMeasTime(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIPeriodMeasTime, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPeriodMeasTime(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIPeriodMeasTime, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIPeriodMeasTime(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPeriodMeasTime, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPeriodDiv(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIPeriodDiv, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPeriodDiv(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIPeriodDiv, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIPeriodDiv(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPeriodDiv, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCICountEdgesTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCICountEdgesTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCICountEdgesTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCICountEdgesTerm(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCICountEdgesTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCICountEdgesTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCICountEdgesLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCICountEdgesLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCICountEdgesDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCICountEdgesDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCICountEdgesDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICountEdgesDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCICountEdgesDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCICountEdgesDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCICountEdgesDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCICountEdgesDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCICountEdgesDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCICountEdgesDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCICountEdgesDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICountEdgesDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCICountEdgesDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCICountEdgesDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCICountEdgesDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCICountEdgesDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesDir(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCICountEdgesDir, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesDir(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCICountEdgesDir, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesDir(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesDir, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesDirTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCICountEdgesDirTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCICountEdgesDirTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCICountEdgesDirTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCICountEdgesDirTerm(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesDirTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesCountDirTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCICountEdgesCountDirTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesCountDirTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCICountEdgesCountDirTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesCountDirTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesCountDirTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesCountDirLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCICountEdgesCountDirLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesCountDirLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCICountEdgesCountDirLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesCountDirLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesCountDirLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesCountDirDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCICountEdgesCountDirDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesCountDirDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCICountEdgesCountDirDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesCountDirDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesCountDirDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesCountDirDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCICountEdgesCountDirDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICountEdgesCountDirDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCICountEdgesCountDirDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCICountEdgesCountDirDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesCountDirDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesCountDirDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCICountEdgesCountDirDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCICountEdgesCountDirDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCICountEdgesCountDirDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCICountEdgesCountDirDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesCountDirDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesCountDirDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCICountEdgesCountDirDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICountEdgesCountDirDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCICountEdgesCountDirDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCICountEdgesCountDirDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesCountDirDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesCountDirDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCICountEdgesCountDirDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesCountDirDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCICountEdgesCountDirDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesCountDirDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesCountDirDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesInitialCnt(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCICountEdgesInitialCnt, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesInitialCnt(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCICountEdgesInitialCnt, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesInitialCnt(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesInitialCnt, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesActiveEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCICountEdgesActiveEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesActiveEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCICountEdgesActiveEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesActiveEdge(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesActiveEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesCountResetEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCICountEdgesCountResetEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesCountResetEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCICountEdgesCountResetEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesCountResetEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesCountResetResetCount(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCICountEdgesCountResetResetCount, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesCountResetResetCount(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCICountEdgesCountResetResetCount, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetResetCount(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesCountResetResetCount, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesCountResetTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCICountEdgesCountResetTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCICountEdgesCountResetTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCICountEdgesCountResetTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetTerm(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesCountResetTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesCountResetTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCICountEdgesCountResetTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesCountResetTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCICountEdgesCountResetTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesCountResetTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesCountResetLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCICountEdgesCountResetLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesCountResetLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCICountEdgesCountResetLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesCountResetLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesCountResetDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCICountEdgesCountResetDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesCountResetDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCICountEdgesCountResetDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesCountResetDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesCountResetDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCICountEdgesCountResetDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICountEdgesCountResetDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCICountEdgesCountResetDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesCountResetDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesCountResetDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCICountEdgesCountResetDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCICountEdgesCountResetDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCICountEdgesCountResetDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesCountResetDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesCountResetDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCICountEdgesCountResetDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICountEdgesCountResetDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCICountEdgesCountResetDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesCountResetDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesCountResetDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCICountEdgesCountResetDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesCountResetDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCICountEdgesCountResetDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesCountResetDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesCountResetActiveEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCICountEdgesCountResetActiveEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesCountResetActiveEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCICountEdgesCountResetActiveEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesCountResetActiveEdge(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesCountResetActiveEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesGateEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCICountEdgesGateEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesGateEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCICountEdgesGateEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesGateEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesGateEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesGateTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCICountEdgesGateTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCICountEdgesGateTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCICountEdgesGateTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCICountEdgesGateTerm(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesGateTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesGateTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCICountEdgesGateTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesGateTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCICountEdgesGateTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesGateTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesGateTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesGateLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCICountEdgesGateLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesGateLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCICountEdgesGateLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesGateLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesGateLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesGateDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCICountEdgesGateDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICountEdgesGateDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCICountEdgesGateDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCICountEdgesGateDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesGateDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesGateDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCICountEdgesGateDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICountEdgesGateDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCICountEdgesGateDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCICountEdgesGateDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesGateDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesGateDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCICountEdgesGateDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCICountEdgesGateDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCICountEdgesGateDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCICountEdgesGateDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesGateDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesGateDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCICountEdgesGateDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICountEdgesGateDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCICountEdgesGateDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCICountEdgesGateDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesGateDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICountEdgesGateWhen(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCICountEdgesGateWhen, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCICountEdgesGateWhen(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCICountEdgesGateWhen, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCICountEdgesGateWhen(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICountEdgesGateWhen, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIDutyCycleTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCIDutyCycleTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIDutyCycleTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCIDutyCycleTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCIDutyCycleTerm(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIDutyCycleTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIDutyCycleTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIDutyCycleTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIDutyCycleTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIDutyCycleTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIDutyCycleTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIDutyCycleTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIDutyCycleLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIDutyCycleLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIDutyCycleLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIDutyCycleLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIDutyCycleLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIDutyCycleLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIDutyCycleDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIDutyCycleDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIDutyCycleDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIDutyCycleDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIDutyCycleDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIDutyCycleDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIDutyCycleDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIDutyCycleDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIDutyCycleDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIDutyCycleDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIDutyCycleDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIDutyCycleDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIDutyCycleDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCIDutyCycleDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIDutyCycleDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCIDutyCycleDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCIDutyCycleDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIDutyCycleDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIDutyCycleDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIDutyCycleDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIDutyCycleDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIDutyCycleDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIDutyCycleDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIDutyCycleDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIDutyCycleStartingEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIDutyCycleStartingEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIDutyCycleStartingEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIDutyCycleStartingEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIDutyCycleStartingEdge(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIDutyCycleStartingEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIAngEncoderUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIAngEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIAngEncoderUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIAngEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIAngEncoderUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIAngEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIAngEncoderPulsesPerRev(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIAngEncoderPulsesPerRev, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIAngEncoderPulsesPerRev(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIAngEncoderPulsesPerRev, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIAngEncoderPulsesPerRev(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIAngEncoderPulsesPerRev, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIAngEncoderInitialAngle(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIAngEncoderInitialAngle, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIAngEncoderInitialAngle(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIAngEncoderInitialAngle, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIAngEncoderInitialAngle(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIAngEncoderInitialAngle, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCILinEncoderUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCILinEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCILinEncoderUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCILinEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCILinEncoderUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCILinEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCILinEncoderDistPerPulse(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCILinEncoderDistPerPulse, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCILinEncoderDistPerPulse(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCILinEncoderDistPerPulse, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCILinEncoderDistPerPulse(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCILinEncoderDistPerPulse, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCILinEncoderInitialPos(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCILinEncoderInitialPos, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCILinEncoderInitialPos(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCILinEncoderInitialPos, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCILinEncoderInitialPos(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCILinEncoderInitialPos, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderDecodingType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIEncoderDecodingType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIEncoderDecodingType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIEncoderDecodingType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIEncoderDecodingType(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderDecodingType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderAInputTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCIEncoderAInputTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIEncoderAInputTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCIEncoderAInputTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCIEncoderAInputTerm(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderAInputTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderAInputTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIEncoderAInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIEncoderAInputTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIEncoderAInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIEncoderAInputTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderAInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderAInputLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIEncoderAInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIEncoderAInputLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIEncoderAInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIEncoderAInputLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderAInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderAInputDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIEncoderAInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIEncoderAInputDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIEncoderAInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIEncoderAInputDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderAInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderAInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIEncoderAInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIEncoderAInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIEncoderAInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIEncoderAInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderAInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderAInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCIEncoderAInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIEncoderAInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCIEncoderAInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCIEncoderAInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderAInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderAInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIEncoderAInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIEncoderAInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIEncoderAInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIEncoderAInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderAInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderAInputDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIEncoderAInputDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIEncoderAInputDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIEncoderAInputDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIEncoderAInputDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderAInputDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderBInputTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCIEncoderBInputTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIEncoderBInputTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCIEncoderBInputTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCIEncoderBInputTerm(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderBInputTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderBInputTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIEncoderBInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIEncoderBInputTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIEncoderBInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIEncoderBInputTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderBInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderBInputLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIEncoderBInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIEncoderBInputLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIEncoderBInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIEncoderBInputLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderBInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderBInputDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIEncoderBInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIEncoderBInputDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIEncoderBInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIEncoderBInputDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderBInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderBInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIEncoderBInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIEncoderBInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIEncoderBInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIEncoderBInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderBInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderBInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCIEncoderBInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIEncoderBInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCIEncoderBInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCIEncoderBInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderBInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderBInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIEncoderBInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIEncoderBInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIEncoderBInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIEncoderBInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderBInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderBInputDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIEncoderBInputDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIEncoderBInputDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIEncoderBInputDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIEncoderBInputDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderBInputDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderZInputTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCIEncoderZInputTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIEncoderZInputTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCIEncoderZInputTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCIEncoderZInputTerm(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderZInputTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderZInputTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIEncoderZInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIEncoderZInputTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIEncoderZInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIEncoderZInputTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderZInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderZInputLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIEncoderZInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIEncoderZInputLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIEncoderZInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIEncoderZInputLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderZInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderZInputDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIEncoderZInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIEncoderZInputDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIEncoderZInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIEncoderZInputDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderZInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderZInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIEncoderZInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIEncoderZInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIEncoderZInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIEncoderZInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderZInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderZInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCIEncoderZInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIEncoderZInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCIEncoderZInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCIEncoderZInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderZInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderZInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIEncoderZInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIEncoderZInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIEncoderZInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIEncoderZInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderZInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderZInputDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIEncoderZInputDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIEncoderZInputDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIEncoderZInputDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIEncoderZInputDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderZInputDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderZIndexEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIEncoderZIndexEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIEncoderZIndexEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIEncoderZIndexEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIEncoderZIndexEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderZIndexEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderZIndexVal(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIEncoderZIndexVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIEncoderZIndexVal(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIEncoderZIndexVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIEncoderZIndexVal(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderZIndexVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIEncoderZIndexPhase(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIEncoderZIndexPhase, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIEncoderZIndexPhase(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIEncoderZIndexPhase, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIEncoderZIndexPhase(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIEncoderZIndexPhase, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseWidthUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIPulseWidthUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseWidthUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIPulseWidthUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIPulseWidthUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseWidthUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseWidthTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCIPulseWidthTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIPulseWidthTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCIPulseWidthTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCIPulseWidthTerm(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseWidthTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseWidthTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIPulseWidthTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseWidthTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIPulseWidthTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIPulseWidthTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseWidthTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseWidthLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIPulseWidthLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseWidthLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIPulseWidthLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIPulseWidthLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseWidthLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseWidthDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIPulseWidthDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPulseWidthDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIPulseWidthDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIPulseWidthDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseWidthDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseWidthDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIPulseWidthDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPulseWidthDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIPulseWidthDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIPulseWidthDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseWidthDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseWidthDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCIPulseWidthDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIPulseWidthDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCIPulseWidthDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCIPulseWidthDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseWidthDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseWidthDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIPulseWidthDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPulseWidthDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIPulseWidthDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIPulseWidthDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseWidthDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseWidthDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIPulseWidthDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPulseWidthDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIPulseWidthDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIPulseWidthDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseWidthDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseWidthStartingEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIPulseWidthStartingEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseWidthStartingEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIPulseWidthStartingEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIPulseWidthStartingEdge(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseWidthStartingEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCITimestampUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCITimestampUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCITimestampUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCITimestampUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCITimestampUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCITimestampUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCITimestampInitialSeconds(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCITimestampInitialSeconds, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCITimestampInitialSeconds(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCITimestampInitialSeconds, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCITimestampInitialSeconds(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCITimestampInitialSeconds, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIGPSSyncMethod(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIGPSSyncMethod, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIGPSSyncMethod(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIGPSSyncMethod, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIGPSSyncMethod(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIGPSSyncMethod, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIGPSSyncSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCIGPSSyncSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIGPSSyncSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCIGPSSyncSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCIGPSSyncSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIGPSSyncSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIVelocityAngEncoderUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIVelocityAngEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIVelocityAngEncoderUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIVelocityAngEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIVelocityAngEncoderUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIVelocityAngEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIVelocityAngEncoderPulsesPerRev(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIVelocityAngEncoderPulsesPerRev, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIVelocityAngEncoderPulsesPerRev(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIVelocityAngEncoderPulsesPerRev, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIVelocityAngEncoderPulsesPerRev(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIVelocityAngEncoderPulsesPerRev, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIVelocityLinEncoderUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIVelocityLinEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIVelocityLinEncoderUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIVelocityLinEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIVelocityLinEncoderUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIVelocityLinEncoderUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIVelocityLinEncoderDistPerPulse(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIVelocityLinEncoderDistPerPulse, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIVelocityLinEncoderDistPerPulse(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIVelocityLinEncoderDistPerPulse, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIVelocityLinEncoderDistPerPulse(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIVelocityLinEncoderDistPerPulse, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIVelocityEncoderDecodingType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIVelocityEncoderDecodingType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIVelocityEncoderDecodingType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIVelocityEncoderDecodingType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIVelocityEncoderDecodingType(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIVelocityEncoderDecodingType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIVelocityEncoderAInputTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCIVelocityEncoderAInputTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIVelocityEncoderAInputTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCIVelocityEncoderAInputTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCIVelocityEncoderAInputTerm(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIVelocityEncoderAInputTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIVelocityEncoderAInputTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIVelocityEncoderAInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIVelocityEncoderAInputTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIVelocityEncoderAInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIVelocityEncoderAInputTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIVelocityEncoderAInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIVelocityEncoderAInputLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIVelocityEncoderAInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIVelocityEncoderAInputLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIVelocityEncoderAInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIVelocityEncoderAInputLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIVelocityEncoderAInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIVelocityEncoderAInputDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIVelocityEncoderAInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIVelocityEncoderAInputDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIVelocityEncoderAInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIVelocityEncoderAInputDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIVelocityEncoderAInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIVelocityEncoderAInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIVelocityEncoderAInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIVelocityEncoderAInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIVelocityEncoderAInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIVelocityEncoderAInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIVelocityEncoderAInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIVelocityEncoderAInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCIVelocityEncoderAInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIVelocityEncoderAInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCIVelocityEncoderAInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCIVelocityEncoderAInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIVelocityEncoderAInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIVelocityEncoderAInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIVelocityEncoderAInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIVelocityEncoderAInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIVelocityEncoderAInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIVelocityEncoderAInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIVelocityEncoderAInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIVelocityEncoderBInputTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCIVelocityEncoderBInputTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIVelocityEncoderBInputTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCIVelocityEncoderBInputTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCIVelocityEncoderBInputTerm(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIVelocityEncoderBInputTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIVelocityEncoderBInputTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIVelocityEncoderBInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIVelocityEncoderBInputTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIVelocityEncoderBInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIVelocityEncoderBInputTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIVelocityEncoderBInputTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIVelocityEncoderBInputLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIVelocityEncoderBInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIVelocityEncoderBInputLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIVelocityEncoderBInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIVelocityEncoderBInputLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIVelocityEncoderBInputLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIVelocityEncoderBInputDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIVelocityEncoderBInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIVelocityEncoderBInputDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIVelocityEncoderBInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIVelocityEncoderBInputDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIVelocityEncoderBInputDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIVelocityEncoderBInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIVelocityEncoderBInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIVelocityEncoderBInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIVelocityEncoderBInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIVelocityEncoderBInputDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIVelocityEncoderBInputDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIVelocityEncoderBInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCIVelocityEncoderBInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIVelocityEncoderBInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCIVelocityEncoderBInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCIVelocityEncoderBInputDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIVelocityEncoderBInputDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIVelocityEncoderBInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIVelocityEncoderBInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIVelocityEncoderBInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIVelocityEncoderBInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIVelocityEncoderBInputDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIVelocityEncoderBInputDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIVelocityMeasTime(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIVelocityMeasTime, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIVelocityMeasTime(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIVelocityMeasTime, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIVelocityMeasTime(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIVelocityMeasTime, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIVelocityDiv(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIVelocityDiv, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIVelocityDiv(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIVelocityDiv, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIVelocityDiv(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIVelocityDiv, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCITwoEdgeSepUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCITwoEdgeSepUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCITwoEdgeSepUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCITwoEdgeSepUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCITwoEdgeSepFirstTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCITwoEdgeSepFirstTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCITwoEdgeSepFirstTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCITwoEdgeSepFirstTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCITwoEdgeSepFirstTerm(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCITwoEdgeSepFirstTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCITwoEdgeSepFirstTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCITwoEdgeSepFirstTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepFirstTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCITwoEdgeSepFirstTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepFirstTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCITwoEdgeSepFirstTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCITwoEdgeSepFirstLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCITwoEdgeSepFirstLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepFirstLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCITwoEdgeSepFirstLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepFirstLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCITwoEdgeSepFirstLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCITwoEdgeSepFirstDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCITwoEdgeSepFirstDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepFirstDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCITwoEdgeSepFirstDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepFirstDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCITwoEdgeSepFirstDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCITwoEdgeSepFirstDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCITwoEdgeSepFirstDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCITwoEdgeSepFirstDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCITwoEdgeSepFirstDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCITwoEdgeSepFirstDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCITwoEdgeSepFirstDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCITwoEdgeSepFirstDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCITwoEdgeSepFirstDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCITwoEdgeSepFirstDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCITwoEdgeSepFirstDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCITwoEdgeSepFirstDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCITwoEdgeSepFirstDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCITwoEdgeSepFirstDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCITwoEdgeSepFirstDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCITwoEdgeSepFirstDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCITwoEdgeSepFirstDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCITwoEdgeSepFirstDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCITwoEdgeSepFirstDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCITwoEdgeSepFirstDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCITwoEdgeSepFirstDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepFirstDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCITwoEdgeSepFirstDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepFirstDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCITwoEdgeSepFirstDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCITwoEdgeSepFirstEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCITwoEdgeSepFirstEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepFirstEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCITwoEdgeSepFirstEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepFirstEdge(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCITwoEdgeSepFirstEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCITwoEdgeSepSecondTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCITwoEdgeSepSecondTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCITwoEdgeSepSecondTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCITwoEdgeSepSecondTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCITwoEdgeSepSecondTerm(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCITwoEdgeSepSecondTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCITwoEdgeSepSecondTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCITwoEdgeSepSecondTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepSecondTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCITwoEdgeSepSecondTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepSecondTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCITwoEdgeSepSecondTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCITwoEdgeSepSecondLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCITwoEdgeSepSecondLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepSecondLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCITwoEdgeSepSecondLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepSecondLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCITwoEdgeSepSecondLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCITwoEdgeSepSecondDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCITwoEdgeSepSecondDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepSecondDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCITwoEdgeSepSecondDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepSecondDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCITwoEdgeSepSecondDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCITwoEdgeSepSecondDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCITwoEdgeSepSecondDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCITwoEdgeSepSecondDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCITwoEdgeSepSecondDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCITwoEdgeSepSecondDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCITwoEdgeSepSecondDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCITwoEdgeSepSecondDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCITwoEdgeSepSecondDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCITwoEdgeSepSecondDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCITwoEdgeSepSecondDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCITwoEdgeSepSecondDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCITwoEdgeSepSecondDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCITwoEdgeSepSecondDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCITwoEdgeSepSecondDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCITwoEdgeSepSecondDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCITwoEdgeSepSecondDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCITwoEdgeSepSecondDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCITwoEdgeSepSecondDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCITwoEdgeSepSecondDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCITwoEdgeSepSecondDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepSecondDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCITwoEdgeSepSecondDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepSecondDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCITwoEdgeSepSecondDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCITwoEdgeSepSecondEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCITwoEdgeSepSecondEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCITwoEdgeSepSecondEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCITwoEdgeSepSecondEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCITwoEdgeSepSecondEdge(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCITwoEdgeSepSecondEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCISemiPeriodUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCISemiPeriodUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCISemiPeriodUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCISemiPeriodUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCISemiPeriodUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCISemiPeriodUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCISemiPeriodTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCISemiPeriodTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCISemiPeriodTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCISemiPeriodTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCISemiPeriodTerm(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCISemiPeriodTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCISemiPeriodTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCISemiPeriodTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCISemiPeriodTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCISemiPeriodTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCISemiPeriodTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCISemiPeriodTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCISemiPeriodLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCISemiPeriodLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCISemiPeriodLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCISemiPeriodLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCISemiPeriodLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCISemiPeriodLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCISemiPeriodDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCISemiPeriodDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCISemiPeriodDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCISemiPeriodDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCISemiPeriodDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCISemiPeriodDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCISemiPeriodDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCISemiPeriodDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCISemiPeriodDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCISemiPeriodDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCISemiPeriodDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCISemiPeriodDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCISemiPeriodDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCISemiPeriodDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCISemiPeriodDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCISemiPeriodDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCISemiPeriodDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCISemiPeriodDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCISemiPeriodDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCISemiPeriodDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCISemiPeriodDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCISemiPeriodDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCISemiPeriodDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCISemiPeriodDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCISemiPeriodDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCISemiPeriodDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCISemiPeriodDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCISemiPeriodDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCISemiPeriodDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCISemiPeriodDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCISemiPeriodStartingEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCISemiPeriodStartingEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCISemiPeriodStartingEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCISemiPeriodStartingEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCISemiPeriodStartingEdge(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCISemiPeriodStartingEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseFreqUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIPulseFreqUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseFreqUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIPulseFreqUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIPulseFreqUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseFreqUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseFreqTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCIPulseFreqTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIPulseFreqTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCIPulseFreqTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCIPulseFreqTerm(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseFreqTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseFreqTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIPulseFreqTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseFreqTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIPulseFreqTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIPulseFreqTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseFreqTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseFreqLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIPulseFreqLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseFreqLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIPulseFreqLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIPulseFreqLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseFreqLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseFreqDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIPulseFreqDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPulseFreqDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIPulseFreqDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIPulseFreqDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseFreqDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseFreqDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIPulseFreqDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPulseFreqDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIPulseFreqDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIPulseFreqDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseFreqDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseFreqDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCIPulseFreqDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIPulseFreqDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCIPulseFreqDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCIPulseFreqDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseFreqDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseFreqDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIPulseFreqDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPulseFreqDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIPulseFreqDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIPulseFreqDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseFreqDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseFreqDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIPulseFreqDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPulseFreqDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIPulseFreqDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIPulseFreqDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseFreqDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseFreqStartEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIPulseFreqStartEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseFreqStartEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIPulseFreqStartEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIPulseFreqStartEdge(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseFreqStartEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseTimeUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIPulseTimeUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseTimeUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIPulseTimeUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIPulseTimeUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseTimeUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseTimeTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCIPulseTimeTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIPulseTimeTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCIPulseTimeTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCIPulseTimeTerm(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseTimeTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseTimeTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIPulseTimeTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseTimeTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIPulseTimeTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIPulseTimeTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseTimeTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseTimeLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIPulseTimeLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseTimeLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIPulseTimeLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIPulseTimeLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseTimeLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseTimeDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIPulseTimeDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPulseTimeDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIPulseTimeDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIPulseTimeDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseTimeDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseTimeDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIPulseTimeDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPulseTimeDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIPulseTimeDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIPulseTimeDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseTimeDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseTimeDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCIPulseTimeDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIPulseTimeDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCIPulseTimeDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCIPulseTimeDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseTimeDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseTimeDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIPulseTimeDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPulseTimeDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIPulseTimeDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIPulseTimeDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseTimeDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseTimeDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIPulseTimeDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPulseTimeDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIPulseTimeDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIPulseTimeDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseTimeDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseTimeStartEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIPulseTimeStartEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseTimeStartEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIPulseTimeStartEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIPulseTimeStartEdge(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseTimeStartEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseTicksTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCIPulseTicksTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIPulseTicksTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCIPulseTicksTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCIPulseTicksTerm(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseTicksTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseTicksTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIPulseTicksTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseTicksTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIPulseTicksTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIPulseTicksTermCfg(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseTicksTermCfg, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseTicksLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIPulseTicksLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseTicksLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIPulseTicksLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIPulseTicksLogicLvlBehavior(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseTicksLogicLvlBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseTicksDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIPulseTicksDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPulseTicksDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIPulseTicksDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIPulseTicksDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseTicksDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseTicksDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIPulseTicksDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPulseTicksDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIPulseTicksDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIPulseTicksDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseTicksDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseTicksDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCIPulseTicksDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCIPulseTicksDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCIPulseTicksDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCIPulseTicksDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseTicksDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseTicksDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIPulseTicksDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIPulseTicksDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIPulseTicksDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIPulseTicksDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseTicksDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseTicksDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIPulseTicksDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPulseTicksDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIPulseTicksDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIPulseTicksDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseTicksDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPulseTicksStartEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIPulseTicksStartEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIPulseTicksStartEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIPulseTicksStartEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIPulseTicksStartEdge(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPulseTicksStartEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICtrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCICtrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCICtrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCICtrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCICtrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICtrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICtrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCICtrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICtrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCICtrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCICtrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICtrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICtrTimebaseActiveEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCICtrTimebaseActiveEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCICtrTimebaseActiveEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCICtrTimebaseActiveEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCICtrTimebaseActiveEdge(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICtrTimebaseActiveEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICtrTimebaseDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCICtrTimebaseDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICtrTimebaseDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCICtrTimebaseDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCICtrTimebaseDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICtrTimebaseDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICtrTimebaseDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCICtrTimebaseDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICtrTimebaseDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCICtrTimebaseDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCICtrTimebaseDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICtrTimebaseDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICtrTimebaseDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCICtrTimebaseDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCICtrTimebaseDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCICtrTimebaseDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCICtrTimebaseDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICtrTimebaseDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICtrTimebaseDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCICtrTimebaseDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCICtrTimebaseDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCICtrTimebaseDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCICtrTimebaseDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICtrTimebaseDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICtrTimebaseDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCICtrTimebaseDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICtrTimebaseDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCICtrTimebaseDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCICtrTimebaseDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICtrTimebaseDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIThreshVoltage(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIThreshVoltage, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIThreshVoltage(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIThreshVoltage, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIThreshVoltage(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIThreshVoltage, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCICount(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCICount, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function GetCIOutputState(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIOutputState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function GetCITCReached(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCITCReached, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function GetCICtrTimebaseMasterTimebaseDiv(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCICtrTimebaseMasterTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCICtrTimebaseMasterTimebaseDiv(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCICtrTimebaseMasterTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCICtrTimebaseMasterTimebaseDiv(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCICtrTimebaseMasterTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCISampClkOverrunBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCISampClkOverrunBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCISampClkOverrunBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCISampClkOverrunBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCISampClkOverrunBehavior(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCISampClkOverrunBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCISampClkOverrunSentinelVal(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCISampClkOverrunSentinelVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCISampClkOverrunSentinelVal(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCISampClkOverrunSentinelVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCISampClkOverrunSentinelVal(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCISampClkOverrunSentinelVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIDataXferMech(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIDataXferMech, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIDataXferMech(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIDataXferMech, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIDataXferMech(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIDataXferMech, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIDataXferReqCond(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCIDataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCIDataXferReqCond(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCIDataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCIDataXferReqCond(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIDataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIUsbXferReqSize(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIUsbXferReqSize(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIUsbXferReqSize(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIUsbXferReqCount(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIUsbXferReqCount(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIUsbXferReqCount(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIMemMapEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIMemMapEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIMemMapEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCINumPossiblyInvalidSamps(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCINumPossiblyInvalidSamps, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function GetCIDupCountPrevent(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIDupCountPrevent, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIDupCountPrevent(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIDupCountPrevent, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIDupCountPrevent(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIDupCountPrevent, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIPrescaler(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCIPrescaler, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCIPrescaler(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCIPrescaler, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCIPrescaler(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIPrescaler, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCIMaxMeasPeriod(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCIMaxMeasPeriod, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCIMaxMeasPeriod(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCIMaxMeasPeriod, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCIMaxMeasPeriod(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCIMaxMeasPeriod, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOOutputType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCOOutputType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function GetCOPulseIdleState(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCOPulseIdleState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCOPulseIdleState(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCOPulseIdleState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCOPulseIdleState(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOPulseIdleState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOPulseTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCOPulseTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCOPulseTerm(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCOPulseTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCOPulseTerm(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOPulseTerm, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOPulseTimeUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCOPulseTimeUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCOPulseTimeUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCOPulseTimeUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCOPulseTimeUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOPulseTimeUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOPulseHighTime(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCOPulseHighTime, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCOPulseHighTime(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCOPulseHighTime, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCOPulseHighTime(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOPulseHighTime, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOPulseLowTime(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCOPulseLowTime, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCOPulseLowTime(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCOPulseLowTime, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCOPulseLowTime(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOPulseLowTime, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOPulseTimeInitialDelay(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCOPulseTimeInitialDelay, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCOPulseTimeInitialDelay(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCOPulseTimeInitialDelay, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCOPulseTimeInitialDelay(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOPulseTimeInitialDelay, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOPulseDutyCyc(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCOPulseDutyCyc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCOPulseDutyCyc(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCOPulseDutyCyc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCOPulseDutyCyc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOPulseDutyCyc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOPulseFreqUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCOPulseFreqUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCOPulseFreqUnits(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCOPulseFreqUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCOPulseFreqUnits(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOPulseFreqUnits, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOPulseFreq(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCOPulseFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCOPulseFreq(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCOPulseFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCOPulseFreq(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOPulseFreq, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOPulseFreqInitialDelay(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCOPulseFreqInitialDelay, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCOPulseFreqInitialDelay(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCOPulseFreqInitialDelay, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCOPulseFreqInitialDelay(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOPulseFreqInitialDelay, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOPulseHighTicks(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCOPulseHighTicks, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOPulseHighTicks(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCOPulseHighTicks, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCOPulseHighTicks(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOPulseHighTicks, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOPulseLowTicks(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCOPulseLowTicks, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOPulseLowTicks(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCOPulseLowTicks, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCOPulseLowTicks(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOPulseLowTicks, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOPulseTicksInitialDelay(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCOPulseTicksInitialDelay, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOPulseTicksInitialDelay(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCOPulseTicksInitialDelay, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCOPulseTicksInitialDelay(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOPulseTicksInitialDelay, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOCtrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCOCtrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCOCtrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCOCtrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCOCtrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOCtrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOCtrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCOCtrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCOCtrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCOCtrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCOCtrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOCtrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOCtrTimebaseActiveEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCOCtrTimebaseActiveEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCOCtrTimebaseActiveEdge(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCOCtrTimebaseActiveEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCOCtrTimebaseActiveEdge(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOCtrTimebaseActiveEdge, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOCtrTimebaseDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCOCtrTimebaseDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOCtrTimebaseDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCOCtrTimebaseDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCOCtrTimebaseDigFltrEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOCtrTimebaseDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOCtrTimebaseDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCOCtrTimebaseDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCOCtrTimebaseDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCOCtrTimebaseDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCOCtrTimebaseDigFltrMinPulseWidth(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOCtrTimebaseDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOCtrTimebaseDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetCOCtrTimebaseDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetCOCtrTimebaseDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetCOCtrTimebaseDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetCOCtrTimebaseDigFltrTimebaseSrc(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOCtrTimebaseDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOCtrTimebaseDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetCOCtrTimebaseDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, channel, data)
end

function SetCOCtrTimebaseDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetCOCtrTimebaseDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, channel, data)
end

function ResetCOCtrTimebaseDigFltrTimebaseRate(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOCtrTimebaseDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOCtrTimebaseDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCOCtrTimebaseDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOCtrTimebaseDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCOCtrTimebaseDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCOCtrTimebaseDigSyncEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOCtrTimebaseDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOCount(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCOCount, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function GetCOOutputState(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCOOutputState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function GetCOAutoIncrCnt(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCOAutoIncrCnt, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOAutoIncrCnt(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCOAutoIncrCnt, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCOAutoIncrCnt(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOAutoIncrCnt, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOCtrTimebaseMasterTimebaseDiv(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCOCtrTimebaseMasterTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOCtrTimebaseMasterTimebaseDiv(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCOCtrTimebaseMasterTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCOCtrTimebaseMasterTimebaseDiv(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOCtrTimebaseMasterTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOPulseDone(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCOPulseDone, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function GetCOEnableInitialDelayOnRetrigger(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCOEnableInitialDelayOnRetrigger, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOEnableInitialDelayOnRetrigger(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCOEnableInitialDelayOnRetrigger, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCOEnableInitialDelayOnRetrigger(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOEnableInitialDelayOnRetrigger, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOConstrainedGenMode(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCOConstrainedGenMode, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCOConstrainedGenMode(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCOConstrainedGenMode, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCOConstrainedGenMode(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOConstrainedGenMode, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOUseOnlyOnBrdMem(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCOUseOnlyOnBrdMem, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOUseOnlyOnBrdMem(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCOUseOnlyOnBrdMem, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCOUseOnlyOnBrdMem(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOUseOnlyOnBrdMem, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCODataXferMech(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCODataXferMech, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCODataXferMech(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCODataXferMech, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCODataXferMech(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCODataXferMech, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCODataXferReqCond(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetCODataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetCODataXferReqCond(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetCODataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetCODataXferReqCond(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCODataXferReqCond, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOUsbXferReqSize(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCOUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOUsbXferReqSize(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCOUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCOUsbXferReqSize(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOUsbXferReqSize, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOUsbXferReqCount(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCOUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOUsbXferReqCount(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCOUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCOUsbXferReqCount(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOUsbXferReqCount, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOMemMapEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCOMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOMemMapEnable(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCOMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCOMemMapEnable(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOMemMapEnable, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCOPrescaler(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCOPrescaler, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function SetCOPrescaler(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetCOPrescaler, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, channel, data)
end

function ResetCOPrescaler(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetCOPrescaler, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetCORdyForNewVal(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCORdyForNewVal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function GetChanType(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetChanType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function GetPhysicalChanName(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetPhysicalChanName, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetPhysicalChanName(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetPhysicalChanName, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function GetChanDescr(taskHandle::TaskHandle, channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetChanDescr, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, channel, data, bufferSize)
end

function SetChanDescr(taskHandle::TaskHandle, channel::Ref{UInt8}, data)
    ccall((:DAQmxSetChanDescr, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, channel, data)
end

function ResetChanDescr(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetChanDescr, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetChanIsGlobal(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetChanIsGlobal, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, channel, data)
end

function GetChanSyncUnlockBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetChanSyncUnlockBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, channel, data)
end

function SetChanSyncUnlockBehavior(taskHandle::TaskHandle, channel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetChanSyncUnlockBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, channel, data)
end

function ResetChanSyncUnlockBehavior(taskHandle::TaskHandle, channel::Ref{UInt8})
    ccall((:DAQmxResetChanSyncUnlockBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, channel)
end

function GetDevIsSimulated(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevIsSimulated, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevProductCategory(device::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetDevProductCategory, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), device, data)
end

function GetDevProductType(device::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetDevProductType, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), device, data, bufferSize)
end

function GetDevProductNum(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevProductNum, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevSerialNum(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevSerialNum, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevAccessoryProductTypes(device::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetDevAccessoryProductTypes, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), device, data, bufferSize)
end

function GetDevAccessoryProductNums(device::Ref{UInt8}, data::Ref{Cuint}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetDevAccessoryProductNums, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}, Cuint), device, data, arraySizeInElements)
end

function GetDevAccessorySerialNums(device::Ref{UInt8}, data::Ref{Cuint}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetDevAccessorySerialNums, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}, Cuint), device, data, arraySizeInElements)
end

function GetCarrierSerialNum(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetCarrierSerialNum, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetFieldDAQDevName(device::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetFieldDAQDevName, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), device, data, bufferSize)
end

function GetFieldDAQBankDevNames(device::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetFieldDAQBankDevNames, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), device, data, bufferSize)
end

function GetDevChassisModuleDevNames(device::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetDevChassisModuleDevNames, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), device, data, bufferSize)
end

function GetDevAnlgTrigSupported(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevAnlgTrigSupported, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevDigTrigSupported(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevDigTrigSupported, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevTimeTrigSupported(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevTimeTrigSupported, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevAIPhysicalChans(device::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetDevAIPhysicalChans, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), device, data, bufferSize)
end

function GetDevAISupportedMeasTypes(device::Ref{UInt8}, data::Ref{Cint}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetDevAISupportedMeasTypes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIMaxSingleChanRate(device::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetDevAIMaxSingleChanRate, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), device, data)
end

function GetDevAIMaxMultiChanRate(device::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetDevAIMaxMultiChanRate, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), device, data)
end

function GetDevAIMinRate(device::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetDevAIMinRate, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), device, data)
end

function GetDevAISimultaneousSamplingSupported(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevAISimultaneousSamplingSupported, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevAINumSampTimingEngines(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevAINumSampTimingEngines, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevAISampModes(device::Ref{UInt8}, data::Ref{Cint}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetDevAISampModes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), device, data, arraySizeInElements)
end

function GetDevAINumSyncPulseSrcs(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevAINumSyncPulseSrcs, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevAITrigUsage(device::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetDevAITrigUsage, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), device, data)
end

function GetDevAIVoltageRngs(device::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetDevAIVoltageRngs, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIVoltageIntExcitDiscreteVals(device::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetDevAIVoltageIntExcitDiscreteVals, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIVoltageIntExcitRangeVals(device::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetDevAIVoltageIntExcitRangeVals, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIChargeRngs(device::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetDevAIChargeRngs, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAICurrentRngs(device::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetDevAICurrentRngs, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAICurrentIntExcitDiscreteVals(device::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetDevAICurrentIntExcitDiscreteVals, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIBridgeRngs(device::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetDevAIBridgeRngs, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIResistanceRngs(device::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetDevAIResistanceRngs, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIFreqRngs(device::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetDevAIFreqRngs, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIGains(device::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetDevAIGains, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAICouplings(device::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetDevAICouplings, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), device, data)
end

function GetDevAILowpassCutoffFreqDiscreteVals(device::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetDevAILowpassCutoffFreqDiscreteVals, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAILowpassCutoffFreqRangeVals(device::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetDevAILowpassCutoffFreqRangeVals, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetAIDigFltrTypes(device::Ref{UInt8}, data::Ref{Cint}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetAIDigFltrTypes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIDigFltrLowpassCutoffFreqDiscreteVals(device::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetDevAIDigFltrLowpassCutoffFreqDiscreteVals, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAIDigFltrLowpassCutoffFreqRangeVals(device::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetDevAIDigFltrLowpassCutoffFreqRangeVals, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAOPhysicalChans(device::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetDevAOPhysicalChans, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), device, data, bufferSize)
end

function GetDevAOSupportedOutputTypes(device::Ref{UInt8}, data::Ref{Cint}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetDevAOSupportedOutputTypes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), device, data, arraySizeInElements)
end

function GetDevAOMaxRate(device::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetDevAOMaxRate, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), device, data)
end

function GetDevAOMinRate(device::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetDevAOMinRate, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), device, data)
end

function GetDevAOSampClkSupported(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevAOSampClkSupported, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevAONumSampTimingEngines(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevAONumSampTimingEngines, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevAOSampModes(device::Ref{UInt8}, data::Ref{Cint}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetDevAOSampModes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), device, data, arraySizeInElements)
end

function GetDevAONumSyncPulseSrcs(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevAONumSyncPulseSrcs, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevAOTrigUsage(device::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetDevAOTrigUsage, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), device, data)
end

function GetDevAOVoltageRngs(device::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetDevAOVoltageRngs, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAOCurrentRngs(device::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetDevAOCurrentRngs, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevAOGains(device::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetDevAOGains, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), device, data, arraySizeInElements)
end

function GetDevDILines(device::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetDevDILines, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), device, data, bufferSize)
end

function GetDevDIPorts(device::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetDevDIPorts, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), device, data, bufferSize)
end

function GetDevDIMaxRate(device::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetDevDIMaxRate, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), device, data)
end

function GetDevDINumSampTimingEngines(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevDINumSampTimingEngines, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevDITrigUsage(device::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetDevDITrigUsage, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), device, data)
end

function GetDevDOLines(device::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetDevDOLines, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), device, data, bufferSize)
end

function GetDevDOPorts(device::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetDevDOPorts, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), device, data, bufferSize)
end

function GetDevDOMaxRate(device::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetDevDOMaxRate, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), device, data)
end

function GetDevDONumSampTimingEngines(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevDONumSampTimingEngines, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevDOTrigUsage(device::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetDevDOTrigUsage, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), device, data)
end

function GetDevCIPhysicalChans(device::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetDevCIPhysicalChans, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), device, data, bufferSize)
end

function GetDevCISupportedMeasTypes(device::Ref{UInt8}, data::Ref{Cint}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetDevCISupportedMeasTypes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), device, data, arraySizeInElements)
end

function GetDevCITrigUsage(device::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetDevCITrigUsage, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), device, data)
end

function GetDevCISampClkSupported(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevCISampClkSupported, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevCISampModes(device::Ref{UInt8}, data::Ref{Cint}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetDevCISampModes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), device, data, arraySizeInElements)
end

function GetDevCIMaxSize(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevCIMaxSize, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevCIMaxTimebase(device::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetDevCIMaxTimebase, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), device, data)
end

function GetDevCOPhysicalChans(device::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetDevCOPhysicalChans, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), device, data, bufferSize)
end

function GetDevCOSupportedOutputTypes(device::Ref{UInt8}, data::Ref{Cint}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetDevCOSupportedOutputTypes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), device, data, arraySizeInElements)
end

function GetDevCOSampClkSupported(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevCOSampClkSupported, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevCOSampModes(device::Ref{UInt8}, data::Ref{Cint}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetDevCOSampModes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), device, data, arraySizeInElements)
end

function GetDevCOTrigUsage(device::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetDevCOTrigUsage, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), device, data)
end

function GetDevCOMaxSize(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevCOMaxSize, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevCOMaxTimebase(device::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetDevCOMaxTimebase, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), device, data)
end

function GetDevTEDSHWTEDSSupported(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevTEDSHWTEDSSupported, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevNumDMAChans(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevNumDMAChans, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevBusType(device::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetDevBusType, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), device, data)
end

function GetDevPCIBusNum(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevPCIBusNum, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevPCIDevNum(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevPCIDevNum, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevPXIChassisNum(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevPXIChassisNum, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevPXISlotNum(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevPXISlotNum, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevCompactDAQChassisDevName(device::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetDevCompactDAQChassisDevName, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), device, data, bufferSize)
end

function GetDevCompactDAQSlotNum(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevCompactDAQSlotNum, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevCompactRIOChassisDevName(device::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetDevCompactRIOChassisDevName, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), device, data, bufferSize)
end

function GetDevCompactRIOSlotNum(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevCompactRIOSlotNum, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevTCPIPHostname(device::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetDevTCPIPHostname, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), device, data, bufferSize)
end

function GetDevTCPIPEthernetIP(device::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetDevTCPIPEthernetIP, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), device, data, bufferSize)
end

function GetDevTCPIPWirelessIP(device::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetDevTCPIPWirelessIP, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), device, data, bufferSize)
end

function GetDevTerminals(device::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetDevTerminals, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), device, data, bufferSize)
end

function GetDevNumTimeTrigs(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevNumTimeTrigs, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetDevNumTimestampEngines(device::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetDevNumTimestampEngines, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), device, data)
end

function GetExportedAIConvClkOutputTerm(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetExportedAIConvClkOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedAIConvClkOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedAIConvClkOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedAIConvClkOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedAIConvClkOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedAIConvClkPulsePolarity(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetExportedAIConvClkPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function GetExported10MHzRefClkOutputTerm(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetExported10MHzRefClkOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExported10MHzRefClkOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExported10MHzRefClkOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExported10MHzRefClkOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExported10MHzRefClkOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExported20MHzTimebaseOutputTerm(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetExported20MHzTimebaseOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExported20MHzTimebaseOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExported20MHzTimebaseOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExported20MHzTimebaseOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExported20MHzTimebaseOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedSampClkOutputBehavior(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetExportedSampClkOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedSampClkOutputBehavior(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetExportedSampClkOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedSampClkOutputBehavior(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedSampClkOutputBehavior, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedSampClkOutputTerm(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetExportedSampClkOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedSampClkOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedSampClkOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedSampClkOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedSampClkOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedSampClkDelayOffset(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetExportedSampClkDelayOffset, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetExportedSampClkDelayOffset(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetExportedSampClkDelayOffset, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetExportedSampClkDelayOffset(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedSampClkDelayOffset, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedSampClkPulsePolarity(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetExportedSampClkPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedSampClkPulsePolarity(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetExportedSampClkPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedSampClkPulsePolarity(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedSampClkPulsePolarity, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedSampClkTimebaseOutputTerm(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetExportedSampClkTimebaseOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedSampClkTimebaseOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedSampClkTimebaseOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedSampClkTimebaseOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedSampClkTimebaseOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedDividedSampClkTimebaseOutputTerm(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetExportedDividedSampClkTimebaseOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedDividedSampClkTimebaseOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedDividedSampClkTimebaseOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedDividedSampClkTimebaseOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedDividedSampClkTimebaseOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedAdvTrigOutputTerm(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetExportedAdvTrigOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedAdvTrigOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedAdvTrigOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedAdvTrigOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedAdvTrigOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedAdvTrigPulsePolarity(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetExportedAdvTrigPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function GetExportedAdvTrigPulseWidthUnits(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetExportedAdvTrigPulseWidthUnits, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedAdvTrigPulseWidthUnits(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetExportedAdvTrigPulseWidthUnits, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedAdvTrigPulseWidthUnits(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedAdvTrigPulseWidthUnits, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedAdvTrigPulseWidth(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetExportedAdvTrigPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetExportedAdvTrigPulseWidth(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetExportedAdvTrigPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetExportedAdvTrigPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedAdvTrigPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedPauseTrigOutputTerm(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetExportedPauseTrigOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedPauseTrigOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedPauseTrigOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedPauseTrigOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedPauseTrigOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedPauseTrigLvlActiveLvl(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetExportedPauseTrigLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedPauseTrigLvlActiveLvl(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetExportedPauseTrigLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedPauseTrigLvlActiveLvl(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedPauseTrigLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedRefTrigOutputTerm(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetExportedRefTrigOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedRefTrigOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedRefTrigOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedRefTrigOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedRefTrigOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedRefTrigPulsePolarity(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetExportedRefTrigPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedRefTrigPulsePolarity(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetExportedRefTrigPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedRefTrigPulsePolarity(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedRefTrigPulsePolarity, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedStartTrigOutputTerm(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetExportedStartTrigOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedStartTrigOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedStartTrigOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedStartTrigOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedStartTrigOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedStartTrigPulsePolarity(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetExportedStartTrigPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedStartTrigPulsePolarity(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetExportedStartTrigPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedStartTrigPulsePolarity(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedStartTrigPulsePolarity, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedAdvCmpltEventOutputTerm(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetExportedAdvCmpltEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedAdvCmpltEventOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedAdvCmpltEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedAdvCmpltEventOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedAdvCmpltEventOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedAdvCmpltEventDelay(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetExportedAdvCmpltEventDelay, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetExportedAdvCmpltEventDelay(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetExportedAdvCmpltEventDelay, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetExportedAdvCmpltEventDelay(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedAdvCmpltEventDelay, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedAdvCmpltEventPulsePolarity(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetExportedAdvCmpltEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedAdvCmpltEventPulsePolarity(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetExportedAdvCmpltEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedAdvCmpltEventPulsePolarity(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedAdvCmpltEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedAdvCmpltEventPulseWidth(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetExportedAdvCmpltEventPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetExportedAdvCmpltEventPulseWidth(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetExportedAdvCmpltEventPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetExportedAdvCmpltEventPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedAdvCmpltEventPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedAIHoldCmpltEventOutputTerm(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetExportedAIHoldCmpltEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedAIHoldCmpltEventOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedAIHoldCmpltEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedAIHoldCmpltEventOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedAIHoldCmpltEventOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedAIHoldCmpltEventPulsePolarity(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetExportedAIHoldCmpltEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedAIHoldCmpltEventPulsePolarity(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetExportedAIHoldCmpltEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedAIHoldCmpltEventPulsePolarity(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedAIHoldCmpltEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedChangeDetectEventOutputTerm(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetExportedChangeDetectEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedChangeDetectEventOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedChangeDetectEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedChangeDetectEventOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedChangeDetectEventOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedChangeDetectEventPulsePolarity(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetExportedChangeDetectEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedChangeDetectEventPulsePolarity(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetExportedChangeDetectEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedChangeDetectEventPulsePolarity(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedChangeDetectEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedCtrOutEventOutputTerm(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetExportedCtrOutEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedCtrOutEventOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedCtrOutEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedCtrOutEventOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedCtrOutEventOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedCtrOutEventOutputBehavior(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetExportedCtrOutEventOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedCtrOutEventOutputBehavior(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetExportedCtrOutEventOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedCtrOutEventOutputBehavior(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedCtrOutEventOutputBehavior, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedCtrOutEventPulsePolarity(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetExportedCtrOutEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedCtrOutEventPulsePolarity(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetExportedCtrOutEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedCtrOutEventPulsePolarity(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedCtrOutEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedCtrOutEventToggleIdleState(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetExportedCtrOutEventToggleIdleState, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedCtrOutEventToggleIdleState(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetExportedCtrOutEventToggleIdleState, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedCtrOutEventToggleIdleState(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedCtrOutEventToggleIdleState, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedHshkEventOutputTerm(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetExportedHshkEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedHshkEventOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedHshkEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedHshkEventOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedHshkEventOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedHshkEventOutputBehavior(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetExportedHshkEventOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedHshkEventOutputBehavior(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetExportedHshkEventOutputBehavior, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedHshkEventOutputBehavior(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedHshkEventOutputBehavior, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedHshkEventDelay(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetExportedHshkEventDelay, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetExportedHshkEventDelay(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetExportedHshkEventDelay, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetExportedHshkEventDelay(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedHshkEventDelay, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedHshkEventInterlockedAssertedLvl(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetExportedHshkEventInterlockedAssertedLvl, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedHshkEventInterlockedAssertedLvl(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetExportedHshkEventInterlockedAssertedLvl, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedHshkEventInterlockedAssertedLvl(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedHshkEventInterlockedAssertedLvl, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedHshkEventInterlockedAssertOnStart(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetExportedHshkEventInterlockedAssertOnStart, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetExportedHshkEventInterlockedAssertOnStart(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetExportedHshkEventInterlockedAssertOnStart, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetExportedHshkEventInterlockedAssertOnStart(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedHshkEventInterlockedAssertOnStart, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedHshkEventInterlockedDeassertDelay(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetExportedHshkEventInterlockedDeassertDelay, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetExportedHshkEventInterlockedDeassertDelay(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetExportedHshkEventInterlockedDeassertDelay, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetExportedHshkEventInterlockedDeassertDelay(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedHshkEventInterlockedDeassertDelay, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedHshkEventPulsePolarity(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetExportedHshkEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedHshkEventPulsePolarity(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetExportedHshkEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedHshkEventPulsePolarity(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedHshkEventPulsePolarity, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedHshkEventPulseWidth(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetExportedHshkEventPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetExportedHshkEventPulseWidth(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetExportedHshkEventPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetExportedHshkEventPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedHshkEventPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedRdyForXferEventOutputTerm(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetExportedRdyForXferEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedRdyForXferEventOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedRdyForXferEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedRdyForXferEventOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedRdyForXferEventOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedRdyForXferEventLvlActiveLvl(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetExportedRdyForXferEventLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedRdyForXferEventLvlActiveLvl(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetExportedRdyForXferEventLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedRdyForXferEventLvlActiveLvl(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedRdyForXferEventLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedRdyForXferEventDeassertCond(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetExportedRdyForXferEventDeassertCond, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedRdyForXferEventDeassertCond(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetExportedRdyForXferEventDeassertCond, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedRdyForXferEventDeassertCond(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedRdyForXferEventDeassertCond, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedRdyForXferEventDeassertCondCustomThreshold(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetExportedRdyForXferEventDeassertCondCustomThreshold, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetExportedRdyForXferEventDeassertCondCustomThreshold(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetExportedRdyForXferEventDeassertCondCustomThreshold, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetExportedRdyForXferEventDeassertCondCustomThreshold(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedRdyForXferEventDeassertCondCustomThreshold, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedDataActiveEventOutputTerm(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetExportedDataActiveEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedDataActiveEventOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedDataActiveEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedDataActiveEventOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedDataActiveEventOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedDataActiveEventLvlActiveLvl(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetExportedDataActiveEventLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedDataActiveEventLvlActiveLvl(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetExportedDataActiveEventLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedDataActiveEventLvlActiveLvl(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedDataActiveEventLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedRdyForStartEventOutputTerm(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetExportedRdyForStartEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedRdyForStartEventOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedRdyForStartEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedRdyForStartEventOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedRdyForStartEventOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedRdyForStartEventLvlActiveLvl(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetExportedRdyForStartEventLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetExportedRdyForStartEventLvlActiveLvl(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetExportedRdyForStartEventLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetExportedRdyForStartEventLvlActiveLvl(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedRdyForStartEventLvlActiveLvl, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedSyncPulseEventOutputTerm(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetExportedSyncPulseEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedSyncPulseEventOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedSyncPulseEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedSyncPulseEventOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedSyncPulseEventOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetExportedWatchdogExpiredEventOutputTerm(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetExportedWatchdogExpiredEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetExportedWatchdogExpiredEventOutputTerm(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetExportedWatchdogExpiredEventOutputTerm, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetExportedWatchdogExpiredEventOutputTerm(taskHandle::TaskHandle)
    ccall((:DAQmxResetExportedWatchdogExpiredEventOutputTerm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetPersistedChanAuthor(channel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetPersistedChanAuthor, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), channel, data, bufferSize)
end

function GetPersistedChanAllowInteractiveEditing(channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetPersistedChanAllowInteractiveEditing, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), channel, data)
end

function GetPersistedChanAllowInteractiveDeletion(channel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetPersistedChanAllowInteractiveDeletion, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), channel, data)
end

function GetPersistedScaleAuthor(scaleName::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetPersistedScaleAuthor, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), scaleName, data, bufferSize)
end

function GetPersistedScaleAllowInteractiveEditing(scaleName::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetPersistedScaleAllowInteractiveEditing, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), scaleName, data)
end

function GetPersistedScaleAllowInteractiveDeletion(scaleName::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetPersistedScaleAllowInteractiveDeletion, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), scaleName, data)
end

function GetPersistedTaskAuthor(taskName::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetPersistedTaskAuthor, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), taskName, data, bufferSize)
end

function GetPersistedTaskAllowInteractiveEditing(taskName::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetPersistedTaskAllowInteractiveEditing, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), taskName, data)
end

function GetPersistedTaskAllowInteractiveDeletion(taskName::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetPersistedTaskAllowInteractiveDeletion, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), taskName, data)
end

function GetPhysicalChanAISupportedMeasTypes(physicalChannel::Ref{UInt8}, data::Ref{Cint}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetPhysicalChanAISupportedMeasTypes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetPhysicalChanAITermCfgs(physicalChannel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetPhysicalChanAITermCfgs, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), physicalChannel, data)
end

function GetPhysicalChanAIInputSrcs(physicalChannel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetPhysicalChanAIInputSrcs, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), physicalChannel, data, bufferSize)
end

function GetPhysicalChanAISensorPowerTypes(physicalChannel::Ref{UInt8}, data::Ref{Cint}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetPhysicalChanAISensorPowerTypes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetPhysicalChanAISensorPowerVoltageRangeVals(physicalChannel::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetPhysicalChanAISensorPowerVoltageRangeVals, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetPhysicalChanAIPowerControlVoltage(physicalChannel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetPhysicalChanAIPowerControlVoltage, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), physicalChannel, data)
end

function SetPhysicalChanAIPowerControlVoltage(physicalChannel::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetPhysicalChanAIPowerControlVoltage, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble), physicalChannel, data)
end

function ResetPhysicalChanAIPowerControlVoltage(physicalChannel::Ref{UInt8})
    ccall((:DAQmxResetPhysicalChanAIPowerControlVoltage, :libnidaqmx), Cint, (Ref{UInt8},), physicalChannel)
end

function GetPhysicalChanAIPowerControlEnable(physicalChannel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetPhysicalChanAIPowerControlEnable, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function SetPhysicalChanAIPowerControlEnable(physicalChannel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetPhysicalChanAIPowerControlEnable, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), physicalChannel, data)
end

function ResetPhysicalChanAIPowerControlEnable(physicalChannel::Ref{UInt8})
    ccall((:DAQmxResetPhysicalChanAIPowerControlEnable, :libnidaqmx), Cint, (Ref{UInt8},), physicalChannel)
end

function GetPhysicalChanAIPowerControlType(physicalChannel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetPhysicalChanAIPowerControlType, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), physicalChannel, data)
end

function SetPhysicalChanAIPowerControlType(physicalChannel::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetPhysicalChanAIPowerControlType, :libnidaqmx), Cint, (Ref{UInt8}, Cint), physicalChannel, data)
end

function ResetPhysicalChanAIPowerControlType(physicalChannel::Ref{UInt8})
    ccall((:DAQmxResetPhysicalChanAIPowerControlType, :libnidaqmx), Cint, (Ref{UInt8},), physicalChannel)
end

function GetPhysicalChanAISensorPowerOpenChan(physicalChannel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetPhysicalChanAISensorPowerOpenChan, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanAISensorPowerOvercurrent(physicalChannel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetPhysicalChanAISensorPowerOvercurrent, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanAOSupportedOutputTypes(physicalChannel::Ref{UInt8}, data::Ref{Cint}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetPhysicalChanAOSupportedOutputTypes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetPhysicalChanAOSupportedPowerUpOutputTypes(physicalChannel::Ref{UInt8}, data::Ref{Cint}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetPhysicalChanAOSupportedPowerUpOutputTypes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetPhysicalChanAOTermCfgs(physicalChannel::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetPhysicalChanAOTermCfgs, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), physicalChannel, data)
end

function GetPhysicalChanAOManualControlEnable(physicalChannel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetPhysicalChanAOManualControlEnable, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function SetPhysicalChanAOManualControlEnable(physicalChannel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetPhysicalChanAOManualControlEnable, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), physicalChannel, data)
end

function ResetPhysicalChanAOManualControlEnable(physicalChannel::Ref{UInt8})
    ccall((:DAQmxResetPhysicalChanAOManualControlEnable, :libnidaqmx), Cint, (Ref{UInt8},), physicalChannel)
end

function GetPhysicalChanAOManualControlShortDetected(physicalChannel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetPhysicalChanAOManualControlShortDetected, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanAOManualControlAmplitude(physicalChannel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetPhysicalChanAOManualControlAmplitude, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), physicalChannel, data)
end

function GetPhysicalChanAOManualControlFreq(physicalChannel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetPhysicalChanAOManualControlFreq, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), physicalChannel, data)
end

function GetAOPowerAmpChannelEnable(physicalChannel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAOPowerAmpChannelEnable, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function SetAOPowerAmpChannelEnable(physicalChannel::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAOPowerAmpChannelEnable, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), physicalChannel, data)
end

function ResetAOPowerAmpChannelEnable(physicalChannel::Ref{UInt8})
    ccall((:DAQmxResetAOPowerAmpChannelEnable, :libnidaqmx), Cint, (Ref{UInt8},), physicalChannel)
end

function GetAOPowerAmpScalingCoeff(physicalChannel::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetAOPowerAmpScalingCoeff, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetAOPowerAmpOvercurrent(physicalChannel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAOPowerAmpOvercurrent, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetAOPowerAmpGain(physicalChannel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAOPowerAmpGain, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), physicalChannel, data)
end

function GetAOPowerAmpOffset(physicalChannel::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAOPowerAmpOffset, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), physicalChannel, data)
end

function GetPhysicalChanDIPortWidth(physicalChannel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetPhysicalChanDIPortWidth, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanDISampClkSupported(physicalChannel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetPhysicalChanDISampClkSupported, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanDISampModes(physicalChannel::Ref{UInt8}, data::Ref{Cint}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetPhysicalChanDISampModes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetPhysicalChanDIChangeDetectSupported(physicalChannel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetPhysicalChanDIChangeDetectSupported, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanDOPortWidth(physicalChannel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetPhysicalChanDOPortWidth, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanDOSampClkSupported(physicalChannel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetPhysicalChanDOSampClkSupported, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanDOSampModes(physicalChannel::Ref{UInt8}, data::Ref{Cint}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetPhysicalChanDOSampModes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetPhysicalChanCISupportedMeasTypes(physicalChannel::Ref{UInt8}, data::Ref{Cint}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetPhysicalChanCISupportedMeasTypes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetPhysicalChanCOSupportedOutputTypes(physicalChannel::Ref{UInt8}, data::Ref{Cint}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetPhysicalChanCOSupportedOutputTypes, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetPhysicalChanTEDSMfgID(physicalChannel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetPhysicalChanTEDSMfgID, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanTEDSModelNum(physicalChannel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetPhysicalChanTEDSModelNum, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanTEDSSerialNum(physicalChannel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetPhysicalChanTEDSSerialNum, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanTEDSVersionNum(physicalChannel::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetPhysicalChanTEDSVersionNum, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), physicalChannel, data)
end

function GetPhysicalChanTEDSVersionLetter(physicalChannel::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetPhysicalChanTEDSVersionLetter, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), physicalChannel, data, bufferSize)
end

function GetPhysicalChanTEDSBitStream(physicalChannel::Ref{UInt8}, data::Ref{Cuchar}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetPhysicalChanTEDSBitStream, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuchar}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetPhysicalChanTEDSTemplateIDs(physicalChannel::Ref{UInt8}, data::Ref{Cuint}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetPhysicalChanTEDSTemplateIDs, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}, Cuint), physicalChannel, data, arraySizeInElements)
end

function GetReadRelativeTo(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetReadRelativeTo, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetReadRelativeTo(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetReadRelativeTo, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetReadRelativeTo(taskHandle::TaskHandle)
    ccall((:DAQmxResetReadRelativeTo, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetReadOffset(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetReadOffset, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetReadOffset(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetReadOffset, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetReadOffset(taskHandle::TaskHandle)
    ccall((:DAQmxResetReadOffset, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetReadChannelsToRead(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetReadChannelsToRead, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetReadChannelsToRead(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetReadChannelsToRead, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetReadChannelsToRead(taskHandle::TaskHandle)
    ccall((:DAQmxResetReadChannelsToRead, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetReadReadAllAvailSamp(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetReadReadAllAvailSamp, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetReadReadAllAvailSamp(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetReadReadAllAvailSamp, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetReadReadAllAvailSamp(taskHandle::TaskHandle)
    ccall((:DAQmxResetReadReadAllAvailSamp, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetReadAutoStart(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetReadAutoStart, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetReadAutoStart(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetReadAutoStart, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetReadAutoStart(taskHandle::TaskHandle)
    ccall((:DAQmxResetReadAutoStart, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetReadOverWrite(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetReadOverWrite, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetReadOverWrite(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetReadOverWrite, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetReadOverWrite(taskHandle::TaskHandle)
    ccall((:DAQmxResetReadOverWrite, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetLoggingFilePath(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetLoggingFilePath, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetLoggingFilePath(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetLoggingFilePath, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetLoggingFilePath(taskHandle::TaskHandle)
    ccall((:DAQmxResetLoggingFilePath, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetLoggingMode(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetLoggingMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetLoggingMode(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetLoggingMode, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetLoggingMode(taskHandle::TaskHandle)
    ccall((:DAQmxResetLoggingMode, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetLoggingTDMSGroupName(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetLoggingTDMSGroupName, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetLoggingTDMSGroupName(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetLoggingTDMSGroupName, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetLoggingTDMSGroupName(taskHandle::TaskHandle)
    ccall((:DAQmxResetLoggingTDMSGroupName, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetLoggingTDMSOperation(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetLoggingTDMSOperation, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetLoggingTDMSOperation(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetLoggingTDMSOperation, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetLoggingTDMSOperation(taskHandle::TaskHandle)
    ccall((:DAQmxResetLoggingTDMSOperation, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetLoggingPause(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetLoggingPause, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetLoggingPause(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetLoggingPause, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetLoggingPause(taskHandle::TaskHandle)
    ccall((:DAQmxResetLoggingPause, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetLoggingSampsPerFile(taskHandle::TaskHandle, data::Ref{Culonglong})
    ccall((:DAQmxGetLoggingSampsPerFile, :libnidaqmx), Cint, (TaskHandle, Ref{Culonglong}), taskHandle, data)
end

function SetLoggingSampsPerFile(taskHandle::TaskHandle, data::Culonglong)
    ccall((:DAQmxSetLoggingSampsPerFile, :libnidaqmx), Cint, (TaskHandle, Culonglong), taskHandle, data)
end

function ResetLoggingSampsPerFile(taskHandle::TaskHandle)
    ccall((:DAQmxResetLoggingSampsPerFile, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetLoggingFileWriteSize(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetLoggingFileWriteSize, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetLoggingFileWriteSize(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetLoggingFileWriteSize, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetLoggingFileWriteSize(taskHandle::TaskHandle)
    ccall((:DAQmxResetLoggingFileWriteSize, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetLoggingFilePreallocationSize(taskHandle::TaskHandle, data::Ref{Culonglong})
    ccall((:DAQmxGetLoggingFilePreallocationSize, :libnidaqmx), Cint, (TaskHandle, Ref{Culonglong}), taskHandle, data)
end

function SetLoggingFilePreallocationSize(taskHandle::TaskHandle, data::Culonglong)
    ccall((:DAQmxSetLoggingFilePreallocationSize, :libnidaqmx), Cint, (TaskHandle, Culonglong), taskHandle, data)
end

function ResetLoggingFilePreallocationSize(taskHandle::TaskHandle)
    ccall((:DAQmxResetLoggingFilePreallocationSize, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetReadCurrReadPos(taskHandle::TaskHandle, data::Ref{Culonglong})
    ccall((:DAQmxGetReadCurrReadPos, :libnidaqmx), Cint, (TaskHandle, Ref{Culonglong}), taskHandle, data)
end

function GetReadAvailSampPerChan(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetReadAvailSampPerChan, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadTotalSampPerChanAcquired(taskHandle::TaskHandle, data::Ref{Culonglong})
    ccall((:DAQmxGetReadTotalSampPerChanAcquired, :libnidaqmx), Cint, (TaskHandle, Ref{Culonglong}), taskHandle, data)
end

function GetReadCommonModeRangeErrorChansExist(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetReadCommonModeRangeErrorChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadCommonModeRangeErrorChans(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetReadCommonModeRangeErrorChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadExcitFaultChansExist(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetReadExcitFaultChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadExcitFaultChans(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetReadExcitFaultChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadOvercurrentChansExist(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetReadOvercurrentChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadOvercurrentChans(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetReadOvercurrentChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadOvertemperatureChansExist(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetReadOvertemperatureChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadOvertemperatureChans(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetReadOvertemperatureChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadOpenChansExist(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetReadOpenChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadOpenChans(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetReadOpenChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadOpenChansDetails(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetReadOpenChansDetails, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadOpenCurrentLoopChansExist(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetReadOpenCurrentLoopChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadOpenCurrentLoopChans(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetReadOpenCurrentLoopChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadOpenThrmcplChansExist(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetReadOpenThrmcplChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadOpenThrmcplChans(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetReadOpenThrmcplChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadOverloadedChansExist(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetReadOverloadedChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadOverloadedChans(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetReadOverloadedChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadPLLUnlockedChansExist(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetReadPLLUnlockedChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadPLLUnlockedChans(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetReadPLLUnlockedChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadSyncUnlockedChansExist(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetReadSyncUnlockedChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadSyncUnlockedChans(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetReadSyncUnlockedChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadAccessoryInsertionOrRemovalDetected(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetReadAccessoryInsertionOrRemovalDetected, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadDevsWithInsertedOrRemovedAccessories(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetReadDevsWithInsertedOrRemovedAccessories, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetReadChangeDetectHasOverflowed(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetReadChangeDetectHasOverflowed, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadRawDataWidth(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetReadRawDataWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadNumChans(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetReadNumChans, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadDigitalLinesBytesPerChan(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetReadDigitalLinesBytesPerChan, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetReadWaitMode(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetReadWaitMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetReadWaitMode(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetReadWaitMode, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetReadWaitMode(taskHandle::TaskHandle)
    ccall((:DAQmxResetReadWaitMode, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetReadSleepTime(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetReadSleepTime, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetReadSleepTime(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetReadSleepTime, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetReadSleepTime(taskHandle::TaskHandle)
    ccall((:DAQmxResetReadSleepTime, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRealTimeConvLateErrorsToWarnings(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetRealTimeConvLateErrorsToWarnings, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetRealTimeConvLateErrorsToWarnings(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetRealTimeConvLateErrorsToWarnings, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetRealTimeConvLateErrorsToWarnings(taskHandle::TaskHandle)
    ccall((:DAQmxResetRealTimeConvLateErrorsToWarnings, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRealTimeNumOfWarmupIters(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetRealTimeNumOfWarmupIters, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetRealTimeNumOfWarmupIters(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetRealTimeNumOfWarmupIters, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetRealTimeNumOfWarmupIters(taskHandle::TaskHandle)
    ccall((:DAQmxResetRealTimeNumOfWarmupIters, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRealTimeWaitForNextSampClkWaitMode(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetRealTimeWaitForNextSampClkWaitMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetRealTimeWaitForNextSampClkWaitMode(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetRealTimeWaitForNextSampClkWaitMode, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetRealTimeWaitForNextSampClkWaitMode(taskHandle::TaskHandle)
    ccall((:DAQmxResetRealTimeWaitForNextSampClkWaitMode, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRealTimeReportMissedSamp(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetRealTimeReportMissedSamp, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetRealTimeReportMissedSamp(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetRealTimeReportMissedSamp, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetRealTimeReportMissedSamp(taskHandle::TaskHandle)
    ccall((:DAQmxResetRealTimeReportMissedSamp, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRealTimeWriteRecoveryMode(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetRealTimeWriteRecoveryMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetRealTimeWriteRecoveryMode(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetRealTimeWriteRecoveryMode, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetRealTimeWriteRecoveryMode(taskHandle::TaskHandle)
    ccall((:DAQmxResetRealTimeWriteRecoveryMode, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetScaleDescr(scaleName::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetScaleDescr, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), scaleName, data, bufferSize)
end

function SetScaleDescr(scaleName::Ref{UInt8}, data)
    ccall((:DAQmxSetScaleDescr, :libnidaqmx), Cint, (Ref{UInt8}, Cstring), scaleName, data)
end

function GetScaleScaledUnits(scaleName::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetScaleScaledUnits, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), scaleName, data, bufferSize)
end

function SetScaleScaledUnits(scaleName::Ref{UInt8}, data)
    ccall((:DAQmxSetScaleScaledUnits, :libnidaqmx), Cint, (Ref{UInt8}, Cstring), scaleName, data)
end

function GetScalePreScaledUnits(scaleName::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetScalePreScaledUnits, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), scaleName, data)
end

function SetScalePreScaledUnits(scaleName::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetScalePreScaledUnits, :libnidaqmx), Cint, (Ref{UInt8}, Cint), scaleName, data)
end

function GetScaleType(scaleName::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetScaleType, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), scaleName, data)
end

function GetScaleLinSlope(scaleName::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetScaleLinSlope, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), scaleName, data)
end

function SetScaleLinSlope(scaleName::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetScaleLinSlope, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble), scaleName, data)
end

function GetScaleLinYIntercept(scaleName::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetScaleLinYIntercept, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), scaleName, data)
end

function SetScaleLinYIntercept(scaleName::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetScaleLinYIntercept, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble), scaleName, data)
end

function GetScaleMapScaledMax(scaleName::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetScaleMapScaledMax, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), scaleName, data)
end

function SetScaleMapScaledMax(scaleName::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetScaleMapScaledMax, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble), scaleName, data)
end

function GetScaleMapPreScaledMax(scaleName::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetScaleMapPreScaledMax, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), scaleName, data)
end

function SetScaleMapPreScaledMax(scaleName::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetScaleMapPreScaledMax, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble), scaleName, data)
end

function GetScaleMapScaledMin(scaleName::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetScaleMapScaledMin, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), scaleName, data)
end

function SetScaleMapScaledMin(scaleName::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetScaleMapScaledMin, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble), scaleName, data)
end

function GetScaleMapPreScaledMin(scaleName::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetScaleMapPreScaledMin, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), scaleName, data)
end

function SetScaleMapPreScaledMin(scaleName::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetScaleMapPreScaledMin, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble), scaleName, data)
end

function GetScalePolyForwardCoeff(scaleName::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetScalePolyForwardCoeff, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), scaleName, data, arraySizeInElements)
end

function SetScalePolyForwardCoeff(scaleName::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxSetScalePolyForwardCoeff, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), scaleName, data, arraySizeInElements)
end

function GetScalePolyReverseCoeff(scaleName::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetScalePolyReverseCoeff, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), scaleName, data, arraySizeInElements)
end

function SetScalePolyReverseCoeff(scaleName::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxSetScalePolyReverseCoeff, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), scaleName, data, arraySizeInElements)
end

function GetScaleTableScaledVals(scaleName::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetScaleTableScaledVals, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), scaleName, data, arraySizeInElements)
end

function SetScaleTableScaledVals(scaleName::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxSetScaleTableScaledVals, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), scaleName, data, arraySizeInElements)
end

function GetScaleTablePreScaledVals(scaleName::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetScaleTablePreScaledVals, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), scaleName, data, arraySizeInElements)
end

function SetScaleTablePreScaledVals(scaleName::Ref{UInt8}, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxSetScaleTablePreScaledVals, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}, Cuint), scaleName, data, arraySizeInElements)
end

function GetSwitchChanUsage(switchChannelName::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetSwitchChanUsage, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cint}), switchChannelName, data)
end

function SetSwitchChanUsage(switchChannelName::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetSwitchChanUsage, :libnidaqmx), Cint, (Ref{UInt8}, Cint), switchChannelName, data)
end

function GetSwitchChanAnlgBusSharingEnable(switchChannelName::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetSwitchChanAnlgBusSharingEnable, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), switchChannelName, data)
end

function SetSwitchChanAnlgBusSharingEnable(switchChannelName::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetSwitchChanAnlgBusSharingEnable, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), switchChannelName, data)
end

function GetSwitchChanMaxACCarryCurrent(switchChannelName::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetSwitchChanMaxACCarryCurrent, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanMaxACSwitchCurrent(switchChannelName::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetSwitchChanMaxACSwitchCurrent, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanMaxACCarryPwr(switchChannelName::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetSwitchChanMaxACCarryPwr, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanMaxACSwitchPwr(switchChannelName::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetSwitchChanMaxACSwitchPwr, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanMaxDCCarryCurrent(switchChannelName::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetSwitchChanMaxDCCarryCurrent, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanMaxDCSwitchCurrent(switchChannelName::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetSwitchChanMaxDCSwitchCurrent, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanMaxDCCarryPwr(switchChannelName::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetSwitchChanMaxDCCarryPwr, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanMaxDCSwitchPwr(switchChannelName::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetSwitchChanMaxDCSwitchPwr, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanMaxACVoltage(switchChannelName::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetSwitchChanMaxACVoltage, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanMaxDCVoltage(switchChannelName::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetSwitchChanMaxDCVoltage, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanWireMode(switchChannelName::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetSwitchChanWireMode, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), switchChannelName, data)
end

function GetSwitchChanBandwidth(switchChannelName::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetSwitchChanBandwidth, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchChanImpedance(switchChannelName::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetSwitchChanImpedance, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), switchChannelName, data)
end

function GetSwitchDevSettlingTime(deviceName::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetSwitchDevSettlingTime, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), deviceName, data)
end

function SetSwitchDevSettlingTime(deviceName::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetSwitchDevSettlingTime, :libnidaqmx), Cint, (Ref{UInt8}, Cdouble), deviceName, data)
end

function GetSwitchDevAutoConnAnlgBus(deviceName::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetSwitchDevAutoConnAnlgBus, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function SetSwitchDevAutoConnAnlgBus(deviceName::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetSwitchDevAutoConnAnlgBus, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), deviceName, data)
end

function GetSwitchDevPwrDownLatchRelaysAfterSettling(deviceName::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetSwitchDevPwrDownLatchRelaysAfterSettling, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function SetSwitchDevPwrDownLatchRelaysAfterSettling(deviceName::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetSwitchDevPwrDownLatchRelaysAfterSettling, :libnidaqmx), Cint, (Ref{UInt8}, Cuint), deviceName, data)
end

function GetSwitchDevSettled(deviceName::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetSwitchDevSettled, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function GetSwitchDevRelayList(deviceName::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetSwitchDevRelayList, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), deviceName, data, bufferSize)
end

function GetSwitchDevNumRelays(deviceName::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetSwitchDevNumRelays, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function GetSwitchDevSwitchChanList(deviceName::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetSwitchDevSwitchChanList, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), deviceName, data, bufferSize)
end

function GetSwitchDevNumSwitchChans(deviceName::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetSwitchDevNumSwitchChans, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function GetSwitchDevNumRows(deviceName::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetSwitchDevNumRows, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function GetSwitchDevNumColumns(deviceName::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetSwitchDevNumColumns, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cuint}), deviceName, data)
end

function GetSwitchDevTopology(deviceName::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetSwitchDevTopology, :libnidaqmx), Cint, (Ref{UInt8}, Cstring, Cuint), deviceName, data, bufferSize)
end

function GetSwitchDevTemperature(deviceName::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetSwitchDevTemperature, :libnidaqmx), Cint, (Ref{UInt8}, Ref{Cdouble}), deviceName, data)
end

function GetSwitchScanBreakMode(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetSwitchScanBreakMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSwitchScanBreakMode(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetSwitchScanBreakMode, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSwitchScanBreakMode(taskHandle::TaskHandle)
    ccall((:DAQmxResetSwitchScanBreakMode, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSwitchScanRepeatMode(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetSwitchScanRepeatMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSwitchScanRepeatMode(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetSwitchScanRepeatMode, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSwitchScanRepeatMode(taskHandle::TaskHandle)
    ccall((:DAQmxResetSwitchScanRepeatMode, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSwitchScanWaitingForAdv(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetSwitchScanWaitingForAdv, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetSysGlobalChans(data, bufferSize::Cuint)
    ccall((:DAQmxGetSysGlobalChans, :libnidaqmx), Cint, (Cstring, Cuint), data, bufferSize)
end

function GetSysScales(data, bufferSize::Cuint)
    ccall((:DAQmxGetSysScales, :libnidaqmx), Cint, (Cstring, Cuint), data, bufferSize)
end

function GetSysTasks(data, bufferSize::Cuint)
    ccall((:DAQmxGetSysTasks, :libnidaqmx), Cint, (Cstring, Cuint), data, bufferSize)
end

function GetSysDevNames(data, bufferSize::Cuint)
    ccall((:DAQmxGetSysDevNames, :libnidaqmx), Cint, (Cstring, Cuint), data, bufferSize)
end

function GetSysNIDAQMajorVersion(data::Ref{Cuint})
    ccall((:DAQmxGetSysNIDAQMajorVersion, :libnidaqmx), Cint, (Ref{Cuint},), data)
end

function GetSysNIDAQMinorVersion(data::Ref{Cuint})
    ccall((:DAQmxGetSysNIDAQMinorVersion, :libnidaqmx), Cint, (Ref{Cuint},), data)
end

function GetSysNIDAQUpdateVersion(data::Ref{Cuint})
    ccall((:DAQmxGetSysNIDAQUpdateVersion, :libnidaqmx), Cint, (Ref{Cuint},), data)
end

function GetTaskName(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetTaskName, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetTaskChannels(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetTaskChannels, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetTaskNumChans(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetTaskNumChans, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetTaskDevices(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetTaskDevices, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetTaskNumDevices(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetTaskNumDevices, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetTaskComplete(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetTaskComplete, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetSampQuantSampMode(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetSampQuantSampMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSampQuantSampMode(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetSampQuantSampMode, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSampQuantSampMode(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampQuantSampMode, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampQuantSampPerChan(taskHandle::TaskHandle, data::Ref{Culonglong})
    ccall((:DAQmxGetSampQuantSampPerChan, :libnidaqmx), Cint, (TaskHandle, Ref{Culonglong}), taskHandle, data)
end

function SetSampQuantSampPerChan(taskHandle::TaskHandle, data::Culonglong)
    ccall((:DAQmxSetSampQuantSampPerChan, :libnidaqmx), Cint, (TaskHandle, Culonglong), taskHandle, data)
end

function ResetSampQuantSampPerChan(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampQuantSampPerChan, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampTimingType(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetSampTimingType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSampTimingType(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetSampTimingType, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSampTimingType(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampTimingType, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkRate(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetSampClkRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetSampClkRate(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetSampClkRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetSampClkRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkMaxRate(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetSampClkMaxRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function GetSampClkSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetSampClkSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetSampClkSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetSampClkSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetSampClkSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkActiveEdge(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetSampClkActiveEdge, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSampClkActiveEdge(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetSampClkActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSampClkActiveEdge(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkActiveEdge, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkOverrunBehavior(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetSampClkOverrunBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSampClkOverrunBehavior(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetSampClkOverrunBehavior, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSampClkOverrunBehavior(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkOverrunBehavior, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkUnderflowBehavior(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetSampClkUnderflowBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSampClkUnderflowBehavior(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetSampClkUnderflowBehavior, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSampClkUnderflowBehavior(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkUnderflowBehavior, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkTimebaseDiv(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetSampClkTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetSampClkTimebaseDiv(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetSampClkTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetSampClkTimebaseDiv(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkTimebaseDiv, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkTerm(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetSampClkTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetSampClkTimebaseRate(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetSampClkTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetSampClkTimebaseRate(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetSampClkTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetSampClkTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkTimebaseSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetSampClkTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetSampClkTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetSampClkTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetSampClkTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkTimebaseActiveEdge(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetSampClkTimebaseActiveEdge, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSampClkTimebaseActiveEdge(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetSampClkTimebaseActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSampClkTimebaseActiveEdge(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkTimebaseActiveEdge, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkTimebaseMasterTimebaseDiv(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetSampClkTimebaseMasterTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetSampClkTimebaseMasterTimebaseDiv(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetSampClkTimebaseMasterTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetSampClkTimebaseMasterTimebaseDiv(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkTimebaseMasterTimebaseDiv, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkTimebaseTerm(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetSampClkTimebaseTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetSampClkDigFltrEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetSampClkDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetSampClkDigFltrEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetSampClkDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetSampClkDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetSampClkDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetSampClkDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetSampClkDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetSampClkDigFltrMinPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkDigFltrTimebaseSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetSampClkDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetSampClkDigFltrTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetSampClkDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetSampClkDigFltrTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkDigFltrTimebaseRate(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetSampClkDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetSampClkDigFltrTimebaseRate(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetSampClkDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetSampClkDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkDigSyncEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetSampClkDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetSampClkDigSyncEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetSampClkDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetSampClkDigSyncEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkDigSyncEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampClkWriteWfmUseInitialWfmDT(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetSampClkWriteWfmUseInitialWfmDT, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetSampClkWriteWfmUseInitialWfmDT(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetSampClkWriteWfmUseInitialWfmDT, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetSampClkWriteWfmUseInitialWfmDT(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkWriteWfmUseInitialWfmDT, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetHshkDelayAfterXfer(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetHshkDelayAfterXfer, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetHshkDelayAfterXfer(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetHshkDelayAfterXfer, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetHshkDelayAfterXfer(taskHandle::TaskHandle)
    ccall((:DAQmxResetHshkDelayAfterXfer, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetHshkStartCond(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetHshkStartCond, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetHshkStartCond(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetHshkStartCond, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetHshkStartCond(taskHandle::TaskHandle)
    ccall((:DAQmxResetHshkStartCond, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetHshkSampleInputDataWhen(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetHshkSampleInputDataWhen, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetHshkSampleInputDataWhen(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetHshkSampleInputDataWhen, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetHshkSampleInputDataWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetHshkSampleInputDataWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetChangeDetectDIRisingEdgePhysicalChans(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetChangeDetectDIRisingEdgePhysicalChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetChangeDetectDIRisingEdgePhysicalChans(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetChangeDetectDIRisingEdgePhysicalChans, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetChangeDetectDIRisingEdgePhysicalChans(taskHandle::TaskHandle)
    ccall((:DAQmxResetChangeDetectDIRisingEdgePhysicalChans, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetChangeDetectDIFallingEdgePhysicalChans(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetChangeDetectDIFallingEdgePhysicalChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetChangeDetectDIFallingEdgePhysicalChans(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetChangeDetectDIFallingEdgePhysicalChans, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetChangeDetectDIFallingEdgePhysicalChans(taskHandle::TaskHandle)
    ccall((:DAQmxResetChangeDetectDIFallingEdgePhysicalChans, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetChangeDetectDITristate(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetChangeDetectDITristate, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetChangeDetectDITristate(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetChangeDetectDITristate, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetChangeDetectDITristate(taskHandle::TaskHandle)
    ccall((:DAQmxResetChangeDetectDITristate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetOnDemandSimultaneousAOEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetOnDemandSimultaneousAOEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetOnDemandSimultaneousAOEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetOnDemandSimultaneousAOEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetOnDemandSimultaneousAOEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetOnDemandSimultaneousAOEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetImplicitUnderflowBehavior(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetImplicitUnderflowBehavior, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetImplicitUnderflowBehavior(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetImplicitUnderflowBehavior, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetImplicitUnderflowBehavior(taskHandle::TaskHandle)
    ccall((:DAQmxResetImplicitUnderflowBehavior, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvRate(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAIConvRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAIConvRate(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetAIConvRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAIConvRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvRateEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIConvRateEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, deviceNames, data)
end

function SetAIConvRateEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIConvRateEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, deviceNames, data)
end

function ResetAIConvRateEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8})
    ccall((:DAQmxResetAIConvRateEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetAIConvMaxRate(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAIConvMaxRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function GetAIConvMaxRateEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIConvMaxRateEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, deviceNames, data)
end

function GetAIConvSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetAIConvSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAIConvSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAIConvSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAIConvSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvSrcEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetAIConvSrcEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, deviceNames, data, bufferSize)
end

function SetAIConvSrcEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, data)
    ccall((:DAQmxSetAIConvSrcEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, deviceNames, data)
end

function ResetAIConvSrcEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8})
    ccall((:DAQmxResetAIConvSrcEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetAIConvActiveEdge(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetAIConvActiveEdge, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAIConvActiveEdge(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetAIConvActiveEdge, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAIConvActiveEdge(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvActiveEdge, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvActiveEdgeEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIConvActiveEdgeEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, deviceNames, data)
end

function SetAIConvActiveEdgeEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIConvActiveEdgeEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, deviceNames, data)
end

function ResetAIConvActiveEdgeEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8})
    ccall((:DAQmxResetAIConvActiveEdgeEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetAIConvTimebaseDiv(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetAIConvTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAIConvTimebaseDiv(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetAIConvTimebaseDiv, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAIConvTimebaseDiv(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvTimebaseDiv, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvTimebaseDivEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIConvTimebaseDivEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, deviceNames, data)
end

function SetAIConvTimebaseDivEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAIConvTimebaseDivEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, deviceNames, data)
end

function ResetAIConvTimebaseDivEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8})
    ccall((:DAQmxResetAIConvTimebaseDivEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetAIConvTimebaseSrc(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetAIConvTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAIConvTimebaseSrc(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetAIConvTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAIConvTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvTimebaseSrcEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetAIConvTimebaseSrcEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, deviceNames, data)
end

function SetAIConvTimebaseSrcEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetAIConvTimebaseSrcEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, deviceNames, data)
end

function ResetAIConvTimebaseSrcEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8})
    ccall((:DAQmxResetAIConvTimebaseSrcEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetDelayFromSampClkDelayUnits(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetDelayFromSampClkDelayUnits, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDelayFromSampClkDelayUnits(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetDelayFromSampClkDelayUnits, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDelayFromSampClkDelayUnits(taskHandle::TaskHandle)
    ccall((:DAQmxResetDelayFromSampClkDelayUnits, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDelayFromSampClkDelayUnitsEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetDelayFromSampClkDelayUnitsEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, deviceNames, data)
end

function SetDelayFromSampClkDelayUnitsEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetDelayFromSampClkDelayUnitsEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, deviceNames, data)
end

function ResetDelayFromSampClkDelayUnitsEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8})
    ccall((:DAQmxResetDelayFromSampClkDelayUnitsEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetDelayFromSampClkDelay(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetDelayFromSampClkDelay, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetDelayFromSampClkDelay(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetDelayFromSampClkDelay, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetDelayFromSampClkDelay(taskHandle::TaskHandle)
    ccall((:DAQmxResetDelayFromSampClkDelay, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDelayFromSampClkDelayEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetDelayFromSampClkDelayEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, deviceNames, data)
end

function SetDelayFromSampClkDelayEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetDelayFromSampClkDelayEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, deviceNames, data)
end

function ResetDelayFromSampClkDelayEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8})
    ccall((:DAQmxResetDelayFromSampClkDelayEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetAIConvDigFltrEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetAIConvDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAIConvDigFltrEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetAIConvDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAIConvDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvDigFltrEnableEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIConvDigFltrEnableEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, deviceNames, data)
end

function SetAIConvDigFltrEnableEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAIConvDigFltrEnableEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, deviceNames, data)
end

function ResetAIConvDigFltrEnableEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8})
    ccall((:DAQmxResetAIConvDigFltrEnableEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetAIConvDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAIConvDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAIConvDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetAIConvDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAIConvDigFltrMinPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvDigFltrMinPulseWidthEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIConvDigFltrMinPulseWidthEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, deviceNames, data)
end

function SetAIConvDigFltrMinPulseWidthEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIConvDigFltrMinPulseWidthEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, deviceNames, data)
end

function ResetAIConvDigFltrMinPulseWidthEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8})
    ccall((:DAQmxResetAIConvDigFltrMinPulseWidthEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetAIConvDigFltrTimebaseSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetAIConvDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAIConvDigFltrTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAIConvDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAIConvDigFltrTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvDigFltrTimebaseSrcEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, data, bufferSize::Cuint)
    ccall((:DAQmxGetAIConvDigFltrTimebaseSrcEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring, Cuint), taskHandle, deviceNames, data, bufferSize)
end

function SetAIConvDigFltrTimebaseSrcEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, data)
    ccall((:DAQmxSetAIConvDigFltrTimebaseSrcEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cstring), taskHandle, deviceNames, data)
end

function ResetAIConvDigFltrTimebaseSrcEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8})
    ccall((:DAQmxResetAIConvDigFltrTimebaseSrcEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetAIConvDigFltrTimebaseRate(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAIConvDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAIConvDigFltrTimebaseRate(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetAIConvDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAIConvDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvDigFltrTimebaseRateEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetAIConvDigFltrTimebaseRateEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, deviceNames, data)
end

function SetAIConvDigFltrTimebaseRateEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetAIConvDigFltrTimebaseRateEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, deviceNames, data)
end

function ResetAIConvDigFltrTimebaseRateEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8})
    ccall((:DAQmxResetAIConvDigFltrTimebaseRateEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetAIConvDigSyncEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetAIConvDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAIConvDigSyncEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetAIConvDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAIConvDigSyncEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAIConvDigSyncEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAIConvDigSyncEnableEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, data::Ref{Cuint})
    ccall((:DAQmxGetAIConvDigSyncEnableEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cuint}), taskHandle, deviceNames, data)
end

function SetAIConvDigSyncEnableEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8}, data::Cuint)
    ccall((:DAQmxSetAIConvDigSyncEnableEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cuint), taskHandle, deviceNames, data)
end

function ResetAIConvDigSyncEnableEx(taskHandle::TaskHandle, deviceNames::Ref{UInt8})
    ccall((:DAQmxResetAIConvDigSyncEnableEx, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, deviceNames)
end

function GetMasterTimebaseRate(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetMasterTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetMasterTimebaseRate(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetMasterTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetMasterTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetMasterTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetMasterTimebaseSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetMasterTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetMasterTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetMasterTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetMasterTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetMasterTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefClkRate(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetRefClkRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetRefClkRate(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetRefClkRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetRefClkRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefClkRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefClkSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetRefClkSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetRefClkSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetRefClkSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetRefClkSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefClkSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSyncPulseType(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetSyncPulseType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSyncPulseType(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetSyncPulseType, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSyncPulseType(taskHandle::TaskHandle)
    ccall((:DAQmxResetSyncPulseType, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSyncPulseSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetSyncPulseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetSyncPulseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetSyncPulseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetSyncPulseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetSyncPulseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSyncPulseTimeWhen(taskHandle::TaskHandle, data::Ref{CVIAbsoluteTime})
    ccall((:DAQmxGetSyncPulseTimeWhen, :libnidaqmx), Cint, (TaskHandle, Ref{CVIAbsoluteTime}), taskHandle, data)
end

function SetSyncPulseTimeWhen(taskHandle::TaskHandle, data::CVIAbsoluteTime)
    ccall((:DAQmxSetSyncPulseTimeWhen, :libnidaqmx), Cint, (TaskHandle, CVIAbsoluteTime), taskHandle, data)
end

function ResetSyncPulseTimeWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetSyncPulseTimeWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSyncPulseTimeTimescale(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetSyncPulseTimeTimescale, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSyncPulseTimeTimescale(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetSyncPulseTimeTimescale, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSyncPulseTimeTimescale(taskHandle::TaskHandle)
    ccall((:DAQmxResetSyncPulseTimeTimescale, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSyncPulseSyncTime(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetSyncPulseSyncTime, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function GetSyncPulseMinDelayToStart(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetSyncPulseMinDelayToStart, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetSyncPulseMinDelayToStart(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetSyncPulseMinDelayToStart, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetSyncPulseMinDelayToStart(taskHandle::TaskHandle)
    ccall((:DAQmxResetSyncPulseMinDelayToStart, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSyncPulseResetTime(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetSyncPulseResetTime, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function GetSyncPulseResetDelay(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetSyncPulseResetDelay, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetSyncPulseResetDelay(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetSyncPulseResetDelay, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetSyncPulseResetDelay(taskHandle::TaskHandle)
    ccall((:DAQmxResetSyncPulseResetDelay, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSyncPulseTerm(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetSyncPulseTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetSyncClkInterval(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetSyncClkInterval, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetSyncClkInterval(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetSyncClkInterval, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetSyncClkInterval(taskHandle::TaskHandle)
    ccall((:DAQmxResetSyncClkInterval, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetSampTimingEngine(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetSampTimingEngine, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetSampTimingEngine(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetSampTimingEngine, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetSampTimingEngine(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampTimingEngine, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetFirstSampTimestampEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetFirstSampTimestampEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetFirstSampTimestampEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetFirstSampTimestampEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetFirstSampTimestampEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetFirstSampTimestampEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetFirstSampTimestampTimescale(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetFirstSampTimestampTimescale, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetFirstSampTimestampTimescale(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetFirstSampTimestampTimescale, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetFirstSampTimestampTimescale(taskHandle::TaskHandle)
    ccall((:DAQmxResetFirstSampTimestampTimescale, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetFirstSampTimestampVal(taskHandle::TaskHandle, data::Ref{CVIAbsoluteTime})
    ccall((:DAQmxGetFirstSampTimestampVal, :libnidaqmx), Cint, (TaskHandle, Ref{CVIAbsoluteTime}), taskHandle, data)
end

function GetFirstSampClkWhen(taskHandle::TaskHandle, data::Ref{CVIAbsoluteTime})
    ccall((:DAQmxGetFirstSampClkWhen, :libnidaqmx), Cint, (TaskHandle, Ref{CVIAbsoluteTime}), taskHandle, data)
end

function SetFirstSampClkWhen(taskHandle::TaskHandle, data::CVIAbsoluteTime)
    ccall((:DAQmxSetFirstSampClkWhen, :libnidaqmx), Cint, (TaskHandle, CVIAbsoluteTime), taskHandle, data)
end

function ResetFirstSampClkWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetFirstSampClkWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetFirstSampClkTimescale(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetFirstSampClkTimescale, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetFirstSampClkTimescale(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetFirstSampClkTimescale, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetFirstSampClkTimescale(taskHandle::TaskHandle)
    ccall((:DAQmxResetFirstSampClkTimescale, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigType(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetStartTrigType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetStartTrigType(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetStartTrigType, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetStartTrigType(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigType, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigTerm(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetStartTrigTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetDigEdgeStartTrigSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetDigEdgeStartTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigEdgeStartTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigEdgeStartTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigEdgeStartTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeStartTrigEdge(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetDigEdgeStartTrigEdge, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDigEdgeStartTrigEdge(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetDigEdgeStartTrigEdge, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDigEdgeStartTrigEdge(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigEdge, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeStartTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetDigEdgeStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetDigEdgeStartTrigDigFltrEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetDigEdgeStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetDigEdgeStartTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetDigEdgeStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetDigEdgeStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetDigEdgeStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetDigEdgeStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeStartTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetDigEdgeStartTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigEdgeStartTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigEdgeStartTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigEdgeStartTrigDigFltrTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetDigEdgeStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetDigEdgeStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetDigEdgeStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetDigEdgeStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeStartTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetDigEdgeStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetDigEdgeStartTrigDigSyncEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetDigEdgeStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetDigEdgeStartTrigDigSyncEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigPatternStartTrigSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetDigPatternStartTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigPatternStartTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigPatternStartTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigPatternStartTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigPatternStartTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigPatternStartTrigPattern(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetDigPatternStartTrigPattern, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigPatternStartTrigPattern(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigPatternStartTrigPattern, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigPatternStartTrigPattern(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigPatternStartTrigPattern, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigPatternStartTrigWhen(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetDigPatternStartTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDigPatternStartTrigWhen(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetDigPatternStartTrigWhen, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDigPatternStartTrigWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigPatternStartTrigWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeStartTrigSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetAnlgEdgeStartTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgEdgeStartTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgEdgeStartTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgEdgeStartTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeStartTrigSlope(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetAnlgEdgeStartTrigSlope, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgEdgeStartTrigSlope(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetAnlgEdgeStartTrigSlope, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgEdgeStartTrigSlope(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigSlope, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeStartTrigLvl(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAnlgEdgeStartTrigLvl, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgEdgeStartTrigLvl(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetAnlgEdgeStartTrigLvl, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgEdgeStartTrigLvl(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigLvl, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeStartTrigHyst(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAnlgEdgeStartTrigHyst, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgEdgeStartTrigHyst(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetAnlgEdgeStartTrigHyst, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgEdgeStartTrigHyst(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigHyst, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeStartTrigCoupling(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetAnlgEdgeStartTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgEdgeStartTrigCoupling(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetAnlgEdgeStartTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgEdgeStartTrigCoupling(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigCoupling, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeStartTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetAnlgEdgeStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgEdgeStartTrigDigFltrEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetAnlgEdgeStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgEdgeStartTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAnlgEdgeStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgEdgeStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetAnlgEdgeStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgEdgeStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeStartTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetAnlgEdgeStartTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgEdgeStartTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgEdgeStartTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgEdgeStartTrigDigFltrTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAnlgEdgeStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgEdgeStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetAnlgEdgeStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgEdgeStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeStartTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetAnlgEdgeStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgEdgeStartTrigDigSyncEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetAnlgEdgeStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgEdgeStartTrigDigSyncEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgMultiEdgeStartTrigSrcs(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetAnlgMultiEdgeStartTrigSrcs, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgMultiEdgeStartTrigSrcs(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgMultiEdgeStartTrigSrcs, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgMultiEdgeStartTrigSrcs(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeStartTrigSrcs, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgMultiEdgeStartTrigSlopes(taskHandle::TaskHandle, data::Ref{Cint}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetAnlgMultiEdgeStartTrigSlopes, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}, Cuint), taskHandle, data, arraySizeInElements)
end

function SetAnlgMultiEdgeStartTrigSlopes(taskHandle::TaskHandle, data::Ref{Cint}, arraySizeInElements::Cuint)
    ccall((:DAQmxSetAnlgMultiEdgeStartTrigSlopes, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}, Cuint), taskHandle, data, arraySizeInElements)
end

function ResetAnlgMultiEdgeStartTrigSlopes(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeStartTrigSlopes, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgMultiEdgeStartTrigLvls(taskHandle::TaskHandle, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetAnlgMultiEdgeStartTrigLvls, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}, Cuint), taskHandle, data, arraySizeInElements)
end

function SetAnlgMultiEdgeStartTrigLvls(taskHandle::TaskHandle, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxSetAnlgMultiEdgeStartTrigLvls, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}, Cuint), taskHandle, data, arraySizeInElements)
end

function ResetAnlgMultiEdgeStartTrigLvls(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeStartTrigLvls, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgMultiEdgeStartTrigHysts(taskHandle::TaskHandle, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetAnlgMultiEdgeStartTrigHysts, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}, Cuint), taskHandle, data, arraySizeInElements)
end

function SetAnlgMultiEdgeStartTrigHysts(taskHandle::TaskHandle, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxSetAnlgMultiEdgeStartTrigHysts, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}, Cuint), taskHandle, data, arraySizeInElements)
end

function ResetAnlgMultiEdgeStartTrigHysts(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeStartTrigHysts, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgMultiEdgeStartTrigCouplings(taskHandle::TaskHandle, data::Ref{Cint}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetAnlgMultiEdgeStartTrigCouplings, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}, Cuint), taskHandle, data, arraySizeInElements)
end

function SetAnlgMultiEdgeStartTrigCouplings(taskHandle::TaskHandle, data::Ref{Cint}, arraySizeInElements::Cuint)
    ccall((:DAQmxSetAnlgMultiEdgeStartTrigCouplings, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}, Cuint), taskHandle, data, arraySizeInElements)
end

function ResetAnlgMultiEdgeStartTrigCouplings(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeStartTrigCouplings, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinStartTrigSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetAnlgWinStartTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgWinStartTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgWinStartTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgWinStartTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinStartTrigWhen(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetAnlgWinStartTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgWinStartTrigWhen(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetAnlgWinStartTrigWhen, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgWinStartTrigWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinStartTrigTop(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAnlgWinStartTrigTop, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinStartTrigTop(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetAnlgWinStartTrigTop, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinStartTrigTop(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigTop, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinStartTrigBtm(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAnlgWinStartTrigBtm, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinStartTrigBtm(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetAnlgWinStartTrigBtm, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinStartTrigBtm(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigBtm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinStartTrigCoupling(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetAnlgWinStartTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgWinStartTrigCoupling(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetAnlgWinStartTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgWinStartTrigCoupling(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigCoupling, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinStartTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetAnlgWinStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgWinStartTrigDigFltrEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetAnlgWinStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgWinStartTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAnlgWinStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetAnlgWinStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinStartTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetAnlgWinStartTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgWinStartTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgWinStartTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgWinStartTrigDigFltrTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAnlgWinStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetAnlgWinStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinStartTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetAnlgWinStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgWinStartTrigDigSyncEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetAnlgWinStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgWinStartTrigDigSyncEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigTrigWhen(taskHandle::TaskHandle, data::Ref{CVIAbsoluteTime})
    ccall((:DAQmxGetStartTrigTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{CVIAbsoluteTime}), taskHandle, data)
end

function SetStartTrigTrigWhen(taskHandle::TaskHandle, data::CVIAbsoluteTime)
    ccall((:DAQmxSetStartTrigTrigWhen, :libnidaqmx), Cint, (TaskHandle, CVIAbsoluteTime), taskHandle, data)
end

function ResetStartTrigTrigWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigTrigWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigTimescale(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetStartTrigTimescale, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetStartTrigTimescale(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetStartTrigTimescale, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetStartTrigTimescale(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigTimescale, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigTimestampEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetStartTrigTimestampEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetStartTrigTimestampEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetStartTrigTimestampEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetStartTrigTimestampEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigTimestampEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigTimestampTimescale(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetStartTrigTimestampTimescale, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetStartTrigTimestampTimescale(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetStartTrigTimestampTimescale, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetStartTrigTimestampTimescale(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigTimestampTimescale, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigTimestampVal(taskHandle::TaskHandle, data::Ref{CVIAbsoluteTime})
    ccall((:DAQmxGetStartTrigTimestampVal, :libnidaqmx), Cint, (TaskHandle, Ref{CVIAbsoluteTime}), taskHandle, data)
end

function GetStartTrigDelay(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetStartTrigDelay, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetStartTrigDelay(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetStartTrigDelay, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetStartTrigDelay(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigDelay, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigDelayUnits(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetStartTrigDelayUnits, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetStartTrigDelayUnits(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetStartTrigDelayUnits, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetStartTrigDelayUnits(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigDelayUnits, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigRetriggerable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetStartTrigRetriggerable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetStartTrigRetriggerable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetStartTrigRetriggerable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetStartTrigRetriggerable(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigRetriggerable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigTrigWin(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetStartTrigTrigWin, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetStartTrigTrigWin(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetStartTrigTrigWin, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetStartTrigTrigWin(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigTrigWin, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigRetriggerWin(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetStartTrigRetriggerWin, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetStartTrigRetriggerWin(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetStartTrigRetriggerWin, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetStartTrigRetriggerWin(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigRetriggerWin, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetStartTrigMaxNumTrigsToDetect(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetStartTrigMaxNumTrigsToDetect, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetStartTrigMaxNumTrigsToDetect(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetStartTrigMaxNumTrigsToDetect, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetStartTrigMaxNumTrigsToDetect(taskHandle::TaskHandle)
    ccall((:DAQmxResetStartTrigMaxNumTrigsToDetect, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigType(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetRefTrigType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetRefTrigType(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetRefTrigType, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetRefTrigType(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigType, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigPretrigSamples(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetRefTrigPretrigSamples, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetRefTrigPretrigSamples(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetRefTrigPretrigSamples, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetRefTrigPretrigSamples(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigPretrigSamples, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigTerm(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetRefTrigTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetDigEdgeRefTrigSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetDigEdgeRefTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigEdgeRefTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigEdgeRefTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigEdgeRefTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeRefTrigEdge(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetDigEdgeRefTrigEdge, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDigEdgeRefTrigEdge(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetDigEdgeRefTrigEdge, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDigEdgeRefTrigEdge(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigEdge, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeRefTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetDigEdgeRefTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetDigEdgeRefTrigDigFltrEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetDigEdgeRefTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetDigEdgeRefTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeRefTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetDigEdgeRefTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetDigEdgeRefTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetDigEdgeRefTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetDigEdgeRefTrigDigFltrMinPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeRefTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetDigEdgeRefTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigEdgeRefTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigEdgeRefTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigEdgeRefTrigDigFltrTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeRefTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetDigEdgeRefTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetDigEdgeRefTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetDigEdgeRefTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetDigEdgeRefTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeRefTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetDigEdgeRefTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetDigEdgeRefTrigDigSyncEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetDigEdgeRefTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetDigEdgeRefTrigDigSyncEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigPatternRefTrigSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetDigPatternRefTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigPatternRefTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigPatternRefTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigPatternRefTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigPatternRefTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigPatternRefTrigPattern(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetDigPatternRefTrigPattern, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigPatternRefTrigPattern(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigPatternRefTrigPattern, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigPatternRefTrigPattern(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigPatternRefTrigPattern, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigPatternRefTrigWhen(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetDigPatternRefTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDigPatternRefTrigWhen(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetDigPatternRefTrigWhen, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDigPatternRefTrigWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigPatternRefTrigWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeRefTrigSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetAnlgEdgeRefTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgEdgeRefTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgEdgeRefTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgEdgeRefTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeRefTrigSlope(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetAnlgEdgeRefTrigSlope, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgEdgeRefTrigSlope(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetAnlgEdgeRefTrigSlope, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgEdgeRefTrigSlope(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigSlope, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeRefTrigLvl(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAnlgEdgeRefTrigLvl, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgEdgeRefTrigLvl(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetAnlgEdgeRefTrigLvl, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgEdgeRefTrigLvl(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigLvl, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeRefTrigHyst(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAnlgEdgeRefTrigHyst, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgEdgeRefTrigHyst(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetAnlgEdgeRefTrigHyst, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgEdgeRefTrigHyst(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigHyst, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeRefTrigCoupling(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetAnlgEdgeRefTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgEdgeRefTrigCoupling(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetAnlgEdgeRefTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgEdgeRefTrigCoupling(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigCoupling, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeRefTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetAnlgEdgeRefTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgEdgeRefTrigDigFltrEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetAnlgEdgeRefTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgEdgeRefTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeRefTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAnlgEdgeRefTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgEdgeRefTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetAnlgEdgeRefTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgEdgeRefTrigDigFltrMinPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeRefTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetAnlgEdgeRefTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgEdgeRefTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgEdgeRefTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgEdgeRefTrigDigFltrTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeRefTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAnlgEdgeRefTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgEdgeRefTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetAnlgEdgeRefTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgEdgeRefTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgEdgeRefTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetAnlgEdgeRefTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgEdgeRefTrigDigSyncEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetAnlgEdgeRefTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgEdgeRefTrigDigSyncEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgMultiEdgeRefTrigSrcs(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetAnlgMultiEdgeRefTrigSrcs, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgMultiEdgeRefTrigSrcs(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgMultiEdgeRefTrigSrcs, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgMultiEdgeRefTrigSrcs(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeRefTrigSrcs, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgMultiEdgeRefTrigSlopes(taskHandle::TaskHandle, data::Ref{Cint}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetAnlgMultiEdgeRefTrigSlopes, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}, Cuint), taskHandle, data, arraySizeInElements)
end

function SetAnlgMultiEdgeRefTrigSlopes(taskHandle::TaskHandle, data::Ref{Cint}, arraySizeInElements::Cuint)
    ccall((:DAQmxSetAnlgMultiEdgeRefTrigSlopes, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}, Cuint), taskHandle, data, arraySizeInElements)
end

function ResetAnlgMultiEdgeRefTrigSlopes(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeRefTrigSlopes, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgMultiEdgeRefTrigLvls(taskHandle::TaskHandle, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetAnlgMultiEdgeRefTrigLvls, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}, Cuint), taskHandle, data, arraySizeInElements)
end

function SetAnlgMultiEdgeRefTrigLvls(taskHandle::TaskHandle, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxSetAnlgMultiEdgeRefTrigLvls, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}, Cuint), taskHandle, data, arraySizeInElements)
end

function ResetAnlgMultiEdgeRefTrigLvls(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeRefTrigLvls, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgMultiEdgeRefTrigHysts(taskHandle::TaskHandle, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetAnlgMultiEdgeRefTrigHysts, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}, Cuint), taskHandle, data, arraySizeInElements)
end

function SetAnlgMultiEdgeRefTrigHysts(taskHandle::TaskHandle, data::Ref{Cdouble}, arraySizeInElements::Cuint)
    ccall((:DAQmxSetAnlgMultiEdgeRefTrigHysts, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}, Cuint), taskHandle, data, arraySizeInElements)
end

function ResetAnlgMultiEdgeRefTrigHysts(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeRefTrigHysts, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgMultiEdgeRefTrigCouplings(taskHandle::TaskHandle, data::Ref{Cint}, arraySizeInElements::Cuint)
    ccall((:DAQmxGetAnlgMultiEdgeRefTrigCouplings, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}, Cuint), taskHandle, data, arraySizeInElements)
end

function SetAnlgMultiEdgeRefTrigCouplings(taskHandle::TaskHandle, data::Ref{Cint}, arraySizeInElements::Cuint)
    ccall((:DAQmxSetAnlgMultiEdgeRefTrigCouplings, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}, Cuint), taskHandle, data, arraySizeInElements)
end

function ResetAnlgMultiEdgeRefTrigCouplings(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeRefTrigCouplings, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinRefTrigSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetAnlgWinRefTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgWinRefTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgWinRefTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgWinRefTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinRefTrigWhen(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetAnlgWinRefTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgWinRefTrigWhen(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetAnlgWinRefTrigWhen, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgWinRefTrigWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinRefTrigTop(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAnlgWinRefTrigTop, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinRefTrigTop(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetAnlgWinRefTrigTop, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinRefTrigTop(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigTop, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinRefTrigBtm(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAnlgWinRefTrigBtm, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinRefTrigBtm(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetAnlgWinRefTrigBtm, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinRefTrigBtm(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigBtm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinRefTrigCoupling(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetAnlgWinRefTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgWinRefTrigCoupling(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetAnlgWinRefTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgWinRefTrigCoupling(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigCoupling, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinRefTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetAnlgWinRefTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgWinRefTrigDigFltrEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetAnlgWinRefTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgWinRefTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinRefTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAnlgWinRefTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinRefTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetAnlgWinRefTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinRefTrigDigFltrMinPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinRefTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetAnlgWinRefTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgWinRefTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgWinRefTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgWinRefTrigDigFltrTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinRefTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAnlgWinRefTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinRefTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetAnlgWinRefTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinRefTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinRefTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetAnlgWinRefTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgWinRefTrigDigSyncEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetAnlgWinRefTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgWinRefTrigDigSyncEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigAutoTrigEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetRefTrigAutoTrigEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetRefTrigAutoTrigEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetRefTrigAutoTrigEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetRefTrigAutoTrigEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigAutoTrigEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigAutoTriggered(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetRefTrigAutoTriggered, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetRefTrigTimestampEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetRefTrigTimestampEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetRefTrigTimestampEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetRefTrigTimestampEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetRefTrigTimestampEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigTimestampEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigTimestampTimescale(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetRefTrigTimestampTimescale, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetRefTrigTimestampTimescale(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetRefTrigTimestampTimescale, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetRefTrigTimestampTimescale(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigTimestampTimescale, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigTimestampVal(taskHandle::TaskHandle, data::Ref{CVIAbsoluteTime})
    ccall((:DAQmxGetRefTrigTimestampVal, :libnidaqmx), Cint, (TaskHandle, Ref{CVIAbsoluteTime}), taskHandle, data)
end

function GetRefTrigDelay(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetRefTrigDelay, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetRefTrigDelay(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetRefTrigDelay, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetRefTrigDelay(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigDelay, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigRetriggerable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetRefTrigRetriggerable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetRefTrigRetriggerable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetRefTrigRetriggerable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetRefTrigRetriggerable(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigRetriggerable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigTrigWin(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetRefTrigTrigWin, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetRefTrigTrigWin(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetRefTrigTrigWin, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetRefTrigTrigWin(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigTrigWin, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigRetriggerWin(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetRefTrigRetriggerWin, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetRefTrigRetriggerWin(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetRefTrigRetriggerWin, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetRefTrigRetriggerWin(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigRetriggerWin, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetRefTrigMaxNumTrigsToDetect(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetRefTrigMaxNumTrigsToDetect, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetRefTrigMaxNumTrigsToDetect(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetRefTrigMaxNumTrigsToDetect, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetRefTrigMaxNumTrigsToDetect(taskHandle::TaskHandle)
    ccall((:DAQmxResetRefTrigMaxNumTrigsToDetect, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAdvTrigType(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetAdvTrigType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAdvTrigType(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetAdvTrigType, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAdvTrigType(taskHandle::TaskHandle)
    ccall((:DAQmxResetAdvTrigType, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeAdvTrigSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetDigEdgeAdvTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigEdgeAdvTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigEdgeAdvTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigEdgeAdvTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeAdvTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeAdvTrigEdge(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetDigEdgeAdvTrigEdge, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDigEdgeAdvTrigEdge(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetDigEdgeAdvTrigEdge, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDigEdgeAdvTrigEdge(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeAdvTrigEdge, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeAdvTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetDigEdgeAdvTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetDigEdgeAdvTrigDigFltrEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetDigEdgeAdvTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetDigEdgeAdvTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeAdvTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetHshkTrigType(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetHshkTrigType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetHshkTrigType(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetHshkTrigType, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetHshkTrigType(taskHandle::TaskHandle)
    ccall((:DAQmxResetHshkTrigType, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetInterlockedHshkTrigSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetInterlockedHshkTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetInterlockedHshkTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetInterlockedHshkTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetInterlockedHshkTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetInterlockedHshkTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetInterlockedHshkTrigAssertedLvl(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetInterlockedHshkTrigAssertedLvl, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetInterlockedHshkTrigAssertedLvl(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetInterlockedHshkTrigAssertedLvl, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetInterlockedHshkTrigAssertedLvl(taskHandle::TaskHandle)
    ccall((:DAQmxResetInterlockedHshkTrigAssertedLvl, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetPauseTrigType(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetPauseTrigType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetPauseTrigType(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetPauseTrigType, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetPauseTrigType(taskHandle::TaskHandle)
    ccall((:DAQmxResetPauseTrigType, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetPauseTrigTerm(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetPauseTrigTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetAnlgLvlPauseTrigSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetAnlgLvlPauseTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgLvlPauseTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgLvlPauseTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgLvlPauseTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgLvlPauseTrigWhen(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetAnlgLvlPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgLvlPauseTrigWhen(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetAnlgLvlPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgLvlPauseTrigWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgLvlPauseTrigLvl(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAnlgLvlPauseTrigLvl, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgLvlPauseTrigLvl(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetAnlgLvlPauseTrigLvl, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgLvlPauseTrigLvl(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigLvl, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgLvlPauseTrigHyst(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAnlgLvlPauseTrigHyst, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgLvlPauseTrigHyst(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetAnlgLvlPauseTrigHyst, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgLvlPauseTrigHyst(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigHyst, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgLvlPauseTrigCoupling(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetAnlgLvlPauseTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgLvlPauseTrigCoupling(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetAnlgLvlPauseTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgLvlPauseTrigCoupling(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigCoupling, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgLvlPauseTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetAnlgLvlPauseTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgLvlPauseTrigDigFltrEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetAnlgLvlPauseTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgLvlPauseTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgLvlPauseTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAnlgLvlPauseTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgLvlPauseTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetAnlgLvlPauseTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgLvlPauseTrigDigFltrMinPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgLvlPauseTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetAnlgLvlPauseTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgLvlPauseTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgLvlPauseTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgLvlPauseTrigDigFltrTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgLvlPauseTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAnlgLvlPauseTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgLvlPauseTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetAnlgLvlPauseTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgLvlPauseTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgLvlPauseTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetAnlgLvlPauseTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgLvlPauseTrigDigSyncEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetAnlgLvlPauseTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgLvlPauseTrigDigSyncEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinPauseTrigSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetAnlgWinPauseTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgWinPauseTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgWinPauseTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgWinPauseTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinPauseTrigWhen(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetAnlgWinPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgWinPauseTrigWhen(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetAnlgWinPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgWinPauseTrigWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinPauseTrigTop(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAnlgWinPauseTrigTop, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinPauseTrigTop(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetAnlgWinPauseTrigTop, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinPauseTrigTop(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigTop, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinPauseTrigBtm(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAnlgWinPauseTrigBtm, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinPauseTrigBtm(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetAnlgWinPauseTrigBtm, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinPauseTrigBtm(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigBtm, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinPauseTrigCoupling(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetAnlgWinPauseTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetAnlgWinPauseTrigCoupling(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetAnlgWinPauseTrigCoupling, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetAnlgWinPauseTrigCoupling(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigCoupling, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinPauseTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetAnlgWinPauseTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgWinPauseTrigDigFltrEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetAnlgWinPauseTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgWinPauseTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinPauseTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAnlgWinPauseTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinPauseTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetAnlgWinPauseTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinPauseTrigDigFltrMinPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinPauseTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetAnlgWinPauseTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetAnlgWinPauseTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetAnlgWinPauseTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetAnlgWinPauseTrigDigFltrTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinPauseTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetAnlgWinPauseTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetAnlgWinPauseTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetAnlgWinPauseTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetAnlgWinPauseTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetAnlgWinPauseTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetAnlgWinPauseTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetAnlgWinPauseTrigDigSyncEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetAnlgWinPauseTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetAnlgWinPauseTrigDigSyncEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigLvlPauseTrigSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetDigLvlPauseTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigLvlPauseTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigLvlPauseTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigLvlPauseTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigLvlPauseTrigWhen(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetDigLvlPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDigLvlPauseTrigWhen(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetDigLvlPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDigLvlPauseTrigWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigLvlPauseTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetDigLvlPauseTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetDigLvlPauseTrigDigFltrEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetDigLvlPauseTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetDigLvlPauseTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigLvlPauseTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetDigLvlPauseTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetDigLvlPauseTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetDigLvlPauseTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetDigLvlPauseTrigDigFltrMinPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigLvlPauseTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetDigLvlPauseTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigLvlPauseTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigLvlPauseTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigLvlPauseTrigDigFltrTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigLvlPauseTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetDigLvlPauseTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetDigLvlPauseTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetDigLvlPauseTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetDigLvlPauseTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigLvlPauseTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetDigLvlPauseTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetDigLvlPauseTrigDigSyncEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetDigLvlPauseTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetDigLvlPauseTrigDigSyncEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigPatternPauseTrigSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetDigPatternPauseTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigPatternPauseTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigPatternPauseTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigPatternPauseTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigPatternPauseTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigPatternPauseTrigPattern(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetDigPatternPauseTrigPattern, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigPatternPauseTrigPattern(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigPatternPauseTrigPattern, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigPatternPauseTrigPattern(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigPatternPauseTrigPattern, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigPatternPauseTrigWhen(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetDigPatternPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDigPatternPauseTrigWhen(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetDigPatternPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDigPatternPauseTrigWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigPatternPauseTrigWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetArmStartTrigType(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetArmStartTrigType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetArmStartTrigType(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetArmStartTrigType, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetArmStartTrigType(taskHandle::TaskHandle)
    ccall((:DAQmxResetArmStartTrigType, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetArmStartTerm(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetArmStartTerm, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetDigEdgeArmStartTrigSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetDigEdgeArmStartTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigEdgeArmStartTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigEdgeArmStartTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigEdgeArmStartTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeArmStartTrigEdge(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetDigEdgeArmStartTrigEdge, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDigEdgeArmStartTrigEdge(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetDigEdgeArmStartTrigEdge, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDigEdgeArmStartTrigEdge(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigEdge, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeArmStartTrigDigFltrEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetDigEdgeArmStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetDigEdgeArmStartTrigDigFltrEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetDigEdgeArmStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetDigEdgeArmStartTrigDigFltrEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigDigFltrEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeArmStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetDigEdgeArmStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetDigEdgeArmStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetDigEdgeArmStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetDigEdgeArmStartTrigDigFltrMinPulseWidth(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigDigFltrMinPulseWidth, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeArmStartTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetDigEdgeArmStartTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigEdgeArmStartTrigDigFltrTimebaseSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigEdgeArmStartTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigEdgeArmStartTrigDigFltrTimebaseSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigDigFltrTimebaseSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeArmStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetDigEdgeArmStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetDigEdgeArmStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetDigEdgeArmStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetDigEdgeArmStartTrigDigFltrTimebaseRate(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigDigFltrTimebaseRate, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeArmStartTrigDigSyncEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetDigEdgeArmStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetDigEdgeArmStartTrigDigSyncEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetDigEdgeArmStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetDigEdgeArmStartTrigDigSyncEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigDigSyncEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetArmStartTrigTrigWhen(taskHandle::TaskHandle, data::Ref{CVIAbsoluteTime})
    ccall((:DAQmxGetArmStartTrigTrigWhen, :libnidaqmx), Cint, (TaskHandle, Ref{CVIAbsoluteTime}), taskHandle, data)
end

function SetArmStartTrigTrigWhen(taskHandle::TaskHandle, data::CVIAbsoluteTime)
    ccall((:DAQmxSetArmStartTrigTrigWhen, :libnidaqmx), Cint, (TaskHandle, CVIAbsoluteTime), taskHandle, data)
end

function ResetArmStartTrigTrigWhen(taskHandle::TaskHandle)
    ccall((:DAQmxResetArmStartTrigTrigWhen, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetArmStartTrigTimescale(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetArmStartTrigTimescale, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetArmStartTrigTimescale(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetArmStartTrigTimescale, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetArmStartTrigTimescale(taskHandle::TaskHandle)
    ccall((:DAQmxResetArmStartTrigTimescale, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetArmStartTrigTimestampEnable(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetArmStartTrigTimestampEnable, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetArmStartTrigTimestampEnable(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetArmStartTrigTimestampEnable, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetArmStartTrigTimestampEnable(taskHandle::TaskHandle)
    ccall((:DAQmxResetArmStartTrigTimestampEnable, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetArmStartTrigTimestampTimescale(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetArmStartTrigTimestampTimescale, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetArmStartTrigTimestampTimescale(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetArmStartTrigTimestampTimescale, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetArmStartTrigTimestampTimescale(taskHandle::TaskHandle)
    ccall((:DAQmxResetArmStartTrigTimestampTimescale, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetArmStartTrigTimestampVal(taskHandle::TaskHandle, data::Ref{CVIAbsoluteTime})
    ccall((:DAQmxGetArmStartTrigTimestampVal, :libnidaqmx), Cint, (TaskHandle, Ref{CVIAbsoluteTime}), taskHandle, data)
end

function GetTriggerSyncType(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetTriggerSyncType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetTriggerSyncType(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetTriggerSyncType, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetTriggerSyncType(taskHandle::TaskHandle)
    ccall((:DAQmxResetTriggerSyncType, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetWatchdogTimeout(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetWatchdogTimeout, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetWatchdogTimeout(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetWatchdogTimeout, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetWatchdogTimeout(taskHandle::TaskHandle)
    ccall((:DAQmxResetWatchdogTimeout, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetWatchdogExpirTrigType(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetWatchdogExpirTrigType, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetWatchdogExpirTrigType(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetWatchdogExpirTrigType, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetWatchdogExpirTrigType(taskHandle::TaskHandle)
    ccall((:DAQmxResetWatchdogExpirTrigType, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetWatchdogExpirTrigTrigOnNetworkConnLoss(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetWatchdogExpirTrigTrigOnNetworkConnLoss, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function SetWatchdogExpirTrigTrigOnNetworkConnLoss(taskHandle::TaskHandle, data::Cuint)
    ccall((:DAQmxSetWatchdogExpirTrigTrigOnNetworkConnLoss, :libnidaqmx), Cint, (TaskHandle, Cuint), taskHandle, data)
end

function ResetWatchdogExpirTrigTrigOnNetworkConnLoss(taskHandle::TaskHandle)
    ccall((:DAQmxResetWatchdogExpirTrigTrigOnNetworkConnLoss, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeWatchdogExpirTrigSrc(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetDigEdgeWatchdogExpirTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function SetDigEdgeWatchdogExpirTrigSrc(taskHandle::TaskHandle, data)
    ccall((:DAQmxSetDigEdgeWatchdogExpirTrigSrc, :libnidaqmx), Cint, (TaskHandle, Cstring), taskHandle, data)
end

function ResetDigEdgeWatchdogExpirTrigSrc(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeWatchdogExpirTrigSrc, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetDigEdgeWatchdogExpirTrigEdge(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetDigEdgeWatchdogExpirTrigEdge, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetDigEdgeWatchdogExpirTrigEdge(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetDigEdgeWatchdogExpirTrigEdge, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetDigEdgeWatchdogExpirTrigEdge(taskHandle::TaskHandle)
    ccall((:DAQmxResetDigEdgeWatchdogExpirTrigEdge, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetWatchdogDOExpirState(taskHandle::TaskHandle, lines::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetWatchdogDOExpirState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, lines, data)
end

function SetWatchdogDOExpirState(taskHandle::TaskHandle, lines::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetWatchdogDOExpirState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, lines, data)
end

function ResetWatchdogDOExpirState(taskHandle::TaskHandle, lines::Ref{UInt8})
    ccall((:DAQmxResetWatchdogDOExpirState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, lines)
end

function GetWatchdogAOOutputType(taskHandle::TaskHandle, lines::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetWatchdogAOOutputType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, lines, data)
end

function SetWatchdogAOOutputType(taskHandle::TaskHandle, lines::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetWatchdogAOOutputType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, lines, data)
end

function ResetWatchdogAOOutputType(taskHandle::TaskHandle, lines::Ref{UInt8})
    ccall((:DAQmxResetWatchdogAOOutputType, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, lines)
end

function GetWatchdogAOExpirState(taskHandle::TaskHandle, lines::Ref{UInt8}, data::Ref{Cdouble})
    ccall((:DAQmxGetWatchdogAOExpirState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cdouble}), taskHandle, lines, data)
end

function SetWatchdogAOExpirState(taskHandle::TaskHandle, lines::Ref{UInt8}, data::Cdouble)
    ccall((:DAQmxSetWatchdogAOExpirState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cdouble), taskHandle, lines, data)
end

function ResetWatchdogAOExpirState(taskHandle::TaskHandle, lines::Ref{UInt8})
    ccall((:DAQmxResetWatchdogAOExpirState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, lines)
end

function GetWatchdogCOExpirState(taskHandle::TaskHandle, lines::Ref{UInt8}, data::Ref{Cint})
    ccall((:DAQmxGetWatchdogCOExpirState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Ref{Cint}), taskHandle, lines, data)
end

function SetWatchdogCOExpirState(taskHandle::TaskHandle, lines::Ref{UInt8}, data::Cint)
    ccall((:DAQmxSetWatchdogCOExpirState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}, Cint), taskHandle, lines, data)
end

function ResetWatchdogCOExpirState(taskHandle::TaskHandle, lines::Ref{UInt8})
    ccall((:DAQmxResetWatchdogCOExpirState, :libnidaqmx), Cint, (TaskHandle, Ref{UInt8}), taskHandle, lines)
end

function GetWatchdogHasExpired(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetWatchdogHasExpired, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteRelativeTo(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetWriteRelativeTo, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetWriteRelativeTo(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetWriteRelativeTo, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetWriteRelativeTo(taskHandle::TaskHandle)
    ccall((:DAQmxResetWriteRelativeTo, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetWriteOffset(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetWriteOffset, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetWriteOffset(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetWriteOffset, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetWriteOffset(taskHandle::TaskHandle)
    ccall((:DAQmxResetWriteOffset, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetWriteRegenMode(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetWriteRegenMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetWriteRegenMode(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetWriteRegenMode, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetWriteRegenMode(taskHandle::TaskHandle)
    ccall((:DAQmxResetWriteRegenMode, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetWriteCurrWritePos(taskHandle::TaskHandle, data::Ref{Culonglong})
    ccall((:DAQmxGetWriteCurrWritePos, :libnidaqmx), Cint, (TaskHandle, Ref{Culonglong}), taskHandle, data)
end

function GetWriteOvercurrentChansExist(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetWriteOvercurrentChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteOvercurrentChans(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetWriteOvercurrentChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetWriteOvertemperatureChansExist(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetWriteOvertemperatureChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteOvertemperatureChans(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetWriteOvertemperatureChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetWriteExternalOvervoltageChansExist(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetWriteExternalOvervoltageChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteExternalOvervoltageChans(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetWriteExternalOvervoltageChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetWriteOverloadedChansExist(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetWriteOverloadedChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteOverloadedChans(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetWriteOverloadedChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetWriteOpenCurrentLoopChansExist(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetWriteOpenCurrentLoopChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteOpenCurrentLoopChans(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetWriteOpenCurrentLoopChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetWritePowerSupplyFaultChansExist(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetWritePowerSupplyFaultChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWritePowerSupplyFaultChans(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetWritePowerSupplyFaultChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetWriteSyncUnlockedChansExist(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetWriteSyncUnlockedChansExist, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteSyncUnlockedChans(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetWriteSyncUnlockedChans, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetWriteSpaceAvail(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetWriteSpaceAvail, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteTotalSampPerChanGenerated(taskHandle::TaskHandle, data::Ref{Culonglong})
    ccall((:DAQmxGetWriteTotalSampPerChanGenerated, :libnidaqmx), Cint, (TaskHandle, Ref{Culonglong}), taskHandle, data)
end

function GetWriteAccessoryInsertionOrRemovalDetected(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetWriteAccessoryInsertionOrRemovalDetected, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteDevsWithInsertedOrRemovedAccessories(taskHandle::TaskHandle, data, bufferSize::Cuint)
    ccall((:DAQmxGetWriteDevsWithInsertedOrRemovedAccessories, :libnidaqmx), Cint, (TaskHandle, Cstring, Cuint), taskHandle, data, bufferSize)
end

function GetWriteRawDataWidth(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetWriteRawDataWidth, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteNumChans(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetWriteNumChans, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetWriteWaitMode(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetWriteWaitMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetWriteWaitMode(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetWriteWaitMode, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetWriteWaitMode(taskHandle::TaskHandle)
    ccall((:DAQmxResetWriteWaitMode, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetWriteSleepTime(taskHandle::TaskHandle, data::Ref{Cdouble})
    ccall((:DAQmxGetWriteSleepTime, :libnidaqmx), Cint, (TaskHandle, Ref{Cdouble}), taskHandle, data)
end

function SetWriteSleepTime(taskHandle::TaskHandle, data::Cdouble)
    ccall((:DAQmxSetWriteSleepTime, :libnidaqmx), Cint, (TaskHandle, Cdouble), taskHandle, data)
end

function ResetWriteSleepTime(taskHandle::TaskHandle)
    ccall((:DAQmxResetWriteSleepTime, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end

function GetWriteDigitalLinesBytesPerChan(taskHandle::TaskHandle, data::Ref{Cuint})
    ccall((:DAQmxGetWriteDigitalLinesBytesPerChan, :libnidaqmx), Cint, (TaskHandle, Ref{Cuint}), taskHandle, data)
end

function GetSampClkTimingResponseMode(taskHandle::TaskHandle, data::Ref{Cint})
    ccall((:DAQmxGetSampClkTimingResponseMode, :libnidaqmx), Cint, (TaskHandle, Ref{Cint}), taskHandle, data)
end

function SetSampClkTimingResponseMode(taskHandle::TaskHandle, data::Cint)
    ccall((:DAQmxSetSampClkTimingResponseMode, :libnidaqmx), Cint, (TaskHandle, Cint), taskHandle, data)
end

function ResetSampClkTimingResponseMode(taskHandle::TaskHandle)
    ccall((:DAQmxResetSampClkTimingResponseMode, :libnidaqmx), Cint, (TaskHandle,), taskHandle)
end
