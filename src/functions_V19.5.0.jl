# Julia wrapper for header: NIDAQmx.h
# Automatically generated using Clang.jl


function DAQmxLoadTask(taskName, taskHandle)
    ccall((:DAQmxLoadTask, nidaqmx), int32, (Ptr{UInt8}, Ptr{TaskHandle}), taskName, taskHandle)
end

function DAQmxCreateTask(taskName, taskHandle)
    ccall((:DAQmxCreateTask, nidaqmx), int32, (Ptr{UInt8}, Ptr{TaskHandle}), taskName, taskHandle)
end

function DAQmxAddGlobalChansToTask(taskHandle, channelNames)
    ccall((:DAQmxAddGlobalChansToTask, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channelNames)
end

function DAQmxStartTask(taskHandle)
    ccall((:DAQmxStartTask, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxStopTask(taskHandle)
    ccall((:DAQmxStopTask, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxClearTask(taskHandle)
    ccall((:DAQmxClearTask, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxWaitUntilTaskDone(taskHandle, timeToWait)
    ccall((:DAQmxWaitUntilTaskDone, nidaqmx), int32, (TaskHandle, float64), taskHandle, timeToWait)
end

function DAQmxWaitForValidTimestamp(taskHandle, timestampEvent, timeout, timestamp)
    ccall((:DAQmxWaitForValidTimestamp, nidaqmx), int32, (TaskHandle, int32, float64, Ptr{CVIAbsoluteTime}), taskHandle, timestampEvent, timeout, timestamp)
end

function DAQmxIsTaskDone(taskHandle, isTaskDone)
    ccall((:DAQmxIsTaskDone, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, isTaskDone)
end

function DAQmxTaskControl(taskHandle, action)
    ccall((:DAQmxTaskControl, nidaqmx), int32, (TaskHandle, int32), taskHandle, action)
end

function DAQmxGetNthTaskChannel(taskHandle, index, buffer, bufferSize)
    ccall((:DAQmxGetNthTaskChannel, nidaqmx), int32, (TaskHandle, uInt32, Ptr{UInt8}, int32), taskHandle, index, buffer, bufferSize)
end

function DAQmxGetNthTaskDevice(taskHandle, index, buffer, bufferSize)
    ccall((:DAQmxGetNthTaskDevice, nidaqmx), int32, (TaskHandle, uInt32, Ptr{UInt8}, int32), taskHandle, index, buffer, bufferSize)
end

function DAQmxRegisterEveryNSamplesEvent(task, everyNsamplesEventType, nSamples, options, callbackFunction, callbackData)
    ccall((:DAQmxRegisterEveryNSamplesEvent, nidaqmx), int32, (TaskHandle, int32, uInt32, uInt32, DAQmxEveryNSamplesEventCallbackPtr, Ptr{Cvoid}), task, everyNsamplesEventType, nSamples, options, callbackFunction, callbackData)
end

function DAQmxRegisterDoneEvent(task, options, callbackFunction, callbackData)
    ccall((:DAQmxRegisterDoneEvent, nidaqmx), int32, (TaskHandle, uInt32, DAQmxDoneEventCallbackPtr, Ptr{Cvoid}), task, options, callbackFunction, callbackData)
end

function DAQmxRegisterSignalEvent(task, signalID, options, callbackFunction, callbackData)
    ccall((:DAQmxRegisterSignalEvent, nidaqmx), int32, (TaskHandle, int32, uInt32, DAQmxSignalEventCallbackPtr, Ptr{Cvoid}), task, signalID, options, callbackFunction, callbackData)
end

function DAQmxCreateAIVoltageChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
    ccall((:DAQmxCreateAIVoltageChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32, float64, float64, int32, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
end

function DAQmxCreateAICurrentChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName)
    ccall((:DAQmxCreateAICurrentChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32, float64, float64, int32, int32, float64, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName)
end

function DAQmxCreateAIVoltageRMSChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
    ccall((:DAQmxCreateAIVoltageRMSChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32, float64, float64, int32, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
end

function DAQmxCreateAICurrentRMSChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName)
    ccall((:DAQmxCreateAICurrentRMSChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32, float64, float64, int32, int32, float64, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName)
end

function DAQmxCreateAIThrmcplChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, thermocoupleType, cjcSource, cjcVal, cjcChannel)
    ccall((:DAQmxCreateAIThrmcplChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, int32, float64, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, thermocoupleType, cjcSource, cjcVal, cjcChannel)
end

function DAQmxCreateAIRTDChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, rtdType, resistanceConfig, currentExcitSource, currentExcitVal, r0)
    ccall((:DAQmxCreateAIRTDChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, int32, int32, float64, float64), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, rtdType, resistanceConfig, currentExcitSource, currentExcitVal, r0)
end

function DAQmxCreateAIThrmstrChanIex(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal, a, b, c)
    ccall((:DAQmxCreateAIThrmstrChanIex, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, int32, float64, float64, float64, float64), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal, a, b, c)
end

function DAQmxCreateAIThrmstrChanVex(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, voltageExcitSource, voltageExcitVal, a, b, c, r1)
    ccall((:DAQmxCreateAIThrmstrChanVex, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, int32, float64, float64, float64, float64, float64), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, voltageExcitSource, voltageExcitVal, a, b, c, r1)
end

function DAQmxCreateAIFreqVoltageChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, thresholdLevel, hysteresis, customScaleName)
    ccall((:DAQmxCreateAIFreqVoltageChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, float64, float64, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, thresholdLevel, hysteresis, customScaleName)
end

function DAQmxCreateAIResistanceChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal, customScaleName)
    ccall((:DAQmxCreateAIResistanceChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, int32, float64, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal, customScaleName)
end

function DAQmxCreateAIStrainGageChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, strainConfig, voltageExcitSource, voltageExcitVal, gageFactor, initialBridgeVoltage, nominalGageResistance, poissonRatio, leadWireResistance, customScaleName)
    ccall((:DAQmxCreateAIStrainGageChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, int32, float64, float64, float64, float64, float64, float64, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, strainConfig, voltageExcitSource, voltageExcitVal, gageFactor, initialBridgeVoltage, nominalGageResistance, poissonRatio, leadWireResistance, customScaleName)
end

function DAQmxCreateAIRosetteStrainGageChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, rosetteType, gageOrientation, rosetteMeasTypes, numRosetteMeasTypes, strainConfig, voltageExcitSource, voltageExcitVal, gageFactor, nominalGageResistance, poissonRatio, leadWireResistance)
    ccall((:DAQmxCreateAIRosetteStrainGageChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, float64, Ptr{int32}, uInt32, int32, int32, float64, float64, float64, float64, float64), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, rosetteType, gageOrientation, rosetteMeasTypes, numRosetteMeasTypes, strainConfig, voltageExcitSource, voltageExcitVal, gageFactor, nominalGageResistance, poissonRatio, leadWireResistance)
end

function DAQmxCreateAIForceBridgeTwoPointLinChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, firstElectricalVal, secondElectricalVal, electricalUnits, firstPhysicalVal, secondPhysicalVal, physicalUnits, customScaleName)
    ccall((:DAQmxCreateAIForceBridgeTwoPointLinChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, int32, float64, float64, float64, float64, int32, float64, float64, int32, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, firstElectricalVal, secondElectricalVal, electricalUnits, firstPhysicalVal, secondPhysicalVal, physicalUnits, customScaleName)
end

function DAQmxCreateAIForceBridgeTableChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, electricalVals, numElectricalVals, electricalUnits, physicalVals, numPhysicalVals, physicalUnits, customScaleName)
    ccall((:DAQmxCreateAIForceBridgeTableChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, int32, float64, float64, Ptr{float64}, uInt32, int32, Ptr{float64}, uInt32, int32, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, electricalVals, numElectricalVals, electricalUnits, physicalVals, numPhysicalVals, physicalUnits, customScaleName)
end

function DAQmxCreateAIForceBridgePolynomialChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, forwardCoeffs, numForwardCoeffs, reverseCoeffs, numReverseCoeffs, electricalUnits, physicalUnits, customScaleName)
    ccall((:DAQmxCreateAIForceBridgePolynomialChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, int32, float64, float64, Ptr{float64}, uInt32, Ptr{float64}, uInt32, int32, int32, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, forwardCoeffs, numForwardCoeffs, reverseCoeffs, numReverseCoeffs, electricalUnits, physicalUnits, customScaleName)
end

function DAQmxCreateAIPressureBridgeTwoPointLinChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, firstElectricalVal, secondElectricalVal, electricalUnits, firstPhysicalVal, secondPhysicalVal, physicalUnits, customScaleName)
    ccall((:DAQmxCreateAIPressureBridgeTwoPointLinChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, int32, float64, float64, float64, float64, int32, float64, float64, int32, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, firstElectricalVal, secondElectricalVal, electricalUnits, firstPhysicalVal, secondPhysicalVal, physicalUnits, customScaleName)
end

function DAQmxCreateAIPressureBridgeTableChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, electricalVals, numElectricalVals, electricalUnits, physicalVals, numPhysicalVals, physicalUnits, customScaleName)
    ccall((:DAQmxCreateAIPressureBridgeTableChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, int32, float64, float64, Ptr{float64}, uInt32, int32, Ptr{float64}, uInt32, int32, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, electricalVals, numElectricalVals, electricalUnits, physicalVals, numPhysicalVals, physicalUnits, customScaleName)
end

function DAQmxCreateAIPressureBridgePolynomialChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, forwardCoeffs, numForwardCoeffs, reverseCoeffs, numReverseCoeffs, electricalUnits, physicalUnits, customScaleName)
    ccall((:DAQmxCreateAIPressureBridgePolynomialChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, int32, float64, float64, Ptr{float64}, uInt32, Ptr{float64}, uInt32, int32, int32, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, forwardCoeffs, numForwardCoeffs, reverseCoeffs, numReverseCoeffs, electricalUnits, physicalUnits, customScaleName)
end

function DAQmxCreateAITorqueBridgeTwoPointLinChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, firstElectricalVal, secondElectricalVal, electricalUnits, firstPhysicalVal, secondPhysicalVal, physicalUnits, customScaleName)
    ccall((:DAQmxCreateAITorqueBridgeTwoPointLinChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, int32, float64, float64, float64, float64, int32, float64, float64, int32, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, firstElectricalVal, secondElectricalVal, electricalUnits, firstPhysicalVal, secondPhysicalVal, physicalUnits, customScaleName)
end

function DAQmxCreateAITorqueBridgeTableChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, electricalVals, numElectricalVals, electricalUnits, physicalVals, numPhysicalVals, physicalUnits, customScaleName)
    ccall((:DAQmxCreateAITorqueBridgeTableChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, int32, float64, float64, Ptr{float64}, uInt32, int32, Ptr{float64}, uInt32, int32, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, electricalVals, numElectricalVals, electricalUnits, physicalVals, numPhysicalVals, physicalUnits, customScaleName)
end

function DAQmxCreateAITorqueBridgePolynomialChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, forwardCoeffs, numForwardCoeffs, reverseCoeffs, numReverseCoeffs, electricalUnits, physicalUnits, customScaleName)
    ccall((:DAQmxCreateAITorqueBridgePolynomialChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, int32, float64, float64, Ptr{float64}, uInt32, Ptr{float64}, uInt32, int32, int32, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, forwardCoeffs, numForwardCoeffs, reverseCoeffs, numReverseCoeffs, electricalUnits, physicalUnits, customScaleName)
end

function DAQmxCreateAIBridgeChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, customScaleName)
    ccall((:DAQmxCreateAIBridgeChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, int32, float64, float64, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, nominalBridgeResistance, customScaleName)
end

function DAQmxCreateAIVoltageChanWithExcit(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, useExcitForScaling, customScaleName)
    ccall((:DAQmxCreateAIVoltageChanWithExcit, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32, float64, float64, int32, int32, int32, float64, bool32, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, bridgeConfig, voltageExcitSource, voltageExcitVal, useExcitForScaling, customScaleName)
end

function DAQmxCreateAITempBuiltInSensorChan(taskHandle, physicalChannel, nameToAssignToChannel, units)
    ccall((:DAQmxCreateAITempBuiltInSensorChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32), taskHandle, physicalChannel, nameToAssignToChannel, units)
end

function DAQmxCreateAIAccelChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, currentExcitSource, currentExcitVal, customScaleName)
    ccall((:DAQmxCreateAIAccelChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32, float64, float64, int32, float64, int32, int32, float64, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, currentExcitSource, currentExcitVal, customScaleName)
end

function DAQmxCreateAIVelocityIEPEChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, currentExcitSource, currentExcitVal, customScaleName)
    ccall((:DAQmxCreateAIVelocityIEPEChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32, float64, float64, int32, float64, int32, int32, float64, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, currentExcitSource, currentExcitVal, customScaleName)
end

function DAQmxCreateAIForceIEPEChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, currentExcitSource, currentExcitVal, customScaleName)
    ccall((:DAQmxCreateAIForceIEPEChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32, float64, float64, int32, float64, int32, int32, float64, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, currentExcitSource, currentExcitVal, customScaleName)
end

function DAQmxCreateAIMicrophoneChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, units, micSensitivity, maxSndPressLevel, currentExcitSource, currentExcitVal, customScaleName)
    ccall((:DAQmxCreateAIMicrophoneChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32, int32, float64, float64, int32, float64, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, units, micSensitivity, maxSndPressLevel, currentExcitSource, currentExcitVal, customScaleName)
end

function DAQmxCreateAIChargeChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
    ccall((:DAQmxCreateAIChargeChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32, float64, float64, int32, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
end

function DAQmxCreateAIAccelChargeChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, customScaleName)
    ccall((:DAQmxCreateAIAccelChargeChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32, float64, float64, int32, float64, int32, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, customScaleName)
end

function DAQmxCreateAIAccel4WireDCVoltageChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, voltageExcitSource, voltageExcitVal, useExcitForScaling, customScaleName)
    ccall((:DAQmxCreateAIAccel4WireDCVoltageChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32, float64, float64, int32, float64, int32, int32, float64, bool32, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, sensitivity, sensitivityUnits, voltageExcitSource, voltageExcitVal, useExcitForScaling, customScaleName)
end

function DAQmxCreateAIPosLVDTChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, sensitivity, sensitivityUnits, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
    ccall((:DAQmxCreateAIPosLVDTChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, float64, int32, int32, float64, float64, int32, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, sensitivity, sensitivityUnits, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
end

function DAQmxCreateAIPosRVDTChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, sensitivity, sensitivityUnits, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
    ccall((:DAQmxCreateAIPosRVDTChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, float64, int32, int32, float64, float64, int32, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, sensitivity, sensitivityUnits, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
end

function DAQmxCreateAIPosEddyCurrProxProbeChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, sensitivity, sensitivityUnits, customScaleName)
    ccall((:DAQmxCreateAIPosEddyCurrProxProbeChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, float64, int32, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, sensitivity, sensitivityUnits, customScaleName)
end

function DAQmxCreateAIDeviceTempChan(taskHandle, physicalChannel, nameToAssignToChannel, units)
    ccall((:DAQmxCreateAIDeviceTempChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32), taskHandle, physicalChannel, nameToAssignToChannel, units)
end

function DAQmxCreateTEDSAIVoltageChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
    ccall((:DAQmxCreateTEDSAIVoltageChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32, float64, float64, int32, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, customScaleName)
end

function DAQmxCreateTEDSAICurrentChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName)
    ccall((:DAQmxCreateTEDSAICurrentChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32, float64, float64, int32, int32, float64, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, shuntResistorLoc, extShuntResistorVal, customScaleName)
end

function DAQmxCreateTEDSAIThrmcplChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, cjcSource, cjcVal, cjcChannel)
    ccall((:DAQmxCreateTEDSAIThrmcplChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, float64, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, cjcSource, cjcVal, cjcChannel)
end

function DAQmxCreateTEDSAIRTDChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal)
    ccall((:DAQmxCreateTEDSAIRTDChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, int32, float64), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal)
end

function DAQmxCreateTEDSAIThrmstrChanIex(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal)
    ccall((:DAQmxCreateTEDSAIThrmstrChanIex, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, int32, float64), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal)
end

function DAQmxCreateTEDSAIThrmstrChanVex(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, voltageExcitSource, voltageExcitVal, r1)
    ccall((:DAQmxCreateTEDSAIThrmstrChanVex, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, int32, float64, float64), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, voltageExcitSource, voltageExcitVal, r1)
end

function DAQmxCreateTEDSAIResistanceChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal, customScaleName)
    ccall((:DAQmxCreateTEDSAIResistanceChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, int32, float64, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, resistanceConfig, currentExcitSource, currentExcitVal, customScaleName)
end

function DAQmxCreateTEDSAIStrainGageChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, initialBridgeVoltage, leadWireResistance, customScaleName)
    ccall((:DAQmxCreateTEDSAIStrainGageChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, float64, float64, float64, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, initialBridgeVoltage, leadWireResistance, customScaleName)
end

function DAQmxCreateTEDSAIForceBridgeChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
    ccall((:DAQmxCreateTEDSAIForceBridgeChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, float64, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
end

function DAQmxCreateTEDSAIPressureBridgeChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
    ccall((:DAQmxCreateTEDSAIPressureBridgeChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, float64, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
end

function DAQmxCreateTEDSAITorqueBridgeChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
    ccall((:DAQmxCreateTEDSAITorqueBridgeChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, float64, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
end

function DAQmxCreateTEDSAIBridgeChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
    ccall((:DAQmxCreateTEDSAIBridgeChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, float64, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
end

function DAQmxCreateTEDSAIVoltageChanWithExcit(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
    ccall((:DAQmxCreateTEDSAIVoltageChanWithExcit, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32, float64, float64, int32, int32, float64, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, customScaleName)
end

function DAQmxCreateTEDSAIAccelChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, currentExcitSource, currentExcitVal, customScaleName)
    ccall((:DAQmxCreateTEDSAIAccelChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32, float64, float64, int32, int32, float64, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, currentExcitSource, currentExcitVal, customScaleName)
end

function DAQmxCreateTEDSAIForceIEPEChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, currentExcitSource, currentExcitVal, customScaleName)
    ccall((:DAQmxCreateTEDSAIForceIEPEChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32, float64, float64, int32, int32, float64, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, minVal, maxVal, units, currentExcitSource, currentExcitVal, customScaleName)
end

function DAQmxCreateTEDSAIMicrophoneChan(taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, units, maxSndPressLevel, currentExcitSource, currentExcitVal, customScaleName)
    ccall((:DAQmxCreateTEDSAIMicrophoneChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32, int32, float64, int32, float64, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, terminalConfig, units, maxSndPressLevel, currentExcitSource, currentExcitVal, customScaleName)
end

function DAQmxCreateTEDSAIPosLVDTChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
    ccall((:DAQmxCreateTEDSAIPosLVDTChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, float64, float64, int32, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
end

function DAQmxCreateTEDSAIPosRVDTChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
    ccall((:DAQmxCreateTEDSAIPosRVDTChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, float64, float64, int32, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, voltageExcitSource, voltageExcitVal, voltageExcitFreq, ACExcitWireMode, customScaleName)
end

function DAQmxCreateAOVoltageChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, customScaleName)
    ccall((:DAQmxCreateAOVoltageChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, customScaleName)
end

function DAQmxCreateAOCurrentChan(taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, customScaleName)
    ccall((:DAQmxCreateAOCurrentChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, Ptr{UInt8}), taskHandle, physicalChannel, nameToAssignToChannel, minVal, maxVal, units, customScaleName)
end

function DAQmxCreateAOFuncGenChan(taskHandle, physicalChannel, nameToAssignToChannel, type, freq, amplitude, offset)
    ccall((:DAQmxCreateAOFuncGenChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32, float64, float64, float64), taskHandle, physicalChannel, nameToAssignToChannel, type, freq, amplitude, offset)
end

function DAQmxCreateDIChan(taskHandle, lines, nameToAssignToLines, lineGrouping)
    ccall((:DAQmxCreateDIChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32), taskHandle, lines, nameToAssignToLines, lineGrouping)
end

function DAQmxCreateDOChan(taskHandle, lines, nameToAssignToLines, lineGrouping)
    ccall((:DAQmxCreateDOChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32), taskHandle, lines, nameToAssignToLines, lineGrouping)
end

function DAQmxCreateCIFreqChan(taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, edge, measMethod, measTime, divisor, customScaleName)
    ccall((:DAQmxCreateCIFreqChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, int32, float64, uInt32, Ptr{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, edge, measMethod, measTime, divisor, customScaleName)
end

function DAQmxCreateCIPeriodChan(taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, edge, measMethod, measTime, divisor, customScaleName)
    ccall((:DAQmxCreateCIPeriodChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, int32, float64, uInt32, Ptr{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, edge, measMethod, measTime, divisor, customScaleName)
end

function DAQmxCreateCICountEdgesChan(taskHandle, counter, nameToAssignToChannel, edge, initialCount, countDirection)
    ccall((:DAQmxCreateCICountEdgesChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32, uInt32, int32), taskHandle, counter, nameToAssignToChannel, edge, initialCount, countDirection)
end

function DAQmxCreateCIDutyCycleChan(taskHandle, counter, nameToAssignToChannel, minFreq, maxFreq, edge, customScaleName)
    ccall((:DAQmxCreateCIDutyCycleChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, Ptr{UInt8}), taskHandle, counter, nameToAssignToChannel, minFreq, maxFreq, edge, customScaleName)
end

function DAQmxCreateCIPulseWidthChan(taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, startingEdge, customScaleName)
    ccall((:DAQmxCreateCIPulseWidthChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, Ptr{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, startingEdge, customScaleName)
end

function DAQmxCreateCISemiPeriodChan(taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, customScaleName)
    ccall((:DAQmxCreateCISemiPeriodChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, Ptr{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, customScaleName)
end

function DAQmxCreateCITwoEdgeSepChan(taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, firstEdge, secondEdge, customScaleName)
    ccall((:DAQmxCreateCITwoEdgeSepChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, int32, Ptr{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units, firstEdge, secondEdge, customScaleName)
end

function DAQmxCreateCIPulseChanFreq(taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units)
    ccall((:DAQmxCreateCIPulseChanFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units)
end

function DAQmxCreateCIPulseChanTime(taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units)
    ccall((:DAQmxCreateCIPulseChanTime, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, units)
end

function DAQmxCreateCIPulseChanTicks(taskHandle, counter, nameToAssignToChannel, sourceTerminal, minVal, maxVal)
    ccall((:DAQmxCreateCIPulseChanTicks, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, Ptr{UInt8}, float64, float64), taskHandle, counter, nameToAssignToChannel, sourceTerminal, minVal, maxVal)
end

function DAQmxCreateCILinEncoderChan(taskHandle, counter, nameToAssignToChannel, decodingType, ZidxEnable, ZidxVal, ZidxPhase, units, distPerPulse, initialPos, customScaleName)
    ccall((:DAQmxCreateCILinEncoderChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32, bool32, float64, int32, int32, float64, float64, Ptr{UInt8}), taskHandle, counter, nameToAssignToChannel, decodingType, ZidxEnable, ZidxVal, ZidxPhase, units, distPerPulse, initialPos, customScaleName)
end

function DAQmxCreateCIAngEncoderChan(taskHandle, counter, nameToAssignToChannel, decodingType, ZidxEnable, ZidxVal, ZidxPhase, units, pulsesPerRev, initialAngle, customScaleName)
    ccall((:DAQmxCreateCIAngEncoderChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32, bool32, float64, int32, int32, uInt32, float64, Ptr{UInt8}), taskHandle, counter, nameToAssignToChannel, decodingType, ZidxEnable, ZidxVal, ZidxPhase, units, pulsesPerRev, initialAngle, customScaleName)
end

function DAQmxCreateCILinVelocityChan(taskHandle, counter, nameToAssignToChannel, minVal, maxVal, decodingType, units, distPerPulse, customScaleName)
    ccall((:DAQmxCreateCILinVelocityChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, float64, Ptr{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, decodingType, units, distPerPulse, customScaleName)
end

function DAQmxCreateCIAngVelocityChan(taskHandle, counter, nameToAssignToChannel, minVal, maxVal, decodingType, units, pulsesPerRev, customScaleName)
    ccall((:DAQmxCreateCIAngVelocityChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, float64, float64, int32, int32, uInt32, Ptr{UInt8}), taskHandle, counter, nameToAssignToChannel, minVal, maxVal, decodingType, units, pulsesPerRev, customScaleName)
end

function DAQmxCreateCIGPSTimestampChan(taskHandle, counter, nameToAssignToChannel, units, syncMethod, customScaleName)
    ccall((:DAQmxCreateCIGPSTimestampChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32, int32, Ptr{UInt8}), taskHandle, counter, nameToAssignToChannel, units, syncMethod, customScaleName)
end

function DAQmxCreateCOPulseChanFreq(taskHandle, counter, nameToAssignToChannel, units, idleState, initialDelay, freq, dutyCycle)
    ccall((:DAQmxCreateCOPulseChanFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32, int32, float64, float64, float64), taskHandle, counter, nameToAssignToChannel, units, idleState, initialDelay, freq, dutyCycle)
end

function DAQmxCreateCOPulseChanTime(taskHandle, counter, nameToAssignToChannel, units, idleState, initialDelay, lowTime, highTime)
    ccall((:DAQmxCreateCOPulseChanTime, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32, int32, float64, float64, float64), taskHandle, counter, nameToAssignToChannel, units, idleState, initialDelay, lowTime, highTime)
end

function DAQmxCreateCOPulseChanTicks(taskHandle, counter, nameToAssignToChannel, sourceTerminal, idleState, initialDelay, lowTicks, highTicks)
    ccall((:DAQmxCreateCOPulseChanTicks, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, Ptr{UInt8}, int32, int32, int32, int32), taskHandle, counter, nameToAssignToChannel, sourceTerminal, idleState, initialDelay, lowTicks, highTicks)
end

function DAQmxGetAIChanCalCalDate(taskHandle, channelName, year, month, day, hour, minute)
    ccall((:DAQmxGetAIChanCalCalDate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}, Ptr{uInt32}, Ptr{uInt32}, Ptr{uInt32}, Ptr{uInt32}), taskHandle, channelName, year, month, day, hour, minute)
end

function DAQmxSetAIChanCalCalDate(taskHandle, channelName, year, month, day, hour, minute)
    ccall((:DAQmxSetAIChanCalCalDate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32, uInt32, uInt32, uInt32, uInt32), taskHandle, channelName, year, month, day, hour, minute)
end

function DAQmxGetAIChanCalExpDate(taskHandle, channelName, year, month, day, hour, minute)
    ccall((:DAQmxGetAIChanCalExpDate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}, Ptr{uInt32}, Ptr{uInt32}, Ptr{uInt32}, Ptr{uInt32}), taskHandle, channelName, year, month, day, hour, minute)
end

function DAQmxSetAIChanCalExpDate(taskHandle, channelName, year, month, day, hour, minute)
    ccall((:DAQmxSetAIChanCalExpDate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32, uInt32, uInt32, uInt32, uInt32), taskHandle, channelName, year, month, day, hour, minute)
end

function DAQmxResetChanAttribute(taskHandle, channel, attribute)
    ccall((:DAQmxResetChanAttribute, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, attribute)
end

function DAQmxCfgSampClkTiming(taskHandle, source, rate, activeEdge, sampleMode, sampsPerChan)
    ccall((:DAQmxCfgSampClkTiming, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64, int32, int32, uInt64), taskHandle, source, rate, activeEdge, sampleMode, sampsPerChan)
end

function DAQmxCfgHandshakingTiming(taskHandle, sampleMode, sampsPerChan)
    ccall((:DAQmxCfgHandshakingTiming, nidaqmx), int32, (TaskHandle, int32, uInt64), taskHandle, sampleMode, sampsPerChan)
end

function DAQmxCfgBurstHandshakingTimingImportClock(taskHandle, sampleMode, sampsPerChan, sampleClkRate, sampleClkSrc, sampleClkActiveEdge, pauseWhen, readyEventActiveLevel)
    ccall((:DAQmxCfgBurstHandshakingTimingImportClock, nidaqmx), int32, (TaskHandle, int32, uInt64, float64, Ptr{UInt8}, int32, int32, int32), taskHandle, sampleMode, sampsPerChan, sampleClkRate, sampleClkSrc, sampleClkActiveEdge, pauseWhen, readyEventActiveLevel)
end

function DAQmxCfgBurstHandshakingTimingExportClock(taskHandle, sampleMode, sampsPerChan, sampleClkRate, sampleClkOutpTerm, sampleClkPulsePolarity, pauseWhen, readyEventActiveLevel)
    ccall((:DAQmxCfgBurstHandshakingTimingExportClock, nidaqmx), int32, (TaskHandle, int32, uInt64, float64, Ptr{UInt8}, int32, int32, int32), taskHandle, sampleMode, sampsPerChan, sampleClkRate, sampleClkOutpTerm, sampleClkPulsePolarity, pauseWhen, readyEventActiveLevel)
end

function DAQmxCfgChangeDetectionTiming(taskHandle, risingEdgeChan, fallingEdgeChan, sampleMode, sampsPerChan)
    ccall((:DAQmxCfgChangeDetectionTiming, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32, uInt64), taskHandle, risingEdgeChan, fallingEdgeChan, sampleMode, sampsPerChan)
end

function DAQmxCfgImplicitTiming(taskHandle, sampleMode, sampsPerChan)
    ccall((:DAQmxCfgImplicitTiming, nidaqmx), int32, (TaskHandle, int32, uInt64), taskHandle, sampleMode, sampsPerChan)
end

function DAQmxCfgPipelinedSampClkTiming(taskHandle, source, rate, activeEdge, sampleMode, sampsPerChan)
    ccall((:DAQmxCfgPipelinedSampClkTiming, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64, int32, int32, uInt64), taskHandle, source, rate, activeEdge, sampleMode, sampsPerChan)
end

function DAQmxResetTimingAttribute(taskHandle, attribute)
    ccall((:DAQmxResetTimingAttribute, nidaqmx), int32, (TaskHandle, int32), taskHandle, attribute)
end

function DAQmxResetTimingAttributeEx(taskHandle, deviceNames, attribute)
    ccall((:DAQmxResetTimingAttributeEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, deviceNames, attribute)
end

function DAQmxDisableStartTrig(taskHandle)
    ccall((:DAQmxDisableStartTrig, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxCfgDigEdgeStartTrig(taskHandle, triggerSource, triggerEdge)
    ccall((:DAQmxCfgDigEdgeStartTrig, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, triggerSource, triggerEdge)
end

function DAQmxCfgAnlgEdgeStartTrig(taskHandle, triggerSource, triggerSlope, triggerLevel)
    ccall((:DAQmxCfgAnlgEdgeStartTrig, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32, float64), taskHandle, triggerSource, triggerSlope, triggerLevel)
end

function DAQmxCfgAnlgMultiEdgeStartTrig(taskHandle, triggerSources, triggerSlopeArray, triggerLevelArray, arraySize)
    ccall((:DAQmxCfgAnlgMultiEdgeStartTrig, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}, Ptr{float64}, uInt32), taskHandle, triggerSources, triggerSlopeArray, triggerLevelArray, arraySize)
end

function DAQmxCfgAnlgWindowStartTrig(taskHandle, triggerSource, triggerWhen, windowTop, windowBottom)
    ccall((:DAQmxCfgAnlgWindowStartTrig, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32, float64, float64), taskHandle, triggerSource, triggerWhen, windowTop, windowBottom)
end

function DAQmxCfgTimeStartTrig(taskHandle, when, timescale)
    ccall((:DAQmxCfgTimeStartTrig, nidaqmx), int32, (TaskHandle, CVIAbsoluteTime, int32), taskHandle, when, timescale)
end

function DAQmxCfgDigPatternStartTrig(taskHandle, triggerSource, triggerPattern, triggerWhen)
    ccall((:DAQmxCfgDigPatternStartTrig, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32), taskHandle, triggerSource, triggerPattern, triggerWhen)
end

function DAQmxDisableRefTrig(taskHandle)
    ccall((:DAQmxDisableRefTrig, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxCfgDigEdgeRefTrig(taskHandle, triggerSource, triggerEdge, pretriggerSamples)
    ccall((:DAQmxCfgDigEdgeRefTrig, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32, uInt32), taskHandle, triggerSource, triggerEdge, pretriggerSamples)
end

function DAQmxCfgAnlgEdgeRefTrig(taskHandle, triggerSource, triggerSlope, triggerLevel, pretriggerSamples)
    ccall((:DAQmxCfgAnlgEdgeRefTrig, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32, float64, uInt32), taskHandle, triggerSource, triggerSlope, triggerLevel, pretriggerSamples)
end

function DAQmxCfgAnlgMultiEdgeRefTrig(taskHandle, triggerSources, triggerSlopeArray, triggerLevelArray, pretriggerSamples, arraySize)
    ccall((:DAQmxCfgAnlgMultiEdgeRefTrig, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}, Ptr{float64}, uInt32, uInt32), taskHandle, triggerSources, triggerSlopeArray, triggerLevelArray, pretriggerSamples, arraySize)
end

function DAQmxCfgAnlgWindowRefTrig(taskHandle, triggerSource, triggerWhen, windowTop, windowBottom, pretriggerSamples)
    ccall((:DAQmxCfgAnlgWindowRefTrig, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32, float64, float64, uInt32), taskHandle, triggerSource, triggerWhen, windowTop, windowBottom, pretriggerSamples)
end

function DAQmxCfgDigPatternRefTrig(taskHandle, triggerSource, triggerPattern, triggerWhen, pretriggerSamples)
    ccall((:DAQmxCfgDigPatternRefTrig, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, int32, uInt32), taskHandle, triggerSource, triggerPattern, triggerWhen, pretriggerSamples)
end

function DAQmxResetTrigAttribute(taskHandle, attribute)
    ccall((:DAQmxResetTrigAttribute, nidaqmx), int32, (TaskHandle, int32), taskHandle, attribute)
end

function DAQmxReadAnalogF64(taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadAnalogF64, nidaqmx), int32, (TaskHandle, int32, float64, bool32, Ptr{float64}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadAnalogScalarF64(taskHandle, timeout, value, reserved)
    ccall((:DAQmxReadAnalogScalarF64, nidaqmx), int32, (TaskHandle, float64, Ptr{float64}, Ptr{bool32}), taskHandle, timeout, value, reserved)
end

function DAQmxReadBinaryI16(taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadBinaryI16, nidaqmx), int32, (TaskHandle, int32, float64, bool32, Ptr{int16}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadBinaryU16(taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadBinaryU16, nidaqmx), int32, (TaskHandle, int32, float64, bool32, Ptr{uInt16}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadBinaryI32(taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadBinaryI32, nidaqmx), int32, (TaskHandle, int32, float64, bool32, Ptr{int32}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadBinaryU32(taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadBinaryU32, nidaqmx), int32, (TaskHandle, int32, float64, bool32, Ptr{uInt32}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadDigitalU8(taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadDigitalU8, nidaqmx), int32, (TaskHandle, int32, float64, bool32, Ptr{uInt8}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadDigitalU16(taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadDigitalU16, nidaqmx), int32, (TaskHandle, int32, float64, bool32, Ptr{uInt16}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadDigitalU32(taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadDigitalU32, nidaqmx), int32, (TaskHandle, int32, float64, bool32, Ptr{uInt32}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadDigitalScalarU32(taskHandle, timeout, value, reserved)
    ccall((:DAQmxReadDigitalScalarU32, nidaqmx), int32, (TaskHandle, float64, Ptr{uInt32}, Ptr{bool32}), taskHandle, timeout, value, reserved)
end

function DAQmxReadDigitalLines(taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInBytes, sampsPerChanRead, numBytesPerSamp, reserved)
    ccall((:DAQmxReadDigitalLines, nidaqmx), int32, (TaskHandle, int32, float64, bool32, Ptr{uInt8}, uInt32, Ptr{int32}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInBytes, sampsPerChanRead, numBytesPerSamp, reserved)
end

function DAQmxReadCounterF64(taskHandle, numSampsPerChan, timeout, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadCounterF64, nidaqmx), int32, (TaskHandle, int32, float64, Ptr{float64}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadCounterU32(taskHandle, numSampsPerChan, timeout, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadCounterU32, nidaqmx), int32, (TaskHandle, int32, float64, Ptr{uInt32}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadCounterF64Ex(taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadCounterF64Ex, nidaqmx), int32, (TaskHandle, int32, float64, bool32, Ptr{float64}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadCounterU32Ex(taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadCounterU32Ex, nidaqmx), int32, (TaskHandle, int32, float64, bool32, Ptr{uInt32}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, fillMode, readArray, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadCounterScalarF64(taskHandle, timeout, value, reserved)
    ccall((:DAQmxReadCounterScalarF64, nidaqmx), int32, (TaskHandle, float64, Ptr{float64}, Ptr{bool32}), taskHandle, timeout, value, reserved)
end

function DAQmxReadCounterScalarU32(taskHandle, timeout, value, reserved)
    ccall((:DAQmxReadCounterScalarU32, nidaqmx), int32, (TaskHandle, float64, Ptr{uInt32}, Ptr{bool32}), taskHandle, timeout, value, reserved)
end

function DAQmxReadCtrFreq(taskHandle, numSampsPerChan, timeout, interleaved, readArrayFrequency, readArrayDutyCycle, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadCtrFreq, nidaqmx), int32, (TaskHandle, int32, float64, bool32, Ptr{float64}, Ptr{float64}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, interleaved, readArrayFrequency, readArrayDutyCycle, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadCtrTime(taskHandle, numSampsPerChan, timeout, interleaved, readArrayHighTime, readArrayLowTime, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadCtrTime, nidaqmx), int32, (TaskHandle, int32, float64, bool32, Ptr{float64}, Ptr{float64}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, interleaved, readArrayHighTime, readArrayLowTime, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadCtrTicks(taskHandle, numSampsPerChan, timeout, interleaved, readArrayHighTicks, readArrayLowTicks, arraySizeInSamps, sampsPerChanRead, reserved)
    ccall((:DAQmxReadCtrTicks, nidaqmx), int32, (TaskHandle, int32, float64, bool32, Ptr{uInt32}, Ptr{uInt32}, uInt32, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, interleaved, readArrayHighTicks, readArrayLowTicks, arraySizeInSamps, sampsPerChanRead, reserved)
end

function DAQmxReadCtrFreqScalar(taskHandle, timeout, frequency, dutyCycle, reserved)
    ccall((:DAQmxReadCtrFreqScalar, nidaqmx), int32, (TaskHandle, float64, Ptr{float64}, Ptr{float64}, Ptr{bool32}), taskHandle, timeout, frequency, dutyCycle, reserved)
end

function DAQmxReadCtrTimeScalar(taskHandle, timeout, highTime, lowTime, reserved)
    ccall((:DAQmxReadCtrTimeScalar, nidaqmx), int32, (TaskHandle, float64, Ptr{float64}, Ptr{float64}, Ptr{bool32}), taskHandle, timeout, highTime, lowTime, reserved)
end

function DAQmxReadCtrTicksScalar(taskHandle, timeout, highTicks, lowTicks, reserved)
    ccall((:DAQmxReadCtrTicksScalar, nidaqmx), int32, (TaskHandle, float64, Ptr{uInt32}, Ptr{uInt32}, Ptr{bool32}), taskHandle, timeout, highTicks, lowTicks, reserved)
end

function DAQmxReadRaw(taskHandle, numSampsPerChan, timeout, readArray, arraySizeInBytes, sampsRead, numBytesPerSamp, reserved)
    ccall((:DAQmxReadRaw, nidaqmx), int32, (TaskHandle, int32, float64, Ptr{Cvoid}, uInt32, Ptr{int32}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, timeout, readArray, arraySizeInBytes, sampsRead, numBytesPerSamp, reserved)
end

function DAQmxGetNthTaskReadChannel(taskHandle, index, buffer, bufferSize)
    ccall((:DAQmxGetNthTaskReadChannel, nidaqmx), int32, (TaskHandle, uInt32, Ptr{UInt8}, int32), taskHandle, index, buffer, bufferSize)
end

function DAQmxResetReadAttribute(taskHandle, attribute)
    ccall((:DAQmxResetReadAttribute, nidaqmx), int32, (TaskHandle, int32), taskHandle, attribute)
end

function DAQmxConfigureLogging(taskHandle, filePath, loggingMode, groupName, operation)
    ccall((:DAQmxConfigureLogging, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32, Ptr{UInt8}, int32), taskHandle, filePath, loggingMode, groupName, operation)
end

function DAQmxStartNewFile(taskHandle, filePath)
    ccall((:DAQmxStartNewFile, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, filePath)
end

function DAQmxWriteAnalogF64(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
    ccall((:DAQmxWriteAnalogF64, nidaqmx), int32, (TaskHandle, int32, bool32, float64, bool32, Ptr{float64}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function DAQmxWriteAnalogScalarF64(taskHandle, autoStart, timeout, value, reserved)
    ccall((:DAQmxWriteAnalogScalarF64, nidaqmx), int32, (TaskHandle, bool32, float64, float64, Ptr{bool32}), taskHandle, autoStart, timeout, value, reserved)
end

function DAQmxWriteBinaryI16(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
    ccall((:DAQmxWriteBinaryI16, nidaqmx), int32, (TaskHandle, int32, bool32, float64, bool32, Ptr{int16}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function DAQmxWriteBinaryU16(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
    ccall((:DAQmxWriteBinaryU16, nidaqmx), int32, (TaskHandle, int32, bool32, float64, bool32, Ptr{uInt16}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function DAQmxWriteBinaryI32(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
    ccall((:DAQmxWriteBinaryI32, nidaqmx), int32, (TaskHandle, int32, bool32, float64, bool32, Ptr{int32}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function DAQmxWriteBinaryU32(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
    ccall((:DAQmxWriteBinaryU32, nidaqmx), int32, (TaskHandle, int32, bool32, float64, bool32, Ptr{uInt32}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function DAQmxWriteDigitalU8(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
    ccall((:DAQmxWriteDigitalU8, nidaqmx), int32, (TaskHandle, int32, bool32, float64, bool32, Ptr{uInt8}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function DAQmxWriteDigitalU16(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
    ccall((:DAQmxWriteDigitalU16, nidaqmx), int32, (TaskHandle, int32, bool32, float64, bool32, Ptr{uInt16}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function DAQmxWriteDigitalU32(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
    ccall((:DAQmxWriteDigitalU32, nidaqmx), int32, (TaskHandle, int32, bool32, float64, bool32, Ptr{uInt32}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function DAQmxWriteDigitalScalarU32(taskHandle, autoStart, timeout, value, reserved)
    ccall((:DAQmxWriteDigitalScalarU32, nidaqmx), int32, (TaskHandle, bool32, float64, uInt32, Ptr{bool32}), taskHandle, autoStart, timeout, value, reserved)
end

function DAQmxWriteDigitalLines(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
    ccall((:DAQmxWriteDigitalLines, nidaqmx), int32, (TaskHandle, int32, bool32, float64, bool32, Ptr{uInt8}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, writeArray, sampsPerChanWritten, reserved)
end

function DAQmxWriteCtrFreq(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, frequency, dutyCycle, numSampsPerChanWritten, reserved)
    ccall((:DAQmxWriteCtrFreq, nidaqmx), int32, (TaskHandle, int32, bool32, float64, bool32, Ptr{float64}, Ptr{float64}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, frequency, dutyCycle, numSampsPerChanWritten, reserved)
end

function DAQmxWriteCtrFreqScalar(taskHandle, autoStart, timeout, frequency, dutyCycle, reserved)
    ccall((:DAQmxWriteCtrFreqScalar, nidaqmx), int32, (TaskHandle, bool32, float64, float64, float64, Ptr{bool32}), taskHandle, autoStart, timeout, frequency, dutyCycle, reserved)
end

function DAQmxWriteCtrTime(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, highTime, lowTime, numSampsPerChanWritten, reserved)
    ccall((:DAQmxWriteCtrTime, nidaqmx), int32, (TaskHandle, int32, bool32, float64, bool32, Ptr{float64}, Ptr{float64}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, highTime, lowTime, numSampsPerChanWritten, reserved)
end

function DAQmxWriteCtrTimeScalar(taskHandle, autoStart, timeout, highTime, lowTime, reserved)
    ccall((:DAQmxWriteCtrTimeScalar, nidaqmx), int32, (TaskHandle, bool32, float64, float64, float64, Ptr{bool32}), taskHandle, autoStart, timeout, highTime, lowTime, reserved)
end

function DAQmxWriteCtrTicks(taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, highTicks, lowTicks, numSampsPerChanWritten, reserved)
    ccall((:DAQmxWriteCtrTicks, nidaqmx), int32, (TaskHandle, int32, bool32, float64, bool32, Ptr{uInt32}, Ptr{uInt32}, Ptr{int32}, Ptr{bool32}), taskHandle, numSampsPerChan, autoStart, timeout, dataLayout, highTicks, lowTicks, numSampsPerChanWritten, reserved)
end

function DAQmxWriteCtrTicksScalar(taskHandle, autoStart, timeout, highTicks, lowTicks, reserved)
    ccall((:DAQmxWriteCtrTicksScalar, nidaqmx), int32, (TaskHandle, bool32, float64, uInt32, uInt32, Ptr{bool32}), taskHandle, autoStart, timeout, highTicks, lowTicks, reserved)
end

function DAQmxWriteRaw(taskHandle, numSamps, autoStart, timeout, writeArray, sampsPerChanWritten, reserved)
    ccall((:DAQmxWriteRaw, nidaqmx), int32, (TaskHandle, int32, bool32, float64, Ptr{Cvoid}, Ptr{int32}, Ptr{bool32}), taskHandle, numSamps, autoStart, timeout, writeArray, sampsPerChanWritten, reserved)
end

function DAQmxResetWriteAttribute(taskHandle, attribute)
    ccall((:DAQmxResetWriteAttribute, nidaqmx), int32, (TaskHandle, int32), taskHandle, attribute)
end

function DAQmxExportSignal(taskHandle, signalID, outputTerminal)
    ccall((:DAQmxExportSignal, nidaqmx), int32, (TaskHandle, int32, Ptr{UInt8}), taskHandle, signalID, outputTerminal)
end

function DAQmxResetExportedSignalAttribute(taskHandle, attribute)
    ccall((:DAQmxResetExportedSignalAttribute, nidaqmx), int32, (TaskHandle, int32), taskHandle, attribute)
end

function DAQmxCreateLinScale(name, slope, yIntercept, preScaledUnits, scaledUnits)
    ccall((:DAQmxCreateLinScale, nidaqmx), int32, (Ptr{UInt8}, float64, float64, int32, Ptr{UInt8}), name, slope, yIntercept, preScaledUnits, scaledUnits)
end

function DAQmxCreateMapScale(name, prescaledMin, prescaledMax, scaledMin, scaledMax, preScaledUnits, scaledUnits)
    ccall((:DAQmxCreateMapScale, nidaqmx), int32, (Ptr{UInt8}, float64, float64, float64, float64, int32, Ptr{UInt8}), name, prescaledMin, prescaledMax, scaledMin, scaledMax, preScaledUnits, scaledUnits)
end

function DAQmxCreatePolynomialScale(name, forwardCoeffs, numForwardCoeffsIn, reverseCoeffs, numReverseCoeffsIn, preScaledUnits, scaledUnits)
    ccall((:DAQmxCreatePolynomialScale, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32, Ptr{float64}, uInt32, int32, Ptr{UInt8}), name, forwardCoeffs, numForwardCoeffsIn, reverseCoeffs, numReverseCoeffsIn, preScaledUnits, scaledUnits)
end

function DAQmxCreateTableScale(name, prescaledVals, numPrescaledValsIn, scaledVals, numScaledValsIn, preScaledUnits, scaledUnits)
    ccall((:DAQmxCreateTableScale, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32, Ptr{float64}, uInt32, int32, Ptr{UInt8}), name, prescaledVals, numPrescaledValsIn, scaledVals, numScaledValsIn, preScaledUnits, scaledUnits)
end

function DAQmxCalculateReversePolyCoeff(forwardCoeffs, numForwardCoeffsIn, minValX, maxValX, numPointsToCompute, reversePolyOrder, reverseCoeffs)
    ccall((:DAQmxCalculateReversePolyCoeff, nidaqmx), int32, (Ptr{float64}, uInt32, float64, float64, int32, int32, Ptr{float64}), forwardCoeffs, numForwardCoeffsIn, minValX, maxValX, numPointsToCompute, reversePolyOrder, reverseCoeffs)
end

function DAQmxCfgInputBuffer(taskHandle, numSampsPerChan)
    ccall((:DAQmxCfgInputBuffer, nidaqmx), int32, (TaskHandle, uInt32), taskHandle, numSampsPerChan)
end

function DAQmxCfgOutputBuffer(taskHandle, numSampsPerChan)
    ccall((:DAQmxCfgOutputBuffer, nidaqmx), int32, (TaskHandle, uInt32), taskHandle, numSampsPerChan)
end

function DAQmxGetBufferAttribute(taskHandle, attribute, value)
    ccall((:DAQmxGetBufferAttribute, nidaqmx), int32, (TaskHandle, int32, Ptr{Cvoid}), taskHandle, attribute, value)
end

function DAQmxResetBufferAttribute(taskHandle, attribute)
    ccall((:DAQmxResetBufferAttribute, nidaqmx), int32, (TaskHandle, int32), taskHandle, attribute)
end

function DAQmxSwitchCreateScanList(scanList, taskHandle)
    ccall((:DAQmxSwitchCreateScanList, nidaqmx), int32, (Ptr{UInt8}, Ptr{TaskHandle}), scanList, taskHandle)
end

function DAQmxSwitchConnect(switchChannel1, switchChannel2, waitForSettling)
    ccall((:DAQmxSwitchConnect, nidaqmx), int32, (Ptr{UInt8}, Ptr{UInt8}, bool32), switchChannel1, switchChannel2, waitForSettling)
end

function DAQmxSwitchConnectMulti(connectionList, waitForSettling)
    ccall((:DAQmxSwitchConnectMulti, nidaqmx), int32, (Ptr{UInt8}, bool32), connectionList, waitForSettling)
end

function DAQmxSwitchDisconnect(switchChannel1, switchChannel2, waitForSettling)
    ccall((:DAQmxSwitchDisconnect, nidaqmx), int32, (Ptr{UInt8}, Ptr{UInt8}, bool32), switchChannel1, switchChannel2, waitForSettling)
end

function DAQmxSwitchDisconnectMulti(connectionList, waitForSettling)
    ccall((:DAQmxSwitchDisconnectMulti, nidaqmx), int32, (Ptr{UInt8}, bool32), connectionList, waitForSettling)
end

function DAQmxSwitchDisconnectAll(deviceName, waitForSettling)
    ccall((:DAQmxSwitchDisconnectAll, nidaqmx), int32, (Ptr{UInt8}, bool32), deviceName, waitForSettling)
end

function DAQmxSwitchSetTopologyAndReset(deviceName, newTopology)
    ccall((:DAQmxSwitchSetTopologyAndReset, nidaqmx), int32, (Ptr{UInt8}, Ptr{UInt8}), deviceName, newTopology)
end

function DAQmxSwitchFindPath(switchChannel1, switchChannel2, path, pathBufferSize, pathStatus)
    ccall((:DAQmxSwitchFindPath, nidaqmx), int32, (Ptr{UInt8}, Ptr{UInt8}, Ptr{UInt8}, uInt32, Ptr{int32}), switchChannel1, switchChannel2, path, pathBufferSize, pathStatus)
end

function DAQmxSwitchOpenRelays(relayList, waitForSettling)
    ccall((:DAQmxSwitchOpenRelays, nidaqmx), int32, (Ptr{UInt8}, bool32), relayList, waitForSettling)
end

function DAQmxSwitchCloseRelays(relayList, waitForSettling)
    ccall((:DAQmxSwitchCloseRelays, nidaqmx), int32, (Ptr{UInt8}, bool32), relayList, waitForSettling)
end

function DAQmxSwitchGetSingleRelayCount(relayName, count)
    ccall((:DAQmxSwitchGetSingleRelayCount, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), relayName, count)
end

function DAQmxSwitchGetMultiRelayCount(relayList, count, countArraySize, numRelayCountsRead)
    ccall((:DAQmxSwitchGetMultiRelayCount, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}, uInt32, Ptr{uInt32}), relayList, count, countArraySize, numRelayCountsRead)
end

function DAQmxSwitchGetSingleRelayPos(relayName, relayPos)
    ccall((:DAQmxSwitchGetSingleRelayPos, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), relayName, relayPos)
end

function DAQmxSwitchGetMultiRelayPos(relayList, relayPos, relayPosArraySize, numRelayPossRead)
    ccall((:DAQmxSwitchGetMultiRelayPos, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}, uInt32, Ptr{uInt32}), relayList, relayPos, relayPosArraySize, numRelayPossRead)
end

function DAQmxSwitchWaitForSettling(deviceName)
    ccall((:DAQmxSwitchWaitForSettling, nidaqmx), int32, (Ptr{UInt8},), deviceName)
end

function DAQmxGetSwitchChanAttribute(switchChannelName, attribute, value)
    ccall((:DAQmxGetSwitchChanAttribute, nidaqmx), int32, (Ptr{UInt8}, int32, Ptr{Cvoid}), switchChannelName, attribute, value)
end

function DAQmxGetSwitchScanAttribute(taskHandle, attribute, value)
    ccall((:DAQmxGetSwitchScanAttribute, nidaqmx), int32, (TaskHandle, int32, Ptr{Cvoid}), taskHandle, attribute, value)
end

function DAQmxResetSwitchScanAttribute(taskHandle, attribute)
    ccall((:DAQmxResetSwitchScanAttribute, nidaqmx), int32, (TaskHandle, int32), taskHandle, attribute)
end

function DAQmxDisableAdvTrig(taskHandle)
    ccall((:DAQmxDisableAdvTrig, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxCfgDigEdgeAdvTrig(taskHandle, triggerSource, triggerEdge)
    ccall((:DAQmxCfgDigEdgeAdvTrig, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, triggerSource, triggerEdge)
end

function DAQmxSendSoftwareTrigger(taskHandle, triggerID)
    ccall((:DAQmxSendSoftwareTrigger, nidaqmx), int32, (TaskHandle, int32), taskHandle, triggerID)
end

function DAQmxConnectTerms(sourceTerminal, destinationTerminal, signalModifiers)
    ccall((:DAQmxConnectTerms, nidaqmx), int32, (Ptr{UInt8}, Ptr{UInt8}, int32), sourceTerminal, destinationTerminal, signalModifiers)
end

function DAQmxDisconnectTerms(sourceTerminal, destinationTerminal)
    ccall((:DAQmxDisconnectTerms, nidaqmx), int32, (Ptr{UInt8}, Ptr{UInt8}), sourceTerminal, destinationTerminal)
end

function DAQmxTristateOutputTerm(outputTerminal)
    ccall((:DAQmxTristateOutputTerm, nidaqmx), int32, (Ptr{UInt8},), outputTerminal)
end

function DAQmxResetDevice(deviceName)
    ccall((:DAQmxResetDevice, nidaqmx), int32, (Ptr{UInt8},), deviceName)
end

function DAQmxSelfTestDevice(deviceName)
    ccall((:DAQmxSelfTestDevice, nidaqmx), int32, (Ptr{UInt8},), deviceName)
end

function DAQmxCreateWatchdogTimerTaskEx(deviceName, taskName, taskHandle, timeout)
    ccall((:DAQmxCreateWatchdogTimerTaskEx, nidaqmx), int32, (Ptr{UInt8}, Ptr{UInt8}, Ptr{TaskHandle}, float64), deviceName, taskName, taskHandle, timeout)
end

function DAQmxControlWatchdogTask(taskHandle, action)
    ccall((:DAQmxControlWatchdogTask, nidaqmx), int32, (TaskHandle, int32), taskHandle, action)
end

function DAQmxCfgWatchdogAOExpirStates(taskHandle, channelNames, expirStateArray, outputTypeArray, arraySize)
    ccall((:DAQmxCfgWatchdogAOExpirStates, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}, Ptr{int32}, uInt32), taskHandle, channelNames, expirStateArray, outputTypeArray, arraySize)
end

function DAQmxCfgWatchdogCOExpirStates(taskHandle, channelNames, expirStateArray, arraySize)
    ccall((:DAQmxCfgWatchdogCOExpirStates, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}, uInt32), taskHandle, channelNames, expirStateArray, arraySize)
end

function DAQmxCfgWatchdogDOExpirStates(taskHandle, channelNames, expirStateArray, arraySize)
    ccall((:DAQmxCfgWatchdogDOExpirStates, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}, uInt32), taskHandle, channelNames, expirStateArray, arraySize)
end

function DAQmxResetWatchdogAttribute(taskHandle, lines, attribute)
    ccall((:DAQmxResetWatchdogAttribute, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, lines, attribute)
end

function DAQmxSelfCal(deviceName)
    ccall((:DAQmxSelfCal, nidaqmx), int32, (Ptr{UInt8},), deviceName)
end

function DAQmxPerformBridgeOffsetNullingCal(taskHandle, channel)
    ccall((:DAQmxPerformBridgeOffsetNullingCal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxPerformBridgeOffsetNullingCalEx(taskHandle, channel, skipUnsupportedChannels)
    ccall((:DAQmxPerformBridgeOffsetNullingCalEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, skipUnsupportedChannels)
end

function DAQmxPerformThrmcplLeadOffsetNullingCal(taskHandle, channel, skipUnsupportedChannels)
    ccall((:DAQmxPerformThrmcplLeadOffsetNullingCal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, skipUnsupportedChannels)
end

function DAQmxPerformStrainShuntCal(taskHandle, channel, shuntResistorValue, shuntResistorLocation, skipUnsupportedChannels)
    ccall((:DAQmxPerformStrainShuntCal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64, int32, bool32), taskHandle, channel, shuntResistorValue, shuntResistorLocation, skipUnsupportedChannels)
end

function DAQmxPerformStrainShuntCalEx(taskHandle, channel, shuntResistorValue, shuntResistorLocation, shuntResistorSelect, shuntResistorSource, skipUnsupportedChannels)
    ccall((:DAQmxPerformStrainShuntCalEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64, int32, int32, int32, bool32), taskHandle, channel, shuntResistorValue, shuntResistorLocation, shuntResistorSelect, shuntResistorSource, skipUnsupportedChannels)
end

function DAQmxPerformBridgeShuntCal(taskHandle, channel, shuntResistorValue, shuntResistorLocation, bridgeResistance, skipUnsupportedChannels)
    ccall((:DAQmxPerformBridgeShuntCal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64, int32, float64, bool32), taskHandle, channel, shuntResistorValue, shuntResistorLocation, bridgeResistance, skipUnsupportedChannels)
end

function DAQmxPerformBridgeShuntCalEx(taskHandle, channel, shuntResistorValue, shuntResistorLocation, shuntResistorSelect, shuntResistorSource, bridgeResistance, skipUnsupportedChannels)
    ccall((:DAQmxPerformBridgeShuntCalEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64, int32, int32, int32, float64, bool32), taskHandle, channel, shuntResistorValue, shuntResistorLocation, shuntResistorSelect, shuntResistorSource, bridgeResistance, skipUnsupportedChannels)
end

function DAQmxGetSelfCalLastDateAndTime(deviceName, year, month, day, hour, minute)
    ccall((:DAQmxGetSelfCalLastDateAndTime, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}, Ptr{uInt32}, Ptr{uInt32}, Ptr{uInt32}, Ptr{uInt32}), deviceName, year, month, day, hour, minute)
end

function DAQmxGetExtCalLastDateAndTime(deviceName, year, month, day, hour, minute)
    ccall((:DAQmxGetExtCalLastDateAndTime, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}, Ptr{uInt32}, Ptr{uInt32}, Ptr{uInt32}, Ptr{uInt32}), deviceName, year, month, day, hour, minute)
end

function DAQmxRestoreLastExtCalConst(deviceName)
    ccall((:DAQmxRestoreLastExtCalConst, nidaqmx), int32, (Ptr{UInt8},), deviceName)
end

function DAQmxESeriesCalAdjust(calHandle, referenceVoltage)
    ccall((:DAQmxESeriesCalAdjust, nidaqmx), int32, (CalHandle, float64), calHandle, referenceVoltage)
end

function DAQmxMSeriesCalAdjust(calHandle, referenceVoltage)
    ccall((:DAQmxMSeriesCalAdjust, nidaqmx), int32, (CalHandle, float64), calHandle, referenceVoltage)
end

function DAQmxSSeriesCalAdjust(calHandle, referenceVoltage)
    ccall((:DAQmxSSeriesCalAdjust, nidaqmx), int32, (CalHandle, float64), calHandle, referenceVoltage)
end

function DAQmxSCBaseboardCalAdjust(calHandle, referenceVoltage)
    ccall((:DAQmxSCBaseboardCalAdjust, nidaqmx), int32, (CalHandle, float64), calHandle, referenceVoltage)
end

function DAQmxAOSeriesCalAdjust(calHandle, referenceVoltage)
    ccall((:DAQmxAOSeriesCalAdjust, nidaqmx), int32, (CalHandle, float64), calHandle, referenceVoltage)
end

function DAQmxXSeriesCalAdjust(calHandle, referenceVoltage)
    ccall((:DAQmxXSeriesCalAdjust, nidaqmx), int32, (CalHandle, float64), calHandle, referenceVoltage)
end

function DAQmxDeviceSupportsCal(deviceName, calSupported)
    ccall((:DAQmxDeviceSupportsCal, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), deviceName, calSupported)
end

function DAQmxInitExtCal(deviceName, password, calHandle)
    ccall((:DAQmxInitExtCal, nidaqmx), int32, (Ptr{UInt8}, Ptr{UInt8}, Ptr{CalHandle}), deviceName, password, calHandle)
end

function DAQmxCloseExtCal(calHandle, action)
    ccall((:DAQmxCloseExtCal, nidaqmx), int32, (CalHandle, int32), calHandle, action)
end

function DAQmxChangeExtCalPassword(deviceName, password, newPassword)
    ccall((:DAQmxChangeExtCalPassword, nidaqmx), int32, (Ptr{UInt8}, Ptr{UInt8}, Ptr{UInt8}), deviceName, password, newPassword)
end

function DAQmxDSASetCalTemp(calHandle, temperature)
    ccall((:DAQmxDSASetCalTemp, nidaqmx), int32, (CalHandle, float64), calHandle, temperature)
end

function DAQmxAdjustDSAAICal(calHandle, referenceVoltage)
    ccall((:DAQmxAdjustDSAAICal, nidaqmx), int32, (CalHandle, float64), calHandle, referenceVoltage)
end

function DAQmxAdjustDSAAICalEx(calHandle, referenceVoltage, inputsShorted)
    ccall((:DAQmxAdjustDSAAICalEx, nidaqmx), int32, (CalHandle, float64, bool32), calHandle, referenceVoltage, inputsShorted)
end

function DAQmxAdjustDSAAICalWithGainAndCoupling(calHandle, coupling, gain, referenceVoltage)
    ccall((:DAQmxAdjustDSAAICalWithGainAndCoupling, nidaqmx), int32, (CalHandle, int32, float64, float64), calHandle, coupling, gain, referenceVoltage)
end

function DAQmxAdjustDSAAOCal(calHandle, channel, requestedLowVoltage, actualLowVoltage, requestedHighVoltage, actualHighVoltage, gainSetting)
    ccall((:DAQmxAdjustDSAAOCal, nidaqmx), int32, (CalHandle, uInt32, float64, float64, float64, float64, float64), calHandle, channel, requestedLowVoltage, actualLowVoltage, requestedHighVoltage, actualHighVoltage, gainSetting)
end

function DAQmxAdjust4610Cal(calHandle, channelName, gain, offset)
    ccall((:DAQmxAdjust4610Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64, float64), calHandle, channelName, gain, offset)
end

function DAQmxAdjustDSATimebaseCal(calHandle, referenceFrequency)
    ccall((:DAQmxAdjustDSATimebaseCal, nidaqmx), int32, (CalHandle, float64), calHandle, referenceFrequency)
end

function DAQmxAdjustDSAAOTimebaseCal(calHandle, measuredFrequency, calComplete)
    ccall((:DAQmxAdjustDSAAOTimebaseCal, nidaqmx), int32, (CalHandle, float64, Ptr{bool32}), calHandle, measuredFrequency, calComplete)
end

function DAQmxSetupDSAAOTimebaseCal(calHandle, expectedFrequency)
    ccall((:DAQmxSetupDSAAOTimebaseCal, nidaqmx), int32, (CalHandle, Ptr{float64}), calHandle, expectedFrequency)
end

function DAQmxGet4463AdjustPoints(calHandle, terminalConfig, gain, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet4463AdjustPoints, nidaqmx), int32, (CalHandle, int32, float64, Ptr{float64}, uInt32), calHandle, terminalConfig, gain, adjustmentPoints, bufferSize)
end

function DAQmxAdjust4463Cal(calHandle, channelNames, referenceVoltage)
    ccall((:DAQmxAdjust4463Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, referenceVoltage)
end

function DAQmxSetup4463Cal(calHandle, channelNames, terminalConfig, gain, outputVoltage)
    ccall((:DAQmxSetup4463Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, int32, float64, float64), calHandle, channelNames, terminalConfig, gain, outputVoltage)
end

function DAQmxSetup4480Cal(calHandle, channelNames, calMode)
    ccall((:DAQmxSetup4480Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, int32), calHandle, channelNames, calMode)
end

function DAQmxAdjustTIOTimebaseCal(calHandle, referenceFrequency)
    ccall((:DAQmxAdjustTIOTimebaseCal, nidaqmx), int32, (CalHandle, float64), calHandle, referenceFrequency)
end

function DAQmxAdjust4204Cal(calHandle, channelNames, lowPassFreq, trackHoldEnabled, inputVal)
    ccall((:DAQmxAdjust4204Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64, bool32, float64), calHandle, channelNames, lowPassFreq, trackHoldEnabled, inputVal)
end

function DAQmxAdjust4220Cal(calHandle, channelNames, gain, inputVal)
    ccall((:DAQmxAdjust4220Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64, float64), calHandle, channelNames, gain, inputVal)
end

function DAQmxAdjust4224Cal(calHandle, channelNames, gain, inputVal)
    ccall((:DAQmxAdjust4224Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64, float64), calHandle, channelNames, gain, inputVal)
end

function DAQmxAdjust4225Cal(calHandle, channelNames, gain, inputVal)
    ccall((:DAQmxAdjust4225Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64, float64), calHandle, channelNames, gain, inputVal)
end

function DAQmxSetup433xCal(calHandle, channelNames, excitationVoltage)
    ccall((:DAQmxSetup433xCal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, excitationVoltage)
end

function DAQmxAdjust433xCal(calHandle, refVoltage, refExcitation, shuntLocation)
    ccall((:DAQmxAdjust433xCal, nidaqmx), int32, (CalHandle, float64, float64, int32), calHandle, refVoltage, refExcitation, shuntLocation)
end

function DAQmxSetup4339Cal(calHandle, channelNames, calMode, rangeMax, rangeMin, excitationVoltage)
    ccall((:DAQmxSetup4339Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, int32, float64, float64, float64), calHandle, channelNames, calMode, rangeMax, rangeMin, excitationVoltage)
end

function DAQmxAdjust4339Cal(calHandle, refVoltage)
    ccall((:DAQmxAdjust4339Cal, nidaqmx), int32, (CalHandle, float64), calHandle, refVoltage)
end

function DAQmxGet4339CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet4339CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust4300Cal(calHandle, refVoltage)
    ccall((:DAQmxAdjust4300Cal, nidaqmx), int32, (CalHandle, float64), calHandle, refVoltage)
end

function DAQmxSetup4302Cal(calHandle, channelNames, rangeMin, rangeMax)
    ccall((:DAQmxSetup4302Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64, float64), calHandle, channelNames, rangeMin, rangeMax)
end

function DAQmxGet4302CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet4302CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust4302Cal(calHandle, refVoltage)
    ccall((:DAQmxAdjust4302Cal, nidaqmx), int32, (CalHandle, float64), calHandle, refVoltage)
end

function DAQmxSetup4303Cal(calHandle, channelNames, rangeMin, rangeMax)
    ccall((:DAQmxSetup4303Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64, float64), calHandle, channelNames, rangeMin, rangeMax)
end

function DAQmxGet4303CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet4303CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust4303Cal(calHandle, refVoltage)
    ccall((:DAQmxAdjust4303Cal, nidaqmx), int32, (CalHandle, float64), calHandle, refVoltage)
end

function DAQmxSetup4304Cal(calHandle, channelNames, rangeMin, rangeMax)
    ccall((:DAQmxSetup4304Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64, float64), calHandle, channelNames, rangeMin, rangeMax)
end

function DAQmxGet4304CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet4304CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust4304Cal(calHandle, refVoltage)
    ccall((:DAQmxAdjust4304Cal, nidaqmx), int32, (CalHandle, float64), calHandle, refVoltage)
end

function DAQmxSetup4305Cal(calHandle, channelNames, rangeMin, rangeMax)
    ccall((:DAQmxSetup4305Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64, float64), calHandle, channelNames, rangeMin, rangeMax)
end

function DAQmxGet4305CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet4305CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust4305Cal(calHandle, refVoltage)
    ccall((:DAQmxAdjust4305Cal, nidaqmx), int32, (CalHandle, float64), calHandle, refVoltage)
end

function DAQmxAdjust4309Cal(calHandle, refVoltage)
    ccall((:DAQmxAdjust4309Cal, nidaqmx), int32, (CalHandle, float64), calHandle, refVoltage)
end

function DAQmxAdjust4310Cal(calHandle, refVoltage)
    ccall((:DAQmxAdjust4310Cal, nidaqmx), int32, (CalHandle, float64), calHandle, refVoltage)
end

function DAQmxAdjust4353Cal(calHandle, channelNames, refVal)
    ccall((:DAQmxAdjust4353Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, refVal)
end

function DAQmxAdjust4357Cal(calHandle, channelNames, refVals, numRefVals)
    ccall((:DAQmxAdjust4357Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, Ptr{float64}, int32), calHandle, channelNames, refVals, numRefVals)
end

function DAQmxSetup4322Cal(calHandle, channelNames, outputType, outputVal)
    ccall((:DAQmxSetup4322Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, int32, float64), calHandle, channelNames, outputType, outputVal)
end

function DAQmxAdjust4322Cal(calHandle, channelNames, refVal)
    ccall((:DAQmxAdjust4322Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, refVal)
end

function DAQmxGet4322CalAdjustPoints(calHandle, outputType, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet4322CalAdjustPoints, nidaqmx), int32, (CalHandle, int32, Ptr{float64}, uInt32), calHandle, outputType, adjustmentPoints, bufferSize)
end

function DAQmxConnectSCExpressCalAccChans(calHandle, channelNames, connection)
    ccall((:DAQmxConnectSCExpressCalAccChans, nidaqmx), int32, (CalHandle, Ptr{UInt8}, Ptr{UInt8}), calHandle, channelNames, connection)
end

function DAQmxDisconnectSCExpressCalAccChans(calHandle)
    ccall((:DAQmxDisconnectSCExpressCalAccChans, nidaqmx), int32, (CalHandle,), calHandle)
end

function DAQmxGetPossibleSCExpressCalAccConnections(deviceName, channelNames, connections, connectionsBufferSize)
    ccall((:DAQmxGetPossibleSCExpressCalAccConnections, nidaqmx), int32, (Ptr{UInt8}, Ptr{UInt8}, Cstring, uInt32), deviceName, channelNames, connections, connectionsBufferSize)
end

function DAQmxSetSCExpressCalAccBridgeOutput(calHandle, voltsPerVolt)
    ccall((:DAQmxSetSCExpressCalAccBridgeOutput, nidaqmx), int32, (CalHandle, float64), calHandle, voltsPerVolt)
end

function DAQmxFieldDAQSetCalTemp(calHandle, temperature)
    ccall((:DAQmxFieldDAQSetCalTemp, nidaqmx), int32, (CalHandle, float64), calHandle, temperature)
end

function DAQmxGet11601CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet11601CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust11601Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust11601Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet11603CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet11603CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust11603Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust11603Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxSetup11605Cal(calHandle, rangeMin, rangeMax)
    ccall((:DAQmxSetup11605Cal, nidaqmx), int32, (CalHandle, float64, float64), calHandle, rangeMin, rangeMax)
end

function DAQmxGet11605CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet11605CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust11605Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust11605Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet11613CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet11613CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust11613Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust11613Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet11614CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet11614CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust11614Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust11614Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxSetup11634Cal(calHandle, rangeMin, rangeMax)
    ccall((:DAQmxSetup11634Cal, nidaqmx), int32, (CalHandle, float64, float64), calHandle, rangeMin, rangeMax)
end

function DAQmxGet11634CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet11634CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust11634Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust11634Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxSetup11637Cal(calHandle, channelNames, bridgeConfig, voltageExcitation)
    ccall((:DAQmxSetup11637Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, int32, float64), calHandle, channelNames, bridgeConfig, voltageExcitation)
end

function DAQmxAdjust11637Cal(calHandle, value, actualReading, asFoundGainError, asFoundOffsetError)
    ccall((:DAQmxAdjust11637Cal, nidaqmx), int32, (CalHandle, float64, Ptr{float64}, Ptr{float64}, Ptr{float64}), calHandle, value, actualReading, asFoundGainError, asFoundOffsetError)
end

function DAQmxGet9201CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9201CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxCSeriesSetCalTemp(calHandle, temperature)
    ccall((:DAQmxCSeriesSetCalTemp, nidaqmx), int32, (CalHandle, float64), calHandle, temperature)
end

function DAQmxAdjust9201Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9201Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9202CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9202CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9202Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9202Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9203CalAdjustPoints(calHandle, rangeMin, rangeMax, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9203CalAdjustPoints, nidaqmx), int32, (CalHandle, float64, float64, Ptr{float64}, uInt32), calHandle, rangeMin, rangeMax, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9203GainCal(calHandle, channelNames, rangeMin, rangeMax, value)
    ccall((:DAQmxAdjust9203GainCal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64, float64, float64), calHandle, channelNames, rangeMin, rangeMax, value)
end

function DAQmxAdjust9203OffsetCal(calHandle, channelNames, rangeMin, rangeMax)
    ccall((:DAQmxAdjust9203OffsetCal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64, float64), calHandle, channelNames, rangeMin, rangeMax)
end

function DAQmxAdjust9205Cal(calHandle, value)
    ccall((:DAQmxAdjust9205Cal, nidaqmx), int32, (CalHandle, float64), calHandle, value)
end

function DAQmxAdjust9206Cal(calHandle, value)
    ccall((:DAQmxAdjust9206Cal, nidaqmx), int32, (CalHandle, float64), calHandle, value)
end

function DAQmxGet9207CalAdjustPoints(calHandle, channelNames, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9207CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{UInt8}, Ptr{float64}, uInt32), calHandle, channelNames, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9207GainCal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9207GainCal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxAdjust9207OffsetCal(calHandle, channelNames)
    ccall((:DAQmxAdjust9207OffsetCal, nidaqmx), int32, (CalHandle, Ptr{UInt8}), calHandle, channelNames)
end

function DAQmxGet9208CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9208CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9208GainCal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9208GainCal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxAdjust9208OffsetCal(calHandle, channelNames)
    ccall((:DAQmxAdjust9208OffsetCal, nidaqmx), int32, (CalHandle, Ptr{UInt8}), calHandle, channelNames)
end

function DAQmxGet9209CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9209CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9209GainCal(calHandle, channelNames, terminalConfig, value)
    ccall((:DAQmxAdjust9209GainCal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, int32, float64), calHandle, channelNames, terminalConfig, value)
end

function DAQmxAdjust9209OffsetCal(calHandle, channelNames)
    ccall((:DAQmxAdjust9209OffsetCal, nidaqmx), int32, (CalHandle, Ptr{UInt8}), calHandle, channelNames)
end

function DAQmxAdjust9210Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9210Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxAdjust9211Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9211Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9212CalAdjustPoints(calHandle, channelNames, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9212CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{UInt8}, Ptr{float64}, uInt32), calHandle, channelNames, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9212Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9212Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9213CalAdjustPoints(calHandle, rangeMin, rangeMax, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9213CalAdjustPoints, nidaqmx), int32, (CalHandle, float64, float64, Ptr{float64}, uInt32), calHandle, rangeMin, rangeMax, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9213Cal(calHandle, channelNames, rangeMin, rangeMax, value)
    ccall((:DAQmxAdjust9213Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64, float64, float64), calHandle, channelNames, rangeMin, rangeMax, value)
end

function DAQmxGet9214CalAdjustPoints(calHandle, channelNames, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9214CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{UInt8}, Ptr{float64}, uInt32), calHandle, channelNames, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9214Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9214Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9215CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9215CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9215Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9215Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9216CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9216CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9216Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9216Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9217CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9217CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9217Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9217Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxSetup9218Cal(calHandle, channelNames, rangeMin, rangeMax, measType)
    ccall((:DAQmxSetup9218Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64, float64, int32), calHandle, channelNames, rangeMin, rangeMax, measType)
end

function DAQmxGet9218CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9218CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9218Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9218Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxSetup9219Cal(calHandle, channelNames, rangeMin, rangeMax, measType, bridgeConfig)
    ccall((:DAQmxSetup9219Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64, float64, int32, int32), calHandle, channelNames, rangeMin, rangeMax, measType, bridgeConfig)
end

function DAQmxGet9219CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9219CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9219Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9219Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9220CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9220CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9220Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9220Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9221CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9221CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9221Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9221Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9222CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9222CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9222Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9222Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9223CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9223CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9223Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9223Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9224CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9224CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9224Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9224Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9225CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9225CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9225Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9225Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9226CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9226CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9226Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9226Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9227CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9227CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9227Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9227Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9228CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9228CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9228Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9228Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9229CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9229CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9229Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9229Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9230CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9230CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9230Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9230Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9231CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9231CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9231Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9231Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9232CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9232CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9232Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9232Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9234CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9234CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9234GainCal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9234GainCal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxAdjust9234OffsetCal(calHandle, channelNames)
    ccall((:DAQmxAdjust9234OffsetCal, nidaqmx), int32, (CalHandle, Ptr{UInt8}), calHandle, channelNames)
end

function DAQmxGet9238CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9238CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9238Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9238Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9239CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9239CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9239Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9239Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9242CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9242CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxSetup9242Cal(calHandle, channelNames, value)
    ccall((:DAQmxSetup9242Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxAdjust9242Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9242Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9244CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9244CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxSetup9244Cal(calHandle, channelNames, value)
    ccall((:DAQmxSetup9244Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxAdjust9244Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9244Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9246CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9246CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9246Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9246Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9247CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9247CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9247Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9247Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9250CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9250CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9250Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9250Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9251CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9251CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9251Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9251Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9252CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9252CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9252Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9252Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9253CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9253CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{float64}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9253Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9253Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9260CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9260CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{int32}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxSetup9260Cal(calHandle, channelNames, value)
    ccall((:DAQmxSetup9260Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, int32), calHandle, channelNames, value)
end

function DAQmxAdjust9260Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9260Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9262CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9262CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{int32}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxSetup9262Cal(calHandle, channelNames, value)
    ccall((:DAQmxSetup9262Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, int32), calHandle, channelNames, value)
end

function DAQmxAdjust9262Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9262Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9263CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9263CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{int32}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxSetup9263Cal(calHandle, channelNames, value)
    ccall((:DAQmxSetup9263Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, int32), calHandle, channelNames, value)
end

function DAQmxAdjust9263Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9263Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9264CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9264CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{int32}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxSetup9264Cal(calHandle, channelNames, value)
    ccall((:DAQmxSetup9264Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, int32), calHandle, channelNames, value)
end

function DAQmxAdjust9264Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9264Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9265CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9265CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{int32}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxSetup9265Cal(calHandle, channelNames, value)
    ccall((:DAQmxSetup9265Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, int32), calHandle, channelNames, value)
end

function DAQmxAdjust9265Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9265Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9266CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9266CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{int32}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxSetup9266Cal(calHandle, channelNames, value)
    ccall((:DAQmxSetup9266Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, int32), calHandle, channelNames, value)
end

function DAQmxAdjust9266Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9266Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9269CalAdjustPoints(calHandle, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9269CalAdjustPoints, nidaqmx), int32, (CalHandle, Ptr{int32}, uInt32), calHandle, adjustmentPoints, bufferSize)
end

function DAQmxSetup9269Cal(calHandle, channelNames, value)
    ccall((:DAQmxSetup9269Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, int32), calHandle, channelNames, value)
end

function DAQmxAdjust9269Cal(calHandle, channelNames, value)
    ccall((:DAQmxAdjust9269Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelNames, value)
end

function DAQmxGet9775CalAdjustPoints(calHandle, coupling, adjustmentPoints, bufferSize)
    ccall((:DAQmxGet9775CalAdjustPoints, nidaqmx), int32, (CalHandle, uInt32, Ptr{float64}, uInt32), calHandle, coupling, adjustmentPoints, bufferSize)
end

function DAQmxAdjust9775Cal(calHandle, channelNames, value, coupling)
    ccall((:DAQmxAdjust9775Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64, uInt32), calHandle, channelNames, value, coupling)
end

function DAQmxSetup1102Cal(calHandle, channelName, gain)
    ccall((:DAQmxSetup1102Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelName, gain)
end

function DAQmxAdjust1102Cal(calHandle, refVoltage, measOutput)
    ccall((:DAQmxAdjust1102Cal, nidaqmx), int32, (CalHandle, float64, float64), calHandle, refVoltage, measOutput)
end

function DAQmxSetup1104Cal(calHandle, channelName)
    ccall((:DAQmxSetup1104Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}), calHandle, channelName)
end

function DAQmxAdjust1104Cal(calHandle, refVoltage, measOutput)
    ccall((:DAQmxAdjust1104Cal, nidaqmx), int32, (CalHandle, float64, float64), calHandle, refVoltage, measOutput)
end

function DAQmxSetup1112Cal(calHandle, channelName)
    ccall((:DAQmxSetup1112Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}), calHandle, channelName)
end

function DAQmxAdjust1112Cal(calHandle, refVoltage, measOutput)
    ccall((:DAQmxAdjust1112Cal, nidaqmx), int32, (CalHandle, float64, float64), calHandle, refVoltage, measOutput)
end

function DAQmxSetup1122Cal(calHandle, channelName, gain)
    ccall((:DAQmxSetup1122Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelName, gain)
end

function DAQmxAdjust1122Cal(calHandle, refVoltage, measOutput)
    ccall((:DAQmxAdjust1122Cal, nidaqmx), int32, (CalHandle, float64, float64), calHandle, refVoltage, measOutput)
end

function DAQmxSetup1124Cal(calHandle, channelName, range, dacValue)
    ccall((:DAQmxSetup1124Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, int32, uInt32), calHandle, channelName, range, dacValue)
end

function DAQmxAdjust1124Cal(calHandle, measOutput)
    ccall((:DAQmxAdjust1124Cal, nidaqmx), int32, (CalHandle, float64), calHandle, measOutput)
end

function DAQmxSetup1125Cal(calHandle, channelName, gain)
    ccall((:DAQmxSetup1125Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelName, gain)
end

function DAQmxAdjust1125Cal(calHandle, refVoltage, measOutput)
    ccall((:DAQmxAdjust1125Cal, nidaqmx), int32, (CalHandle, float64, float64), calHandle, refVoltage, measOutput)
end

function DAQmxSetup1126Cal(calHandle, channelName, upperFreqLimit)
    ccall((:DAQmxSetup1126Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelName, upperFreqLimit)
end

function DAQmxAdjust1126Cal(calHandle, refFreq, measOutput)
    ccall((:DAQmxAdjust1126Cal, nidaqmx), int32, (CalHandle, float64, float64), calHandle, refFreq, measOutput)
end

function DAQmxSetup1141Cal(calHandle, channelName, gain)
    ccall((:DAQmxSetup1141Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelName, gain)
end

function DAQmxAdjust1141Cal(calHandle, refVoltage, measOutput)
    ccall((:DAQmxAdjust1141Cal, nidaqmx), int32, (CalHandle, float64, float64), calHandle, refVoltage, measOutput)
end

function DAQmxSetup1142Cal(calHandle, channelName, gain)
    ccall((:DAQmxSetup1142Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelName, gain)
end

function DAQmxAdjust1142Cal(calHandle, refVoltage, measOutput)
    ccall((:DAQmxAdjust1142Cal, nidaqmx), int32, (CalHandle, float64, float64), calHandle, refVoltage, measOutput)
end

function DAQmxSetup1143Cal(calHandle, channelName, gain)
    ccall((:DAQmxSetup1143Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelName, gain)
end

function DAQmxAdjust1143Cal(calHandle, refVoltage, measOutput)
    ccall((:DAQmxAdjust1143Cal, nidaqmx), int32, (CalHandle, float64, float64), calHandle, refVoltage, measOutput)
end

function DAQmxSetup1502Cal(calHandle, channelName, gain)
    ccall((:DAQmxSetup1502Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelName, gain)
end

function DAQmxAdjust1502Cal(calHandle, refVoltage, measOutput)
    ccall((:DAQmxAdjust1502Cal, nidaqmx), int32, (CalHandle, float64, float64), calHandle, refVoltage, measOutput)
end

function DAQmxSetup1503Cal(calHandle, channelName, gain)
    ccall((:DAQmxSetup1503Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelName, gain)
end

function DAQmxAdjust1503Cal(calHandle, refVoltage, measOutput)
    ccall((:DAQmxAdjust1503Cal, nidaqmx), int32, (CalHandle, float64, float64), calHandle, refVoltage, measOutput)
end

function DAQmxAdjust1503CurrentCal(calHandle, channelName, measCurrent)
    ccall((:DAQmxAdjust1503CurrentCal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelName, measCurrent)
end

function DAQmxSetup1520Cal(calHandle, channelName, gain)
    ccall((:DAQmxSetup1520Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelName, gain)
end

function DAQmxAdjust1520Cal(calHandle, refVoltage, measOutput)
    ccall((:DAQmxAdjust1520Cal, nidaqmx), int32, (CalHandle, float64, float64), calHandle, refVoltage, measOutput)
end

function DAQmxSetup1521Cal(calHandle, channelName)
    ccall((:DAQmxSetup1521Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}), calHandle, channelName)
end

function DAQmxAdjust1521Cal(calHandle, refVoltage, measOutput)
    ccall((:DAQmxAdjust1521Cal, nidaqmx), int32, (CalHandle, float64, float64), calHandle, refVoltage, measOutput)
end

function DAQmxSetup153xCal(calHandle, channelName, gain)
    ccall((:DAQmxSetup153xCal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64), calHandle, channelName, gain)
end

function DAQmxAdjust153xCal(calHandle, refVoltage, measOutput)
    ccall((:DAQmxAdjust153xCal, nidaqmx), int32, (CalHandle, float64, float64), calHandle, refVoltage, measOutput)
end

function DAQmxSetup1540Cal(calHandle, channelName, excitationVoltage, excitationFreq)
    ccall((:DAQmxSetup1540Cal, nidaqmx), int32, (CalHandle, Ptr{UInt8}, float64, float64), calHandle, channelName, excitationVoltage, excitationFreq)
end

function DAQmxAdjust1540Cal(calHandle, refVoltage, measOutput, inputCalSource)
    ccall((:DAQmxAdjust1540Cal, nidaqmx), int32, (CalHandle, float64, float64, int32), calHandle, refVoltage, measOutput, inputCalSource)
end

function DAQmxConfigureTEDS(physicalChannel, filePath)
    ccall((:DAQmxConfigureTEDS, nidaqmx), int32, (Ptr{UInt8}, Ptr{UInt8}), physicalChannel, filePath)
end

function DAQmxClearTEDS(physicalChannel)
    ccall((:DAQmxClearTEDS, nidaqmx), int32, (Ptr{UInt8},), physicalChannel)
end

function DAQmxWriteToTEDSFromArray(physicalChannel, bitStream, arraySize, basicTEDSOptions)
    ccall((:DAQmxWriteToTEDSFromArray, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt8}, uInt32, int32), physicalChannel, bitStream, arraySize, basicTEDSOptions)
end

function DAQmxWriteToTEDSFromFile(physicalChannel, filePath, basicTEDSOptions)
    ccall((:DAQmxWriteToTEDSFromFile, nidaqmx), int32, (Ptr{UInt8}, Ptr{UInt8}, int32), physicalChannel, filePath, basicTEDSOptions)
end

function DAQmxWaitForNextSampleClock(taskHandle, timeout, isLate)
    ccall((:DAQmxWaitForNextSampleClock, nidaqmx), int32, (TaskHandle, float64, Ptr{bool32}), taskHandle, timeout, isLate)
end

function DAQmxResetRealTimeAttribute(taskHandle, attribute)
    ccall((:DAQmxResetRealTimeAttribute, nidaqmx), int32, (TaskHandle, int32), taskHandle, attribute)
end

function DAQmxIsReadOrWriteLate(errorCode)
    ccall((:DAQmxIsReadOrWriteLate, nidaqmx), bool32, (int32,), errorCode)
end

function DAQmxSaveTask(taskHandle, saveAs, author, options)
    ccall((:DAQmxSaveTask, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, uInt32), taskHandle, saveAs, author, options)
end

function DAQmxSaveGlobalChan(taskHandle, channelName, saveAs, author, options)
    ccall((:DAQmxSaveGlobalChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{UInt8}, Ptr{UInt8}, uInt32), taskHandle, channelName, saveAs, author, options)
end

function DAQmxSaveScale(scaleName, saveAs, author, options)
    ccall((:DAQmxSaveScale, nidaqmx), int32, (Ptr{UInt8}, Ptr{UInt8}, Ptr{UInt8}, uInt32), scaleName, saveAs, author, options)
end

function DAQmxDeleteSavedTask(taskName)
    ccall((:DAQmxDeleteSavedTask, nidaqmx), int32, (Ptr{UInt8},), taskName)
end

function DAQmxDeleteSavedGlobalChan(channelName)
    ccall((:DAQmxDeleteSavedGlobalChan, nidaqmx), int32, (Ptr{UInt8},), channelName)
end

function DAQmxDeleteSavedScale(scaleName)
    ccall((:DAQmxDeleteSavedScale, nidaqmx), int32, (Ptr{UInt8},), scaleName)
end

function DAQmxSetAnalogPowerUpStatesWithOutputType(channelNames, stateArray, channelTypeArray, arraySize)
    ccall((:DAQmxSetAnalogPowerUpStatesWithOutputType, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, Ptr{int32}, uInt32), channelNames, stateArray, channelTypeArray, arraySize)
end

function DAQmxGetAnalogPowerUpStatesWithOutputType(channelNames, stateArray, channelTypeArray, arraySizePtr)
    ccall((:DAQmxGetAnalogPowerUpStatesWithOutputType, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, Ptr{int32}, Ptr{uInt32}), channelNames, stateArray, channelTypeArray, arraySizePtr)
end

function DAQmxSetDigitalLogicFamilyPowerUpState(deviceName, logicFamily)
    ccall((:DAQmxSetDigitalLogicFamilyPowerUpState, nidaqmx), int32, (Ptr{UInt8}, int32), deviceName, logicFamily)
end

function DAQmxGetDigitalLogicFamilyPowerUpState(deviceName, logicFamily)
    ccall((:DAQmxGetDigitalLogicFamilyPowerUpState, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}), deviceName, logicFamily)
end

function DAQmxAddNetworkDevice(IPAddress, deviceName, attemptReservation, timeout, deviceNameOut, deviceNameOutBufferSize)
    ccall((:DAQmxAddNetworkDevice, nidaqmx), int32, (Ptr{UInt8}, Ptr{UInt8}, bool32, float64, Ptr{UInt8}, uInt32), IPAddress, deviceName, attemptReservation, timeout, deviceNameOut, deviceNameOutBufferSize)
end

function DAQmxDeleteNetworkDevice(deviceName)
    ccall((:DAQmxDeleteNetworkDevice, nidaqmx), int32, (Ptr{UInt8},), deviceName)
end

function DAQmxReserveNetworkDevice(deviceName, overrideReservation)
    ccall((:DAQmxReserveNetworkDevice, nidaqmx), int32, (Ptr{UInt8}, bool32), deviceName, overrideReservation)
end

function DAQmxUnreserveNetworkDevice(deviceName)
    ccall((:DAQmxUnreserveNetworkDevice, nidaqmx), int32, (Ptr{UInt8},), deviceName)
end

function DAQmxAutoConfigureCDAQSyncConnections(chassisDevicesPorts, timeout)
    ccall((:DAQmxAutoConfigureCDAQSyncConnections, nidaqmx), int32, (Ptr{UInt8}, float64), chassisDevicesPorts, timeout)
end

function DAQmxGetAutoConfiguredCDAQSyncConnections(portList, portListSize)
    ccall((:DAQmxGetAutoConfiguredCDAQSyncConnections, nidaqmx), int32, (Ptr{UInt8}, uInt32), portList, portListSize)
end

function DAQmxAreConfiguredCDAQSyncPortsDisconnected(chassisDevicesPorts, timeout, disconnectedPortsExist)
    ccall((:DAQmxAreConfiguredCDAQSyncPortsDisconnected, nidaqmx), int32, (Ptr{UInt8}, float64, Ptr{bool32}), chassisDevicesPorts, timeout, disconnectedPortsExist)
end

function DAQmxGetDisconnectedCDAQSyncPorts(portList, portListSize)
    ccall((:DAQmxGetDisconnectedCDAQSyncPorts, nidaqmx), int32, (Ptr{UInt8}, uInt32), portList, portListSize)
end

function DAQmxAddCDAQSyncConnection(portList)
    ccall((:DAQmxAddCDAQSyncConnection, nidaqmx), int32, (Ptr{UInt8},), portList)
end

function DAQmxRemoveCDAQSyncConnection(portList)
    ccall((:DAQmxRemoveCDAQSyncConnection, nidaqmx), int32, (Ptr{UInt8},), portList)
end

function DAQmxGetErrorString(errorCode, errorString, bufferSize)
    ccall((:DAQmxGetErrorString, nidaqmx), int32, (int32, Ptr{UInt8}, uInt32), errorCode, errorString, bufferSize)
end

function DAQmxGetExtendedErrorInfo(errorString, bufferSize)
    ccall((:DAQmxGetExtendedErrorInfo, nidaqmx), int32, (Ptr{UInt8}, uInt32), errorString, bufferSize)
end

function DAQmxGetBufInputBufSize(taskHandle, data)
    ccall((:DAQmxGetBufInputBufSize, nidaqmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetBufInputBufSize(taskHandle, data)
    ccall((:DAQmxSetBufInputBufSize, nidaqmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetBufInputBufSize(taskHandle)
    ccall((:DAQmxResetBufInputBufSize, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetBufInputOnbrdBufSize(taskHandle, data)
    ccall((:DAQmxGetBufInputOnbrdBufSize, nidaqmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxGetBufOutputBufSize(taskHandle, data)
    ccall((:DAQmxGetBufOutputBufSize, nidaqmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetBufOutputBufSize(taskHandle, data)
    ccall((:DAQmxSetBufOutputBufSize, nidaqmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetBufOutputBufSize(taskHandle)
    ccall((:DAQmxResetBufOutputBufSize, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetBufOutputOnbrdBufSize(taskHandle, data)
    ccall((:DAQmxGetBufOutputOnbrdBufSize, nidaqmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetBufOutputOnbrdBufSize(taskHandle, data)
    ccall((:DAQmxSetBufOutputOnbrdBufSize, nidaqmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetBufOutputOnbrdBufSize(taskHandle)
    ccall((:DAQmxResetBufOutputOnbrdBufSize, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSelfCalSupported(deviceName, data)
    ccall((:DAQmxGetSelfCalSupported, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), deviceName, data)
end

function DAQmxGetSelfCalLastTemp(deviceName, data)
    ccall((:DAQmxGetSelfCalLastTemp, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), deviceName, data)
end

function DAQmxGetExtCalRecommendedInterval(deviceName, data)
    ccall((:DAQmxGetExtCalRecommendedInterval, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), deviceName, data)
end

function DAQmxGetExtCalLastTemp(deviceName, data)
    ccall((:DAQmxGetExtCalLastTemp, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), deviceName, data)
end

function DAQmxGetCalUserDefinedInfo(deviceName, data, bufferSize)
    ccall((:DAQmxGetCalUserDefinedInfo, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), deviceName, data, bufferSize)
end

function DAQmxSetCalUserDefinedInfo(deviceName, data)
    ccall((:DAQmxSetCalUserDefinedInfo, nidaqmx), int32, (Ptr{UInt8}, Cstring), deviceName, data)
end

function DAQmxGetCalUserDefinedInfoMaxSize(deviceName, data)
    ccall((:DAQmxGetCalUserDefinedInfoMaxSize, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), deviceName, data)
end

function DAQmxGetCalDevTemp(deviceName, data)
    ccall((:DAQmxGetCalDevTemp, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), deviceName, data)
end

function DAQmxGetCalAccConnectionCount(deviceName, data)
    ccall((:DAQmxGetCalAccConnectionCount, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), deviceName, data)
end

function DAQmxSetCalAccConnectionCount(deviceName, data)
    ccall((:DAQmxSetCalAccConnectionCount, nidaqmx), int32, (Ptr{UInt8}, uInt32), deviceName, data)
end

function DAQmxGetCalRecommendedAccConnectionCountLimit(deviceName, data)
    ccall((:DAQmxGetCalRecommendedAccConnectionCountLimit, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), deviceName, data)
end

function DAQmxGetAIMax(taskHandle, channel, data)
    ccall((:DAQmxGetAIMax, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIMax(taskHandle, channel, data)
    ccall((:DAQmxSetAIMax, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIMax(taskHandle, channel)
    ccall((:DAQmxResetAIMax, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIMin(taskHandle, channel, data)
    ccall((:DAQmxGetAIMin, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIMin(taskHandle, channel, data)
    ccall((:DAQmxSetAIMin, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIMin(taskHandle, channel)
    ccall((:DAQmxResetAIMin, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAICustomScaleName(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetAICustomScaleName, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetAICustomScaleName(taskHandle, channel, data)
    ccall((:DAQmxSetAICustomScaleName, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetAICustomScaleName(taskHandle, channel)
    ccall((:DAQmxResetAICustomScaleName, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIMeasType(taskHandle, channel, data)
    ccall((:DAQmxGetAIMeasType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxGetAIVoltageUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIVoltageUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIVoltageUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIVoltageUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIVoltageUnits(taskHandle, channel)
    ccall((:DAQmxResetAIVoltageUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIVoltagedBRef(taskHandle, channel, data)
    ccall((:DAQmxGetAIVoltagedBRef, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIVoltagedBRef(taskHandle, channel, data)
    ccall((:DAQmxSetAIVoltagedBRef, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIVoltagedBRef(taskHandle, channel)
    ccall((:DAQmxResetAIVoltagedBRef, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIVoltageACRMSUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIVoltageACRMSUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIVoltageACRMSUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIVoltageACRMSUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIVoltageACRMSUnits(taskHandle, channel)
    ccall((:DAQmxResetAIVoltageACRMSUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAITempUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAITempUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAITempUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAITempUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAITempUnits(taskHandle, channel)
    ccall((:DAQmxResetAITempUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIThrmcplType(taskHandle, channel, data)
    ccall((:DAQmxGetAIThrmcplType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIThrmcplType(taskHandle, channel, data)
    ccall((:DAQmxSetAIThrmcplType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIThrmcplType(taskHandle, channel)
    ccall((:DAQmxResetAIThrmcplType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIThrmcplScaleType(taskHandle, channel, data)
    ccall((:DAQmxGetAIThrmcplScaleType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIThrmcplScaleType(taskHandle, channel, data)
    ccall((:DAQmxSetAIThrmcplScaleType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIThrmcplScaleType(taskHandle, channel)
    ccall((:DAQmxResetAIThrmcplScaleType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIThrmcplCJCSrc(taskHandle, channel, data)
    ccall((:DAQmxGetAIThrmcplCJCSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxGetAIThrmcplCJCVal(taskHandle, channel, data)
    ccall((:DAQmxGetAIThrmcplCJCVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIThrmcplCJCVal(taskHandle, channel, data)
    ccall((:DAQmxSetAIThrmcplCJCVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIThrmcplCJCVal(taskHandle, channel)
    ccall((:DAQmxResetAIThrmcplCJCVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIThrmcplCJCChan(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetAIThrmcplCJCChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxGetAIRTDType(taskHandle, channel, data)
    ccall((:DAQmxGetAIRTDType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIRTDType(taskHandle, channel, data)
    ccall((:DAQmxSetAIRTDType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIRTDType(taskHandle, channel)
    ccall((:DAQmxResetAIRTDType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIRTDR0(taskHandle, channel, data)
    ccall((:DAQmxGetAIRTDR0, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIRTDR0(taskHandle, channel, data)
    ccall((:DAQmxSetAIRTDR0, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIRTDR0(taskHandle, channel)
    ccall((:DAQmxResetAIRTDR0, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIRTDA(taskHandle, channel, data)
    ccall((:DAQmxGetAIRTDA, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIRTDA(taskHandle, channel, data)
    ccall((:DAQmxSetAIRTDA, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIRTDA(taskHandle, channel)
    ccall((:DAQmxResetAIRTDA, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIRTDB(taskHandle, channel, data)
    ccall((:DAQmxGetAIRTDB, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIRTDB(taskHandle, channel, data)
    ccall((:DAQmxSetAIRTDB, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIRTDB(taskHandle, channel)
    ccall((:DAQmxResetAIRTDB, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIRTDC(taskHandle, channel, data)
    ccall((:DAQmxGetAIRTDC, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIRTDC(taskHandle, channel, data)
    ccall((:DAQmxSetAIRTDC, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIRTDC(taskHandle, channel)
    ccall((:DAQmxResetAIRTDC, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIThrmstrA(taskHandle, channel, data)
    ccall((:DAQmxGetAIThrmstrA, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIThrmstrA(taskHandle, channel, data)
    ccall((:DAQmxSetAIThrmstrA, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIThrmstrA(taskHandle, channel)
    ccall((:DAQmxResetAIThrmstrA, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIThrmstrB(taskHandle, channel, data)
    ccall((:DAQmxGetAIThrmstrB, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIThrmstrB(taskHandle, channel, data)
    ccall((:DAQmxSetAIThrmstrB, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIThrmstrB(taskHandle, channel)
    ccall((:DAQmxResetAIThrmstrB, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIThrmstrC(taskHandle, channel, data)
    ccall((:DAQmxGetAIThrmstrC, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIThrmstrC(taskHandle, channel, data)
    ccall((:DAQmxSetAIThrmstrC, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIThrmstrC(taskHandle, channel)
    ccall((:DAQmxResetAIThrmstrC, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIThrmstrR1(taskHandle, channel, data)
    ccall((:DAQmxGetAIThrmstrR1, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIThrmstrR1(taskHandle, channel, data)
    ccall((:DAQmxSetAIThrmstrR1, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIThrmstrR1(taskHandle, channel)
    ccall((:DAQmxResetAIThrmstrR1, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIForceReadFromChan(taskHandle, channel, data)
    ccall((:DAQmxGetAIForceReadFromChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIForceReadFromChan(taskHandle, channel, data)
    ccall((:DAQmxSetAIForceReadFromChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIForceReadFromChan(taskHandle, channel)
    ccall((:DAQmxResetAIForceReadFromChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAICurrentUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAICurrentUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAICurrentUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAICurrentUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAICurrentUnits(taskHandle, channel)
    ccall((:DAQmxResetAICurrentUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAICurrentACRMSUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAICurrentACRMSUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAICurrentACRMSUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAICurrentACRMSUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAICurrentACRMSUnits(taskHandle, channel)
    ccall((:DAQmxResetAICurrentACRMSUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIStrainUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIStrainUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIStrainUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIStrainUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIStrainUnits(taskHandle, channel)
    ccall((:DAQmxResetAIStrainUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIStrainGageForceReadFromChan(taskHandle, channel, data)
    ccall((:DAQmxGetAIStrainGageForceReadFromChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIStrainGageForceReadFromChan(taskHandle, channel, data)
    ccall((:DAQmxSetAIStrainGageForceReadFromChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIStrainGageForceReadFromChan(taskHandle, channel)
    ccall((:DAQmxResetAIStrainGageForceReadFromChan, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIStrainGageGageFactor(taskHandle, channel, data)
    ccall((:DAQmxGetAIStrainGageGageFactor, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIStrainGageGageFactor(taskHandle, channel, data)
    ccall((:DAQmxSetAIStrainGageGageFactor, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIStrainGageGageFactor(taskHandle, channel)
    ccall((:DAQmxResetAIStrainGageGageFactor, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIStrainGagePoissonRatio(taskHandle, channel, data)
    ccall((:DAQmxGetAIStrainGagePoissonRatio, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIStrainGagePoissonRatio(taskHandle, channel, data)
    ccall((:DAQmxSetAIStrainGagePoissonRatio, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIStrainGagePoissonRatio(taskHandle, channel)
    ccall((:DAQmxResetAIStrainGagePoissonRatio, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIStrainGageCfg(taskHandle, channel, data)
    ccall((:DAQmxGetAIStrainGageCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIStrainGageCfg(taskHandle, channel, data)
    ccall((:DAQmxSetAIStrainGageCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIStrainGageCfg(taskHandle, channel)
    ccall((:DAQmxResetAIStrainGageCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIRosetteStrainGageRosetteType(taskHandle, channel, data)
    ccall((:DAQmxGetAIRosetteStrainGageRosetteType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxGetAIRosetteStrainGageOrientation(taskHandle, channel, data)
    ccall((:DAQmxGetAIRosetteStrainGageOrientation, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIRosetteStrainGageOrientation(taskHandle, channel, data)
    ccall((:DAQmxSetAIRosetteStrainGageOrientation, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIRosetteStrainGageOrientation(taskHandle, channel)
    ccall((:DAQmxResetAIRosetteStrainGageOrientation, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIRosetteStrainGageStrainChans(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetAIRosetteStrainGageStrainChans, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxGetAIRosetteStrainGageRosetteMeasType(taskHandle, channel, data)
    ccall((:DAQmxGetAIRosetteStrainGageRosetteMeasType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIRosetteStrainGageRosetteMeasType(taskHandle, channel, data)
    ccall((:DAQmxSetAIRosetteStrainGageRosetteMeasType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIRosetteStrainGageRosetteMeasType(taskHandle, channel)
    ccall((:DAQmxResetAIRosetteStrainGageRosetteMeasType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIResistanceUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIResistanceUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIResistanceUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIResistanceUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIResistanceUnits(taskHandle, channel)
    ccall((:DAQmxResetAIResistanceUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIFreqUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIFreqUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIFreqUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIFreqUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIFreqUnits(taskHandle, channel)
    ccall((:DAQmxResetAIFreqUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIFreqThreshVoltage(taskHandle, channel, data)
    ccall((:DAQmxGetAIFreqThreshVoltage, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIFreqThreshVoltage(taskHandle, channel, data)
    ccall((:DAQmxSetAIFreqThreshVoltage, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIFreqThreshVoltage(taskHandle, channel)
    ccall((:DAQmxResetAIFreqThreshVoltage, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIFreqHyst(taskHandle, channel, data)
    ccall((:DAQmxGetAIFreqHyst, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIFreqHyst(taskHandle, channel, data)
    ccall((:DAQmxSetAIFreqHyst, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIFreqHyst(taskHandle, channel)
    ccall((:DAQmxResetAIFreqHyst, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAILVDTUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAILVDTUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAILVDTUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAILVDTUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAILVDTUnits(taskHandle, channel)
    ccall((:DAQmxResetAILVDTUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAILVDTSensitivity(taskHandle, channel, data)
    ccall((:DAQmxGetAILVDTSensitivity, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAILVDTSensitivity(taskHandle, channel, data)
    ccall((:DAQmxSetAILVDTSensitivity, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAILVDTSensitivity(taskHandle, channel)
    ccall((:DAQmxResetAILVDTSensitivity, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAILVDTSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAILVDTSensitivityUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAILVDTSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAILVDTSensitivityUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAILVDTSensitivityUnits(taskHandle, channel)
    ccall((:DAQmxResetAILVDTSensitivityUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIRVDTUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIRVDTUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIRVDTUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIRVDTUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIRVDTUnits(taskHandle, channel)
    ccall((:DAQmxResetAIRVDTUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIRVDTSensitivity(taskHandle, channel, data)
    ccall((:DAQmxGetAIRVDTSensitivity, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIRVDTSensitivity(taskHandle, channel, data)
    ccall((:DAQmxSetAIRVDTSensitivity, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIRVDTSensitivity(taskHandle, channel)
    ccall((:DAQmxResetAIRVDTSensitivity, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIRVDTSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIRVDTSensitivityUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIRVDTSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIRVDTSensitivityUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIRVDTSensitivityUnits(taskHandle, channel)
    ccall((:DAQmxResetAIRVDTSensitivityUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIEddyCurrentProxProbeUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIEddyCurrentProxProbeUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIEddyCurrentProxProbeUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIEddyCurrentProxProbeUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIEddyCurrentProxProbeUnits(taskHandle, channel)
    ccall((:DAQmxResetAIEddyCurrentProxProbeUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIEddyCurrentProxProbeSensitivity(taskHandle, channel, data)
    ccall((:DAQmxGetAIEddyCurrentProxProbeSensitivity, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIEddyCurrentProxProbeSensitivity(taskHandle, channel, data)
    ccall((:DAQmxSetAIEddyCurrentProxProbeSensitivity, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIEddyCurrentProxProbeSensitivity(taskHandle, channel)
    ccall((:DAQmxResetAIEddyCurrentProxProbeSensitivity, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIEddyCurrentProxProbeSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIEddyCurrentProxProbeSensitivityUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIEddyCurrentProxProbeSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIEddyCurrentProxProbeSensitivityUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIEddyCurrentProxProbeSensitivityUnits(taskHandle, channel)
    ccall((:DAQmxResetAIEddyCurrentProxProbeSensitivityUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAISoundPressureMaxSoundPressureLvl(taskHandle, channel, data)
    ccall((:DAQmxGetAISoundPressureMaxSoundPressureLvl, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAISoundPressureMaxSoundPressureLvl(taskHandle, channel, data)
    ccall((:DAQmxSetAISoundPressureMaxSoundPressureLvl, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAISoundPressureMaxSoundPressureLvl(taskHandle, channel)
    ccall((:DAQmxResetAISoundPressureMaxSoundPressureLvl, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAISoundPressureUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAISoundPressureUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAISoundPressureUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAISoundPressureUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAISoundPressureUnits(taskHandle, channel)
    ccall((:DAQmxResetAISoundPressureUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAISoundPressuredBRef(taskHandle, channel, data)
    ccall((:DAQmxGetAISoundPressuredBRef, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAISoundPressuredBRef(taskHandle, channel, data)
    ccall((:DAQmxSetAISoundPressuredBRef, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAISoundPressuredBRef(taskHandle, channel)
    ccall((:DAQmxResetAISoundPressuredBRef, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIMicrophoneSensitivity(taskHandle, channel, data)
    ccall((:DAQmxGetAIMicrophoneSensitivity, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIMicrophoneSensitivity(taskHandle, channel, data)
    ccall((:DAQmxSetAIMicrophoneSensitivity, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIMicrophoneSensitivity(taskHandle, channel)
    ccall((:DAQmxResetAIMicrophoneSensitivity, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIAccelUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIAccelUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIAccelUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIAccelUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIAccelUnits(taskHandle, channel)
    ccall((:DAQmxResetAIAccelUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIAcceldBRef(taskHandle, channel, data)
    ccall((:DAQmxGetAIAcceldBRef, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIAcceldBRef(taskHandle, channel, data)
    ccall((:DAQmxSetAIAcceldBRef, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIAcceldBRef(taskHandle, channel)
    ccall((:DAQmxResetAIAcceldBRef, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIAccel4WireDCVoltageSensitivity(taskHandle, channel, data)
    ccall((:DAQmxGetAIAccel4WireDCVoltageSensitivity, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIAccel4WireDCVoltageSensitivity(taskHandle, channel, data)
    ccall((:DAQmxSetAIAccel4WireDCVoltageSensitivity, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIAccel4WireDCVoltageSensitivity(taskHandle, channel)
    ccall((:DAQmxResetAIAccel4WireDCVoltageSensitivity, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIAccel4WireDCVoltageSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIAccel4WireDCVoltageSensitivityUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIAccel4WireDCVoltageSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIAccel4WireDCVoltageSensitivityUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIAccel4WireDCVoltageSensitivityUnits(taskHandle, channel)
    ccall((:DAQmxResetAIAccel4WireDCVoltageSensitivityUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIAccelSensitivity(taskHandle, channel, data)
    ccall((:DAQmxGetAIAccelSensitivity, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIAccelSensitivity(taskHandle, channel, data)
    ccall((:DAQmxSetAIAccelSensitivity, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIAccelSensitivity(taskHandle, channel)
    ccall((:DAQmxResetAIAccelSensitivity, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIAccelSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIAccelSensitivityUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIAccelSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIAccelSensitivityUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIAccelSensitivityUnits(taskHandle, channel)
    ccall((:DAQmxResetAIAccelSensitivityUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIAccelChargeSensitivity(taskHandle, channel, data)
    ccall((:DAQmxGetAIAccelChargeSensitivity, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIAccelChargeSensitivity(taskHandle, channel, data)
    ccall((:DAQmxSetAIAccelChargeSensitivity, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIAccelChargeSensitivity(taskHandle, channel)
    ccall((:DAQmxResetAIAccelChargeSensitivity, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIAccelChargeSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIAccelChargeSensitivityUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIAccelChargeSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIAccelChargeSensitivityUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIAccelChargeSensitivityUnits(taskHandle, channel)
    ccall((:DAQmxResetAIAccelChargeSensitivityUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIVelocityUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIVelocityUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIVelocityUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIVelocityUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIVelocityUnits(taskHandle, channel)
    ccall((:DAQmxResetAIVelocityUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIVelocityIEPESensordBRef(taskHandle, channel, data)
    ccall((:DAQmxGetAIVelocityIEPESensordBRef, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIVelocityIEPESensordBRef(taskHandle, channel, data)
    ccall((:DAQmxSetAIVelocityIEPESensordBRef, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIVelocityIEPESensordBRef(taskHandle, channel)
    ccall((:DAQmxResetAIVelocityIEPESensordBRef, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIVelocityIEPESensorSensitivity(taskHandle, channel, data)
    ccall((:DAQmxGetAIVelocityIEPESensorSensitivity, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIVelocityIEPESensorSensitivity(taskHandle, channel, data)
    ccall((:DAQmxSetAIVelocityIEPESensorSensitivity, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIVelocityIEPESensorSensitivity(taskHandle, channel)
    ccall((:DAQmxResetAIVelocityIEPESensorSensitivity, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIVelocityIEPESensorSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIVelocityIEPESensorSensitivityUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIVelocityIEPESensorSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIVelocityIEPESensorSensitivityUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIVelocityIEPESensorSensitivityUnits(taskHandle, channel)
    ccall((:DAQmxResetAIVelocityIEPESensorSensitivityUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIForceUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIForceUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIForceUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIForceUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIForceUnits(taskHandle, channel)
    ccall((:DAQmxResetAIForceUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIForceIEPESensorSensitivity(taskHandle, channel, data)
    ccall((:DAQmxGetAIForceIEPESensorSensitivity, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIForceIEPESensorSensitivity(taskHandle, channel, data)
    ccall((:DAQmxSetAIForceIEPESensorSensitivity, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIForceIEPESensorSensitivity(taskHandle, channel)
    ccall((:DAQmxResetAIForceIEPESensorSensitivity, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIForceIEPESensorSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIForceIEPESensorSensitivityUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIForceIEPESensorSensitivityUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIForceIEPESensorSensitivityUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIForceIEPESensorSensitivityUnits(taskHandle, channel)
    ccall((:DAQmxResetAIForceIEPESensorSensitivityUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIPressureUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIPressureUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIPressureUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIPressureUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIPressureUnits(taskHandle, channel)
    ccall((:DAQmxResetAIPressureUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAITorqueUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAITorqueUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAITorqueUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAITorqueUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAITorqueUnits(taskHandle, channel)
    ccall((:DAQmxResetAITorqueUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIBridgeUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIBridgeUnits(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIBridgeElectricalUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeElectricalUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeElectricalUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeElectricalUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIBridgeElectricalUnits(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeElectricalUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIBridgePhysicalUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgePhysicalUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIBridgePhysicalUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgePhysicalUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIBridgePhysicalUnits(taskHandle, channel)
    ccall((:DAQmxResetAIBridgePhysicalUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIBridgeScaleType(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeScaleType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeScaleType(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeScaleType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIBridgeScaleType(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeScaleType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIBridgeTwoPointLinFirstElectricalVal(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeTwoPointLinFirstElectricalVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeTwoPointLinFirstElectricalVal(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeTwoPointLinFirstElectricalVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIBridgeTwoPointLinFirstElectricalVal(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeTwoPointLinFirstElectricalVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIBridgeTwoPointLinFirstPhysicalVal(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeTwoPointLinFirstPhysicalVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeTwoPointLinFirstPhysicalVal(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeTwoPointLinFirstPhysicalVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIBridgeTwoPointLinFirstPhysicalVal(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeTwoPointLinFirstPhysicalVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIBridgeTwoPointLinSecondElectricalVal(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeTwoPointLinSecondElectricalVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeTwoPointLinSecondElectricalVal(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeTwoPointLinSecondElectricalVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIBridgeTwoPointLinSecondElectricalVal(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeTwoPointLinSecondElectricalVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIBridgeTwoPointLinSecondPhysicalVal(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeTwoPointLinSecondPhysicalVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeTwoPointLinSecondPhysicalVal(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeTwoPointLinSecondPhysicalVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIBridgeTwoPointLinSecondPhysicalVal(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeTwoPointLinSecondPhysicalVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIBridgeTableElectricalVals(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetAIBridgeTableElectricalVals, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxSetAIBridgeTableElectricalVals(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxSetAIBridgeTableElectricalVals, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxResetAIBridgeTableElectricalVals(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeTableElectricalVals, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIBridgeTablePhysicalVals(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetAIBridgeTablePhysicalVals, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxSetAIBridgeTablePhysicalVals(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxSetAIBridgeTablePhysicalVals, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxResetAIBridgeTablePhysicalVals(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeTablePhysicalVals, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIBridgePolyForwardCoeff(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetAIBridgePolyForwardCoeff, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxSetAIBridgePolyForwardCoeff(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxSetAIBridgePolyForwardCoeff, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxResetAIBridgePolyForwardCoeff(taskHandle, channel)
    ccall((:DAQmxResetAIBridgePolyForwardCoeff, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIBridgePolyReverseCoeff(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetAIBridgePolyReverseCoeff, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxSetAIBridgePolyReverseCoeff(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxSetAIBridgePolyReverseCoeff, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxResetAIBridgePolyReverseCoeff(taskHandle, channel)
    ccall((:DAQmxResetAIBridgePolyReverseCoeff, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIChargeUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIChargeUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIChargeUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIChargeUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIChargeUnits(taskHandle, channel)
    ccall((:DAQmxResetAIChargeUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIIsTEDS(taskHandle, channel, data)
    ccall((:DAQmxGetAIIsTEDS, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxGetAITEDSUnits(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetAITEDSUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxGetAICoupling(taskHandle, channel, data)
    ccall((:DAQmxGetAICoupling, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAICoupling(taskHandle, channel, data)
    ccall((:DAQmxSetAICoupling, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAICoupling(taskHandle, channel)
    ccall((:DAQmxResetAICoupling, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIImpedance(taskHandle, channel, data)
    ccall((:DAQmxGetAIImpedance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIImpedance(taskHandle, channel, data)
    ccall((:DAQmxSetAIImpedance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIImpedance(taskHandle, channel)
    ccall((:DAQmxResetAIImpedance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAITermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetAITermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAITermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetAITermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAITermCfg(taskHandle, channel)
    ccall((:DAQmxResetAITermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIInputSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetAIInputSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetAIInputSrc(taskHandle, channel, data)
    ccall((:DAQmxSetAIInputSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetAIInputSrc(taskHandle, channel)
    ccall((:DAQmxResetAIInputSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIResistanceCfg(taskHandle, channel, data)
    ccall((:DAQmxGetAIResistanceCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIResistanceCfg(taskHandle, channel, data)
    ccall((:DAQmxSetAIResistanceCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIResistanceCfg(taskHandle, channel)
    ccall((:DAQmxResetAIResistanceCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAILeadWireResistance(taskHandle, channel, data)
    ccall((:DAQmxGetAILeadWireResistance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAILeadWireResistance(taskHandle, channel, data)
    ccall((:DAQmxSetAILeadWireResistance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAILeadWireResistance(taskHandle, channel)
    ccall((:DAQmxResetAILeadWireResistance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIBridgeCfg(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeCfg(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIBridgeCfg(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIBridgeNomResistance(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeNomResistance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeNomResistance(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeNomResistance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIBridgeNomResistance(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeNomResistance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIBridgeInitialVoltage(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeInitialVoltage, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeInitialVoltage(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeInitialVoltage, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIBridgeInitialVoltage(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeInitialVoltage, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIBridgeInitialRatio(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeInitialRatio, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeInitialRatio(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeInitialRatio, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIBridgeInitialRatio(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeInitialRatio, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIBridgeShuntCalEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeShuntCalEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeShuntCalEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeShuntCalEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIBridgeShuntCalEnable(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeShuntCalEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIBridgeShuntCalSelect(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeShuntCalSelect, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeShuntCalSelect(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeShuntCalSelect, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIBridgeShuntCalSelect(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeShuntCalSelect, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIBridgeShuntCalShuntCalASrc(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeShuntCalShuntCalASrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeShuntCalShuntCalASrc(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeShuntCalShuntCalASrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIBridgeShuntCalShuntCalASrc(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeShuntCalShuntCalASrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIBridgeShuntCalGainAdjust(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeShuntCalGainAdjust, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeShuntCalGainAdjust(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeShuntCalGainAdjust, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIBridgeShuntCalGainAdjust(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeShuntCalGainAdjust, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIBridgeShuntCalShuntCalAResistance(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeShuntCalShuntCalAResistance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeShuntCalShuntCalAResistance(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeShuntCalShuntCalAResistance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIBridgeShuntCalShuntCalAResistance(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeShuntCalShuntCalAResistance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIBridgeShuntCalShuntCalAActualResistance(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeShuntCalShuntCalAActualResistance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeShuntCalShuntCalAActualResistance(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeShuntCalShuntCalAActualResistance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIBridgeShuntCalShuntCalAActualResistance(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeShuntCalShuntCalAActualResistance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIBridgeShuntCalShuntCalBResistance(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeShuntCalShuntCalBResistance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeShuntCalShuntCalBResistance(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeShuntCalShuntCalBResistance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIBridgeShuntCalShuntCalBResistance(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeShuntCalShuntCalBResistance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIBridgeShuntCalShuntCalBActualResistance(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeShuntCalShuntCalBActualResistance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeShuntCalShuntCalBActualResistance(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeShuntCalShuntCalBActualResistance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIBridgeShuntCalShuntCalBActualResistance(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeShuntCalShuntCalBActualResistance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIBridgeBalanceCoarsePot(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeBalanceCoarsePot, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeBalanceCoarsePot(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeBalanceCoarsePot, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIBridgeBalanceCoarsePot(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeBalanceCoarsePot, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIBridgeBalanceFinePot(taskHandle, channel, data)
    ccall((:DAQmxGetAIBridgeBalanceFinePot, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIBridgeBalanceFinePot(taskHandle, channel, data)
    ccall((:DAQmxSetAIBridgeBalanceFinePot, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIBridgeBalanceFinePot(taskHandle, channel)
    ccall((:DAQmxResetAIBridgeBalanceFinePot, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAICurrentShuntLoc(taskHandle, channel, data)
    ccall((:DAQmxGetAICurrentShuntLoc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAICurrentShuntLoc(taskHandle, channel, data)
    ccall((:DAQmxSetAICurrentShuntLoc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAICurrentShuntLoc(taskHandle, channel)
    ccall((:DAQmxResetAICurrentShuntLoc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAICurrentShuntResistance(taskHandle, channel, data)
    ccall((:DAQmxGetAICurrentShuntResistance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAICurrentShuntResistance(taskHandle, channel, data)
    ccall((:DAQmxSetAICurrentShuntResistance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAICurrentShuntResistance(taskHandle, channel)
    ccall((:DAQmxResetAICurrentShuntResistance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIExcitSense(taskHandle, channel, data)
    ccall((:DAQmxGetAIExcitSense, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIExcitSense(taskHandle, channel, data)
    ccall((:DAQmxSetAIExcitSense, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIExcitSense(taskHandle, channel)
    ccall((:DAQmxResetAIExcitSense, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIExcitSrc(taskHandle, channel, data)
    ccall((:DAQmxGetAIExcitSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIExcitSrc(taskHandle, channel, data)
    ccall((:DAQmxSetAIExcitSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIExcitSrc(taskHandle, channel)
    ccall((:DAQmxResetAIExcitSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIExcitVal(taskHandle, channel, data)
    ccall((:DAQmxGetAIExcitVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIExcitVal(taskHandle, channel, data)
    ccall((:DAQmxSetAIExcitVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIExcitVal(taskHandle, channel)
    ccall((:DAQmxResetAIExcitVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIExcitUseForScaling(taskHandle, channel, data)
    ccall((:DAQmxGetAIExcitUseForScaling, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIExcitUseForScaling(taskHandle, channel, data)
    ccall((:DAQmxSetAIExcitUseForScaling, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIExcitUseForScaling(taskHandle, channel)
    ccall((:DAQmxResetAIExcitUseForScaling, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIExcitUseMultiplexed(taskHandle, channel, data)
    ccall((:DAQmxGetAIExcitUseMultiplexed, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIExcitUseMultiplexed(taskHandle, channel, data)
    ccall((:DAQmxSetAIExcitUseMultiplexed, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIExcitUseMultiplexed(taskHandle, channel)
    ccall((:DAQmxResetAIExcitUseMultiplexed, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIExcitActualVal(taskHandle, channel, data)
    ccall((:DAQmxGetAIExcitActualVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIExcitActualVal(taskHandle, channel, data)
    ccall((:DAQmxSetAIExcitActualVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIExcitActualVal(taskHandle, channel)
    ccall((:DAQmxResetAIExcitActualVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIExcitDCorAC(taskHandle, channel, data)
    ccall((:DAQmxGetAIExcitDCorAC, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIExcitDCorAC(taskHandle, channel, data)
    ccall((:DAQmxSetAIExcitDCorAC, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIExcitDCorAC(taskHandle, channel)
    ccall((:DAQmxResetAIExcitDCorAC, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIExcitVoltageOrCurrent(taskHandle, channel, data)
    ccall((:DAQmxGetAIExcitVoltageOrCurrent, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIExcitVoltageOrCurrent(taskHandle, channel, data)
    ccall((:DAQmxSetAIExcitVoltageOrCurrent, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIExcitVoltageOrCurrent(taskHandle, channel)
    ccall((:DAQmxResetAIExcitVoltageOrCurrent, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIExcitIdleOutputBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetAIExcitIdleOutputBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIExcitIdleOutputBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetAIExcitIdleOutputBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIExcitIdleOutputBehavior(taskHandle, channel)
    ccall((:DAQmxResetAIExcitIdleOutputBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIACExcitFreq(taskHandle, channel, data)
    ccall((:DAQmxGetAIACExcitFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIACExcitFreq(taskHandle, channel, data)
    ccall((:DAQmxSetAIACExcitFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIACExcitFreq(taskHandle, channel)
    ccall((:DAQmxResetAIACExcitFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIACExcitSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAIACExcitSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIACExcitSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAIACExcitSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIACExcitSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetAIACExcitSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIACExcitWireMode(taskHandle, channel, data)
    ccall((:DAQmxGetAIACExcitWireMode, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIACExcitWireMode(taskHandle, channel, data)
    ccall((:DAQmxSetAIACExcitWireMode, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIACExcitWireMode(taskHandle, channel)
    ccall((:DAQmxResetAIACExcitWireMode, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAISensorPowerVoltage(taskHandle, channel, data)
    ccall((:DAQmxGetAISensorPowerVoltage, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAISensorPowerVoltage(taskHandle, channel, data)
    ccall((:DAQmxSetAISensorPowerVoltage, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAISensorPowerVoltage(taskHandle, channel)
    ccall((:DAQmxResetAISensorPowerVoltage, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAISensorPowerCfg(taskHandle, channel, data)
    ccall((:DAQmxGetAISensorPowerCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAISensorPowerCfg(taskHandle, channel, data)
    ccall((:DAQmxSetAISensorPowerCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAISensorPowerCfg(taskHandle, channel)
    ccall((:DAQmxResetAISensorPowerCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAISensorPowerType(taskHandle, channel, data)
    ccall((:DAQmxGetAISensorPowerType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAISensorPowerType(taskHandle, channel, data)
    ccall((:DAQmxSetAISensorPowerType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAISensorPowerType(taskHandle, channel)
    ccall((:DAQmxResetAISensorPowerType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIOpenThrmcplDetectEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAIOpenThrmcplDetectEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIOpenThrmcplDetectEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAIOpenThrmcplDetectEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIOpenThrmcplDetectEnable(taskHandle, channel)
    ccall((:DAQmxResetAIOpenThrmcplDetectEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIThrmcplLeadOffsetVoltage(taskHandle, channel, data)
    ccall((:DAQmxGetAIThrmcplLeadOffsetVoltage, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIThrmcplLeadOffsetVoltage(taskHandle, channel, data)
    ccall((:DAQmxSetAIThrmcplLeadOffsetVoltage, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIThrmcplLeadOffsetVoltage(taskHandle, channel)
    ccall((:DAQmxResetAIThrmcplLeadOffsetVoltage, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIAtten(taskHandle, channel, data)
    ccall((:DAQmxGetAIAtten, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIAtten(taskHandle, channel, data)
    ccall((:DAQmxSetAIAtten, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIAtten(taskHandle, channel)
    ccall((:DAQmxResetAIAtten, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIProbeAtten(taskHandle, channel, data)
    ccall((:DAQmxGetAIProbeAtten, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIProbeAtten(taskHandle, channel, data)
    ccall((:DAQmxSetAIProbeAtten, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIProbeAtten(taskHandle, channel)
    ccall((:DAQmxResetAIProbeAtten, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAILowpassEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAILowpassEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAILowpassEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAILowpassEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAILowpassEnable(taskHandle, channel)
    ccall((:DAQmxResetAILowpassEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAILowpassCutoffFreq(taskHandle, channel, data)
    ccall((:DAQmxGetAILowpassCutoffFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAILowpassCutoffFreq(taskHandle, channel, data)
    ccall((:DAQmxSetAILowpassCutoffFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAILowpassCutoffFreq(taskHandle, channel)
    ccall((:DAQmxResetAILowpassCutoffFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAILowpassSwitchCapClkSrc(taskHandle, channel, data)
    ccall((:DAQmxGetAILowpassSwitchCapClkSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAILowpassSwitchCapClkSrc(taskHandle, channel, data)
    ccall((:DAQmxSetAILowpassSwitchCapClkSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAILowpassSwitchCapClkSrc(taskHandle, channel)
    ccall((:DAQmxResetAILowpassSwitchCapClkSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAILowpassSwitchCapExtClkFreq(taskHandle, channel, data)
    ccall((:DAQmxGetAILowpassSwitchCapExtClkFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAILowpassSwitchCapExtClkFreq(taskHandle, channel, data)
    ccall((:DAQmxSetAILowpassSwitchCapExtClkFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAILowpassSwitchCapExtClkFreq(taskHandle, channel)
    ccall((:DAQmxResetAILowpassSwitchCapExtClkFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAILowpassSwitchCapExtClkDiv(taskHandle, channel, data)
    ccall((:DAQmxGetAILowpassSwitchCapExtClkDiv, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetAILowpassSwitchCapExtClkDiv(taskHandle, channel, data)
    ccall((:DAQmxSetAILowpassSwitchCapExtClkDiv, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetAILowpassSwitchCapExtClkDiv(taskHandle, channel)
    ccall((:DAQmxResetAILowpassSwitchCapExtClkDiv, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAILowpassSwitchCapOutClkDiv(taskHandle, channel, data)
    ccall((:DAQmxGetAILowpassSwitchCapOutClkDiv, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetAILowpassSwitchCapOutClkDiv(taskHandle, channel, data)
    ccall((:DAQmxSetAILowpassSwitchCapOutClkDiv, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetAILowpassSwitchCapOutClkDiv(taskHandle, channel)
    ccall((:DAQmxResetAILowpassSwitchCapOutClkDiv, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAIDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAIDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetAIDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIDigFltrType(taskHandle, channel, data)
    ccall((:DAQmxGetAIDigFltrType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIDigFltrType(taskHandle, channel, data)
    ccall((:DAQmxSetAIDigFltrType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIDigFltrType(taskHandle, channel)
    ccall((:DAQmxResetAIDigFltrType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIDigFltrResponse(taskHandle, channel, data)
    ccall((:DAQmxGetAIDigFltrResponse, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIDigFltrResponse(taskHandle, channel, data)
    ccall((:DAQmxSetAIDigFltrResponse, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIDigFltrResponse(taskHandle, channel)
    ccall((:DAQmxResetAIDigFltrResponse, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIDigFltrOrder(taskHandle, channel, data)
    ccall((:DAQmxGetAIDigFltrOrder, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetAIDigFltrOrder(taskHandle, channel, data)
    ccall((:DAQmxSetAIDigFltrOrder, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetAIDigFltrOrder(taskHandle, channel)
    ccall((:DAQmxResetAIDigFltrOrder, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIDigFltrLowpassCutoffFreq(taskHandle, channel, data)
    ccall((:DAQmxGetAIDigFltrLowpassCutoffFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIDigFltrLowpassCutoffFreq(taskHandle, channel, data)
    ccall((:DAQmxSetAIDigFltrLowpassCutoffFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIDigFltrLowpassCutoffFreq(taskHandle, channel)
    ccall((:DAQmxResetAIDigFltrLowpassCutoffFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIDigFltrHighpassCutoffFreq(taskHandle, channel, data)
    ccall((:DAQmxGetAIDigFltrHighpassCutoffFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIDigFltrHighpassCutoffFreq(taskHandle, channel, data)
    ccall((:DAQmxSetAIDigFltrHighpassCutoffFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIDigFltrHighpassCutoffFreq(taskHandle, channel)
    ccall((:DAQmxResetAIDigFltrHighpassCutoffFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIDigFltrBandpassCenterFreq(taskHandle, channel, data)
    ccall((:DAQmxGetAIDigFltrBandpassCenterFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIDigFltrBandpassCenterFreq(taskHandle, channel, data)
    ccall((:DAQmxSetAIDigFltrBandpassCenterFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIDigFltrBandpassCenterFreq(taskHandle, channel)
    ccall((:DAQmxResetAIDigFltrBandpassCenterFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIDigFltrBandpassWidth(taskHandle, channel, data)
    ccall((:DAQmxGetAIDigFltrBandpassWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIDigFltrBandpassWidth(taskHandle, channel, data)
    ccall((:DAQmxSetAIDigFltrBandpassWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIDigFltrBandpassWidth(taskHandle, channel)
    ccall((:DAQmxResetAIDigFltrBandpassWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIDigFltrNotchCenterFreq(taskHandle, channel, data)
    ccall((:DAQmxGetAIDigFltrNotchCenterFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIDigFltrNotchCenterFreq(taskHandle, channel, data)
    ccall((:DAQmxSetAIDigFltrNotchCenterFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIDigFltrNotchCenterFreq(taskHandle, channel)
    ccall((:DAQmxResetAIDigFltrNotchCenterFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIDigFltrNotchWidth(taskHandle, channel, data)
    ccall((:DAQmxGetAIDigFltrNotchWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIDigFltrNotchWidth(taskHandle, channel, data)
    ccall((:DAQmxSetAIDigFltrNotchWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIDigFltrNotchWidth(taskHandle, channel)
    ccall((:DAQmxResetAIDigFltrNotchWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIDigFltrCoeff(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetAIDigFltrCoeff, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxSetAIDigFltrCoeff(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxSetAIDigFltrCoeff, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxResetAIDigFltrCoeff(taskHandle, channel)
    ccall((:DAQmxResetAIDigFltrCoeff, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIFilterEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAIFilterEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIFilterEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAIFilterEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIFilterEnable(taskHandle, channel)
    ccall((:DAQmxResetAIFilterEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIFilterFreq(taskHandle, channel, data)
    ccall((:DAQmxGetAIFilterFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIFilterFreq(taskHandle, channel, data)
    ccall((:DAQmxSetAIFilterFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIFilterFreq(taskHandle, channel)
    ccall((:DAQmxResetAIFilterFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIFilterResponse(taskHandle, channel, data)
    ccall((:DAQmxGetAIFilterResponse, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIFilterResponse(taskHandle, channel, data)
    ccall((:DAQmxSetAIFilterResponse, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIFilterResponse(taskHandle, channel)
    ccall((:DAQmxResetAIFilterResponse, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIFilterOrder(taskHandle, channel, data)
    ccall((:DAQmxGetAIFilterOrder, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetAIFilterOrder(taskHandle, channel, data)
    ccall((:DAQmxSetAIFilterOrder, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetAIFilterOrder(taskHandle, channel)
    ccall((:DAQmxResetAIFilterOrder, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIFilterDelay(taskHandle, channel, data)
    ccall((:DAQmxGetAIFilterDelay, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxGetAIFilterDelayUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIFilterDelayUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIFilterDelayUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAIFilterDelayUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIFilterDelayUnits(taskHandle, channel)
    ccall((:DAQmxResetAIFilterDelayUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIRemoveFilterDelay(taskHandle, channel, data)
    ccall((:DAQmxGetAIRemoveFilterDelay, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIRemoveFilterDelay(taskHandle, channel, data)
    ccall((:DAQmxSetAIRemoveFilterDelay, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIRemoveFilterDelay(taskHandle, channel)
    ccall((:DAQmxResetAIRemoveFilterDelay, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIFilterDelayAdjustment(taskHandle, channel, data)
    ccall((:DAQmxGetAIFilterDelayAdjustment, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIFilterDelayAdjustment(taskHandle, channel, data)
    ccall((:DAQmxSetAIFilterDelayAdjustment, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIFilterDelayAdjustment(taskHandle, channel)
    ccall((:DAQmxResetAIFilterDelayAdjustment, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIAveragingWinSize(taskHandle, channel, data)
    ccall((:DAQmxGetAIAveragingWinSize, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetAIAveragingWinSize(taskHandle, channel, data)
    ccall((:DAQmxSetAIAveragingWinSize, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetAIAveragingWinSize(taskHandle, channel)
    ccall((:DAQmxResetAIAveragingWinSize, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIResolutionUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAIResolutionUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxGetAIResolution(taskHandle, channel, data)
    ccall((:DAQmxGetAIResolution, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxGetAIRawSampSize(taskHandle, channel, data)
    ccall((:DAQmxGetAIRawSampSize, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxGetAIRawSampJustification(taskHandle, channel, data)
    ccall((:DAQmxGetAIRawSampJustification, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxGetAIADCTimingMode(taskHandle, channel, data)
    ccall((:DAQmxGetAIADCTimingMode, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIADCTimingMode(taskHandle, channel, data)
    ccall((:DAQmxSetAIADCTimingMode, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIADCTimingMode(taskHandle, channel)
    ccall((:DAQmxResetAIADCTimingMode, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIADCCustomTimingMode(taskHandle, channel, data)
    ccall((:DAQmxGetAIADCCustomTimingMode, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetAIADCCustomTimingMode(taskHandle, channel, data)
    ccall((:DAQmxSetAIADCCustomTimingMode, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetAIADCCustomTimingMode(taskHandle, channel)
    ccall((:DAQmxResetAIADCCustomTimingMode, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIDitherEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAIDitherEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIDitherEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAIDitherEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIDitherEnable(taskHandle, channel)
    ccall((:DAQmxResetAIDitherEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIChanCalHasValidCalInfo(taskHandle, channel, data)
    ccall((:DAQmxGetAIChanCalHasValidCalInfo, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxGetAIChanCalEnableCal(taskHandle, channel, data)
    ccall((:DAQmxGetAIChanCalEnableCal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIChanCalEnableCal(taskHandle, channel, data)
    ccall((:DAQmxSetAIChanCalEnableCal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIChanCalEnableCal(taskHandle, channel)
    ccall((:DAQmxResetAIChanCalEnableCal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIChanCalApplyCalIfExp(taskHandle, channel, data)
    ccall((:DAQmxGetAIChanCalApplyCalIfExp, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIChanCalApplyCalIfExp(taskHandle, channel, data)
    ccall((:DAQmxSetAIChanCalApplyCalIfExp, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIChanCalApplyCalIfExp(taskHandle, channel)
    ccall((:DAQmxResetAIChanCalApplyCalIfExp, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIChanCalScaleType(taskHandle, channel, data)
    ccall((:DAQmxGetAIChanCalScaleType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIChanCalScaleType(taskHandle, channel, data)
    ccall((:DAQmxSetAIChanCalScaleType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIChanCalScaleType(taskHandle, channel)
    ccall((:DAQmxResetAIChanCalScaleType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIChanCalTablePreScaledVals(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetAIChanCalTablePreScaledVals, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxSetAIChanCalTablePreScaledVals(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxSetAIChanCalTablePreScaledVals, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxResetAIChanCalTablePreScaledVals(taskHandle, channel)
    ccall((:DAQmxResetAIChanCalTablePreScaledVals, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIChanCalTableScaledVals(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetAIChanCalTableScaledVals, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxSetAIChanCalTableScaledVals(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxSetAIChanCalTableScaledVals, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxResetAIChanCalTableScaledVals(taskHandle, channel)
    ccall((:DAQmxResetAIChanCalTableScaledVals, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIChanCalPolyForwardCoeff(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetAIChanCalPolyForwardCoeff, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxSetAIChanCalPolyForwardCoeff(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxSetAIChanCalPolyForwardCoeff, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxResetAIChanCalPolyForwardCoeff(taskHandle, channel)
    ccall((:DAQmxResetAIChanCalPolyForwardCoeff, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIChanCalPolyReverseCoeff(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetAIChanCalPolyReverseCoeff, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxSetAIChanCalPolyReverseCoeff(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxSetAIChanCalPolyReverseCoeff, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxResetAIChanCalPolyReverseCoeff(taskHandle, channel)
    ccall((:DAQmxResetAIChanCalPolyReverseCoeff, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIChanCalOperatorName(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetAIChanCalOperatorName, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetAIChanCalOperatorName(taskHandle, channel, data)
    ccall((:DAQmxSetAIChanCalOperatorName, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetAIChanCalOperatorName(taskHandle, channel)
    ccall((:DAQmxResetAIChanCalOperatorName, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIChanCalDesc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetAIChanCalDesc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetAIChanCalDesc(taskHandle, channel, data)
    ccall((:DAQmxSetAIChanCalDesc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetAIChanCalDesc(taskHandle, channel)
    ccall((:DAQmxResetAIChanCalDesc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIChanCalVerifRefVals(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetAIChanCalVerifRefVals, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxSetAIChanCalVerifRefVals(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxSetAIChanCalVerifRefVals, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxResetAIChanCalVerifRefVals(taskHandle, channel)
    ccall((:DAQmxResetAIChanCalVerifRefVals, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIChanCalVerifAcqVals(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetAIChanCalVerifAcqVals, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxSetAIChanCalVerifAcqVals(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxSetAIChanCalVerifAcqVals, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxResetAIChanCalVerifAcqVals(taskHandle, channel)
    ccall((:DAQmxResetAIChanCalVerifAcqVals, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIRngHigh(taskHandle, channel, data)
    ccall((:DAQmxGetAIRngHigh, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIRngHigh(taskHandle, channel, data)
    ccall((:DAQmxSetAIRngHigh, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIRngHigh(taskHandle, channel)
    ccall((:DAQmxResetAIRngHigh, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIRngLow(taskHandle, channel, data)
    ccall((:DAQmxGetAIRngLow, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIRngLow(taskHandle, channel, data)
    ccall((:DAQmxSetAIRngLow, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIRngLow(taskHandle, channel)
    ccall((:DAQmxResetAIRngLow, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIDCOffset(taskHandle, channel, data)
    ccall((:DAQmxGetAIDCOffset, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIDCOffset(taskHandle, channel, data)
    ccall((:DAQmxSetAIDCOffset, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIDCOffset(taskHandle, channel)
    ccall((:DAQmxResetAIDCOffset, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIGain(taskHandle, channel, data)
    ccall((:DAQmxGetAIGain, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIGain(taskHandle, channel, data)
    ccall((:DAQmxSetAIGain, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIGain(taskHandle, channel)
    ccall((:DAQmxResetAIGain, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAISampAndHoldEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAISampAndHoldEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAISampAndHoldEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAISampAndHoldEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAISampAndHoldEnable(taskHandle, channel)
    ccall((:DAQmxResetAISampAndHoldEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIAutoZeroMode(taskHandle, channel, data)
    ccall((:DAQmxGetAIAutoZeroMode, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIAutoZeroMode(taskHandle, channel, data)
    ccall((:DAQmxSetAIAutoZeroMode, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIAutoZeroMode(taskHandle, channel)
    ccall((:DAQmxResetAIAutoZeroMode, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIChopEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAIChopEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIChopEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAIChopEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIChopEnable(taskHandle, channel)
    ccall((:DAQmxResetAIChopEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIDataXferMaxRate(taskHandle, channel, data)
    ccall((:DAQmxGetAIDataXferMaxRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIDataXferMaxRate(taskHandle, channel, data)
    ccall((:DAQmxSetAIDataXferMaxRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIDataXferMaxRate(taskHandle, channel)
    ccall((:DAQmxResetAIDataXferMaxRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIDataXferMech(taskHandle, channel, data)
    ccall((:DAQmxGetAIDataXferMech, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIDataXferMech(taskHandle, channel, data)
    ccall((:DAQmxSetAIDataXferMech, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIDataXferMech(taskHandle, channel)
    ccall((:DAQmxResetAIDataXferMech, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIDataXferReqCond(taskHandle, channel, data)
    ccall((:DAQmxGetAIDataXferReqCond, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIDataXferReqCond(taskHandle, channel, data)
    ccall((:DAQmxSetAIDataXferReqCond, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIDataXferReqCond(taskHandle, channel)
    ccall((:DAQmxResetAIDataXferReqCond, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIDataXferCustomThreshold(taskHandle, channel, data)
    ccall((:DAQmxGetAIDataXferCustomThreshold, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetAIDataXferCustomThreshold(taskHandle, channel, data)
    ccall((:DAQmxSetAIDataXferCustomThreshold, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetAIDataXferCustomThreshold(taskHandle, channel)
    ccall((:DAQmxResetAIDataXferCustomThreshold, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIUsbXferReqSize(taskHandle, channel, data)
    ccall((:DAQmxGetAIUsbXferReqSize, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetAIUsbXferReqSize(taskHandle, channel, data)
    ccall((:DAQmxSetAIUsbXferReqSize, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetAIUsbXferReqSize(taskHandle, channel)
    ccall((:DAQmxResetAIUsbXferReqSize, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIUsbXferReqCount(taskHandle, channel, data)
    ccall((:DAQmxGetAIUsbXferReqCount, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetAIUsbXferReqCount(taskHandle, channel, data)
    ccall((:DAQmxSetAIUsbXferReqCount, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetAIUsbXferReqCount(taskHandle, channel)
    ccall((:DAQmxResetAIUsbXferReqCount, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIMemMapEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAIMemMapEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIMemMapEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAIMemMapEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIMemMapEnable(taskHandle, channel)
    ccall((:DAQmxResetAIMemMapEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIRawDataCompressionType(taskHandle, channel, data)
    ccall((:DAQmxGetAIRawDataCompressionType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAIRawDataCompressionType(taskHandle, channel, data)
    ccall((:DAQmxSetAIRawDataCompressionType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAIRawDataCompressionType(taskHandle, channel)
    ccall((:DAQmxResetAIRawDataCompressionType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAILossyLSBRemovalCompressedSampSize(taskHandle, channel, data)
    ccall((:DAQmxGetAILossyLSBRemovalCompressedSampSize, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetAILossyLSBRemovalCompressedSampSize(taskHandle, channel, data)
    ccall((:DAQmxSetAILossyLSBRemovalCompressedSampSize, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetAILossyLSBRemovalCompressedSampSize(taskHandle, channel)
    ccall((:DAQmxResetAILossyLSBRemovalCompressedSampSize, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIDevScalingCoeff(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetAIDevScalingCoeff, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxGetAIEnhancedAliasRejectionEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAIEnhancedAliasRejectionEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIEnhancedAliasRejectionEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAIEnhancedAliasRejectionEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIEnhancedAliasRejectionEnable(taskHandle, channel)
    ccall((:DAQmxResetAIEnhancedAliasRejectionEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIOpenChanDetectEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAIOpenChanDetectEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIOpenChanDetectEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAIOpenChanDetectEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIOpenChanDetectEnable(taskHandle, channel)
    ccall((:DAQmxResetAIOpenChanDetectEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIInputLimitsFaultDetectUpperLimit(taskHandle, channel, data)
    ccall((:DAQmxGetAIInputLimitsFaultDetectUpperLimit, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIInputLimitsFaultDetectUpperLimit(taskHandle, channel, data)
    ccall((:DAQmxSetAIInputLimitsFaultDetectUpperLimit, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIInputLimitsFaultDetectUpperLimit(taskHandle, channel)
    ccall((:DAQmxResetAIInputLimitsFaultDetectUpperLimit, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIInputLimitsFaultDetectLowerLimit(taskHandle, channel, data)
    ccall((:DAQmxGetAIInputLimitsFaultDetectLowerLimit, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAIInputLimitsFaultDetectLowerLimit(taskHandle, channel, data)
    ccall((:DAQmxSetAIInputLimitsFaultDetectLowerLimit, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAIInputLimitsFaultDetectLowerLimit(taskHandle, channel)
    ccall((:DAQmxResetAIInputLimitsFaultDetectLowerLimit, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIInputLimitsFaultDetectEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAIInputLimitsFaultDetectEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIInputLimitsFaultDetectEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAIInputLimitsFaultDetectEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIInputLimitsFaultDetectEnable(taskHandle, channel)
    ccall((:DAQmxResetAIInputLimitsFaultDetectEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIPowerSupplyFaultDetectEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAIPowerSupplyFaultDetectEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIPowerSupplyFaultDetectEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAIPowerSupplyFaultDetectEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIPowerSupplyFaultDetectEnable(taskHandle, channel)
    ccall((:DAQmxResetAIPowerSupplyFaultDetectEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAIOvercurrentDetectEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAIOvercurrentDetectEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAIOvercurrentDetectEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAIOvercurrentDetectEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAIOvercurrentDetectEnable(taskHandle, channel)
    ccall((:DAQmxResetAIOvercurrentDetectEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOMax(taskHandle, channel, data)
    ccall((:DAQmxGetAOMax, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOMax(taskHandle, channel, data)
    ccall((:DAQmxSetAOMax, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAOMax(taskHandle, channel)
    ccall((:DAQmxResetAOMax, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOMin(taskHandle, channel, data)
    ccall((:DAQmxGetAOMin, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOMin(taskHandle, channel, data)
    ccall((:DAQmxSetAOMin, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAOMin(taskHandle, channel)
    ccall((:DAQmxResetAOMin, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOCustomScaleName(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetAOCustomScaleName, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetAOCustomScaleName(taskHandle, channel, data)
    ccall((:DAQmxSetAOCustomScaleName, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetAOCustomScaleName(taskHandle, channel)
    ccall((:DAQmxResetAOCustomScaleName, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOOutputType(taskHandle, channel, data)
    ccall((:DAQmxGetAOOutputType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxGetAOVoltageUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAOVoltageUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAOVoltageUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAOVoltageUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAOVoltageUnits(taskHandle, channel)
    ccall((:DAQmxResetAOVoltageUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOVoltageCurrentLimit(taskHandle, channel, data)
    ccall((:DAQmxGetAOVoltageCurrentLimit, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOVoltageCurrentLimit(taskHandle, channel, data)
    ccall((:DAQmxSetAOVoltageCurrentLimit, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAOVoltageCurrentLimit(taskHandle, channel)
    ccall((:DAQmxResetAOVoltageCurrentLimit, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOCurrentUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAOCurrentUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAOCurrentUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAOCurrentUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAOCurrentUnits(taskHandle, channel)
    ccall((:DAQmxResetAOCurrentUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOFuncGenType(taskHandle, channel, data)
    ccall((:DAQmxGetAOFuncGenType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAOFuncGenType(taskHandle, channel, data)
    ccall((:DAQmxSetAOFuncGenType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAOFuncGenType(taskHandle, channel)
    ccall((:DAQmxResetAOFuncGenType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOFuncGenFreq(taskHandle, channel, data)
    ccall((:DAQmxGetAOFuncGenFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOFuncGenFreq(taskHandle, channel, data)
    ccall((:DAQmxSetAOFuncGenFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAOFuncGenFreq(taskHandle, channel)
    ccall((:DAQmxResetAOFuncGenFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOFuncGenAmplitude(taskHandle, channel, data)
    ccall((:DAQmxGetAOFuncGenAmplitude, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOFuncGenAmplitude(taskHandle, channel, data)
    ccall((:DAQmxSetAOFuncGenAmplitude, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAOFuncGenAmplitude(taskHandle, channel)
    ccall((:DAQmxResetAOFuncGenAmplitude, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOFuncGenOffset(taskHandle, channel, data)
    ccall((:DAQmxGetAOFuncGenOffset, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOFuncGenOffset(taskHandle, channel, data)
    ccall((:DAQmxSetAOFuncGenOffset, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAOFuncGenOffset(taskHandle, channel)
    ccall((:DAQmxResetAOFuncGenOffset, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOFuncGenSquareDutyCycle(taskHandle, channel, data)
    ccall((:DAQmxGetAOFuncGenSquareDutyCycle, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOFuncGenSquareDutyCycle(taskHandle, channel, data)
    ccall((:DAQmxSetAOFuncGenSquareDutyCycle, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAOFuncGenSquareDutyCycle(taskHandle, channel)
    ccall((:DAQmxResetAOFuncGenSquareDutyCycle, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOFuncGenModulationType(taskHandle, channel, data)
    ccall((:DAQmxGetAOFuncGenModulationType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAOFuncGenModulationType(taskHandle, channel, data)
    ccall((:DAQmxSetAOFuncGenModulationType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAOFuncGenModulationType(taskHandle, channel)
    ccall((:DAQmxResetAOFuncGenModulationType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOFuncGenFMDeviation(taskHandle, channel, data)
    ccall((:DAQmxGetAOFuncGenFMDeviation, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOFuncGenFMDeviation(taskHandle, channel, data)
    ccall((:DAQmxSetAOFuncGenFMDeviation, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAOFuncGenFMDeviation(taskHandle, channel)
    ccall((:DAQmxResetAOFuncGenFMDeviation, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOOutputImpedance(taskHandle, channel, data)
    ccall((:DAQmxGetAOOutputImpedance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOOutputImpedance(taskHandle, channel, data)
    ccall((:DAQmxSetAOOutputImpedance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAOOutputImpedance(taskHandle, channel)
    ccall((:DAQmxResetAOOutputImpedance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOLoadImpedance(taskHandle, channel, data)
    ccall((:DAQmxGetAOLoadImpedance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOLoadImpedance(taskHandle, channel, data)
    ccall((:DAQmxSetAOLoadImpedance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAOLoadImpedance(taskHandle, channel)
    ccall((:DAQmxResetAOLoadImpedance, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOIdleOutputBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetAOIdleOutputBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAOIdleOutputBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetAOIdleOutputBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAOIdleOutputBehavior(taskHandle, channel)
    ccall((:DAQmxResetAOIdleOutputBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetAOTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAOTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetAOTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAOTermCfg(taskHandle, channel)
    ccall((:DAQmxResetAOTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOResolutionUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAOResolutionUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAOResolutionUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAOResolutionUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAOResolutionUnits(taskHandle, channel)
    ccall((:DAQmxResetAOResolutionUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOResolution(taskHandle, channel, data)
    ccall((:DAQmxGetAOResolution, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxGetAODACRngHigh(taskHandle, channel, data)
    ccall((:DAQmxGetAODACRngHigh, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAODACRngHigh(taskHandle, channel, data)
    ccall((:DAQmxSetAODACRngHigh, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAODACRngHigh(taskHandle, channel)
    ccall((:DAQmxResetAODACRngHigh, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAODACRngLow(taskHandle, channel, data)
    ccall((:DAQmxGetAODACRngLow, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAODACRngLow(taskHandle, channel, data)
    ccall((:DAQmxSetAODACRngLow, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAODACRngLow(taskHandle, channel)
    ccall((:DAQmxResetAODACRngLow, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAODACRefConnToGnd(taskHandle, channel, data)
    ccall((:DAQmxGetAODACRefConnToGnd, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAODACRefConnToGnd(taskHandle, channel, data)
    ccall((:DAQmxSetAODACRefConnToGnd, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAODACRefConnToGnd(taskHandle, channel)
    ccall((:DAQmxResetAODACRefConnToGnd, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAODACRefAllowConnToGnd(taskHandle, channel, data)
    ccall((:DAQmxGetAODACRefAllowConnToGnd, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAODACRefAllowConnToGnd(taskHandle, channel, data)
    ccall((:DAQmxSetAODACRefAllowConnToGnd, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAODACRefAllowConnToGnd(taskHandle, channel)
    ccall((:DAQmxResetAODACRefAllowConnToGnd, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAODACRefSrc(taskHandle, channel, data)
    ccall((:DAQmxGetAODACRefSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAODACRefSrc(taskHandle, channel, data)
    ccall((:DAQmxSetAODACRefSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAODACRefSrc(taskHandle, channel)
    ccall((:DAQmxResetAODACRefSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAODACRefExtSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetAODACRefExtSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetAODACRefExtSrc(taskHandle, channel, data)
    ccall((:DAQmxSetAODACRefExtSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetAODACRefExtSrc(taskHandle, channel)
    ccall((:DAQmxResetAODACRefExtSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAODACRefVal(taskHandle, channel, data)
    ccall((:DAQmxGetAODACRefVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAODACRefVal(taskHandle, channel, data)
    ccall((:DAQmxSetAODACRefVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAODACRefVal(taskHandle, channel)
    ccall((:DAQmxResetAODACRefVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAODACOffsetSrc(taskHandle, channel, data)
    ccall((:DAQmxGetAODACOffsetSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAODACOffsetSrc(taskHandle, channel, data)
    ccall((:DAQmxSetAODACOffsetSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAODACOffsetSrc(taskHandle, channel)
    ccall((:DAQmxResetAODACOffsetSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAODACOffsetExtSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetAODACOffsetExtSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetAODACOffsetExtSrc(taskHandle, channel, data)
    ccall((:DAQmxSetAODACOffsetExtSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetAODACOffsetExtSrc(taskHandle, channel)
    ccall((:DAQmxResetAODACOffsetExtSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAODACOffsetVal(taskHandle, channel, data)
    ccall((:DAQmxGetAODACOffsetVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAODACOffsetVal(taskHandle, channel, data)
    ccall((:DAQmxSetAODACOffsetVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAODACOffsetVal(taskHandle, channel)
    ccall((:DAQmxResetAODACOffsetVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOReglitchEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAOReglitchEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAOReglitchEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAOReglitchEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAOReglitchEnable(taskHandle, channel)
    ccall((:DAQmxResetAOReglitchEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOFilterDelay(taskHandle, channel, data)
    ccall((:DAQmxGetAOFilterDelay, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOFilterDelay(taskHandle, channel, data)
    ccall((:DAQmxSetAOFilterDelay, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAOFilterDelay(taskHandle, channel)
    ccall((:DAQmxResetAOFilterDelay, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOFilterDelayUnits(taskHandle, channel, data)
    ccall((:DAQmxGetAOFilterDelayUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAOFilterDelayUnits(taskHandle, channel, data)
    ccall((:DAQmxSetAOFilterDelayUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAOFilterDelayUnits(taskHandle, channel)
    ccall((:DAQmxResetAOFilterDelayUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOFilterDelayAdjustment(taskHandle, channel, data)
    ccall((:DAQmxGetAOFilterDelayAdjustment, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOFilterDelayAdjustment(taskHandle, channel, data)
    ccall((:DAQmxSetAOFilterDelayAdjustment, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAOFilterDelayAdjustment(taskHandle, channel)
    ccall((:DAQmxResetAOFilterDelayAdjustment, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOGain(taskHandle, channel, data)
    ccall((:DAQmxGetAOGain, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetAOGain(taskHandle, channel, data)
    ccall((:DAQmxSetAOGain, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetAOGain(taskHandle, channel)
    ccall((:DAQmxResetAOGain, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOUseOnlyOnBrdMem(taskHandle, channel, data)
    ccall((:DAQmxGetAOUseOnlyOnBrdMem, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAOUseOnlyOnBrdMem(taskHandle, channel, data)
    ccall((:DAQmxSetAOUseOnlyOnBrdMem, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAOUseOnlyOnBrdMem(taskHandle, channel)
    ccall((:DAQmxResetAOUseOnlyOnBrdMem, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAODataXferMech(taskHandle, channel, data)
    ccall((:DAQmxGetAODataXferMech, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAODataXferMech(taskHandle, channel, data)
    ccall((:DAQmxSetAODataXferMech, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAODataXferMech(taskHandle, channel)
    ccall((:DAQmxResetAODataXferMech, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAODataXferReqCond(taskHandle, channel, data)
    ccall((:DAQmxGetAODataXferReqCond, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetAODataXferReqCond(taskHandle, channel, data)
    ccall((:DAQmxSetAODataXferReqCond, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetAODataXferReqCond(taskHandle, channel)
    ccall((:DAQmxResetAODataXferReqCond, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOUsbXferReqSize(taskHandle, channel, data)
    ccall((:DAQmxGetAOUsbXferReqSize, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetAOUsbXferReqSize(taskHandle, channel, data)
    ccall((:DAQmxSetAOUsbXferReqSize, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetAOUsbXferReqSize(taskHandle, channel)
    ccall((:DAQmxResetAOUsbXferReqSize, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOUsbXferReqCount(taskHandle, channel, data)
    ccall((:DAQmxGetAOUsbXferReqCount, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetAOUsbXferReqCount(taskHandle, channel, data)
    ccall((:DAQmxSetAOUsbXferReqCount, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetAOUsbXferReqCount(taskHandle, channel)
    ccall((:DAQmxResetAOUsbXferReqCount, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAOMemMapEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAOMemMapEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAOMemMapEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAOMemMapEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAOMemMapEnable(taskHandle, channel)
    ccall((:DAQmxResetAOMemMapEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetAODevScalingCoeff(taskHandle, channel, data, arraySizeInElements)
    ccall((:DAQmxGetAODevScalingCoeff, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}, uInt32), taskHandle, channel, data, arraySizeInElements)
end

function DAQmxGetAOEnhancedImageRejectionEnable(taskHandle, channel, data)
    ccall((:DAQmxGetAOEnhancedImageRejectionEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetAOEnhancedImageRejectionEnable(taskHandle, channel, data)
    ccall((:DAQmxSetAOEnhancedImageRejectionEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetAOEnhancedImageRejectionEnable(taskHandle, channel)
    ccall((:DAQmxResetAOEnhancedImageRejectionEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDIInvertLines(taskHandle, channel, data)
    ccall((:DAQmxGetDIInvertLines, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetDIInvertLines(taskHandle, channel, data)
    ccall((:DAQmxSetDIInvertLines, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetDIInvertLines(taskHandle, channel)
    ccall((:DAQmxResetDIInvertLines, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDINumLines(taskHandle, channel, data)
    ccall((:DAQmxGetDINumLines, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxGetDIDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetDIDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetDIDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetDIDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetDIDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetDIDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDIDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetDIDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetDIDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetDIDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetDIDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetDIDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDIDigFltrEnableBusMode(taskHandle, channel, data)
    ccall((:DAQmxGetDIDigFltrEnableBusMode, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetDIDigFltrEnableBusMode(taskHandle, channel, data)
    ccall((:DAQmxSetDIDigFltrEnableBusMode, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetDIDigFltrEnableBusMode(taskHandle, channel)
    ccall((:DAQmxResetDIDigFltrEnableBusMode, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDIDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetDIDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetDIDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetDIDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetDIDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetDIDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDIDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetDIDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetDIDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetDIDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetDIDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetDIDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDIDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetDIDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetDIDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetDIDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetDIDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetDIDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDITristate(taskHandle, channel, data)
    ccall((:DAQmxGetDITristate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetDITristate(taskHandle, channel, data)
    ccall((:DAQmxSetDITristate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetDITristate(taskHandle, channel)
    ccall((:DAQmxResetDITristate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDILogicFamily(taskHandle, channel, data)
    ccall((:DAQmxGetDILogicFamily, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetDILogicFamily(taskHandle, channel, data)
    ccall((:DAQmxSetDILogicFamily, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetDILogicFamily(taskHandle, channel)
    ccall((:DAQmxResetDILogicFamily, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDIDataXferMech(taskHandle, channel, data)
    ccall((:DAQmxGetDIDataXferMech, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetDIDataXferMech(taskHandle, channel, data)
    ccall((:DAQmxSetDIDataXferMech, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetDIDataXferMech(taskHandle, channel)
    ccall((:DAQmxResetDIDataXferMech, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDIDataXferReqCond(taskHandle, channel, data)
    ccall((:DAQmxGetDIDataXferReqCond, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetDIDataXferReqCond(taskHandle, channel, data)
    ccall((:DAQmxSetDIDataXferReqCond, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetDIDataXferReqCond(taskHandle, channel)
    ccall((:DAQmxResetDIDataXferReqCond, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDIUsbXferReqSize(taskHandle, channel, data)
    ccall((:DAQmxGetDIUsbXferReqSize, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetDIUsbXferReqSize(taskHandle, channel, data)
    ccall((:DAQmxSetDIUsbXferReqSize, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetDIUsbXferReqSize(taskHandle, channel)
    ccall((:DAQmxResetDIUsbXferReqSize, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDIUsbXferReqCount(taskHandle, channel, data)
    ccall((:DAQmxGetDIUsbXferReqCount, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetDIUsbXferReqCount(taskHandle, channel, data)
    ccall((:DAQmxSetDIUsbXferReqCount, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetDIUsbXferReqCount(taskHandle, channel)
    ccall((:DAQmxResetDIUsbXferReqCount, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDIMemMapEnable(taskHandle, channel, data)
    ccall((:DAQmxGetDIMemMapEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetDIMemMapEnable(taskHandle, channel, data)
    ccall((:DAQmxSetDIMemMapEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetDIMemMapEnable(taskHandle, channel)
    ccall((:DAQmxResetDIMemMapEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDIAcquireOn(taskHandle, channel, data)
    ccall((:DAQmxGetDIAcquireOn, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetDIAcquireOn(taskHandle, channel, data)
    ccall((:DAQmxSetDIAcquireOn, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetDIAcquireOn(taskHandle, channel)
    ccall((:DAQmxResetDIAcquireOn, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDOOutputDriveType(taskHandle, channel, data)
    ccall((:DAQmxGetDOOutputDriveType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetDOOutputDriveType(taskHandle, channel, data)
    ccall((:DAQmxSetDOOutputDriveType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetDOOutputDriveType(taskHandle, channel)
    ccall((:DAQmxResetDOOutputDriveType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDOInvertLines(taskHandle, channel, data)
    ccall((:DAQmxGetDOInvertLines, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetDOInvertLines(taskHandle, channel, data)
    ccall((:DAQmxSetDOInvertLines, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetDOInvertLines(taskHandle, channel)
    ccall((:DAQmxResetDOInvertLines, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDONumLines(taskHandle, channel, data)
    ccall((:DAQmxGetDONumLines, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxGetDOTristate(taskHandle, channel, data)
    ccall((:DAQmxGetDOTristate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetDOTristate(taskHandle, channel, data)
    ccall((:DAQmxSetDOTristate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetDOTristate(taskHandle, channel)
    ccall((:DAQmxResetDOTristate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDOLineStatesStartState(taskHandle, channel, data)
    ccall((:DAQmxGetDOLineStatesStartState, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetDOLineStatesStartState(taskHandle, channel, data)
    ccall((:DAQmxSetDOLineStatesStartState, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetDOLineStatesStartState(taskHandle, channel)
    ccall((:DAQmxResetDOLineStatesStartState, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDOLineStatesPausedState(taskHandle, channel, data)
    ccall((:DAQmxGetDOLineStatesPausedState, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetDOLineStatesPausedState(taskHandle, channel, data)
    ccall((:DAQmxSetDOLineStatesPausedState, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetDOLineStatesPausedState(taskHandle, channel)
    ccall((:DAQmxResetDOLineStatesPausedState, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDOLineStatesDoneState(taskHandle, channel, data)
    ccall((:DAQmxGetDOLineStatesDoneState, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetDOLineStatesDoneState(taskHandle, channel, data)
    ccall((:DAQmxSetDOLineStatesDoneState, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetDOLineStatesDoneState(taskHandle, channel)
    ccall((:DAQmxResetDOLineStatesDoneState, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDOLogicFamily(taskHandle, channel, data)
    ccall((:DAQmxGetDOLogicFamily, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetDOLogicFamily(taskHandle, channel, data)
    ccall((:DAQmxSetDOLogicFamily, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetDOLogicFamily(taskHandle, channel)
    ccall((:DAQmxResetDOLogicFamily, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDOOvercurrentLimit(taskHandle, channel, data)
    ccall((:DAQmxGetDOOvercurrentLimit, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetDOOvercurrentLimit(taskHandle, channel, data)
    ccall((:DAQmxSetDOOvercurrentLimit, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetDOOvercurrentLimit(taskHandle, channel)
    ccall((:DAQmxResetDOOvercurrentLimit, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDOOvercurrentAutoReenable(taskHandle, channel, data)
    ccall((:DAQmxGetDOOvercurrentAutoReenable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetDOOvercurrentAutoReenable(taskHandle, channel, data)
    ccall((:DAQmxSetDOOvercurrentAutoReenable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetDOOvercurrentAutoReenable(taskHandle, channel)
    ccall((:DAQmxResetDOOvercurrentAutoReenable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDOOvercurrentReenablePeriod(taskHandle, channel, data)
    ccall((:DAQmxGetDOOvercurrentReenablePeriod, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetDOOvercurrentReenablePeriod(taskHandle, channel, data)
    ccall((:DAQmxSetDOOvercurrentReenablePeriod, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetDOOvercurrentReenablePeriod(taskHandle, channel)
    ccall((:DAQmxResetDOOvercurrentReenablePeriod, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDOUseOnlyOnBrdMem(taskHandle, channel, data)
    ccall((:DAQmxGetDOUseOnlyOnBrdMem, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetDOUseOnlyOnBrdMem(taskHandle, channel, data)
    ccall((:DAQmxSetDOUseOnlyOnBrdMem, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetDOUseOnlyOnBrdMem(taskHandle, channel)
    ccall((:DAQmxResetDOUseOnlyOnBrdMem, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDODataXferMech(taskHandle, channel, data)
    ccall((:DAQmxGetDODataXferMech, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetDODataXferMech(taskHandle, channel, data)
    ccall((:DAQmxSetDODataXferMech, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetDODataXferMech(taskHandle, channel)
    ccall((:DAQmxResetDODataXferMech, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDODataXferReqCond(taskHandle, channel, data)
    ccall((:DAQmxGetDODataXferReqCond, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetDODataXferReqCond(taskHandle, channel, data)
    ccall((:DAQmxSetDODataXferReqCond, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetDODataXferReqCond(taskHandle, channel)
    ccall((:DAQmxResetDODataXferReqCond, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDOUsbXferReqSize(taskHandle, channel, data)
    ccall((:DAQmxGetDOUsbXferReqSize, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetDOUsbXferReqSize(taskHandle, channel, data)
    ccall((:DAQmxSetDOUsbXferReqSize, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetDOUsbXferReqSize(taskHandle, channel)
    ccall((:DAQmxResetDOUsbXferReqSize, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDOUsbXferReqCount(taskHandle, channel, data)
    ccall((:DAQmxGetDOUsbXferReqCount, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetDOUsbXferReqCount(taskHandle, channel, data)
    ccall((:DAQmxSetDOUsbXferReqCount, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetDOUsbXferReqCount(taskHandle, channel)
    ccall((:DAQmxResetDOUsbXferReqCount, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDOMemMapEnable(taskHandle, channel, data)
    ccall((:DAQmxGetDOMemMapEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetDOMemMapEnable(taskHandle, channel, data)
    ccall((:DAQmxSetDOMemMapEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetDOMemMapEnable(taskHandle, channel)
    ccall((:DAQmxResetDOMemMapEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDOGenerateOn(taskHandle, channel, data)
    ccall((:DAQmxGetDOGenerateOn, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetDOGenerateOn(taskHandle, channel, data)
    ccall((:DAQmxSetDOGenerateOn, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetDOGenerateOn(taskHandle, channel)
    ccall((:DAQmxResetDOGenerateOn, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIMax(taskHandle, channel, data)
    ccall((:DAQmxGetCIMax, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIMax(taskHandle, channel, data)
    ccall((:DAQmxSetCIMax, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIMax(taskHandle, channel)
    ccall((:DAQmxResetCIMax, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIMin(taskHandle, channel, data)
    ccall((:DAQmxGetCIMin, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIMin(taskHandle, channel, data)
    ccall((:DAQmxSetCIMin, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIMin(taskHandle, channel)
    ccall((:DAQmxResetCIMin, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICustomScaleName(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCICustomScaleName, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCICustomScaleName(taskHandle, channel, data)
    ccall((:DAQmxSetCICustomScaleName, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCICustomScaleName(taskHandle, channel)
    ccall((:DAQmxResetCICustomScaleName, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIMeasType(taskHandle, channel, data)
    ccall((:DAQmxGetCIMeasType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxGetCIFreqUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCIFreqUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIFreqUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIFreqUnits(taskHandle, channel)
    ccall((:DAQmxResetCIFreqUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIFreqTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIFreqTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIFreqTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCIFreqTerm(taskHandle, channel)
    ccall((:DAQmxResetCIFreqTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIFreqTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCIFreqTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIFreqTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIFreqTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCIFreqTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIFreqLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCIFreqLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIFreqLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIFreqLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCIFreqLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIFreqDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIFreqDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIFreqDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIFreqDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCIFreqDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIFreqDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCIFreqDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIFreqDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIFreqDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCIFreqDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIFreqDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIFreqDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIFreqDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCIFreqDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCIFreqDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIFreqDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCIFreqDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIFreqDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIFreqDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCIFreqDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIFreqDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIFreqDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIFreqDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIFreqDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCIFreqDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIFreqStartingEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCIFreqStartingEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIFreqStartingEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqStartingEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIFreqStartingEdge(taskHandle, channel)
    ccall((:DAQmxResetCIFreqStartingEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIFreqMeasMeth(taskHandle, channel, data)
    ccall((:DAQmxGetCIFreqMeasMeth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIFreqMeasMeth(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqMeasMeth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIFreqMeasMeth(taskHandle, channel)
    ccall((:DAQmxResetCIFreqMeasMeth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIFreqEnableAveraging(taskHandle, channel, data)
    ccall((:DAQmxGetCIFreqEnableAveraging, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIFreqEnableAveraging(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqEnableAveraging, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIFreqEnableAveraging(taskHandle, channel)
    ccall((:DAQmxResetCIFreqEnableAveraging, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIFreqMeasTime(taskHandle, channel, data)
    ccall((:DAQmxGetCIFreqMeasTime, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIFreqMeasTime(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqMeasTime, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIFreqMeasTime(taskHandle, channel)
    ccall((:DAQmxResetCIFreqMeasTime, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIFreqDiv(taskHandle, channel, data)
    ccall((:DAQmxGetCIFreqDiv, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCIFreqDiv(taskHandle, channel, data)
    ccall((:DAQmxSetCIFreqDiv, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCIFreqDiv(taskHandle, channel)
    ccall((:DAQmxResetCIFreqDiv, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPeriodUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCIPeriodUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPeriodUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPeriodUnits(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPeriodTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIPeriodTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIPeriodTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCIPeriodTerm(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPeriodTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCIPeriodTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPeriodTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPeriodTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPeriodLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCIPeriodLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPeriodLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPeriodLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPeriodDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIPeriodDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIPeriodDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIPeriodDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPeriodDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCIPeriodDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIPeriodDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIPeriodDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPeriodDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIPeriodDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIPeriodDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCIPeriodDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPeriodDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCIPeriodDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIPeriodDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIPeriodDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPeriodDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIPeriodDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIPeriodDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIPeriodDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPeriodStartingEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCIPeriodStartingEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPeriodStartingEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodStartingEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPeriodStartingEdge(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodStartingEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPeriodMeasMeth(taskHandle, channel, data)
    ccall((:DAQmxGetCIPeriodMeasMeth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPeriodMeasMeth(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodMeasMeth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPeriodMeasMeth(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodMeasMeth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPeriodEnableAveraging(taskHandle, channel, data)
    ccall((:DAQmxGetCIPeriodEnableAveraging, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIPeriodEnableAveraging(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodEnableAveraging, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIPeriodEnableAveraging(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodEnableAveraging, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPeriodMeasTime(taskHandle, channel, data)
    ccall((:DAQmxGetCIPeriodMeasTime, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIPeriodMeasTime(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodMeasTime, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIPeriodMeasTime(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodMeasTime, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPeriodDiv(taskHandle, channel, data)
    ccall((:DAQmxGetCIPeriodDiv, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCIPeriodDiv(taskHandle, channel, data)
    ccall((:DAQmxSetCIPeriodDiv, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCIPeriodDiv(taskHandle, channel)
    ccall((:DAQmxResetCIPeriodDiv, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCICountEdgesTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCICountEdgesTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesTerm(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCICountEdgesDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCICountEdgesDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesDir(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesDir, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesDir(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesDir, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesDir(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesDir, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesDirTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCICountEdgesDirTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCICountEdgesDirTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesDirTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesDirTerm(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesDirTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountDirTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountDirTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountDirTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountDirTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountDirTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountDirTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountDirLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountDirLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountDirLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountDirLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountDirLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountDirLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountDirDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountDirDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountDirDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountDirDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountDirDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountDirDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountDirDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountDirDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountDirDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountDirDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountDirDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountDirDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountDirDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCICountEdgesCountDirDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCICountEdgesCountDirDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountDirDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountDirDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountDirDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountDirDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountDirDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountDirDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountDirDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountDirDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountDirDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountDirDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountDirDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountDirDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountDirDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountDirDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountDirDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesInitialCnt(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesInitialCnt, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesInitialCnt(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesInitialCnt, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesInitialCnt(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesInitialCnt, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesActiveEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesActiveEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesActiveEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesActiveEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesActiveEdge(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesActiveEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountResetEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountResetEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountResetEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountResetEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountResetEnable(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountResetEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountResetResetCount(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountResetResetCount, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountResetResetCount(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountResetResetCount, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountResetResetCount(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountResetResetCount, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountResetTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCICountEdgesCountResetTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCICountEdgesCountResetTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountResetTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountResetTerm(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountResetTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountResetTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountResetTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountResetTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountResetTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountResetTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountResetTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountResetLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountResetLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountResetLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountResetLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountResetLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountResetLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountResetDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountResetDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountResetDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountResetDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountResetDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountResetDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountResetDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountResetDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountResetDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountResetDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountResetDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountResetDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountResetDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCICountEdgesCountResetDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCICountEdgesCountResetDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountResetDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountResetDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountResetDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountResetDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountResetDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountResetDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountResetDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountResetDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountResetDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountResetDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountResetDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountResetDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountResetDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountResetDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountResetDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesCountResetActiveEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesCountResetActiveEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesCountResetActiveEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesCountResetActiveEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesCountResetActiveEdge(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesCountResetActiveEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesGateEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesGateEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesGateEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesGateEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesGateEnable(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesGateEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesGateTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCICountEdgesGateTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCICountEdgesGateTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesGateTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesGateTerm(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesGateTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesGateTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesGateTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesGateTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesGateTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesGateTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesGateTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesGateLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesGateLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesGateLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesGateLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesGateLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesGateLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesGateDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesGateDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesGateDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesGateDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesGateDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesGateDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesGateDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesGateDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesGateDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesGateDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesGateDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesGateDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesGateDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCICountEdgesGateDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCICountEdgesGateDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesGateDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesGateDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesGateDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesGateDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesGateDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesGateDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesGateDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesGateDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesGateDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICountEdgesGateWhen(taskHandle, channel, data)
    ccall((:DAQmxGetCICountEdgesGateWhen, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCICountEdgesGateWhen(taskHandle, channel, data)
    ccall((:DAQmxSetCICountEdgesGateWhen, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCICountEdgesGateWhen(taskHandle, channel)
    ccall((:DAQmxResetCICountEdgesGateWhen, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIDutyCycleTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIDutyCycleTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIDutyCycleTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCIDutyCycleTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCIDutyCycleTerm(taskHandle, channel)
    ccall((:DAQmxResetCIDutyCycleTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIDutyCycleTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCIDutyCycleTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIDutyCycleTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCIDutyCycleTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIDutyCycleTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCIDutyCycleTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIDutyCycleLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCIDutyCycleLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIDutyCycleLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCIDutyCycleLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIDutyCycleLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCIDutyCycleLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIDutyCycleDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIDutyCycleDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIDutyCycleDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIDutyCycleDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIDutyCycleDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCIDutyCycleDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIDutyCycleDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCIDutyCycleDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIDutyCycleDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCIDutyCycleDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIDutyCycleDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCIDutyCycleDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIDutyCycleDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIDutyCycleDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIDutyCycleDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCIDutyCycleDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCIDutyCycleDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCIDutyCycleDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIDutyCycleDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCIDutyCycleDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIDutyCycleDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCIDutyCycleDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIDutyCycleDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCIDutyCycleDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIDutyCycleStartingEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCIDutyCycleStartingEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIDutyCycleStartingEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCIDutyCycleStartingEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIDutyCycleStartingEdge(taskHandle, channel)
    ccall((:DAQmxResetCIDutyCycleStartingEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIAngEncoderUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCIAngEncoderUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIAngEncoderUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCIAngEncoderUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIAngEncoderUnits(taskHandle, channel)
    ccall((:DAQmxResetCIAngEncoderUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIAngEncoderPulsesPerRev(taskHandle, channel, data)
    ccall((:DAQmxGetCIAngEncoderPulsesPerRev, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCIAngEncoderPulsesPerRev(taskHandle, channel, data)
    ccall((:DAQmxSetCIAngEncoderPulsesPerRev, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCIAngEncoderPulsesPerRev(taskHandle, channel)
    ccall((:DAQmxResetCIAngEncoderPulsesPerRev, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIAngEncoderInitialAngle(taskHandle, channel, data)
    ccall((:DAQmxGetCIAngEncoderInitialAngle, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIAngEncoderInitialAngle(taskHandle, channel, data)
    ccall((:DAQmxSetCIAngEncoderInitialAngle, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIAngEncoderInitialAngle(taskHandle, channel)
    ccall((:DAQmxResetCIAngEncoderInitialAngle, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCILinEncoderUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCILinEncoderUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCILinEncoderUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCILinEncoderUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCILinEncoderUnits(taskHandle, channel)
    ccall((:DAQmxResetCILinEncoderUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCILinEncoderDistPerPulse(taskHandle, channel, data)
    ccall((:DAQmxGetCILinEncoderDistPerPulse, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCILinEncoderDistPerPulse(taskHandle, channel, data)
    ccall((:DAQmxSetCILinEncoderDistPerPulse, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCILinEncoderDistPerPulse(taskHandle, channel)
    ccall((:DAQmxResetCILinEncoderDistPerPulse, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCILinEncoderInitialPos(taskHandle, channel, data)
    ccall((:DAQmxGetCILinEncoderInitialPos, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCILinEncoderInitialPos(taskHandle, channel, data)
    ccall((:DAQmxSetCILinEncoderInitialPos, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCILinEncoderInitialPos(taskHandle, channel)
    ccall((:DAQmxResetCILinEncoderInitialPos, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderDecodingType(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderDecodingType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderDecodingType(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderDecodingType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderDecodingType(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderDecodingType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderAInputTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIEncoderAInputTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIEncoderAInputTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderAInputTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCIEncoderAInputTerm(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderAInputTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderAInputTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderAInputTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderAInputTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderAInputTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderAInputTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderAInputTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderAInputLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderAInputLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderAInputLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderAInputLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderAInputLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderAInputLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderAInputDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderAInputDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderAInputDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderAInputDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderAInputDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderAInputDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderAInputDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderAInputDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderAInputDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderAInputDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIEncoderAInputDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderAInputDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderAInputDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIEncoderAInputDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIEncoderAInputDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderAInputDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCIEncoderAInputDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderAInputDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderAInputDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderAInputDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderAInputDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderAInputDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIEncoderAInputDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderAInputDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderAInputDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderAInputDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderAInputDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderAInputDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderAInputDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderAInputDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderBInputTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIEncoderBInputTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIEncoderBInputTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderBInputTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCIEncoderBInputTerm(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderBInputTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderBInputTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderBInputTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderBInputTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderBInputTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderBInputTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderBInputTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderBInputLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderBInputLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderBInputLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderBInputLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderBInputLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderBInputLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderBInputDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderBInputDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderBInputDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderBInputDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderBInputDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderBInputDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderBInputDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderBInputDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderBInputDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderBInputDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIEncoderBInputDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderBInputDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderBInputDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIEncoderBInputDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIEncoderBInputDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderBInputDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCIEncoderBInputDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderBInputDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderBInputDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderBInputDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderBInputDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderBInputDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIEncoderBInputDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderBInputDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderBInputDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderBInputDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderBInputDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderBInputDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderBInputDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderBInputDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderZInputTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIEncoderZInputTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIEncoderZInputTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderZInputTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCIEncoderZInputTerm(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderZInputTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderZInputTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderZInputTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderZInputTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderZInputTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderZInputTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderZInputTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderZInputLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderZInputLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderZInputLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderZInputLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderZInputLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderZInputLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderZInputDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderZInputDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderZInputDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderZInputDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderZInputDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderZInputDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderZInputDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderZInputDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderZInputDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderZInputDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIEncoderZInputDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderZInputDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderZInputDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIEncoderZInputDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIEncoderZInputDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderZInputDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCIEncoderZInputDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderZInputDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderZInputDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderZInputDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderZInputDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderZInputDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIEncoderZInputDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderZInputDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderZInputDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderZInputDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderZInputDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderZInputDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderZInputDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderZInputDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderZIndexEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderZIndexEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderZIndexEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderZIndexEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderZIndexEnable(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderZIndexEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderZIndexVal(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderZIndexVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderZIndexVal(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderZIndexVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIEncoderZIndexVal(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderZIndexVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIEncoderZIndexPhase(taskHandle, channel, data)
    ccall((:DAQmxGetCIEncoderZIndexPhase, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIEncoderZIndexPhase(taskHandle, channel, data)
    ccall((:DAQmxSetCIEncoderZIndexPhase, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIEncoderZIndexPhase(taskHandle, channel)
    ccall((:DAQmxResetCIEncoderZIndexPhase, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseWidthUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseWidthUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseWidthUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseWidthUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseWidthUnits(taskHandle, channel)
    ccall((:DAQmxResetCIPulseWidthUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseWidthTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIPulseWidthTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIPulseWidthTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseWidthTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCIPulseWidthTerm(taskHandle, channel)
    ccall((:DAQmxResetCIPulseWidthTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseWidthTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseWidthTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseWidthTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseWidthTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseWidthTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCIPulseWidthTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseWidthLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseWidthLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseWidthLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseWidthLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseWidthLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCIPulseWidthLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseWidthDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseWidthDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseWidthDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseWidthDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIPulseWidthDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCIPulseWidthDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseWidthDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseWidthDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIPulseWidthDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseWidthDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIPulseWidthDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCIPulseWidthDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseWidthDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIPulseWidthDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIPulseWidthDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseWidthDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCIPulseWidthDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCIPulseWidthDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseWidthDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseWidthDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIPulseWidthDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseWidthDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIPulseWidthDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCIPulseWidthDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseWidthDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseWidthDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseWidthDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseWidthDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIPulseWidthDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCIPulseWidthDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseWidthStartingEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseWidthStartingEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseWidthStartingEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseWidthStartingEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseWidthStartingEdge(taskHandle, channel)
    ccall((:DAQmxResetCIPulseWidthStartingEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCITimestampUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCITimestampUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCITimestampUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCITimestampUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCITimestampUnits(taskHandle, channel)
    ccall((:DAQmxResetCITimestampUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCITimestampInitialSeconds(taskHandle, channel, data)
    ccall((:DAQmxGetCITimestampInitialSeconds, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCITimestampInitialSeconds(taskHandle, channel, data)
    ccall((:DAQmxSetCITimestampInitialSeconds, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCITimestampInitialSeconds(taskHandle, channel)
    ccall((:DAQmxResetCITimestampInitialSeconds, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIGPSSyncMethod(taskHandle, channel, data)
    ccall((:DAQmxGetCIGPSSyncMethod, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIGPSSyncMethod(taskHandle, channel, data)
    ccall((:DAQmxSetCIGPSSyncMethod, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIGPSSyncMethod(taskHandle, channel)
    ccall((:DAQmxResetCIGPSSyncMethod, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIGPSSyncSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIGPSSyncSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIGPSSyncSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCIGPSSyncSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCIGPSSyncSrc(taskHandle, channel)
    ccall((:DAQmxResetCIGPSSyncSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIVelocityAngEncoderUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityAngEncoderUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityAngEncoderUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityAngEncoderUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIVelocityAngEncoderUnits(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityAngEncoderUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIVelocityAngEncoderPulsesPerRev(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityAngEncoderPulsesPerRev, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityAngEncoderPulsesPerRev(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityAngEncoderPulsesPerRev, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCIVelocityAngEncoderPulsesPerRev(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityAngEncoderPulsesPerRev, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIVelocityLinEncoderUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityLinEncoderUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityLinEncoderUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityLinEncoderUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIVelocityLinEncoderUnits(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityLinEncoderUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIVelocityLinEncoderDistPerPulse(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityLinEncoderDistPerPulse, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityLinEncoderDistPerPulse(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityLinEncoderDistPerPulse, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIVelocityLinEncoderDistPerPulse(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityLinEncoderDistPerPulse, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderDecodingType(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityEncoderDecodingType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityEncoderDecodingType(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderDecodingType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderDecodingType(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderDecodingType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderAInputTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIVelocityEncoderAInputTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIVelocityEncoderAInputTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderAInputTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderAInputTerm(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderAInputTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderAInputTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityEncoderAInputTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityEncoderAInputTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderAInputTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderAInputTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderAInputTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderAInputLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityEncoderAInputLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityEncoderAInputLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderAInputLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderAInputLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderAInputLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderAInputDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityEncoderAInputDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityEncoderAInputDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderAInputDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderAInputDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderAInputDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderAInputDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityEncoderAInputDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityEncoderAInputDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderAInputDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderAInputDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderAInputDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderAInputDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIVelocityEncoderAInputDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIVelocityEncoderAInputDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderAInputDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderAInputDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderAInputDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderAInputDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityEncoderAInputDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityEncoderAInputDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderAInputDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderAInputDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderAInputDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderBInputTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIVelocityEncoderBInputTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIVelocityEncoderBInputTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderBInputTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderBInputTerm(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderBInputTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderBInputTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityEncoderBInputTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityEncoderBInputTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderBInputTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderBInputTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderBInputTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderBInputLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityEncoderBInputLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityEncoderBInputLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderBInputLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderBInputLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderBInputLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderBInputDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityEncoderBInputDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityEncoderBInputDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderBInputDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderBInputDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderBInputDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderBInputDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityEncoderBInputDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityEncoderBInputDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderBInputDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderBInputDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderBInputDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderBInputDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIVelocityEncoderBInputDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIVelocityEncoderBInputDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderBInputDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderBInputDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderBInputDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIVelocityEncoderBInputDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityEncoderBInputDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityEncoderBInputDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityEncoderBInputDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIVelocityEncoderBInputDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityEncoderBInputDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIVelocityMeasTime(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityMeasTime, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityMeasTime(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityMeasTime, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIVelocityMeasTime(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityMeasTime, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIVelocityDiv(taskHandle, channel, data)
    ccall((:DAQmxGetCIVelocityDiv, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCIVelocityDiv(taskHandle, channel, data)
    ccall((:DAQmxSetCIVelocityDiv, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCIVelocityDiv(taskHandle, channel)
    ccall((:DAQmxResetCIVelocityDiv, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepUnits(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepFirstTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCITwoEdgeSepFirstTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCITwoEdgeSepFirstTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepFirstTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepFirstTerm(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepFirstTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepFirstTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepFirstTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepFirstTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepFirstTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepFirstTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepFirstTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepFirstLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepFirstLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepFirstLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepFirstLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepFirstLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepFirstLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepFirstDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepFirstDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepFirstDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepFirstDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepFirstDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepFirstDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepFirstDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepFirstDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepFirstDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepFirstDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepFirstDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepFirstDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepFirstDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCITwoEdgeSepFirstDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCITwoEdgeSepFirstDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepFirstDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepFirstDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepFirstDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepFirstDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepFirstDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepFirstDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepFirstDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepFirstDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepFirstDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepFirstDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepFirstDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepFirstDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepFirstDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepFirstDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepFirstDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepFirstEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepFirstEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepFirstEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepFirstEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepFirstEdge(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepFirstEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepSecondTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCITwoEdgeSepSecondTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCITwoEdgeSepSecondTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepSecondTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepSecondTerm(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepSecondTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepSecondTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepSecondTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepSecondTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepSecondTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepSecondTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepSecondTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepSecondLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepSecondLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepSecondLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepSecondLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepSecondLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepSecondLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepSecondDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepSecondDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepSecondDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepSecondDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepSecondDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepSecondDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepSecondDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepSecondDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepSecondDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepSecondDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepSecondDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepSecondDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepSecondDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCITwoEdgeSepSecondDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCITwoEdgeSepSecondDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepSecondDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepSecondDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepSecondDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepSecondDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepSecondDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepSecondDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepSecondDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepSecondDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepSecondDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepSecondDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepSecondDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepSecondDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepSecondDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepSecondDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepSecondDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCITwoEdgeSepSecondEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCITwoEdgeSepSecondEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCITwoEdgeSepSecondEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCITwoEdgeSepSecondEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCITwoEdgeSepSecondEdge(taskHandle, channel)
    ccall((:DAQmxResetCITwoEdgeSepSecondEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCISemiPeriodUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCISemiPeriodUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCISemiPeriodUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCISemiPeriodUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCISemiPeriodUnits(taskHandle, channel)
    ccall((:DAQmxResetCISemiPeriodUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCISemiPeriodTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCISemiPeriodTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCISemiPeriodTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCISemiPeriodTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCISemiPeriodTerm(taskHandle, channel)
    ccall((:DAQmxResetCISemiPeriodTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCISemiPeriodTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCISemiPeriodTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCISemiPeriodTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCISemiPeriodTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCISemiPeriodTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCISemiPeriodTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCISemiPeriodLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCISemiPeriodLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCISemiPeriodLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCISemiPeriodLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCISemiPeriodLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCISemiPeriodLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCISemiPeriodDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCISemiPeriodDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCISemiPeriodDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCISemiPeriodDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCISemiPeriodDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCISemiPeriodDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCISemiPeriodDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCISemiPeriodDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCISemiPeriodDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCISemiPeriodDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCISemiPeriodDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCISemiPeriodDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCISemiPeriodDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCISemiPeriodDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCISemiPeriodDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCISemiPeriodDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCISemiPeriodDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCISemiPeriodDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCISemiPeriodDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCISemiPeriodDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCISemiPeriodDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCISemiPeriodDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCISemiPeriodDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCISemiPeriodDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCISemiPeriodDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCISemiPeriodDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCISemiPeriodDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCISemiPeriodDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCISemiPeriodDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCISemiPeriodDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCISemiPeriodStartingEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCISemiPeriodStartingEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCISemiPeriodStartingEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCISemiPeriodStartingEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCISemiPeriodStartingEdge(taskHandle, channel)
    ccall((:DAQmxResetCISemiPeriodStartingEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseFreqUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseFreqUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseFreqUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseFreqUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseFreqUnits(taskHandle, channel)
    ccall((:DAQmxResetCIPulseFreqUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseFreqTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIPulseFreqTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIPulseFreqTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseFreqTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCIPulseFreqTerm(taskHandle, channel)
    ccall((:DAQmxResetCIPulseFreqTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseFreqTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseFreqTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseFreqTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseFreqTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseFreqTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCIPulseFreqTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseFreqLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseFreqLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseFreqLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseFreqLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseFreqLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCIPulseFreqLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseFreqDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseFreqDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseFreqDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseFreqDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIPulseFreqDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCIPulseFreqDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseFreqDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseFreqDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIPulseFreqDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseFreqDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIPulseFreqDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCIPulseFreqDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseFreqDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIPulseFreqDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIPulseFreqDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseFreqDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCIPulseFreqDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCIPulseFreqDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseFreqDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseFreqDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIPulseFreqDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseFreqDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIPulseFreqDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCIPulseFreqDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseFreqDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseFreqDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseFreqDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseFreqDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIPulseFreqDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCIPulseFreqDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseFreqStartEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseFreqStartEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseFreqStartEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseFreqStartEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseFreqStartEdge(taskHandle, channel)
    ccall((:DAQmxResetCIPulseFreqStartEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseTimeUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTimeUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTimeUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTimeUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseTimeUnits(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTimeUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseTimeTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIPulseTimeTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIPulseTimeTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTimeTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCIPulseTimeTerm(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTimeTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseTimeTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTimeTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTimeTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTimeTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseTimeTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTimeTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseTimeLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTimeLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTimeLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTimeLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseTimeLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTimeLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseTimeDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTimeDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTimeDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTimeDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIPulseTimeDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTimeDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseTimeDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTimeDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTimeDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTimeDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIPulseTimeDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTimeDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseTimeDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIPulseTimeDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIPulseTimeDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTimeDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCIPulseTimeDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTimeDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseTimeDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTimeDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTimeDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTimeDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIPulseTimeDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTimeDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseTimeDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTimeDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTimeDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTimeDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIPulseTimeDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTimeDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseTimeStartEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTimeStartEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTimeStartEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTimeStartEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseTimeStartEdge(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTimeStartEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseTicksTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIPulseTicksTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIPulseTicksTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTicksTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCIPulseTicksTerm(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTicksTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseTicksTermCfg(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTicksTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTicksTermCfg(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTicksTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseTicksTermCfg(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTicksTermCfg, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseTicksLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTicksLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTicksLogicLvlBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTicksLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseTicksLogicLvlBehavior(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTicksLogicLvlBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseTicksDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTicksDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTicksDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTicksDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIPulseTicksDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTicksDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseTicksDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTicksDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTicksDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTicksDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIPulseTicksDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTicksDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseTicksDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCIPulseTicksDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCIPulseTicksDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTicksDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCIPulseTicksDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTicksDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseTicksDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTicksDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTicksDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTicksDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIPulseTicksDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTicksDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseTicksDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTicksDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTicksDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTicksDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIPulseTicksDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTicksDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPulseTicksStartEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCIPulseTicksStartEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIPulseTicksStartEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCIPulseTicksStartEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIPulseTicksStartEdge(taskHandle, channel)
    ccall((:DAQmxResetCIPulseTicksStartEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICtrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCICtrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCICtrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCICtrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCICtrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCICtrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICtrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCICtrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICtrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCICtrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCICtrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCICtrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICtrTimebaseActiveEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCICtrTimebaseActiveEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCICtrTimebaseActiveEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCICtrTimebaseActiveEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCICtrTimebaseActiveEdge(taskHandle, channel)
    ccall((:DAQmxResetCICtrTimebaseActiveEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICtrTimebaseDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCICtrTimebaseDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCICtrTimebaseDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCICtrTimebaseDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCICtrTimebaseDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCICtrTimebaseDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICtrTimebaseDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCICtrTimebaseDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICtrTimebaseDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCICtrTimebaseDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCICtrTimebaseDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCICtrTimebaseDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICtrTimebaseDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCICtrTimebaseDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCICtrTimebaseDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCICtrTimebaseDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCICtrTimebaseDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCICtrTimebaseDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICtrTimebaseDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCICtrTimebaseDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCICtrTimebaseDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCICtrTimebaseDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCICtrTimebaseDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCICtrTimebaseDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICtrTimebaseDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCICtrTimebaseDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCICtrTimebaseDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCICtrTimebaseDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCICtrTimebaseDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCICtrTimebaseDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIThreshVoltage(taskHandle, channel, data)
    ccall((:DAQmxGetCIThreshVoltage, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIThreshVoltage(taskHandle, channel, data)
    ccall((:DAQmxSetCIThreshVoltage, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIThreshVoltage(taskHandle, channel)
    ccall((:DAQmxResetCIThreshVoltage, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCICount(taskHandle, channel, data)
    ccall((:DAQmxGetCICount, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxGetCIOutputState(taskHandle, channel, data)
    ccall((:DAQmxGetCIOutputState, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxGetCITCReached(taskHandle, channel, data)
    ccall((:DAQmxGetCITCReached, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxGetCICtrTimebaseMasterTimebaseDiv(taskHandle, channel, data)
    ccall((:DAQmxGetCICtrTimebaseMasterTimebaseDiv, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCICtrTimebaseMasterTimebaseDiv(taskHandle, channel, data)
    ccall((:DAQmxSetCICtrTimebaseMasterTimebaseDiv, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCICtrTimebaseMasterTimebaseDiv(taskHandle, channel)
    ccall((:DAQmxResetCICtrTimebaseMasterTimebaseDiv, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCISampClkOverrunBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetCISampClkOverrunBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCISampClkOverrunBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetCISampClkOverrunBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCISampClkOverrunBehavior(taskHandle, channel)
    ccall((:DAQmxResetCISampClkOverrunBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCISampClkOverrunSentinelVal(taskHandle, channel, data)
    ccall((:DAQmxGetCISampClkOverrunSentinelVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCISampClkOverrunSentinelVal(taskHandle, channel, data)
    ccall((:DAQmxSetCISampClkOverrunSentinelVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCISampClkOverrunSentinelVal(taskHandle, channel)
    ccall((:DAQmxResetCISampClkOverrunSentinelVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIDataXferMech(taskHandle, channel, data)
    ccall((:DAQmxGetCIDataXferMech, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIDataXferMech(taskHandle, channel, data)
    ccall((:DAQmxSetCIDataXferMech, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIDataXferMech(taskHandle, channel)
    ccall((:DAQmxResetCIDataXferMech, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIDataXferReqCond(taskHandle, channel, data)
    ccall((:DAQmxGetCIDataXferReqCond, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCIDataXferReqCond(taskHandle, channel, data)
    ccall((:DAQmxSetCIDataXferReqCond, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCIDataXferReqCond(taskHandle, channel)
    ccall((:DAQmxResetCIDataXferReqCond, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIUsbXferReqSize(taskHandle, channel, data)
    ccall((:DAQmxGetCIUsbXferReqSize, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCIUsbXferReqSize(taskHandle, channel, data)
    ccall((:DAQmxSetCIUsbXferReqSize, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCIUsbXferReqSize(taskHandle, channel)
    ccall((:DAQmxResetCIUsbXferReqSize, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIUsbXferReqCount(taskHandle, channel, data)
    ccall((:DAQmxGetCIUsbXferReqCount, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCIUsbXferReqCount(taskHandle, channel, data)
    ccall((:DAQmxSetCIUsbXferReqCount, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCIUsbXferReqCount(taskHandle, channel)
    ccall((:DAQmxResetCIUsbXferReqCount, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIMemMapEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCIMemMapEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIMemMapEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCIMemMapEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIMemMapEnable(taskHandle, channel)
    ccall((:DAQmxResetCIMemMapEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCINumPossiblyInvalidSamps(taskHandle, channel, data)
    ccall((:DAQmxGetCINumPossiblyInvalidSamps, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxGetCIDupCountPrevent(taskHandle, channel, data)
    ccall((:DAQmxGetCIDupCountPrevent, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCIDupCountPrevent(taskHandle, channel, data)
    ccall((:DAQmxSetCIDupCountPrevent, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCIDupCountPrevent(taskHandle, channel)
    ccall((:DAQmxResetCIDupCountPrevent, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIPrescaler(taskHandle, channel, data)
    ccall((:DAQmxGetCIPrescaler, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCIPrescaler(taskHandle, channel, data)
    ccall((:DAQmxSetCIPrescaler, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCIPrescaler(taskHandle, channel)
    ccall((:DAQmxResetCIPrescaler, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCIMaxMeasPeriod(taskHandle, channel, data)
    ccall((:DAQmxGetCIMaxMeasPeriod, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCIMaxMeasPeriod(taskHandle, channel, data)
    ccall((:DAQmxSetCIMaxMeasPeriod, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCIMaxMeasPeriod(taskHandle, channel)
    ccall((:DAQmxResetCIMaxMeasPeriod, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOOutputType(taskHandle, channel, data)
    ccall((:DAQmxGetCOOutputType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxGetCOPulseIdleState(taskHandle, channel, data)
    ccall((:DAQmxGetCOPulseIdleState, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCOPulseIdleState(taskHandle, channel, data)
    ccall((:DAQmxSetCOPulseIdleState, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCOPulseIdleState(taskHandle, channel)
    ccall((:DAQmxResetCOPulseIdleState, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOPulseTerm(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCOPulseTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCOPulseTerm(taskHandle, channel, data)
    ccall((:DAQmxSetCOPulseTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCOPulseTerm(taskHandle, channel)
    ccall((:DAQmxResetCOPulseTerm, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOPulseTimeUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCOPulseTimeUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCOPulseTimeUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCOPulseTimeUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCOPulseTimeUnits(taskHandle, channel)
    ccall((:DAQmxResetCOPulseTimeUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOPulseHighTime(taskHandle, channel, data)
    ccall((:DAQmxGetCOPulseHighTime, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCOPulseHighTime(taskHandle, channel, data)
    ccall((:DAQmxSetCOPulseHighTime, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCOPulseHighTime(taskHandle, channel)
    ccall((:DAQmxResetCOPulseHighTime, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOPulseLowTime(taskHandle, channel, data)
    ccall((:DAQmxGetCOPulseLowTime, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCOPulseLowTime(taskHandle, channel, data)
    ccall((:DAQmxSetCOPulseLowTime, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCOPulseLowTime(taskHandle, channel)
    ccall((:DAQmxResetCOPulseLowTime, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOPulseTimeInitialDelay(taskHandle, channel, data)
    ccall((:DAQmxGetCOPulseTimeInitialDelay, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCOPulseTimeInitialDelay(taskHandle, channel, data)
    ccall((:DAQmxSetCOPulseTimeInitialDelay, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCOPulseTimeInitialDelay(taskHandle, channel)
    ccall((:DAQmxResetCOPulseTimeInitialDelay, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOPulseDutyCyc(taskHandle, channel, data)
    ccall((:DAQmxGetCOPulseDutyCyc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCOPulseDutyCyc(taskHandle, channel, data)
    ccall((:DAQmxSetCOPulseDutyCyc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCOPulseDutyCyc(taskHandle, channel)
    ccall((:DAQmxResetCOPulseDutyCyc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOPulseFreqUnits(taskHandle, channel, data)
    ccall((:DAQmxGetCOPulseFreqUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCOPulseFreqUnits(taskHandle, channel, data)
    ccall((:DAQmxSetCOPulseFreqUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCOPulseFreqUnits(taskHandle, channel)
    ccall((:DAQmxResetCOPulseFreqUnits, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOPulseFreq(taskHandle, channel, data)
    ccall((:DAQmxGetCOPulseFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCOPulseFreq(taskHandle, channel, data)
    ccall((:DAQmxSetCOPulseFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCOPulseFreq(taskHandle, channel)
    ccall((:DAQmxResetCOPulseFreq, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOPulseFreqInitialDelay(taskHandle, channel, data)
    ccall((:DAQmxGetCOPulseFreqInitialDelay, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCOPulseFreqInitialDelay(taskHandle, channel, data)
    ccall((:DAQmxSetCOPulseFreqInitialDelay, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCOPulseFreqInitialDelay(taskHandle, channel)
    ccall((:DAQmxResetCOPulseFreqInitialDelay, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOPulseHighTicks(taskHandle, channel, data)
    ccall((:DAQmxGetCOPulseHighTicks, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCOPulseHighTicks(taskHandle, channel, data)
    ccall((:DAQmxSetCOPulseHighTicks, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCOPulseHighTicks(taskHandle, channel)
    ccall((:DAQmxResetCOPulseHighTicks, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOPulseLowTicks(taskHandle, channel, data)
    ccall((:DAQmxGetCOPulseLowTicks, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCOPulseLowTicks(taskHandle, channel, data)
    ccall((:DAQmxSetCOPulseLowTicks, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCOPulseLowTicks(taskHandle, channel)
    ccall((:DAQmxResetCOPulseLowTicks, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOPulseTicksInitialDelay(taskHandle, channel, data)
    ccall((:DAQmxGetCOPulseTicksInitialDelay, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCOPulseTicksInitialDelay(taskHandle, channel, data)
    ccall((:DAQmxSetCOPulseTicksInitialDelay, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCOPulseTicksInitialDelay(taskHandle, channel)
    ccall((:DAQmxResetCOPulseTicksInitialDelay, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOCtrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCOCtrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCOCtrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCOCtrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCOCtrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCOCtrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOCtrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCOCtrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCOCtrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCOCtrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCOCtrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCOCtrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOCtrTimebaseActiveEdge(taskHandle, channel, data)
    ccall((:DAQmxGetCOCtrTimebaseActiveEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCOCtrTimebaseActiveEdge(taskHandle, channel, data)
    ccall((:DAQmxSetCOCtrTimebaseActiveEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCOCtrTimebaseActiveEdge(taskHandle, channel)
    ccall((:DAQmxResetCOCtrTimebaseActiveEdge, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOCtrTimebaseDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCOCtrTimebaseDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCOCtrTimebaseDigFltrEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCOCtrTimebaseDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCOCtrTimebaseDigFltrEnable(taskHandle, channel)
    ccall((:DAQmxResetCOCtrTimebaseDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOCtrTimebaseDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxGetCOCtrTimebaseDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCOCtrTimebaseDigFltrMinPulseWidth(taskHandle, channel, data)
    ccall((:DAQmxSetCOCtrTimebaseDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCOCtrTimebaseDigFltrMinPulseWidth(taskHandle, channel)
    ccall((:DAQmxResetCOCtrTimebaseDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOCtrTimebaseDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetCOCtrTimebaseDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetCOCtrTimebaseDigFltrTimebaseSrc(taskHandle, channel, data)
    ccall((:DAQmxSetCOCtrTimebaseDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetCOCtrTimebaseDigFltrTimebaseSrc(taskHandle, channel)
    ccall((:DAQmxResetCOCtrTimebaseDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOCtrTimebaseDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxGetCOCtrTimebaseDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, channel, data)
end

function DAQmxSetCOCtrTimebaseDigFltrTimebaseRate(taskHandle, channel, data)
    ccall((:DAQmxSetCOCtrTimebaseDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, channel, data)
end

function DAQmxResetCOCtrTimebaseDigFltrTimebaseRate(taskHandle, channel)
    ccall((:DAQmxResetCOCtrTimebaseDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOCtrTimebaseDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCOCtrTimebaseDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCOCtrTimebaseDigSyncEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCOCtrTimebaseDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCOCtrTimebaseDigSyncEnable(taskHandle, channel)
    ccall((:DAQmxResetCOCtrTimebaseDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOCount(taskHandle, channel, data)
    ccall((:DAQmxGetCOCount, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxGetCOOutputState(taskHandle, channel, data)
    ccall((:DAQmxGetCOOutputState, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxGetCOAutoIncrCnt(taskHandle, channel, data)
    ccall((:DAQmxGetCOAutoIncrCnt, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCOAutoIncrCnt(taskHandle, channel, data)
    ccall((:DAQmxSetCOAutoIncrCnt, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCOAutoIncrCnt(taskHandle, channel)
    ccall((:DAQmxResetCOAutoIncrCnt, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOCtrTimebaseMasterTimebaseDiv(taskHandle, channel, data)
    ccall((:DAQmxGetCOCtrTimebaseMasterTimebaseDiv, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCOCtrTimebaseMasterTimebaseDiv(taskHandle, channel, data)
    ccall((:DAQmxSetCOCtrTimebaseMasterTimebaseDiv, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCOCtrTimebaseMasterTimebaseDiv(taskHandle, channel)
    ccall((:DAQmxResetCOCtrTimebaseMasterTimebaseDiv, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOPulseDone(taskHandle, channel, data)
    ccall((:DAQmxGetCOPulseDone, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxGetCOEnableInitialDelayOnRetrigger(taskHandle, channel, data)
    ccall((:DAQmxGetCOEnableInitialDelayOnRetrigger, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCOEnableInitialDelayOnRetrigger(taskHandle, channel, data)
    ccall((:DAQmxSetCOEnableInitialDelayOnRetrigger, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCOEnableInitialDelayOnRetrigger(taskHandle, channel)
    ccall((:DAQmxResetCOEnableInitialDelayOnRetrigger, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOConstrainedGenMode(taskHandle, channel, data)
    ccall((:DAQmxGetCOConstrainedGenMode, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCOConstrainedGenMode(taskHandle, channel, data)
    ccall((:DAQmxSetCOConstrainedGenMode, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCOConstrainedGenMode(taskHandle, channel)
    ccall((:DAQmxResetCOConstrainedGenMode, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOUseOnlyOnBrdMem(taskHandle, channel, data)
    ccall((:DAQmxGetCOUseOnlyOnBrdMem, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCOUseOnlyOnBrdMem(taskHandle, channel, data)
    ccall((:DAQmxSetCOUseOnlyOnBrdMem, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCOUseOnlyOnBrdMem(taskHandle, channel)
    ccall((:DAQmxResetCOUseOnlyOnBrdMem, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCODataXferMech(taskHandle, channel, data)
    ccall((:DAQmxGetCODataXferMech, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCODataXferMech(taskHandle, channel, data)
    ccall((:DAQmxSetCODataXferMech, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCODataXferMech(taskHandle, channel)
    ccall((:DAQmxResetCODataXferMech, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCODataXferReqCond(taskHandle, channel, data)
    ccall((:DAQmxGetCODataXferReqCond, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetCODataXferReqCond(taskHandle, channel, data)
    ccall((:DAQmxSetCODataXferReqCond, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetCODataXferReqCond(taskHandle, channel)
    ccall((:DAQmxResetCODataXferReqCond, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOUsbXferReqSize(taskHandle, channel, data)
    ccall((:DAQmxGetCOUsbXferReqSize, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCOUsbXferReqSize(taskHandle, channel, data)
    ccall((:DAQmxSetCOUsbXferReqSize, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCOUsbXferReqSize(taskHandle, channel)
    ccall((:DAQmxResetCOUsbXferReqSize, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOUsbXferReqCount(taskHandle, channel, data)
    ccall((:DAQmxGetCOUsbXferReqCount, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCOUsbXferReqCount(taskHandle, channel, data)
    ccall((:DAQmxSetCOUsbXferReqCount, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCOUsbXferReqCount(taskHandle, channel)
    ccall((:DAQmxResetCOUsbXferReqCount, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOMemMapEnable(taskHandle, channel, data)
    ccall((:DAQmxGetCOMemMapEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxSetCOMemMapEnable(taskHandle, channel, data)
    ccall((:DAQmxSetCOMemMapEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, channel, data)
end

function DAQmxResetCOMemMapEnable(taskHandle, channel)
    ccall((:DAQmxResetCOMemMapEnable, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCOPrescaler(taskHandle, channel, data)
    ccall((:DAQmxGetCOPrescaler, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, channel, data)
end

function DAQmxSetCOPrescaler(taskHandle, channel, data)
    ccall((:DAQmxSetCOPrescaler, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, channel, data)
end

function DAQmxResetCOPrescaler(taskHandle, channel)
    ccall((:DAQmxResetCOPrescaler, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetCORdyForNewVal(taskHandle, channel, data)
    ccall((:DAQmxGetCORdyForNewVal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxGetChanType(taskHandle, channel, data)
    ccall((:DAQmxGetChanType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxGetPhysicalChanName(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetPhysicalChanName, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetPhysicalChanName(taskHandle, channel, data)
    ccall((:DAQmxSetPhysicalChanName, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxGetChanDescr(taskHandle, channel, data, bufferSize)
    ccall((:DAQmxGetChanDescr, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, channel, data, bufferSize)
end

function DAQmxSetChanDescr(taskHandle, channel, data)
    ccall((:DAQmxSetChanDescr, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, channel, data)
end

function DAQmxResetChanDescr(taskHandle, channel)
    ccall((:DAQmxResetChanDescr, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetChanIsGlobal(taskHandle, channel, data)
    ccall((:DAQmxGetChanIsGlobal, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, channel, data)
end

function DAQmxGetChanSyncUnlockBehavior(taskHandle, channel, data)
    ccall((:DAQmxGetChanSyncUnlockBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, channel, data)
end

function DAQmxSetChanSyncUnlockBehavior(taskHandle, channel, data)
    ccall((:DAQmxSetChanSyncUnlockBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, channel, data)
end

function DAQmxResetChanSyncUnlockBehavior(taskHandle, channel)
    ccall((:DAQmxResetChanSyncUnlockBehavior, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, channel)
end

function DAQmxGetDevIsSimulated(device, data)
    ccall((:DAQmxGetDevIsSimulated, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), device, data)
end

function DAQmxGetDevProductCategory(device, data)
    ccall((:DAQmxGetDevProductCategory, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}), device, data)
end

function DAQmxGetDevProductType(device, data, bufferSize)
    ccall((:DAQmxGetDevProductType, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), device, data, bufferSize)
end

function DAQmxGetDevProductNum(device, data)
    ccall((:DAQmxGetDevProductNum, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevSerialNum(device, data)
    ccall((:DAQmxGetDevSerialNum, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevAccessoryProductTypes(device, data, bufferSize)
    ccall((:DAQmxGetDevAccessoryProductTypes, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), device, data, bufferSize)
end

function DAQmxGetDevAccessoryProductNums(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAccessoryProductNums, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAccessorySerialNums(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAccessorySerialNums, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetCarrierSerialNum(device, data)
    ccall((:DAQmxGetCarrierSerialNum, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), device, data)
end

function DAQmxGetFieldDAQDevName(device, data, bufferSize)
    ccall((:DAQmxGetFieldDAQDevName, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), device, data, bufferSize)
end

function DAQmxGetFieldDAQBankDevNames(device, data, bufferSize)
    ccall((:DAQmxGetFieldDAQBankDevNames, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), device, data, bufferSize)
end

function DAQmxGetDevChassisModuleDevNames(device, data, bufferSize)
    ccall((:DAQmxGetDevChassisModuleDevNames, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), device, data, bufferSize)
end

function DAQmxGetDevAnlgTrigSupported(device, data)
    ccall((:DAQmxGetDevAnlgTrigSupported, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), device, data)
end

function DAQmxGetDevDigTrigSupported(device, data)
    ccall((:DAQmxGetDevDigTrigSupported, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), device, data)
end

function DAQmxGetDevTimeTrigSupported(device, data)
    ccall((:DAQmxGetDevTimeTrigSupported, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), device, data)
end

function DAQmxGetDevAIPhysicalChans(device, data, bufferSize)
    ccall((:DAQmxGetDevAIPhysicalChans, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), device, data, bufferSize)
end

function DAQmxGetDevAISupportedMeasTypes(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAISupportedMeasTypes, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAIMaxSingleChanRate(device, data)
    ccall((:DAQmxGetDevAIMaxSingleChanRate, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), device, data)
end

function DAQmxGetDevAIMaxMultiChanRate(device, data)
    ccall((:DAQmxGetDevAIMaxMultiChanRate, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), device, data)
end

function DAQmxGetDevAIMinRate(device, data)
    ccall((:DAQmxGetDevAIMinRate, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), device, data)
end

function DAQmxGetDevAISimultaneousSamplingSupported(device, data)
    ccall((:DAQmxGetDevAISimultaneousSamplingSupported, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), device, data)
end

function DAQmxGetDevAINumSampTimingEngines(device, data)
    ccall((:DAQmxGetDevAINumSampTimingEngines, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevAISampModes(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAISampModes, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAINumSyncPulseSrcs(device, data)
    ccall((:DAQmxGetDevAINumSyncPulseSrcs, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevAITrigUsage(device, data)
    ccall((:DAQmxGetDevAITrigUsage, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}), device, data)
end

function DAQmxGetDevAIVoltageRngs(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAIVoltageRngs, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAIVoltageIntExcitDiscreteVals(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAIVoltageIntExcitDiscreteVals, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAIVoltageIntExcitRangeVals(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAIVoltageIntExcitRangeVals, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAIChargeRngs(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAIChargeRngs, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAICurrentRngs(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAICurrentRngs, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAICurrentIntExcitDiscreteVals(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAICurrentIntExcitDiscreteVals, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAIBridgeRngs(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAIBridgeRngs, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAIResistanceRngs(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAIResistanceRngs, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAIFreqRngs(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAIFreqRngs, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAIGains(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAIGains, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAICouplings(device, data)
    ccall((:DAQmxGetDevAICouplings, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}), device, data)
end

function DAQmxGetDevAILowpassCutoffFreqDiscreteVals(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAILowpassCutoffFreqDiscreteVals, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAILowpassCutoffFreqRangeVals(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAILowpassCutoffFreqRangeVals, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetAIDigFltrTypes(device, data, arraySizeInElements)
    ccall((:DAQmxGetAIDigFltrTypes, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAIDigFltrLowpassCutoffFreqDiscreteVals(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAIDigFltrLowpassCutoffFreqDiscreteVals, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAIDigFltrLowpassCutoffFreqRangeVals(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAIDigFltrLowpassCutoffFreqRangeVals, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAOPhysicalChans(device, data, bufferSize)
    ccall((:DAQmxGetDevAOPhysicalChans, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), device, data, bufferSize)
end

function DAQmxGetDevAOSupportedOutputTypes(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAOSupportedOutputTypes, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAOMaxRate(device, data)
    ccall((:DAQmxGetDevAOMaxRate, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), device, data)
end

function DAQmxGetDevAOMinRate(device, data)
    ccall((:DAQmxGetDevAOMinRate, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), device, data)
end

function DAQmxGetDevAOSampClkSupported(device, data)
    ccall((:DAQmxGetDevAOSampClkSupported, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), device, data)
end

function DAQmxGetDevAONumSampTimingEngines(device, data)
    ccall((:DAQmxGetDevAONumSampTimingEngines, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevAOSampModes(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAOSampModes, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAONumSyncPulseSrcs(device, data)
    ccall((:DAQmxGetDevAONumSyncPulseSrcs, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevAOTrigUsage(device, data)
    ccall((:DAQmxGetDevAOTrigUsage, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}), device, data)
end

function DAQmxGetDevAOVoltageRngs(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAOVoltageRngs, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAOCurrentRngs(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAOCurrentRngs, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevAOGains(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevAOGains, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevDILines(device, data, bufferSize)
    ccall((:DAQmxGetDevDILines, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), device, data, bufferSize)
end

function DAQmxGetDevDIPorts(device, data, bufferSize)
    ccall((:DAQmxGetDevDIPorts, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), device, data, bufferSize)
end

function DAQmxGetDevDIMaxRate(device, data)
    ccall((:DAQmxGetDevDIMaxRate, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), device, data)
end

function DAQmxGetDevDINumSampTimingEngines(device, data)
    ccall((:DAQmxGetDevDINumSampTimingEngines, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevDITrigUsage(device, data)
    ccall((:DAQmxGetDevDITrigUsage, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}), device, data)
end

function DAQmxGetDevDOLines(device, data, bufferSize)
    ccall((:DAQmxGetDevDOLines, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), device, data, bufferSize)
end

function DAQmxGetDevDOPorts(device, data, bufferSize)
    ccall((:DAQmxGetDevDOPorts, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), device, data, bufferSize)
end

function DAQmxGetDevDOMaxRate(device, data)
    ccall((:DAQmxGetDevDOMaxRate, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), device, data)
end

function DAQmxGetDevDONumSampTimingEngines(device, data)
    ccall((:DAQmxGetDevDONumSampTimingEngines, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevDOTrigUsage(device, data)
    ccall((:DAQmxGetDevDOTrigUsage, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}), device, data)
end

function DAQmxGetDevCIPhysicalChans(device, data, bufferSize)
    ccall((:DAQmxGetDevCIPhysicalChans, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), device, data, bufferSize)
end

function DAQmxGetDevCISupportedMeasTypes(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevCISupportedMeasTypes, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevCITrigUsage(device, data)
    ccall((:DAQmxGetDevCITrigUsage, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}), device, data)
end

function DAQmxGetDevCISampClkSupported(device, data)
    ccall((:DAQmxGetDevCISampClkSupported, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), device, data)
end

function DAQmxGetDevCISampModes(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevCISampModes, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevCIMaxSize(device, data)
    ccall((:DAQmxGetDevCIMaxSize, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevCIMaxTimebase(device, data)
    ccall((:DAQmxGetDevCIMaxTimebase, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), device, data)
end

function DAQmxGetDevCOPhysicalChans(device, data, bufferSize)
    ccall((:DAQmxGetDevCOPhysicalChans, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), device, data, bufferSize)
end

function DAQmxGetDevCOSupportedOutputTypes(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevCOSupportedOutputTypes, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevCOSampClkSupported(device, data)
    ccall((:DAQmxGetDevCOSampClkSupported, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), device, data)
end

function DAQmxGetDevCOSampModes(device, data, arraySizeInElements)
    ccall((:DAQmxGetDevCOSampModes, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}, uInt32), device, data, arraySizeInElements)
end

function DAQmxGetDevCOTrigUsage(device, data)
    ccall((:DAQmxGetDevCOTrigUsage, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}), device, data)
end

function DAQmxGetDevCOMaxSize(device, data)
    ccall((:DAQmxGetDevCOMaxSize, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevCOMaxTimebase(device, data)
    ccall((:DAQmxGetDevCOMaxTimebase, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), device, data)
end

function DAQmxGetDevTEDSHWTEDSSupported(device, data)
    ccall((:DAQmxGetDevTEDSHWTEDSSupported, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), device, data)
end

function DAQmxGetDevNumDMAChans(device, data)
    ccall((:DAQmxGetDevNumDMAChans, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevBusType(device, data)
    ccall((:DAQmxGetDevBusType, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}), device, data)
end

function DAQmxGetDevPCIBusNum(device, data)
    ccall((:DAQmxGetDevPCIBusNum, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevPCIDevNum(device, data)
    ccall((:DAQmxGetDevPCIDevNum, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevPXIChassisNum(device, data)
    ccall((:DAQmxGetDevPXIChassisNum, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevPXISlotNum(device, data)
    ccall((:DAQmxGetDevPXISlotNum, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevCompactDAQChassisDevName(device, data, bufferSize)
    ccall((:DAQmxGetDevCompactDAQChassisDevName, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), device, data, bufferSize)
end

function DAQmxGetDevCompactDAQSlotNum(device, data)
    ccall((:DAQmxGetDevCompactDAQSlotNum, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevCompactRIOChassisDevName(device, data, bufferSize)
    ccall((:DAQmxGetDevCompactRIOChassisDevName, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), device, data, bufferSize)
end

function DAQmxGetDevCompactRIOSlotNum(device, data)
    ccall((:DAQmxGetDevCompactRIOSlotNum, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevTCPIPHostname(device, data, bufferSize)
    ccall((:DAQmxGetDevTCPIPHostname, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), device, data, bufferSize)
end

function DAQmxGetDevTCPIPEthernetIP(device, data, bufferSize)
    ccall((:DAQmxGetDevTCPIPEthernetIP, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), device, data, bufferSize)
end

function DAQmxGetDevTCPIPWirelessIP(device, data, bufferSize)
    ccall((:DAQmxGetDevTCPIPWirelessIP, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), device, data, bufferSize)
end

function DAQmxGetDevTerminals(device, data, bufferSize)
    ccall((:DAQmxGetDevTerminals, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), device, data, bufferSize)
end

function DAQmxGetDevNumTimeTrigs(device, data)
    ccall((:DAQmxGetDevNumTimeTrigs, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), device, data)
end

function DAQmxGetDevNumTimestampEngines(device, data)
    ccall((:DAQmxGetDevNumTimestampEngines, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), device, data)
end

function DAQmxGetExportedAIConvClkOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedAIConvClkOutputTerm, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedAIConvClkOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedAIConvClkOutputTerm, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetExportedAIConvClkOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedAIConvClkOutputTerm, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedAIConvClkPulsePolarity(taskHandle, data)
    ccall((:DAQmxGetExportedAIConvClkPulsePolarity, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxGetExported10MHzRefClkOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExported10MHzRefClkOutputTerm, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExported10MHzRefClkOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExported10MHzRefClkOutputTerm, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetExported10MHzRefClkOutputTerm(taskHandle)
    ccall((:DAQmxResetExported10MHzRefClkOutputTerm, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExported20MHzTimebaseOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExported20MHzTimebaseOutputTerm, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExported20MHzTimebaseOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExported20MHzTimebaseOutputTerm, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetExported20MHzTimebaseOutputTerm(taskHandle)
    ccall((:DAQmxResetExported20MHzTimebaseOutputTerm, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedSampClkOutputBehavior(taskHandle, data)
    ccall((:DAQmxGetExportedSampClkOutputBehavior, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedSampClkOutputBehavior(taskHandle, data)
    ccall((:DAQmxSetExportedSampClkOutputBehavior, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedSampClkOutputBehavior(taskHandle)
    ccall((:DAQmxResetExportedSampClkOutputBehavior, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedSampClkOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedSampClkOutputTerm, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedSampClkOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedSampClkOutputTerm, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetExportedSampClkOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedSampClkOutputTerm, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedSampClkDelayOffset(taskHandle, data)
    ccall((:DAQmxGetExportedSampClkDelayOffset, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetExportedSampClkDelayOffset(taskHandle, data)
    ccall((:DAQmxSetExportedSampClkDelayOffset, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetExportedSampClkDelayOffset(taskHandle)
    ccall((:DAQmxResetExportedSampClkDelayOffset, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedSampClkPulsePolarity(taskHandle, data)
    ccall((:DAQmxGetExportedSampClkPulsePolarity, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedSampClkPulsePolarity(taskHandle, data)
    ccall((:DAQmxSetExportedSampClkPulsePolarity, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedSampClkPulsePolarity(taskHandle)
    ccall((:DAQmxResetExportedSampClkPulsePolarity, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedSampClkTimebaseOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedSampClkTimebaseOutputTerm, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedSampClkTimebaseOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedSampClkTimebaseOutputTerm, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetExportedSampClkTimebaseOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedSampClkTimebaseOutputTerm, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedDividedSampClkTimebaseOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedDividedSampClkTimebaseOutputTerm, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedDividedSampClkTimebaseOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedDividedSampClkTimebaseOutputTerm, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetExportedDividedSampClkTimebaseOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedDividedSampClkTimebaseOutputTerm, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedAdvTrigOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedAdvTrigOutputTerm, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedAdvTrigOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedAdvTrigOutputTerm, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetExportedAdvTrigOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedAdvTrigOutputTerm, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedAdvTrigPulsePolarity(taskHandle, data)
    ccall((:DAQmxGetExportedAdvTrigPulsePolarity, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxGetExportedAdvTrigPulseWidthUnits(taskHandle, data)
    ccall((:DAQmxGetExportedAdvTrigPulseWidthUnits, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedAdvTrigPulseWidthUnits(taskHandle, data)
    ccall((:DAQmxSetExportedAdvTrigPulseWidthUnits, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedAdvTrigPulseWidthUnits(taskHandle)
    ccall((:DAQmxResetExportedAdvTrigPulseWidthUnits, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedAdvTrigPulseWidth(taskHandle, data)
    ccall((:DAQmxGetExportedAdvTrigPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetExportedAdvTrigPulseWidth(taskHandle, data)
    ccall((:DAQmxSetExportedAdvTrigPulseWidth, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetExportedAdvTrigPulseWidth(taskHandle)
    ccall((:DAQmxResetExportedAdvTrigPulseWidth, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedPauseTrigOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedPauseTrigOutputTerm, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedPauseTrigOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedPauseTrigOutputTerm, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetExportedPauseTrigOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedPauseTrigOutputTerm, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedPauseTrigLvlActiveLvl(taskHandle, data)
    ccall((:DAQmxGetExportedPauseTrigLvlActiveLvl, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedPauseTrigLvlActiveLvl(taskHandle, data)
    ccall((:DAQmxSetExportedPauseTrigLvlActiveLvl, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedPauseTrigLvlActiveLvl(taskHandle)
    ccall((:DAQmxResetExportedPauseTrigLvlActiveLvl, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedRefTrigOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedRefTrigOutputTerm, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedRefTrigOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedRefTrigOutputTerm, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetExportedRefTrigOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedRefTrigOutputTerm, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedRefTrigPulsePolarity(taskHandle, data)
    ccall((:DAQmxGetExportedRefTrigPulsePolarity, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedRefTrigPulsePolarity(taskHandle, data)
    ccall((:DAQmxSetExportedRefTrigPulsePolarity, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedRefTrigPulsePolarity(taskHandle)
    ccall((:DAQmxResetExportedRefTrigPulsePolarity, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedStartTrigOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedStartTrigOutputTerm, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedStartTrigOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedStartTrigOutputTerm, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetExportedStartTrigOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedStartTrigOutputTerm, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedStartTrigPulsePolarity(taskHandle, data)
    ccall((:DAQmxGetExportedStartTrigPulsePolarity, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedStartTrigPulsePolarity(taskHandle, data)
    ccall((:DAQmxSetExportedStartTrigPulsePolarity, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedStartTrigPulsePolarity(taskHandle)
    ccall((:DAQmxResetExportedStartTrigPulsePolarity, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedAdvCmpltEventOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedAdvCmpltEventOutputTerm, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedAdvCmpltEventOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedAdvCmpltEventOutputTerm, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetExportedAdvCmpltEventOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedAdvCmpltEventOutputTerm, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedAdvCmpltEventDelay(taskHandle, data)
    ccall((:DAQmxGetExportedAdvCmpltEventDelay, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetExportedAdvCmpltEventDelay(taskHandle, data)
    ccall((:DAQmxSetExportedAdvCmpltEventDelay, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetExportedAdvCmpltEventDelay(taskHandle)
    ccall((:DAQmxResetExportedAdvCmpltEventDelay, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedAdvCmpltEventPulsePolarity(taskHandle, data)
    ccall((:DAQmxGetExportedAdvCmpltEventPulsePolarity, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedAdvCmpltEventPulsePolarity(taskHandle, data)
    ccall((:DAQmxSetExportedAdvCmpltEventPulsePolarity, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedAdvCmpltEventPulsePolarity(taskHandle)
    ccall((:DAQmxResetExportedAdvCmpltEventPulsePolarity, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedAdvCmpltEventPulseWidth(taskHandle, data)
    ccall((:DAQmxGetExportedAdvCmpltEventPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetExportedAdvCmpltEventPulseWidth(taskHandle, data)
    ccall((:DAQmxSetExportedAdvCmpltEventPulseWidth, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetExportedAdvCmpltEventPulseWidth(taskHandle)
    ccall((:DAQmxResetExportedAdvCmpltEventPulseWidth, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedAIHoldCmpltEventOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedAIHoldCmpltEventOutputTerm, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedAIHoldCmpltEventOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedAIHoldCmpltEventOutputTerm, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetExportedAIHoldCmpltEventOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedAIHoldCmpltEventOutputTerm, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedAIHoldCmpltEventPulsePolarity(taskHandle, data)
    ccall((:DAQmxGetExportedAIHoldCmpltEventPulsePolarity, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedAIHoldCmpltEventPulsePolarity(taskHandle, data)
    ccall((:DAQmxSetExportedAIHoldCmpltEventPulsePolarity, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedAIHoldCmpltEventPulsePolarity(taskHandle)
    ccall((:DAQmxResetExportedAIHoldCmpltEventPulsePolarity, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedChangeDetectEventOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedChangeDetectEventOutputTerm, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedChangeDetectEventOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedChangeDetectEventOutputTerm, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetExportedChangeDetectEventOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedChangeDetectEventOutputTerm, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedChangeDetectEventPulsePolarity(taskHandle, data)
    ccall((:DAQmxGetExportedChangeDetectEventPulsePolarity, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedChangeDetectEventPulsePolarity(taskHandle, data)
    ccall((:DAQmxSetExportedChangeDetectEventPulsePolarity, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedChangeDetectEventPulsePolarity(taskHandle)
    ccall((:DAQmxResetExportedChangeDetectEventPulsePolarity, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedCtrOutEventOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedCtrOutEventOutputTerm, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedCtrOutEventOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedCtrOutEventOutputTerm, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetExportedCtrOutEventOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedCtrOutEventOutputTerm, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedCtrOutEventOutputBehavior(taskHandle, data)
    ccall((:DAQmxGetExportedCtrOutEventOutputBehavior, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedCtrOutEventOutputBehavior(taskHandle, data)
    ccall((:DAQmxSetExportedCtrOutEventOutputBehavior, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedCtrOutEventOutputBehavior(taskHandle)
    ccall((:DAQmxResetExportedCtrOutEventOutputBehavior, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedCtrOutEventPulsePolarity(taskHandle, data)
    ccall((:DAQmxGetExportedCtrOutEventPulsePolarity, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedCtrOutEventPulsePolarity(taskHandle, data)
    ccall((:DAQmxSetExportedCtrOutEventPulsePolarity, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedCtrOutEventPulsePolarity(taskHandle)
    ccall((:DAQmxResetExportedCtrOutEventPulsePolarity, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedCtrOutEventToggleIdleState(taskHandle, data)
    ccall((:DAQmxGetExportedCtrOutEventToggleIdleState, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedCtrOutEventToggleIdleState(taskHandle, data)
    ccall((:DAQmxSetExportedCtrOutEventToggleIdleState, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedCtrOutEventToggleIdleState(taskHandle)
    ccall((:DAQmxResetExportedCtrOutEventToggleIdleState, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedHshkEventOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedHshkEventOutputTerm, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedHshkEventOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedHshkEventOutputTerm, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetExportedHshkEventOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedHshkEventOutputTerm, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedHshkEventOutputBehavior(taskHandle, data)
    ccall((:DAQmxGetExportedHshkEventOutputBehavior, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedHshkEventOutputBehavior(taskHandle, data)
    ccall((:DAQmxSetExportedHshkEventOutputBehavior, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedHshkEventOutputBehavior(taskHandle)
    ccall((:DAQmxResetExportedHshkEventOutputBehavior, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedHshkEventDelay(taskHandle, data)
    ccall((:DAQmxGetExportedHshkEventDelay, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetExportedHshkEventDelay(taskHandle, data)
    ccall((:DAQmxSetExportedHshkEventDelay, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetExportedHshkEventDelay(taskHandle)
    ccall((:DAQmxResetExportedHshkEventDelay, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedHshkEventInterlockedAssertedLvl(taskHandle, data)
    ccall((:DAQmxGetExportedHshkEventInterlockedAssertedLvl, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedHshkEventInterlockedAssertedLvl(taskHandle, data)
    ccall((:DAQmxSetExportedHshkEventInterlockedAssertedLvl, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedHshkEventInterlockedAssertedLvl(taskHandle)
    ccall((:DAQmxResetExportedHshkEventInterlockedAssertedLvl, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedHshkEventInterlockedAssertOnStart(taskHandle, data)
    ccall((:DAQmxGetExportedHshkEventInterlockedAssertOnStart, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetExportedHshkEventInterlockedAssertOnStart(taskHandle, data)
    ccall((:DAQmxSetExportedHshkEventInterlockedAssertOnStart, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetExportedHshkEventInterlockedAssertOnStart(taskHandle)
    ccall((:DAQmxResetExportedHshkEventInterlockedAssertOnStart, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedHshkEventInterlockedDeassertDelay(taskHandle, data)
    ccall((:DAQmxGetExportedHshkEventInterlockedDeassertDelay, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetExportedHshkEventInterlockedDeassertDelay(taskHandle, data)
    ccall((:DAQmxSetExportedHshkEventInterlockedDeassertDelay, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetExportedHshkEventInterlockedDeassertDelay(taskHandle)
    ccall((:DAQmxResetExportedHshkEventInterlockedDeassertDelay, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedHshkEventPulsePolarity(taskHandle, data)
    ccall((:DAQmxGetExportedHshkEventPulsePolarity, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedHshkEventPulsePolarity(taskHandle, data)
    ccall((:DAQmxSetExportedHshkEventPulsePolarity, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedHshkEventPulsePolarity(taskHandle)
    ccall((:DAQmxResetExportedHshkEventPulsePolarity, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedHshkEventPulseWidth(taskHandle, data)
    ccall((:DAQmxGetExportedHshkEventPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetExportedHshkEventPulseWidth(taskHandle, data)
    ccall((:DAQmxSetExportedHshkEventPulseWidth, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetExportedHshkEventPulseWidth(taskHandle)
    ccall((:DAQmxResetExportedHshkEventPulseWidth, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedRdyForXferEventOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedRdyForXferEventOutputTerm, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedRdyForXferEventOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedRdyForXferEventOutputTerm, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetExportedRdyForXferEventOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedRdyForXferEventOutputTerm, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedRdyForXferEventLvlActiveLvl(taskHandle, data)
    ccall((:DAQmxGetExportedRdyForXferEventLvlActiveLvl, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedRdyForXferEventLvlActiveLvl(taskHandle, data)
    ccall((:DAQmxSetExportedRdyForXferEventLvlActiveLvl, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedRdyForXferEventLvlActiveLvl(taskHandle)
    ccall((:DAQmxResetExportedRdyForXferEventLvlActiveLvl, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedRdyForXferEventDeassertCond(taskHandle, data)
    ccall((:DAQmxGetExportedRdyForXferEventDeassertCond, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedRdyForXferEventDeassertCond(taskHandle, data)
    ccall((:DAQmxSetExportedRdyForXferEventDeassertCond, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedRdyForXferEventDeassertCond(taskHandle)
    ccall((:DAQmxResetExportedRdyForXferEventDeassertCond, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedRdyForXferEventDeassertCondCustomThreshold(taskHandle, data)
    ccall((:DAQmxGetExportedRdyForXferEventDeassertCondCustomThreshold, nidaqmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetExportedRdyForXferEventDeassertCondCustomThreshold(taskHandle, data)
    ccall((:DAQmxSetExportedRdyForXferEventDeassertCondCustomThreshold, nidaqmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetExportedRdyForXferEventDeassertCondCustomThreshold(taskHandle)
    ccall((:DAQmxResetExportedRdyForXferEventDeassertCondCustomThreshold, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedDataActiveEventOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedDataActiveEventOutputTerm, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedDataActiveEventOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedDataActiveEventOutputTerm, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetExportedDataActiveEventOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedDataActiveEventOutputTerm, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedDataActiveEventLvlActiveLvl(taskHandle, data)
    ccall((:DAQmxGetExportedDataActiveEventLvlActiveLvl, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedDataActiveEventLvlActiveLvl(taskHandle, data)
    ccall((:DAQmxSetExportedDataActiveEventLvlActiveLvl, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedDataActiveEventLvlActiveLvl(taskHandle)
    ccall((:DAQmxResetExportedDataActiveEventLvlActiveLvl, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedRdyForStartEventOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedRdyForStartEventOutputTerm, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedRdyForStartEventOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedRdyForStartEventOutputTerm, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetExportedRdyForStartEventOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedRdyForStartEventOutputTerm, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedRdyForStartEventLvlActiveLvl(taskHandle, data)
    ccall((:DAQmxGetExportedRdyForStartEventLvlActiveLvl, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetExportedRdyForStartEventLvlActiveLvl(taskHandle, data)
    ccall((:DAQmxSetExportedRdyForStartEventLvlActiveLvl, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetExportedRdyForStartEventLvlActiveLvl(taskHandle)
    ccall((:DAQmxResetExportedRdyForStartEventLvlActiveLvl, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedSyncPulseEventOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedSyncPulseEventOutputTerm, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedSyncPulseEventOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedSyncPulseEventOutputTerm, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetExportedSyncPulseEventOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedSyncPulseEventOutputTerm, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetExportedWatchdogExpiredEventOutputTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetExportedWatchdogExpiredEventOutputTerm, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetExportedWatchdogExpiredEventOutputTerm(taskHandle, data)
    ccall((:DAQmxSetExportedWatchdogExpiredEventOutputTerm, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetExportedWatchdogExpiredEventOutputTerm(taskHandle)
    ccall((:DAQmxResetExportedWatchdogExpiredEventOutputTerm, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetPersistedChanAuthor(channel, data, bufferSize)
    ccall((:DAQmxGetPersistedChanAuthor, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), channel, data, bufferSize)
end

function DAQmxGetPersistedChanAllowInteractiveEditing(channel, data)
    ccall((:DAQmxGetPersistedChanAllowInteractiveEditing, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), channel, data)
end

function DAQmxGetPersistedChanAllowInteractiveDeletion(channel, data)
    ccall((:DAQmxGetPersistedChanAllowInteractiveDeletion, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), channel, data)
end

function DAQmxGetPersistedScaleAuthor(scaleName, data, bufferSize)
    ccall((:DAQmxGetPersistedScaleAuthor, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), scaleName, data, bufferSize)
end

function DAQmxGetPersistedScaleAllowInteractiveEditing(scaleName, data)
    ccall((:DAQmxGetPersistedScaleAllowInteractiveEditing, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), scaleName, data)
end

function DAQmxGetPersistedScaleAllowInteractiveDeletion(scaleName, data)
    ccall((:DAQmxGetPersistedScaleAllowInteractiveDeletion, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), scaleName, data)
end

function DAQmxGetPersistedTaskAuthor(taskName, data, bufferSize)
    ccall((:DAQmxGetPersistedTaskAuthor, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), taskName, data, bufferSize)
end

function DAQmxGetPersistedTaskAllowInteractiveEditing(taskName, data)
    ccall((:DAQmxGetPersistedTaskAllowInteractiveEditing, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), taskName, data)
end

function DAQmxGetPersistedTaskAllowInteractiveDeletion(taskName, data)
    ccall((:DAQmxGetPersistedTaskAllowInteractiveDeletion, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), taskName, data)
end

function DAQmxGetPhysicalChanAISupportedMeasTypes(physicalChannel, data, arraySizeInElements)
    ccall((:DAQmxGetPhysicalChanAISupportedMeasTypes, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}, uInt32), physicalChannel, data, arraySizeInElements)
end

function DAQmxGetPhysicalChanAITermCfgs(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanAITermCfgs, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanAIInputSrcs(physicalChannel, data, bufferSize)
    ccall((:DAQmxGetPhysicalChanAIInputSrcs, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), physicalChannel, data, bufferSize)
end

function DAQmxGetPhysicalChanAISensorPowerTypes(physicalChannel, data, arraySizeInElements)
    ccall((:DAQmxGetPhysicalChanAISensorPowerTypes, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}, uInt32), physicalChannel, data, arraySizeInElements)
end

function DAQmxGetPhysicalChanAISensorPowerVoltageRangeVals(physicalChannel, data, arraySizeInElements)
    ccall((:DAQmxGetPhysicalChanAISensorPowerVoltageRangeVals, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32), physicalChannel, data, arraySizeInElements)
end

function DAQmxGetPhysicalChanAIPowerControlVoltage(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanAIPowerControlVoltage, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), physicalChannel, data)
end

function DAQmxSetPhysicalChanAIPowerControlVoltage(physicalChannel, data)
    ccall((:DAQmxSetPhysicalChanAIPowerControlVoltage, nidaqmx), int32, (Ptr{UInt8}, float64), physicalChannel, data)
end

function DAQmxResetPhysicalChanAIPowerControlVoltage(physicalChannel)
    ccall((:DAQmxResetPhysicalChanAIPowerControlVoltage, nidaqmx), int32, (Ptr{UInt8},), physicalChannel)
end

function DAQmxGetPhysicalChanAIPowerControlEnable(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanAIPowerControlEnable, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), physicalChannel, data)
end

function DAQmxSetPhysicalChanAIPowerControlEnable(physicalChannel, data)
    ccall((:DAQmxSetPhysicalChanAIPowerControlEnable, nidaqmx), int32, (Ptr{UInt8}, bool32), physicalChannel, data)
end

function DAQmxResetPhysicalChanAIPowerControlEnable(physicalChannel)
    ccall((:DAQmxResetPhysicalChanAIPowerControlEnable, nidaqmx), int32, (Ptr{UInt8},), physicalChannel)
end

function DAQmxGetPhysicalChanAIPowerControlType(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanAIPowerControlType, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}), physicalChannel, data)
end

function DAQmxSetPhysicalChanAIPowerControlType(physicalChannel, data)
    ccall((:DAQmxSetPhysicalChanAIPowerControlType, nidaqmx), int32, (Ptr{UInt8}, int32), physicalChannel, data)
end

function DAQmxResetPhysicalChanAIPowerControlType(physicalChannel)
    ccall((:DAQmxResetPhysicalChanAIPowerControlType, nidaqmx), int32, (Ptr{UInt8},), physicalChannel)
end

function DAQmxGetPhysicalChanAISensorPowerOpenChan(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanAISensorPowerOpenChan, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanAISensorPowerOvercurrent(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanAISensorPowerOvercurrent, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanAOSupportedOutputTypes(physicalChannel, data, arraySizeInElements)
    ccall((:DAQmxGetPhysicalChanAOSupportedOutputTypes, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}, uInt32), physicalChannel, data, arraySizeInElements)
end

function DAQmxGetPhysicalChanAOSupportedPowerUpOutputTypes(physicalChannel, data, arraySizeInElements)
    ccall((:DAQmxGetPhysicalChanAOSupportedPowerUpOutputTypes, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}, uInt32), physicalChannel, data, arraySizeInElements)
end

function DAQmxGetPhysicalChanAOTermCfgs(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanAOTermCfgs, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanAOManualControlEnable(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanAOManualControlEnable, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), physicalChannel, data)
end

function DAQmxSetPhysicalChanAOManualControlEnable(physicalChannel, data)
    ccall((:DAQmxSetPhysicalChanAOManualControlEnable, nidaqmx), int32, (Ptr{UInt8}, bool32), physicalChannel, data)
end

function DAQmxResetPhysicalChanAOManualControlEnable(physicalChannel)
    ccall((:DAQmxResetPhysicalChanAOManualControlEnable, nidaqmx), int32, (Ptr{UInt8},), physicalChannel)
end

function DAQmxGetPhysicalChanAOManualControlShortDetected(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanAOManualControlShortDetected, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanAOManualControlAmplitude(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanAOManualControlAmplitude, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), physicalChannel, data)
end

function DAQmxGetPhysicalChanAOManualControlFreq(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanAOManualControlFreq, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), physicalChannel, data)
end

function DAQmxGetAOPowerAmpChannelEnable(physicalChannel, data)
    ccall((:DAQmxGetAOPowerAmpChannelEnable, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), physicalChannel, data)
end

function DAQmxSetAOPowerAmpChannelEnable(physicalChannel, data)
    ccall((:DAQmxSetAOPowerAmpChannelEnable, nidaqmx), int32, (Ptr{UInt8}, bool32), physicalChannel, data)
end

function DAQmxResetAOPowerAmpChannelEnable(physicalChannel)
    ccall((:DAQmxResetAOPowerAmpChannelEnable, nidaqmx), int32, (Ptr{UInt8},), physicalChannel)
end

function DAQmxGetAOPowerAmpScalingCoeff(physicalChannel, data, arraySizeInElements)
    ccall((:DAQmxGetAOPowerAmpScalingCoeff, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32), physicalChannel, data, arraySizeInElements)
end

function DAQmxGetAOPowerAmpOvercurrent(physicalChannel, data)
    ccall((:DAQmxGetAOPowerAmpOvercurrent, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), physicalChannel, data)
end

function DAQmxGetAOPowerAmpGain(physicalChannel, data)
    ccall((:DAQmxGetAOPowerAmpGain, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), physicalChannel, data)
end

function DAQmxGetAOPowerAmpOffset(physicalChannel, data)
    ccall((:DAQmxGetAOPowerAmpOffset, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), physicalChannel, data)
end

function DAQmxGetPhysicalChanDIPortWidth(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanDIPortWidth, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanDISampClkSupported(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanDISampClkSupported, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanDISampModes(physicalChannel, data, arraySizeInElements)
    ccall((:DAQmxGetPhysicalChanDISampModes, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}, uInt32), physicalChannel, data, arraySizeInElements)
end

function DAQmxGetPhysicalChanDIChangeDetectSupported(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanDIChangeDetectSupported, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanDOPortWidth(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanDOPortWidth, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanDOSampClkSupported(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanDOSampClkSupported, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanDOSampModes(physicalChannel, data, arraySizeInElements)
    ccall((:DAQmxGetPhysicalChanDOSampModes, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}, uInt32), physicalChannel, data, arraySizeInElements)
end

function DAQmxGetPhysicalChanCISupportedMeasTypes(physicalChannel, data, arraySizeInElements)
    ccall((:DAQmxGetPhysicalChanCISupportedMeasTypes, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}, uInt32), physicalChannel, data, arraySizeInElements)
end

function DAQmxGetPhysicalChanCOSupportedOutputTypes(physicalChannel, data, arraySizeInElements)
    ccall((:DAQmxGetPhysicalChanCOSupportedOutputTypes, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}, uInt32), physicalChannel, data, arraySizeInElements)
end

function DAQmxGetPhysicalChanTEDSMfgID(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanTEDSMfgID, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanTEDSModelNum(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanTEDSModelNum, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanTEDSSerialNum(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanTEDSSerialNum, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanTEDSVersionNum(physicalChannel, data)
    ccall((:DAQmxGetPhysicalChanTEDSVersionNum, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), physicalChannel, data)
end

function DAQmxGetPhysicalChanTEDSVersionLetter(physicalChannel, data, bufferSize)
    ccall((:DAQmxGetPhysicalChanTEDSVersionLetter, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), physicalChannel, data, bufferSize)
end

function DAQmxGetPhysicalChanTEDSBitStream(physicalChannel, data, arraySizeInElements)
    ccall((:DAQmxGetPhysicalChanTEDSBitStream, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt8}, uInt32), physicalChannel, data, arraySizeInElements)
end

function DAQmxGetPhysicalChanTEDSTemplateIDs(physicalChannel, data, arraySizeInElements)
    ccall((:DAQmxGetPhysicalChanTEDSTemplateIDs, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}, uInt32), physicalChannel, data, arraySizeInElements)
end

function DAQmxGetReadRelativeTo(taskHandle, data)
    ccall((:DAQmxGetReadRelativeTo, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetReadRelativeTo(taskHandle, data)
    ccall((:DAQmxSetReadRelativeTo, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetReadRelativeTo(taskHandle)
    ccall((:DAQmxResetReadRelativeTo, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetReadOffset(taskHandle, data)
    ccall((:DAQmxGetReadOffset, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetReadOffset(taskHandle, data)
    ccall((:DAQmxSetReadOffset, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetReadOffset(taskHandle)
    ccall((:DAQmxResetReadOffset, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetReadChannelsToRead(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadChannelsToRead, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetReadChannelsToRead(taskHandle, data)
    ccall((:DAQmxSetReadChannelsToRead, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetReadChannelsToRead(taskHandle)
    ccall((:DAQmxResetReadChannelsToRead, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetReadReadAllAvailSamp(taskHandle, data)
    ccall((:DAQmxGetReadReadAllAvailSamp, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetReadReadAllAvailSamp(taskHandle, data)
    ccall((:DAQmxSetReadReadAllAvailSamp, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetReadReadAllAvailSamp(taskHandle)
    ccall((:DAQmxResetReadReadAllAvailSamp, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetReadAutoStart(taskHandle, data)
    ccall((:DAQmxGetReadAutoStart, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetReadAutoStart(taskHandle, data)
    ccall((:DAQmxSetReadAutoStart, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetReadAutoStart(taskHandle)
    ccall((:DAQmxResetReadAutoStart, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetReadOverWrite(taskHandle, data)
    ccall((:DAQmxGetReadOverWrite, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetReadOverWrite(taskHandle, data)
    ccall((:DAQmxSetReadOverWrite, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetReadOverWrite(taskHandle)
    ccall((:DAQmxResetReadOverWrite, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetLoggingFilePath(taskHandle, data, bufferSize)
    ccall((:DAQmxGetLoggingFilePath, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetLoggingFilePath(taskHandle, data)
    ccall((:DAQmxSetLoggingFilePath, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetLoggingFilePath(taskHandle)
    ccall((:DAQmxResetLoggingFilePath, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetLoggingMode(taskHandle, data)
    ccall((:DAQmxGetLoggingMode, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetLoggingMode(taskHandle, data)
    ccall((:DAQmxSetLoggingMode, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetLoggingMode(taskHandle)
    ccall((:DAQmxResetLoggingMode, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetLoggingTDMSGroupName(taskHandle, data, bufferSize)
    ccall((:DAQmxGetLoggingTDMSGroupName, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetLoggingTDMSGroupName(taskHandle, data)
    ccall((:DAQmxSetLoggingTDMSGroupName, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetLoggingTDMSGroupName(taskHandle)
    ccall((:DAQmxResetLoggingTDMSGroupName, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetLoggingTDMSOperation(taskHandle, data)
    ccall((:DAQmxGetLoggingTDMSOperation, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetLoggingTDMSOperation(taskHandle, data)
    ccall((:DAQmxSetLoggingTDMSOperation, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetLoggingTDMSOperation(taskHandle)
    ccall((:DAQmxResetLoggingTDMSOperation, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetLoggingPause(taskHandle, data)
    ccall((:DAQmxGetLoggingPause, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetLoggingPause(taskHandle, data)
    ccall((:DAQmxSetLoggingPause, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetLoggingPause(taskHandle)
    ccall((:DAQmxResetLoggingPause, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetLoggingSampsPerFile(taskHandle, data)
    ccall((:DAQmxGetLoggingSampsPerFile, nidaqmx), int32, (TaskHandle, Ptr{uInt64}), taskHandle, data)
end

function DAQmxSetLoggingSampsPerFile(taskHandle, data)
    ccall((:DAQmxSetLoggingSampsPerFile, nidaqmx), int32, (TaskHandle, uInt64), taskHandle, data)
end

function DAQmxResetLoggingSampsPerFile(taskHandle)
    ccall((:DAQmxResetLoggingSampsPerFile, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetLoggingFileWriteSize(taskHandle, data)
    ccall((:DAQmxGetLoggingFileWriteSize, nidaqmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetLoggingFileWriteSize(taskHandle, data)
    ccall((:DAQmxSetLoggingFileWriteSize, nidaqmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetLoggingFileWriteSize(taskHandle)
    ccall((:DAQmxResetLoggingFileWriteSize, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetLoggingFilePreallocationSize(taskHandle, data)
    ccall((:DAQmxGetLoggingFilePreallocationSize, nidaqmx), int32, (TaskHandle, Ptr{uInt64}), taskHandle, data)
end

function DAQmxSetLoggingFilePreallocationSize(taskHandle, data)
    ccall((:DAQmxSetLoggingFilePreallocationSize, nidaqmx), int32, (TaskHandle, uInt64), taskHandle, data)
end

function DAQmxResetLoggingFilePreallocationSize(taskHandle)
    ccall((:DAQmxResetLoggingFilePreallocationSize, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetReadCurrReadPos(taskHandle, data)
    ccall((:DAQmxGetReadCurrReadPos, nidaqmx), int32, (TaskHandle, Ptr{uInt64}), taskHandle, data)
end

function DAQmxGetReadAvailSampPerChan(taskHandle, data)
    ccall((:DAQmxGetReadAvailSampPerChan, nidaqmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxGetReadTotalSampPerChanAcquired(taskHandle, data)
    ccall((:DAQmxGetReadTotalSampPerChanAcquired, nidaqmx), int32, (TaskHandle, Ptr{uInt64}), taskHandle, data)
end

function DAQmxGetReadCommonModeRangeErrorChansExist(taskHandle, data)
    ccall((:DAQmxGetReadCommonModeRangeErrorChansExist, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadCommonModeRangeErrorChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadCommonModeRangeErrorChans, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadExcitFaultChansExist(taskHandle, data)
    ccall((:DAQmxGetReadExcitFaultChansExist, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadExcitFaultChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadExcitFaultChans, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadOvercurrentChansExist(taskHandle, data)
    ccall((:DAQmxGetReadOvercurrentChansExist, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadOvercurrentChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadOvercurrentChans, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadOvertemperatureChansExist(taskHandle, data)
    ccall((:DAQmxGetReadOvertemperatureChansExist, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadOvertemperatureChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadOvertemperatureChans, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadOpenChansExist(taskHandle, data)
    ccall((:DAQmxGetReadOpenChansExist, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadOpenChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadOpenChans, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadOpenChansDetails(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadOpenChansDetails, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadOpenCurrentLoopChansExist(taskHandle, data)
    ccall((:DAQmxGetReadOpenCurrentLoopChansExist, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadOpenCurrentLoopChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadOpenCurrentLoopChans, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadOpenThrmcplChansExist(taskHandle, data)
    ccall((:DAQmxGetReadOpenThrmcplChansExist, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadOpenThrmcplChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadOpenThrmcplChans, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadOverloadedChansExist(taskHandle, data)
    ccall((:DAQmxGetReadOverloadedChansExist, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadOverloadedChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadOverloadedChans, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadInputLimitsFaultChansExist(taskHandle, data)
    ccall((:DAQmxGetReadInputLimitsFaultChansExist, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadInputLimitsFaultChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadInputLimitsFaultChans, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadPLLUnlockedChansExist(taskHandle, data)
    ccall((:DAQmxGetReadPLLUnlockedChansExist, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadPLLUnlockedChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadPLLUnlockedChans, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadPowerSupplyFaultChansExist(taskHandle, data)
    ccall((:DAQmxGetReadPowerSupplyFaultChansExist, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadPowerSupplyFaultChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadPowerSupplyFaultChans, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadSyncUnlockedChansExist(taskHandle, data)
    ccall((:DAQmxGetReadSyncUnlockedChansExist, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadSyncUnlockedChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadSyncUnlockedChans, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadAccessoryInsertionOrRemovalDetected(taskHandle, data)
    ccall((:DAQmxGetReadAccessoryInsertionOrRemovalDetected, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadDevsWithInsertedOrRemovedAccessories(taskHandle, data, bufferSize)
    ccall((:DAQmxGetReadDevsWithInsertedOrRemovedAccessories, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetReadChangeDetectHasOverflowed(taskHandle, data)
    ccall((:DAQmxGetReadChangeDetectHasOverflowed, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetReadRawDataWidth(taskHandle, data)
    ccall((:DAQmxGetReadRawDataWidth, nidaqmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxGetReadNumChans(taskHandle, data)
    ccall((:DAQmxGetReadNumChans, nidaqmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxGetReadDigitalLinesBytesPerChan(taskHandle, data)
    ccall((:DAQmxGetReadDigitalLinesBytesPerChan, nidaqmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxGetReadWaitMode(taskHandle, data)
    ccall((:DAQmxGetReadWaitMode, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetReadWaitMode(taskHandle, data)
    ccall((:DAQmxSetReadWaitMode, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetReadWaitMode(taskHandle)
    ccall((:DAQmxResetReadWaitMode, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetReadSleepTime(taskHandle, data)
    ccall((:DAQmxGetReadSleepTime, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetReadSleepTime(taskHandle, data)
    ccall((:DAQmxSetReadSleepTime, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetReadSleepTime(taskHandle)
    ccall((:DAQmxResetReadSleepTime, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRealTimeConvLateErrorsToWarnings(taskHandle, data)
    ccall((:DAQmxGetRealTimeConvLateErrorsToWarnings, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetRealTimeConvLateErrorsToWarnings(taskHandle, data)
    ccall((:DAQmxSetRealTimeConvLateErrorsToWarnings, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetRealTimeConvLateErrorsToWarnings(taskHandle)
    ccall((:DAQmxResetRealTimeConvLateErrorsToWarnings, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRealTimeNumOfWarmupIters(taskHandle, data)
    ccall((:DAQmxGetRealTimeNumOfWarmupIters, nidaqmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetRealTimeNumOfWarmupIters(taskHandle, data)
    ccall((:DAQmxSetRealTimeNumOfWarmupIters, nidaqmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetRealTimeNumOfWarmupIters(taskHandle)
    ccall((:DAQmxResetRealTimeNumOfWarmupIters, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRealTimeWaitForNextSampClkWaitMode(taskHandle, data)
    ccall((:DAQmxGetRealTimeWaitForNextSampClkWaitMode, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetRealTimeWaitForNextSampClkWaitMode(taskHandle, data)
    ccall((:DAQmxSetRealTimeWaitForNextSampClkWaitMode, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetRealTimeWaitForNextSampClkWaitMode(taskHandle)
    ccall((:DAQmxResetRealTimeWaitForNextSampClkWaitMode, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRealTimeReportMissedSamp(taskHandle, data)
    ccall((:DAQmxGetRealTimeReportMissedSamp, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetRealTimeReportMissedSamp(taskHandle, data)
    ccall((:DAQmxSetRealTimeReportMissedSamp, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetRealTimeReportMissedSamp(taskHandle)
    ccall((:DAQmxResetRealTimeReportMissedSamp, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRealTimeWriteRecoveryMode(taskHandle, data)
    ccall((:DAQmxGetRealTimeWriteRecoveryMode, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetRealTimeWriteRecoveryMode(taskHandle, data)
    ccall((:DAQmxSetRealTimeWriteRecoveryMode, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetRealTimeWriteRecoveryMode(taskHandle)
    ccall((:DAQmxResetRealTimeWriteRecoveryMode, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetScaleDescr(scaleName, data, bufferSize)
    ccall((:DAQmxGetScaleDescr, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), scaleName, data, bufferSize)
end

function DAQmxSetScaleDescr(scaleName, data)
    ccall((:DAQmxSetScaleDescr, nidaqmx), int32, (Ptr{UInt8}, Cstring), scaleName, data)
end

function DAQmxGetScaleScaledUnits(scaleName, data, bufferSize)
    ccall((:DAQmxGetScaleScaledUnits, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), scaleName, data, bufferSize)
end

function DAQmxSetScaleScaledUnits(scaleName, data)
    ccall((:DAQmxSetScaleScaledUnits, nidaqmx), int32, (Ptr{UInt8}, Cstring), scaleName, data)
end

function DAQmxGetScalePreScaledUnits(scaleName, data)
    ccall((:DAQmxGetScalePreScaledUnits, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}), scaleName, data)
end

function DAQmxSetScalePreScaledUnits(scaleName, data)
    ccall((:DAQmxSetScalePreScaledUnits, nidaqmx), int32, (Ptr{UInt8}, int32), scaleName, data)
end

function DAQmxGetScaleType(scaleName, data)
    ccall((:DAQmxGetScaleType, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}), scaleName, data)
end

function DAQmxGetScaleLinSlope(scaleName, data)
    ccall((:DAQmxGetScaleLinSlope, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), scaleName, data)
end

function DAQmxSetScaleLinSlope(scaleName, data)
    ccall((:DAQmxSetScaleLinSlope, nidaqmx), int32, (Ptr{UInt8}, float64), scaleName, data)
end

function DAQmxGetScaleLinYIntercept(scaleName, data)
    ccall((:DAQmxGetScaleLinYIntercept, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), scaleName, data)
end

function DAQmxSetScaleLinYIntercept(scaleName, data)
    ccall((:DAQmxSetScaleLinYIntercept, nidaqmx), int32, (Ptr{UInt8}, float64), scaleName, data)
end

function DAQmxGetScaleMapScaledMax(scaleName, data)
    ccall((:DAQmxGetScaleMapScaledMax, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), scaleName, data)
end

function DAQmxSetScaleMapScaledMax(scaleName, data)
    ccall((:DAQmxSetScaleMapScaledMax, nidaqmx), int32, (Ptr{UInt8}, float64), scaleName, data)
end

function DAQmxGetScaleMapPreScaledMax(scaleName, data)
    ccall((:DAQmxGetScaleMapPreScaledMax, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), scaleName, data)
end

function DAQmxSetScaleMapPreScaledMax(scaleName, data)
    ccall((:DAQmxSetScaleMapPreScaledMax, nidaqmx), int32, (Ptr{UInt8}, float64), scaleName, data)
end

function DAQmxGetScaleMapScaledMin(scaleName, data)
    ccall((:DAQmxGetScaleMapScaledMin, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), scaleName, data)
end

function DAQmxSetScaleMapScaledMin(scaleName, data)
    ccall((:DAQmxSetScaleMapScaledMin, nidaqmx), int32, (Ptr{UInt8}, float64), scaleName, data)
end

function DAQmxGetScaleMapPreScaledMin(scaleName, data)
    ccall((:DAQmxGetScaleMapPreScaledMin, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), scaleName, data)
end

function DAQmxSetScaleMapPreScaledMin(scaleName, data)
    ccall((:DAQmxSetScaleMapPreScaledMin, nidaqmx), int32, (Ptr{UInt8}, float64), scaleName, data)
end

function DAQmxGetScalePolyForwardCoeff(scaleName, data, arraySizeInElements)
    ccall((:DAQmxGetScalePolyForwardCoeff, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32), scaleName, data, arraySizeInElements)
end

function DAQmxSetScalePolyForwardCoeff(scaleName, data, arraySizeInElements)
    ccall((:DAQmxSetScalePolyForwardCoeff, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32), scaleName, data, arraySizeInElements)
end

function DAQmxGetScalePolyReverseCoeff(scaleName, data, arraySizeInElements)
    ccall((:DAQmxGetScalePolyReverseCoeff, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32), scaleName, data, arraySizeInElements)
end

function DAQmxSetScalePolyReverseCoeff(scaleName, data, arraySizeInElements)
    ccall((:DAQmxSetScalePolyReverseCoeff, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32), scaleName, data, arraySizeInElements)
end

function DAQmxGetScaleTableScaledVals(scaleName, data, arraySizeInElements)
    ccall((:DAQmxGetScaleTableScaledVals, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32), scaleName, data, arraySizeInElements)
end

function DAQmxSetScaleTableScaledVals(scaleName, data, arraySizeInElements)
    ccall((:DAQmxSetScaleTableScaledVals, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32), scaleName, data, arraySizeInElements)
end

function DAQmxGetScaleTablePreScaledVals(scaleName, data, arraySizeInElements)
    ccall((:DAQmxGetScaleTablePreScaledVals, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32), scaleName, data, arraySizeInElements)
end

function DAQmxSetScaleTablePreScaledVals(scaleName, data, arraySizeInElements)
    ccall((:DAQmxSetScaleTablePreScaledVals, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}, uInt32), scaleName, data, arraySizeInElements)
end

function DAQmxGetSwitchChanUsage(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanUsage, nidaqmx), int32, (Ptr{UInt8}, Ptr{int32}), switchChannelName, data)
end

function DAQmxSetSwitchChanUsage(switchChannelName, data)
    ccall((:DAQmxSetSwitchChanUsage, nidaqmx), int32, (Ptr{UInt8}, int32), switchChannelName, data)
end

function DAQmxGetSwitchChanAnlgBusSharingEnable(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanAnlgBusSharingEnable, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), switchChannelName, data)
end

function DAQmxSetSwitchChanAnlgBusSharingEnable(switchChannelName, data)
    ccall((:DAQmxSetSwitchChanAnlgBusSharingEnable, nidaqmx), int32, (Ptr{UInt8}, bool32), switchChannelName, data)
end

function DAQmxGetSwitchChanMaxACCarryCurrent(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanMaxACCarryCurrent, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), switchChannelName, data)
end

function DAQmxGetSwitchChanMaxACSwitchCurrent(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanMaxACSwitchCurrent, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), switchChannelName, data)
end

function DAQmxGetSwitchChanMaxACCarryPwr(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanMaxACCarryPwr, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), switchChannelName, data)
end

function DAQmxGetSwitchChanMaxACSwitchPwr(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanMaxACSwitchPwr, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), switchChannelName, data)
end

function DAQmxGetSwitchChanMaxDCCarryCurrent(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanMaxDCCarryCurrent, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), switchChannelName, data)
end

function DAQmxGetSwitchChanMaxDCSwitchCurrent(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanMaxDCSwitchCurrent, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), switchChannelName, data)
end

function DAQmxGetSwitchChanMaxDCCarryPwr(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanMaxDCCarryPwr, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), switchChannelName, data)
end

function DAQmxGetSwitchChanMaxDCSwitchPwr(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanMaxDCSwitchPwr, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), switchChannelName, data)
end

function DAQmxGetSwitchChanMaxACVoltage(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanMaxACVoltage, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), switchChannelName, data)
end

function DAQmxGetSwitchChanMaxDCVoltage(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanMaxDCVoltage, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), switchChannelName, data)
end

function DAQmxGetSwitchChanWireMode(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanWireMode, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), switchChannelName, data)
end

function DAQmxGetSwitchChanBandwidth(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanBandwidth, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), switchChannelName, data)
end

function DAQmxGetSwitchChanImpedance(switchChannelName, data)
    ccall((:DAQmxGetSwitchChanImpedance, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), switchChannelName, data)
end

function DAQmxGetSwitchDevSettlingTime(deviceName, data)
    ccall((:DAQmxGetSwitchDevSettlingTime, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), deviceName, data)
end

function DAQmxSetSwitchDevSettlingTime(deviceName, data)
    ccall((:DAQmxSetSwitchDevSettlingTime, nidaqmx), int32, (Ptr{UInt8}, float64), deviceName, data)
end

function DAQmxGetSwitchDevAutoConnAnlgBus(deviceName, data)
    ccall((:DAQmxGetSwitchDevAutoConnAnlgBus, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), deviceName, data)
end

function DAQmxSetSwitchDevAutoConnAnlgBus(deviceName, data)
    ccall((:DAQmxSetSwitchDevAutoConnAnlgBus, nidaqmx), int32, (Ptr{UInt8}, bool32), deviceName, data)
end

function DAQmxGetSwitchDevPwrDownLatchRelaysAfterSettling(deviceName, data)
    ccall((:DAQmxGetSwitchDevPwrDownLatchRelaysAfterSettling, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), deviceName, data)
end

function DAQmxSetSwitchDevPwrDownLatchRelaysAfterSettling(deviceName, data)
    ccall((:DAQmxSetSwitchDevPwrDownLatchRelaysAfterSettling, nidaqmx), int32, (Ptr{UInt8}, bool32), deviceName, data)
end

function DAQmxGetSwitchDevSettled(deviceName, data)
    ccall((:DAQmxGetSwitchDevSettled, nidaqmx), int32, (Ptr{UInt8}, Ptr{bool32}), deviceName, data)
end

function DAQmxGetSwitchDevRelayList(deviceName, data, bufferSize)
    ccall((:DAQmxGetSwitchDevRelayList, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), deviceName, data, bufferSize)
end

function DAQmxGetSwitchDevNumRelays(deviceName, data)
    ccall((:DAQmxGetSwitchDevNumRelays, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), deviceName, data)
end

function DAQmxGetSwitchDevSwitchChanList(deviceName, data, bufferSize)
    ccall((:DAQmxGetSwitchDevSwitchChanList, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), deviceName, data, bufferSize)
end

function DAQmxGetSwitchDevNumSwitchChans(deviceName, data)
    ccall((:DAQmxGetSwitchDevNumSwitchChans, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), deviceName, data)
end

function DAQmxGetSwitchDevNumRows(deviceName, data)
    ccall((:DAQmxGetSwitchDevNumRows, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), deviceName, data)
end

function DAQmxGetSwitchDevNumColumns(deviceName, data)
    ccall((:DAQmxGetSwitchDevNumColumns, nidaqmx), int32, (Ptr{UInt8}, Ptr{uInt32}), deviceName, data)
end

function DAQmxGetSwitchDevTopology(deviceName, data, bufferSize)
    ccall((:DAQmxGetSwitchDevTopology, nidaqmx), int32, (Ptr{UInt8}, Cstring, uInt32), deviceName, data, bufferSize)
end

function DAQmxGetSwitchDevTemperature(deviceName, data)
    ccall((:DAQmxGetSwitchDevTemperature, nidaqmx), int32, (Ptr{UInt8}, Ptr{float64}), deviceName, data)
end

function DAQmxGetSwitchScanBreakMode(taskHandle, data)
    ccall((:DAQmxGetSwitchScanBreakMode, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetSwitchScanBreakMode(taskHandle, data)
    ccall((:DAQmxSetSwitchScanBreakMode, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetSwitchScanBreakMode(taskHandle)
    ccall((:DAQmxResetSwitchScanBreakMode, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSwitchScanRepeatMode(taskHandle, data)
    ccall((:DAQmxGetSwitchScanRepeatMode, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetSwitchScanRepeatMode(taskHandle, data)
    ccall((:DAQmxSetSwitchScanRepeatMode, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetSwitchScanRepeatMode(taskHandle)
    ccall((:DAQmxResetSwitchScanRepeatMode, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSwitchScanWaitingForAdv(taskHandle, data)
    ccall((:DAQmxGetSwitchScanWaitingForAdv, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetSysGlobalChans(data, bufferSize)
    ccall((:DAQmxGetSysGlobalChans, nidaqmx), int32, (Cstring, uInt32), data, bufferSize)
end

function DAQmxGetSysScales(data, bufferSize)
    ccall((:DAQmxGetSysScales, nidaqmx), int32, (Cstring, uInt32), data, bufferSize)
end

function DAQmxGetSysTasks(data, bufferSize)
    ccall((:DAQmxGetSysTasks, nidaqmx), int32, (Cstring, uInt32), data, bufferSize)
end

function DAQmxGetSysDevNames(data, bufferSize)
    ccall((:DAQmxGetSysDevNames, nidaqmx), int32, (Cstring, uInt32), data, bufferSize)
end

function DAQmxGetSysNIDAQMajorVersion(data)
    ccall((:DAQmxGetSysNIDAQMajorVersion, nidaqmx), int32, (Ptr{uInt32},), data)
end

function DAQmxGetSysNIDAQMinorVersion(data)
    ccall((:DAQmxGetSysNIDAQMinorVersion, nidaqmx), int32, (Ptr{uInt32},), data)
end

function DAQmxGetSysNIDAQUpdateVersion(data)
    ccall((:DAQmxGetSysNIDAQUpdateVersion, nidaqmx), int32, (Ptr{uInt32},), data)
end

function DAQmxGetTaskName(taskHandle, data, bufferSize)
    ccall((:DAQmxGetTaskName, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetTaskChannels(taskHandle, data, bufferSize)
    ccall((:DAQmxGetTaskChannels, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetTaskNumChans(taskHandle, data)
    ccall((:DAQmxGetTaskNumChans, nidaqmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxGetTaskDevices(taskHandle, data, bufferSize)
    ccall((:DAQmxGetTaskDevices, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetTaskNumDevices(taskHandle, data)
    ccall((:DAQmxGetTaskNumDevices, nidaqmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxGetTaskComplete(taskHandle, data)
    ccall((:DAQmxGetTaskComplete, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetSampQuantSampMode(taskHandle, data)
    ccall((:DAQmxGetSampQuantSampMode, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetSampQuantSampMode(taskHandle, data)
    ccall((:DAQmxSetSampQuantSampMode, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetSampQuantSampMode(taskHandle)
    ccall((:DAQmxResetSampQuantSampMode, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampQuantSampPerChan(taskHandle, data)
    ccall((:DAQmxGetSampQuantSampPerChan, nidaqmx), int32, (TaskHandle, Ptr{uInt64}), taskHandle, data)
end

function DAQmxSetSampQuantSampPerChan(taskHandle, data)
    ccall((:DAQmxSetSampQuantSampPerChan, nidaqmx), int32, (TaskHandle, uInt64), taskHandle, data)
end

function DAQmxResetSampQuantSampPerChan(taskHandle)
    ccall((:DAQmxResetSampQuantSampPerChan, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampTimingType(taskHandle, data)
    ccall((:DAQmxGetSampTimingType, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetSampTimingType(taskHandle, data)
    ccall((:DAQmxSetSampTimingType, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetSampTimingType(taskHandle)
    ccall((:DAQmxResetSampTimingType, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkRate(taskHandle, data)
    ccall((:DAQmxGetSampClkRate, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetSampClkRate(taskHandle, data)
    ccall((:DAQmxSetSampClkRate, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetSampClkRate(taskHandle)
    ccall((:DAQmxResetSampClkRate, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkMaxRate(taskHandle, data)
    ccall((:DAQmxGetSampClkMaxRate, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxGetSampClkSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetSampClkSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetSampClkSrc(taskHandle, data)
    ccall((:DAQmxSetSampClkSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetSampClkSrc(taskHandle)
    ccall((:DAQmxResetSampClkSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkActiveEdge(taskHandle, data)
    ccall((:DAQmxGetSampClkActiveEdge, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetSampClkActiveEdge(taskHandle, data)
    ccall((:DAQmxSetSampClkActiveEdge, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetSampClkActiveEdge(taskHandle)
    ccall((:DAQmxResetSampClkActiveEdge, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkOverrunBehavior(taskHandle, data)
    ccall((:DAQmxGetSampClkOverrunBehavior, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetSampClkOverrunBehavior(taskHandle, data)
    ccall((:DAQmxSetSampClkOverrunBehavior, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetSampClkOverrunBehavior(taskHandle)
    ccall((:DAQmxResetSampClkOverrunBehavior, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkUnderflowBehavior(taskHandle, data)
    ccall((:DAQmxGetSampClkUnderflowBehavior, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetSampClkUnderflowBehavior(taskHandle, data)
    ccall((:DAQmxSetSampClkUnderflowBehavior, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetSampClkUnderflowBehavior(taskHandle)
    ccall((:DAQmxResetSampClkUnderflowBehavior, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkTimebaseDiv(taskHandle, data)
    ccall((:DAQmxGetSampClkTimebaseDiv, nidaqmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetSampClkTimebaseDiv(taskHandle, data)
    ccall((:DAQmxSetSampClkTimebaseDiv, nidaqmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetSampClkTimebaseDiv(taskHandle)
    ccall((:DAQmxResetSampClkTimebaseDiv, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetSampClkTerm, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetSampClkTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetSampClkTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetSampClkTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetSampClkTimebaseRate, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetSampClkTimebaseRate(taskHandle)
    ccall((:DAQmxResetSampClkTimebaseRate, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetSampClkTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetSampClkTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetSampClkTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetSampClkTimebaseSrc(taskHandle)
    ccall((:DAQmxResetSampClkTimebaseSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkTimebaseActiveEdge(taskHandle, data)
    ccall((:DAQmxGetSampClkTimebaseActiveEdge, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetSampClkTimebaseActiveEdge(taskHandle, data)
    ccall((:DAQmxSetSampClkTimebaseActiveEdge, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetSampClkTimebaseActiveEdge(taskHandle)
    ccall((:DAQmxResetSampClkTimebaseActiveEdge, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkTimebaseMasterTimebaseDiv(taskHandle, data)
    ccall((:DAQmxGetSampClkTimebaseMasterTimebaseDiv, nidaqmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetSampClkTimebaseMasterTimebaseDiv(taskHandle, data)
    ccall((:DAQmxSetSampClkTimebaseMasterTimebaseDiv, nidaqmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetSampClkTimebaseMasterTimebaseDiv(taskHandle)
    ccall((:DAQmxResetSampClkTimebaseMasterTimebaseDiv, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkTimebaseTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetSampClkTimebaseTerm, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetSampClkDigFltrEnable(taskHandle, data)
    ccall((:DAQmxGetSampClkDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetSampClkDigFltrEnable(taskHandle, data)
    ccall((:DAQmxSetSampClkDigFltrEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetSampClkDigFltrEnable(taskHandle)
    ccall((:DAQmxResetSampClkDigFltrEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxGetSampClkDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetSampClkDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxSetSampClkDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetSampClkDigFltrMinPulseWidth(taskHandle)
    ccall((:DAQmxResetSampClkDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetSampClkDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetSampClkDigFltrTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetSampClkDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetSampClkDigFltrTimebaseSrc(taskHandle)
    ccall((:DAQmxResetSampClkDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetSampClkDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetSampClkDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetSampClkDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetSampClkDigFltrTimebaseRate(taskHandle)
    ccall((:DAQmxResetSampClkDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkDigSyncEnable(taskHandle, data)
    ccall((:DAQmxGetSampClkDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetSampClkDigSyncEnable(taskHandle, data)
    ccall((:DAQmxSetSampClkDigSyncEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetSampClkDigSyncEnable(taskHandle)
    ccall((:DAQmxResetSampClkDigSyncEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampClkWriteWfmUseInitialWfmDT(taskHandle, data)
    ccall((:DAQmxGetSampClkWriteWfmUseInitialWfmDT, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetSampClkWriteWfmUseInitialWfmDT(taskHandle, data)
    ccall((:DAQmxSetSampClkWriteWfmUseInitialWfmDT, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetSampClkWriteWfmUseInitialWfmDT(taskHandle)
    ccall((:DAQmxResetSampClkWriteWfmUseInitialWfmDT, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetHshkDelayAfterXfer(taskHandle, data)
    ccall((:DAQmxGetHshkDelayAfterXfer, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetHshkDelayAfterXfer(taskHandle, data)
    ccall((:DAQmxSetHshkDelayAfterXfer, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetHshkDelayAfterXfer(taskHandle)
    ccall((:DAQmxResetHshkDelayAfterXfer, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetHshkStartCond(taskHandle, data)
    ccall((:DAQmxGetHshkStartCond, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetHshkStartCond(taskHandle, data)
    ccall((:DAQmxSetHshkStartCond, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetHshkStartCond(taskHandle)
    ccall((:DAQmxResetHshkStartCond, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetHshkSampleInputDataWhen(taskHandle, data)
    ccall((:DAQmxGetHshkSampleInputDataWhen, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetHshkSampleInputDataWhen(taskHandle, data)
    ccall((:DAQmxSetHshkSampleInputDataWhen, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetHshkSampleInputDataWhen(taskHandle)
    ccall((:DAQmxResetHshkSampleInputDataWhen, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetChangeDetectDIRisingEdgePhysicalChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetChangeDetectDIRisingEdgePhysicalChans, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetChangeDetectDIRisingEdgePhysicalChans(taskHandle, data)
    ccall((:DAQmxSetChangeDetectDIRisingEdgePhysicalChans, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetChangeDetectDIRisingEdgePhysicalChans(taskHandle)
    ccall((:DAQmxResetChangeDetectDIRisingEdgePhysicalChans, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetChangeDetectDIFallingEdgePhysicalChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetChangeDetectDIFallingEdgePhysicalChans, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetChangeDetectDIFallingEdgePhysicalChans(taskHandle, data)
    ccall((:DAQmxSetChangeDetectDIFallingEdgePhysicalChans, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetChangeDetectDIFallingEdgePhysicalChans(taskHandle)
    ccall((:DAQmxResetChangeDetectDIFallingEdgePhysicalChans, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetChangeDetectDITristate(taskHandle, data)
    ccall((:DAQmxGetChangeDetectDITristate, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetChangeDetectDITristate(taskHandle, data)
    ccall((:DAQmxSetChangeDetectDITristate, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetChangeDetectDITristate(taskHandle)
    ccall((:DAQmxResetChangeDetectDITristate, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetOnDemandSimultaneousAOEnable(taskHandle, data)
    ccall((:DAQmxGetOnDemandSimultaneousAOEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetOnDemandSimultaneousAOEnable(taskHandle, data)
    ccall((:DAQmxSetOnDemandSimultaneousAOEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetOnDemandSimultaneousAOEnable(taskHandle)
    ccall((:DAQmxResetOnDemandSimultaneousAOEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetImplicitUnderflowBehavior(taskHandle, data)
    ccall((:DAQmxGetImplicitUnderflowBehavior, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetImplicitUnderflowBehavior(taskHandle, data)
    ccall((:DAQmxSetImplicitUnderflowBehavior, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetImplicitUnderflowBehavior(taskHandle)
    ccall((:DAQmxResetImplicitUnderflowBehavior, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAIConvRate(taskHandle, data)
    ccall((:DAQmxGetAIConvRate, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAIConvRate(taskHandle, data)
    ccall((:DAQmxSetAIConvRate, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAIConvRate(taskHandle)
    ccall((:DAQmxResetAIConvRate, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAIConvRateEx(taskHandle, deviceNames, data)
    ccall((:DAQmxGetAIConvRateEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, deviceNames, data)
end

function DAQmxSetAIConvRateEx(taskHandle, deviceNames, data)
    ccall((:DAQmxSetAIConvRateEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, deviceNames, data)
end

function DAQmxResetAIConvRateEx(taskHandle, deviceNames)
    ccall((:DAQmxResetAIConvRateEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, deviceNames)
end

function DAQmxGetAIConvMaxRate(taskHandle, data)
    ccall((:DAQmxGetAIConvMaxRate, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxGetAIConvMaxRateEx(taskHandle, deviceNames, data)
    ccall((:DAQmxGetAIConvMaxRateEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, deviceNames, data)
end

function DAQmxGetAIConvSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAIConvSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAIConvSrc(taskHandle, data)
    ccall((:DAQmxSetAIConvSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetAIConvSrc(taskHandle)
    ccall((:DAQmxResetAIConvSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAIConvSrcEx(taskHandle, deviceNames, data, bufferSize)
    ccall((:DAQmxGetAIConvSrcEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, deviceNames, data, bufferSize)
end

function DAQmxSetAIConvSrcEx(taskHandle, deviceNames, data)
    ccall((:DAQmxSetAIConvSrcEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, deviceNames, data)
end

function DAQmxResetAIConvSrcEx(taskHandle, deviceNames)
    ccall((:DAQmxResetAIConvSrcEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, deviceNames)
end

function DAQmxGetAIConvActiveEdge(taskHandle, data)
    ccall((:DAQmxGetAIConvActiveEdge, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAIConvActiveEdge(taskHandle, data)
    ccall((:DAQmxSetAIConvActiveEdge, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAIConvActiveEdge(taskHandle)
    ccall((:DAQmxResetAIConvActiveEdge, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAIConvActiveEdgeEx(taskHandle, deviceNames, data)
    ccall((:DAQmxGetAIConvActiveEdgeEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, deviceNames, data)
end

function DAQmxSetAIConvActiveEdgeEx(taskHandle, deviceNames, data)
    ccall((:DAQmxSetAIConvActiveEdgeEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, deviceNames, data)
end

function DAQmxResetAIConvActiveEdgeEx(taskHandle, deviceNames)
    ccall((:DAQmxResetAIConvActiveEdgeEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, deviceNames)
end

function DAQmxGetAIConvTimebaseDiv(taskHandle, data)
    ccall((:DAQmxGetAIConvTimebaseDiv, nidaqmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetAIConvTimebaseDiv(taskHandle, data)
    ccall((:DAQmxSetAIConvTimebaseDiv, nidaqmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetAIConvTimebaseDiv(taskHandle)
    ccall((:DAQmxResetAIConvTimebaseDiv, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAIConvTimebaseDivEx(taskHandle, deviceNames, data)
    ccall((:DAQmxGetAIConvTimebaseDivEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{uInt32}), taskHandle, deviceNames, data)
end

function DAQmxSetAIConvTimebaseDivEx(taskHandle, deviceNames, data)
    ccall((:DAQmxSetAIConvTimebaseDivEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, uInt32), taskHandle, deviceNames, data)
end

function DAQmxResetAIConvTimebaseDivEx(taskHandle, deviceNames)
    ccall((:DAQmxResetAIConvTimebaseDivEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, deviceNames)
end

function DAQmxGetAIConvTimebaseSrc(taskHandle, data)
    ccall((:DAQmxGetAIConvTimebaseSrc, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAIConvTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetAIConvTimebaseSrc, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAIConvTimebaseSrc(taskHandle)
    ccall((:DAQmxResetAIConvTimebaseSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAIConvTimebaseSrcEx(taskHandle, deviceNames, data)
    ccall((:DAQmxGetAIConvTimebaseSrcEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, deviceNames, data)
end

function DAQmxSetAIConvTimebaseSrcEx(taskHandle, deviceNames, data)
    ccall((:DAQmxSetAIConvTimebaseSrcEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, deviceNames, data)
end

function DAQmxResetAIConvTimebaseSrcEx(taskHandle, deviceNames)
    ccall((:DAQmxResetAIConvTimebaseSrcEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, deviceNames)
end

function DAQmxGetDelayFromSampClkDelayUnits(taskHandle, data)
    ccall((:DAQmxGetDelayFromSampClkDelayUnits, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetDelayFromSampClkDelayUnits(taskHandle, data)
    ccall((:DAQmxSetDelayFromSampClkDelayUnits, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetDelayFromSampClkDelayUnits(taskHandle)
    ccall((:DAQmxResetDelayFromSampClkDelayUnits, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDelayFromSampClkDelayUnitsEx(taskHandle, deviceNames, data)
    ccall((:DAQmxGetDelayFromSampClkDelayUnitsEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, deviceNames, data)
end

function DAQmxSetDelayFromSampClkDelayUnitsEx(taskHandle, deviceNames, data)
    ccall((:DAQmxSetDelayFromSampClkDelayUnitsEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, deviceNames, data)
end

function DAQmxResetDelayFromSampClkDelayUnitsEx(taskHandle, deviceNames)
    ccall((:DAQmxResetDelayFromSampClkDelayUnitsEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, deviceNames)
end

function DAQmxGetDelayFromSampClkDelay(taskHandle, data)
    ccall((:DAQmxGetDelayFromSampClkDelay, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetDelayFromSampClkDelay(taskHandle, data)
    ccall((:DAQmxSetDelayFromSampClkDelay, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetDelayFromSampClkDelay(taskHandle)
    ccall((:DAQmxResetDelayFromSampClkDelay, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDelayFromSampClkDelayEx(taskHandle, deviceNames, data)
    ccall((:DAQmxGetDelayFromSampClkDelayEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, deviceNames, data)
end

function DAQmxSetDelayFromSampClkDelayEx(taskHandle, deviceNames, data)
    ccall((:DAQmxSetDelayFromSampClkDelayEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, deviceNames, data)
end

function DAQmxResetDelayFromSampClkDelayEx(taskHandle, deviceNames)
    ccall((:DAQmxResetDelayFromSampClkDelayEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, deviceNames)
end

function DAQmxGetAIConvDigFltrEnable(taskHandle, data)
    ccall((:DAQmxGetAIConvDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAIConvDigFltrEnable(taskHandle, data)
    ccall((:DAQmxSetAIConvDigFltrEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAIConvDigFltrEnable(taskHandle)
    ccall((:DAQmxResetAIConvDigFltrEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAIConvDigFltrEnableEx(taskHandle, deviceNames, data)
    ccall((:DAQmxGetAIConvDigFltrEnableEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, deviceNames, data)
end

function DAQmxSetAIConvDigFltrEnableEx(taskHandle, deviceNames, data)
    ccall((:DAQmxSetAIConvDigFltrEnableEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, deviceNames, data)
end

function DAQmxResetAIConvDigFltrEnableEx(taskHandle, deviceNames)
    ccall((:DAQmxResetAIConvDigFltrEnableEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, deviceNames)
end

function DAQmxGetAIConvDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxGetAIConvDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAIConvDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxSetAIConvDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAIConvDigFltrMinPulseWidth(taskHandle)
    ccall((:DAQmxResetAIConvDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAIConvDigFltrMinPulseWidthEx(taskHandle, deviceNames, data)
    ccall((:DAQmxGetAIConvDigFltrMinPulseWidthEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, deviceNames, data)
end

function DAQmxSetAIConvDigFltrMinPulseWidthEx(taskHandle, deviceNames, data)
    ccall((:DAQmxSetAIConvDigFltrMinPulseWidthEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, deviceNames, data)
end

function DAQmxResetAIConvDigFltrMinPulseWidthEx(taskHandle, deviceNames)
    ccall((:DAQmxResetAIConvDigFltrMinPulseWidthEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, deviceNames)
end

function DAQmxGetAIConvDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAIConvDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAIConvDigFltrTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetAIConvDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetAIConvDigFltrTimebaseSrc(taskHandle)
    ccall((:DAQmxResetAIConvDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAIConvDigFltrTimebaseSrcEx(taskHandle, deviceNames, data, bufferSize)
    ccall((:DAQmxGetAIConvDigFltrTimebaseSrcEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring, uInt32), taskHandle, deviceNames, data, bufferSize)
end

function DAQmxSetAIConvDigFltrTimebaseSrcEx(taskHandle, deviceNames, data)
    ccall((:DAQmxSetAIConvDigFltrTimebaseSrcEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Cstring), taskHandle, deviceNames, data)
end

function DAQmxResetAIConvDigFltrTimebaseSrcEx(taskHandle, deviceNames)
    ccall((:DAQmxResetAIConvDigFltrTimebaseSrcEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, deviceNames)
end

function DAQmxGetAIConvDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetAIConvDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAIConvDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetAIConvDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAIConvDigFltrTimebaseRate(taskHandle)
    ccall((:DAQmxResetAIConvDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAIConvDigFltrTimebaseRateEx(taskHandle, deviceNames, data)
    ccall((:DAQmxGetAIConvDigFltrTimebaseRateEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, deviceNames, data)
end

function DAQmxSetAIConvDigFltrTimebaseRateEx(taskHandle, deviceNames, data)
    ccall((:DAQmxSetAIConvDigFltrTimebaseRateEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, deviceNames, data)
end

function DAQmxResetAIConvDigFltrTimebaseRateEx(taskHandle, deviceNames)
    ccall((:DAQmxResetAIConvDigFltrTimebaseRateEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, deviceNames)
end

function DAQmxGetAIConvDigSyncEnable(taskHandle, data)
    ccall((:DAQmxGetAIConvDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAIConvDigSyncEnable(taskHandle, data)
    ccall((:DAQmxSetAIConvDigSyncEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAIConvDigSyncEnable(taskHandle)
    ccall((:DAQmxResetAIConvDigSyncEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAIConvDigSyncEnableEx(taskHandle, deviceNames, data)
    ccall((:DAQmxGetAIConvDigSyncEnableEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{bool32}), taskHandle, deviceNames, data)
end

function DAQmxSetAIConvDigSyncEnableEx(taskHandle, deviceNames, data)
    ccall((:DAQmxSetAIConvDigSyncEnableEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, bool32), taskHandle, deviceNames, data)
end

function DAQmxResetAIConvDigSyncEnableEx(taskHandle, deviceNames)
    ccall((:DAQmxResetAIConvDigSyncEnableEx, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, deviceNames)
end

function DAQmxGetMasterTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetMasterTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetMasterTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetMasterTimebaseRate, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetMasterTimebaseRate(taskHandle)
    ccall((:DAQmxResetMasterTimebaseRate, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetMasterTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetMasterTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetMasterTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetMasterTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetMasterTimebaseSrc(taskHandle)
    ccall((:DAQmxResetMasterTimebaseSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRefClkRate(taskHandle, data)
    ccall((:DAQmxGetRefClkRate, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetRefClkRate(taskHandle, data)
    ccall((:DAQmxSetRefClkRate, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetRefClkRate(taskHandle)
    ccall((:DAQmxResetRefClkRate, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRefClkSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetRefClkSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetRefClkSrc(taskHandle, data)
    ccall((:DAQmxSetRefClkSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetRefClkSrc(taskHandle)
    ccall((:DAQmxResetRefClkSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSyncPulseType(taskHandle, data)
    ccall((:DAQmxGetSyncPulseType, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetSyncPulseType(taskHandle, data)
    ccall((:DAQmxSetSyncPulseType, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetSyncPulseType(taskHandle)
    ccall((:DAQmxResetSyncPulseType, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSyncPulseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetSyncPulseSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetSyncPulseSrc(taskHandle, data)
    ccall((:DAQmxSetSyncPulseSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetSyncPulseSrc(taskHandle)
    ccall((:DAQmxResetSyncPulseSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSyncPulseTimeWhen(taskHandle, data)
    ccall((:DAQmxGetSyncPulseTimeWhen, nidaqmx), int32, (TaskHandle, Ptr{CVIAbsoluteTime}), taskHandle, data)
end

function DAQmxSetSyncPulseTimeWhen(taskHandle, data)
    ccall((:DAQmxSetSyncPulseTimeWhen, nidaqmx), int32, (TaskHandle, CVIAbsoluteTime), taskHandle, data)
end

function DAQmxResetSyncPulseTimeWhen(taskHandle)
    ccall((:DAQmxResetSyncPulseTimeWhen, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSyncPulseTimeTimescale(taskHandle, data)
    ccall((:DAQmxGetSyncPulseTimeTimescale, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetSyncPulseTimeTimescale(taskHandle, data)
    ccall((:DAQmxSetSyncPulseTimeTimescale, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetSyncPulseTimeTimescale(taskHandle)
    ccall((:DAQmxResetSyncPulseTimeTimescale, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSyncPulseSyncTime(taskHandle, data)
    ccall((:DAQmxGetSyncPulseSyncTime, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxGetSyncPulseMinDelayToStart(taskHandle, data)
    ccall((:DAQmxGetSyncPulseMinDelayToStart, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetSyncPulseMinDelayToStart(taskHandle, data)
    ccall((:DAQmxSetSyncPulseMinDelayToStart, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetSyncPulseMinDelayToStart(taskHandle)
    ccall((:DAQmxResetSyncPulseMinDelayToStart, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSyncPulseResetTime(taskHandle, data)
    ccall((:DAQmxGetSyncPulseResetTime, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxGetSyncPulseResetDelay(taskHandle, data)
    ccall((:DAQmxGetSyncPulseResetDelay, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetSyncPulseResetDelay(taskHandle, data)
    ccall((:DAQmxSetSyncPulseResetDelay, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetSyncPulseResetDelay(taskHandle)
    ccall((:DAQmxResetSyncPulseResetDelay, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSyncPulseTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetSyncPulseTerm, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetSyncClkInterval(taskHandle, data)
    ccall((:DAQmxGetSyncClkInterval, nidaqmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetSyncClkInterval(taskHandle, data)
    ccall((:DAQmxSetSyncClkInterval, nidaqmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetSyncClkInterval(taskHandle)
    ccall((:DAQmxResetSyncClkInterval, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetSampTimingEngine(taskHandle, data)
    ccall((:DAQmxGetSampTimingEngine, nidaqmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetSampTimingEngine(taskHandle, data)
    ccall((:DAQmxSetSampTimingEngine, nidaqmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetSampTimingEngine(taskHandle)
    ccall((:DAQmxResetSampTimingEngine, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetFirstSampTimestampEnable(taskHandle, data)
    ccall((:DAQmxGetFirstSampTimestampEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetFirstSampTimestampEnable(taskHandle, data)
    ccall((:DAQmxSetFirstSampTimestampEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetFirstSampTimestampEnable(taskHandle)
    ccall((:DAQmxResetFirstSampTimestampEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetFirstSampTimestampTimescale(taskHandle, data)
    ccall((:DAQmxGetFirstSampTimestampTimescale, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetFirstSampTimestampTimescale(taskHandle, data)
    ccall((:DAQmxSetFirstSampTimestampTimescale, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetFirstSampTimestampTimescale(taskHandle)
    ccall((:DAQmxResetFirstSampTimestampTimescale, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetFirstSampTimestampVal(taskHandle, data)
    ccall((:DAQmxGetFirstSampTimestampVal, nidaqmx), int32, (TaskHandle, Ptr{CVIAbsoluteTime}), taskHandle, data)
end

function DAQmxGetFirstSampClkWhen(taskHandle, data)
    ccall((:DAQmxGetFirstSampClkWhen, nidaqmx), int32, (TaskHandle, Ptr{CVIAbsoluteTime}), taskHandle, data)
end

function DAQmxSetFirstSampClkWhen(taskHandle, data)
    ccall((:DAQmxSetFirstSampClkWhen, nidaqmx), int32, (TaskHandle, CVIAbsoluteTime), taskHandle, data)
end

function DAQmxResetFirstSampClkWhen(taskHandle)
    ccall((:DAQmxResetFirstSampClkWhen, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetFirstSampClkTimescale(taskHandle, data)
    ccall((:DAQmxGetFirstSampClkTimescale, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetFirstSampClkTimescale(taskHandle, data)
    ccall((:DAQmxSetFirstSampClkTimescale, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetFirstSampClkTimescale(taskHandle)
    ccall((:DAQmxResetFirstSampClkTimescale, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetFirstSampClkOffset(taskHandle, data)
    ccall((:DAQmxGetFirstSampClkOffset, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetFirstSampClkOffset(taskHandle, data)
    ccall((:DAQmxSetFirstSampClkOffset, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetFirstSampClkOffset(taskHandle)
    ccall((:DAQmxResetFirstSampClkOffset, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetStartTrigType(taskHandle, data)
    ccall((:DAQmxGetStartTrigType, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetStartTrigType(taskHandle, data)
    ccall((:DAQmxSetStartTrigType, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetStartTrigType(taskHandle)
    ccall((:DAQmxResetStartTrigType, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetStartTrigTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetStartTrigTerm, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetDigEdgeStartTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigEdgeStartTrigSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigEdgeStartTrigSrc(taskHandle, data)
    ccall((:DAQmxSetDigEdgeStartTrigSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetDigEdgeStartTrigSrc(taskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeStartTrigEdge(taskHandle, data)
    ccall((:DAQmxGetDigEdgeStartTrigEdge, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetDigEdgeStartTrigEdge(taskHandle, data)
    ccall((:DAQmxSetDigEdgeStartTrigEdge, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetDigEdgeStartTrigEdge(taskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigEdge, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeStartTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxGetDigEdgeStartTrigDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetDigEdgeStartTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxSetDigEdgeStartTrigDigFltrEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetDigEdgeStartTrigDigFltrEnable(taskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigDigFltrEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeStartTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxGetDigEdgeStartTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetDigEdgeStartTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxSetDigEdgeStartTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetDigEdgeStartTrigDigFltrMinPulseWidth(taskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeStartTrigDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigEdgeStartTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigEdgeStartTrigDigFltrTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetDigEdgeStartTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetDigEdgeStartTrigDigFltrTimebaseSrc(taskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeStartTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetDigEdgeStartTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetDigEdgeStartTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetDigEdgeStartTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetDigEdgeStartTrigDigFltrTimebaseRate(taskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeStartTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxGetDigEdgeStartTrigDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetDigEdgeStartTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxSetDigEdgeStartTrigDigSyncEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetDigEdgeStartTrigDigSyncEnable(taskHandle)
    ccall((:DAQmxResetDigEdgeStartTrigDigSyncEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigPatternStartTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigPatternStartTrigSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigPatternStartTrigSrc(taskHandle, data)
    ccall((:DAQmxSetDigPatternStartTrigSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetDigPatternStartTrigSrc(taskHandle)
    ccall((:DAQmxResetDigPatternStartTrigSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigPatternStartTrigPattern(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigPatternStartTrigPattern, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigPatternStartTrigPattern(taskHandle, data)
    ccall((:DAQmxSetDigPatternStartTrigPattern, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetDigPatternStartTrigPattern(taskHandle)
    ccall((:DAQmxResetDigPatternStartTrigPattern, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigPatternStartTrigWhen(taskHandle, data)
    ccall((:DAQmxGetDigPatternStartTrigWhen, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetDigPatternStartTrigWhen(taskHandle, data)
    ccall((:DAQmxSetDigPatternStartTrigWhen, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetDigPatternStartTrigWhen(taskHandle)
    ccall((:DAQmxResetDigPatternStartTrigWhen, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeStartTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgEdgeStartTrigSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgEdgeStartTrigSrc(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeStartTrigSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetAnlgEdgeStartTrigSrc(taskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeStartTrigSlope(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeStartTrigSlope, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAnlgEdgeStartTrigSlope(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeStartTrigSlope, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAnlgEdgeStartTrigSlope(taskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigSlope, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeStartTrigLvl(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeStartTrigLvl, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgEdgeStartTrigLvl(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeStartTrigLvl, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgEdgeStartTrigLvl(taskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigLvl, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeStartTrigHyst(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeStartTrigHyst, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgEdgeStartTrigHyst(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeStartTrigHyst, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgEdgeStartTrigHyst(taskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigHyst, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeStartTrigCoupling(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeStartTrigCoupling, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAnlgEdgeStartTrigCoupling(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeStartTrigCoupling, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAnlgEdgeStartTrigCoupling(taskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigCoupling, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeStartTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeStartTrigDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAnlgEdgeStartTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeStartTrigDigFltrEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAnlgEdgeStartTrigDigFltrEnable(taskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigDigFltrEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeStartTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeStartTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgEdgeStartTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeStartTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgEdgeStartTrigDigFltrMinPulseWidth(taskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeStartTrigDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgEdgeStartTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgEdgeStartTrigDigFltrTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeStartTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetAnlgEdgeStartTrigDigFltrTimebaseSrc(taskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeStartTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeStartTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgEdgeStartTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeStartTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgEdgeStartTrigDigFltrTimebaseRate(taskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeStartTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeStartTrigDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAnlgEdgeStartTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeStartTrigDigSyncEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAnlgEdgeStartTrigDigSyncEnable(taskHandle)
    ccall((:DAQmxResetAnlgEdgeStartTrigDigSyncEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgMultiEdgeStartTrigSrcs(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgMultiEdgeStartTrigSrcs, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgMultiEdgeStartTrigSrcs(taskHandle, data)
    ccall((:DAQmxSetAnlgMultiEdgeStartTrigSrcs, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetAnlgMultiEdgeStartTrigSrcs(taskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeStartTrigSrcs, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgMultiEdgeStartTrigSlopes(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxGetAnlgMultiEdgeStartTrigSlopes, nidaqmx), int32, (TaskHandle, Ptr{int32}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxSetAnlgMultiEdgeStartTrigSlopes(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxSetAnlgMultiEdgeStartTrigSlopes, nidaqmx), int32, (TaskHandle, Ptr{int32}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxResetAnlgMultiEdgeStartTrigSlopes(taskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeStartTrigSlopes, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgMultiEdgeStartTrigLvls(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxGetAnlgMultiEdgeStartTrigLvls, nidaqmx), int32, (TaskHandle, Ptr{float64}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxSetAnlgMultiEdgeStartTrigLvls(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxSetAnlgMultiEdgeStartTrigLvls, nidaqmx), int32, (TaskHandle, Ptr{float64}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxResetAnlgMultiEdgeStartTrigLvls(taskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeStartTrigLvls, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgMultiEdgeStartTrigHysts(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxGetAnlgMultiEdgeStartTrigHysts, nidaqmx), int32, (TaskHandle, Ptr{float64}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxSetAnlgMultiEdgeStartTrigHysts(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxSetAnlgMultiEdgeStartTrigHysts, nidaqmx), int32, (TaskHandle, Ptr{float64}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxResetAnlgMultiEdgeStartTrigHysts(taskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeStartTrigHysts, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgMultiEdgeStartTrigCouplings(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxGetAnlgMultiEdgeStartTrigCouplings, nidaqmx), int32, (TaskHandle, Ptr{int32}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxSetAnlgMultiEdgeStartTrigCouplings(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxSetAnlgMultiEdgeStartTrigCouplings, nidaqmx), int32, (TaskHandle, Ptr{int32}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxResetAnlgMultiEdgeStartTrigCouplings(taskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeStartTrigCouplings, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinStartTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgWinStartTrigSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgWinStartTrigSrc(taskHandle, data)
    ccall((:DAQmxSetAnlgWinStartTrigSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetAnlgWinStartTrigSrc(taskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinStartTrigWhen(taskHandle, data)
    ccall((:DAQmxGetAnlgWinStartTrigWhen, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAnlgWinStartTrigWhen(taskHandle, data)
    ccall((:DAQmxSetAnlgWinStartTrigWhen, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAnlgWinStartTrigWhen(taskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigWhen, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinStartTrigTop(taskHandle, data)
    ccall((:DAQmxGetAnlgWinStartTrigTop, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgWinStartTrigTop(taskHandle, data)
    ccall((:DAQmxSetAnlgWinStartTrigTop, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgWinStartTrigTop(taskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigTop, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinStartTrigBtm(taskHandle, data)
    ccall((:DAQmxGetAnlgWinStartTrigBtm, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgWinStartTrigBtm(taskHandle, data)
    ccall((:DAQmxSetAnlgWinStartTrigBtm, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgWinStartTrigBtm(taskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigBtm, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinStartTrigCoupling(taskHandle, data)
    ccall((:DAQmxGetAnlgWinStartTrigCoupling, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAnlgWinStartTrigCoupling(taskHandle, data)
    ccall((:DAQmxSetAnlgWinStartTrigCoupling, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAnlgWinStartTrigCoupling(taskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigCoupling, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinStartTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxGetAnlgWinStartTrigDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAnlgWinStartTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxSetAnlgWinStartTrigDigFltrEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAnlgWinStartTrigDigFltrEnable(taskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigDigFltrEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinStartTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxGetAnlgWinStartTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgWinStartTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxSetAnlgWinStartTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgWinStartTrigDigFltrMinPulseWidth(taskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinStartTrigDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgWinStartTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgWinStartTrigDigFltrTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetAnlgWinStartTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetAnlgWinStartTrigDigFltrTimebaseSrc(taskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinStartTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetAnlgWinStartTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgWinStartTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetAnlgWinStartTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgWinStartTrigDigFltrTimebaseRate(taskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinStartTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxGetAnlgWinStartTrigDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAnlgWinStartTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxSetAnlgWinStartTrigDigSyncEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAnlgWinStartTrigDigSyncEnable(taskHandle)
    ccall((:DAQmxResetAnlgWinStartTrigDigSyncEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetStartTrigTrigWhen(taskHandle, data)
    ccall((:DAQmxGetStartTrigTrigWhen, nidaqmx), int32, (TaskHandle, Ptr{CVIAbsoluteTime}), taskHandle, data)
end

function DAQmxSetStartTrigTrigWhen(taskHandle, data)
    ccall((:DAQmxSetStartTrigTrigWhen, nidaqmx), int32, (TaskHandle, CVIAbsoluteTime), taskHandle, data)
end

function DAQmxResetStartTrigTrigWhen(taskHandle)
    ccall((:DAQmxResetStartTrigTrigWhen, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetStartTrigTimescale(taskHandle, data)
    ccall((:DAQmxGetStartTrigTimescale, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetStartTrigTimescale(taskHandle, data)
    ccall((:DAQmxSetStartTrigTimescale, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetStartTrigTimescale(taskHandle)
    ccall((:DAQmxResetStartTrigTimescale, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetStartTrigTimestampEnable(taskHandle, data)
    ccall((:DAQmxGetStartTrigTimestampEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetStartTrigTimestampEnable(taskHandle, data)
    ccall((:DAQmxSetStartTrigTimestampEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetStartTrigTimestampEnable(taskHandle)
    ccall((:DAQmxResetStartTrigTimestampEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetStartTrigTimestampTimescale(taskHandle, data)
    ccall((:DAQmxGetStartTrigTimestampTimescale, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetStartTrigTimestampTimescale(taskHandle, data)
    ccall((:DAQmxSetStartTrigTimestampTimescale, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetStartTrigTimestampTimescale(taskHandle)
    ccall((:DAQmxResetStartTrigTimestampTimescale, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetStartTrigTimestampVal(taskHandle, data)
    ccall((:DAQmxGetStartTrigTimestampVal, nidaqmx), int32, (TaskHandle, Ptr{CVIAbsoluteTime}), taskHandle, data)
end

function DAQmxGetStartTrigDelay(taskHandle, data)
    ccall((:DAQmxGetStartTrigDelay, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetStartTrigDelay(taskHandle, data)
    ccall((:DAQmxSetStartTrigDelay, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetStartTrigDelay(taskHandle)
    ccall((:DAQmxResetStartTrigDelay, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetStartTrigDelayUnits(taskHandle, data)
    ccall((:DAQmxGetStartTrigDelayUnits, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetStartTrigDelayUnits(taskHandle, data)
    ccall((:DAQmxSetStartTrigDelayUnits, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetStartTrigDelayUnits(taskHandle)
    ccall((:DAQmxResetStartTrigDelayUnits, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetStartTrigRetriggerable(taskHandle, data)
    ccall((:DAQmxGetStartTrigRetriggerable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetStartTrigRetriggerable(taskHandle, data)
    ccall((:DAQmxSetStartTrigRetriggerable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetStartTrigRetriggerable(taskHandle)
    ccall((:DAQmxResetStartTrigRetriggerable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetStartTrigTrigWin(taskHandle, data)
    ccall((:DAQmxGetStartTrigTrigWin, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetStartTrigTrigWin(taskHandle, data)
    ccall((:DAQmxSetStartTrigTrigWin, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetStartTrigTrigWin(taskHandle)
    ccall((:DAQmxResetStartTrigTrigWin, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetStartTrigRetriggerWin(taskHandle, data)
    ccall((:DAQmxGetStartTrigRetriggerWin, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetStartTrigRetriggerWin(taskHandle, data)
    ccall((:DAQmxSetStartTrigRetriggerWin, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetStartTrigRetriggerWin(taskHandle)
    ccall((:DAQmxResetStartTrigRetriggerWin, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetStartTrigMaxNumTrigsToDetect(taskHandle, data)
    ccall((:DAQmxGetStartTrigMaxNumTrigsToDetect, nidaqmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetStartTrigMaxNumTrigsToDetect(taskHandle, data)
    ccall((:DAQmxSetStartTrigMaxNumTrigsToDetect, nidaqmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetStartTrigMaxNumTrigsToDetect(taskHandle)
    ccall((:DAQmxResetStartTrigMaxNumTrigsToDetect, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRefTrigType(taskHandle, data)
    ccall((:DAQmxGetRefTrigType, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetRefTrigType(taskHandle, data)
    ccall((:DAQmxSetRefTrigType, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetRefTrigType(taskHandle)
    ccall((:DAQmxResetRefTrigType, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRefTrigPretrigSamples(taskHandle, data)
    ccall((:DAQmxGetRefTrigPretrigSamples, nidaqmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetRefTrigPretrigSamples(taskHandle, data)
    ccall((:DAQmxSetRefTrigPretrigSamples, nidaqmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetRefTrigPretrigSamples(taskHandle)
    ccall((:DAQmxResetRefTrigPretrigSamples, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRefTrigTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetRefTrigTerm, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetDigEdgeRefTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigEdgeRefTrigSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigEdgeRefTrigSrc(taskHandle, data)
    ccall((:DAQmxSetDigEdgeRefTrigSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetDigEdgeRefTrigSrc(taskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeRefTrigEdge(taskHandle, data)
    ccall((:DAQmxGetDigEdgeRefTrigEdge, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetDigEdgeRefTrigEdge(taskHandle, data)
    ccall((:DAQmxSetDigEdgeRefTrigEdge, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetDigEdgeRefTrigEdge(taskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigEdge, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeRefTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxGetDigEdgeRefTrigDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetDigEdgeRefTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxSetDigEdgeRefTrigDigFltrEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetDigEdgeRefTrigDigFltrEnable(taskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigDigFltrEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeRefTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxGetDigEdgeRefTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetDigEdgeRefTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxSetDigEdgeRefTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetDigEdgeRefTrigDigFltrMinPulseWidth(taskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeRefTrigDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigEdgeRefTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigEdgeRefTrigDigFltrTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetDigEdgeRefTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetDigEdgeRefTrigDigFltrTimebaseSrc(taskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeRefTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetDigEdgeRefTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetDigEdgeRefTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetDigEdgeRefTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetDigEdgeRefTrigDigFltrTimebaseRate(taskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeRefTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxGetDigEdgeRefTrigDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetDigEdgeRefTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxSetDigEdgeRefTrigDigSyncEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetDigEdgeRefTrigDigSyncEnable(taskHandle)
    ccall((:DAQmxResetDigEdgeRefTrigDigSyncEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigPatternRefTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigPatternRefTrigSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigPatternRefTrigSrc(taskHandle, data)
    ccall((:DAQmxSetDigPatternRefTrigSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetDigPatternRefTrigSrc(taskHandle)
    ccall((:DAQmxResetDigPatternRefTrigSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigPatternRefTrigPattern(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigPatternRefTrigPattern, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigPatternRefTrigPattern(taskHandle, data)
    ccall((:DAQmxSetDigPatternRefTrigPattern, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetDigPatternRefTrigPattern(taskHandle)
    ccall((:DAQmxResetDigPatternRefTrigPattern, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigPatternRefTrigWhen(taskHandle, data)
    ccall((:DAQmxGetDigPatternRefTrigWhen, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetDigPatternRefTrigWhen(taskHandle, data)
    ccall((:DAQmxSetDigPatternRefTrigWhen, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetDigPatternRefTrigWhen(taskHandle)
    ccall((:DAQmxResetDigPatternRefTrigWhen, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeRefTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgEdgeRefTrigSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgEdgeRefTrigSrc(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeRefTrigSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetAnlgEdgeRefTrigSrc(taskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeRefTrigSlope(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeRefTrigSlope, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAnlgEdgeRefTrigSlope(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeRefTrigSlope, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAnlgEdgeRefTrigSlope(taskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigSlope, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeRefTrigLvl(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeRefTrigLvl, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgEdgeRefTrigLvl(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeRefTrigLvl, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgEdgeRefTrigLvl(taskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigLvl, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeRefTrigHyst(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeRefTrigHyst, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgEdgeRefTrigHyst(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeRefTrigHyst, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgEdgeRefTrigHyst(taskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigHyst, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeRefTrigCoupling(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeRefTrigCoupling, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAnlgEdgeRefTrigCoupling(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeRefTrigCoupling, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAnlgEdgeRefTrigCoupling(taskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigCoupling, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeRefTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeRefTrigDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAnlgEdgeRefTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeRefTrigDigFltrEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAnlgEdgeRefTrigDigFltrEnable(taskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigDigFltrEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeRefTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeRefTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgEdgeRefTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeRefTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgEdgeRefTrigDigFltrMinPulseWidth(taskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeRefTrigDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgEdgeRefTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgEdgeRefTrigDigFltrTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeRefTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetAnlgEdgeRefTrigDigFltrTimebaseSrc(taskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeRefTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeRefTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgEdgeRefTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeRefTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgEdgeRefTrigDigFltrTimebaseRate(taskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgEdgeRefTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxGetAnlgEdgeRefTrigDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAnlgEdgeRefTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxSetAnlgEdgeRefTrigDigSyncEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAnlgEdgeRefTrigDigSyncEnable(taskHandle)
    ccall((:DAQmxResetAnlgEdgeRefTrigDigSyncEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgMultiEdgeRefTrigSrcs(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgMultiEdgeRefTrigSrcs, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgMultiEdgeRefTrigSrcs(taskHandle, data)
    ccall((:DAQmxSetAnlgMultiEdgeRefTrigSrcs, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetAnlgMultiEdgeRefTrigSrcs(taskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeRefTrigSrcs, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgMultiEdgeRefTrigSlopes(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxGetAnlgMultiEdgeRefTrigSlopes, nidaqmx), int32, (TaskHandle, Ptr{int32}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxSetAnlgMultiEdgeRefTrigSlopes(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxSetAnlgMultiEdgeRefTrigSlopes, nidaqmx), int32, (TaskHandle, Ptr{int32}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxResetAnlgMultiEdgeRefTrigSlopes(taskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeRefTrigSlopes, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgMultiEdgeRefTrigLvls(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxGetAnlgMultiEdgeRefTrigLvls, nidaqmx), int32, (TaskHandle, Ptr{float64}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxSetAnlgMultiEdgeRefTrigLvls(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxSetAnlgMultiEdgeRefTrigLvls, nidaqmx), int32, (TaskHandle, Ptr{float64}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxResetAnlgMultiEdgeRefTrigLvls(taskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeRefTrigLvls, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgMultiEdgeRefTrigHysts(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxGetAnlgMultiEdgeRefTrigHysts, nidaqmx), int32, (TaskHandle, Ptr{float64}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxSetAnlgMultiEdgeRefTrigHysts(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxSetAnlgMultiEdgeRefTrigHysts, nidaqmx), int32, (TaskHandle, Ptr{float64}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxResetAnlgMultiEdgeRefTrigHysts(taskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeRefTrigHysts, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgMultiEdgeRefTrigCouplings(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxGetAnlgMultiEdgeRefTrigCouplings, nidaqmx), int32, (TaskHandle, Ptr{int32}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxSetAnlgMultiEdgeRefTrigCouplings(taskHandle, data, arraySizeInElements)
    ccall((:DAQmxSetAnlgMultiEdgeRefTrigCouplings, nidaqmx), int32, (TaskHandle, Ptr{int32}, uInt32), taskHandle, data, arraySizeInElements)
end

function DAQmxResetAnlgMultiEdgeRefTrigCouplings(taskHandle)
    ccall((:DAQmxResetAnlgMultiEdgeRefTrigCouplings, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinRefTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgWinRefTrigSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgWinRefTrigSrc(taskHandle, data)
    ccall((:DAQmxSetAnlgWinRefTrigSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetAnlgWinRefTrigSrc(taskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinRefTrigWhen(taskHandle, data)
    ccall((:DAQmxGetAnlgWinRefTrigWhen, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAnlgWinRefTrigWhen(taskHandle, data)
    ccall((:DAQmxSetAnlgWinRefTrigWhen, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAnlgWinRefTrigWhen(taskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigWhen, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinRefTrigTop(taskHandle, data)
    ccall((:DAQmxGetAnlgWinRefTrigTop, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgWinRefTrigTop(taskHandle, data)
    ccall((:DAQmxSetAnlgWinRefTrigTop, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgWinRefTrigTop(taskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigTop, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinRefTrigBtm(taskHandle, data)
    ccall((:DAQmxGetAnlgWinRefTrigBtm, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgWinRefTrigBtm(taskHandle, data)
    ccall((:DAQmxSetAnlgWinRefTrigBtm, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgWinRefTrigBtm(taskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigBtm, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinRefTrigCoupling(taskHandle, data)
    ccall((:DAQmxGetAnlgWinRefTrigCoupling, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAnlgWinRefTrigCoupling(taskHandle, data)
    ccall((:DAQmxSetAnlgWinRefTrigCoupling, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAnlgWinRefTrigCoupling(taskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigCoupling, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinRefTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxGetAnlgWinRefTrigDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAnlgWinRefTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxSetAnlgWinRefTrigDigFltrEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAnlgWinRefTrigDigFltrEnable(taskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigDigFltrEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinRefTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxGetAnlgWinRefTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgWinRefTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxSetAnlgWinRefTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgWinRefTrigDigFltrMinPulseWidth(taskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinRefTrigDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgWinRefTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgWinRefTrigDigFltrTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetAnlgWinRefTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetAnlgWinRefTrigDigFltrTimebaseSrc(taskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinRefTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetAnlgWinRefTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgWinRefTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetAnlgWinRefTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgWinRefTrigDigFltrTimebaseRate(taskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinRefTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxGetAnlgWinRefTrigDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAnlgWinRefTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxSetAnlgWinRefTrigDigSyncEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAnlgWinRefTrigDigSyncEnable(taskHandle)
    ccall((:DAQmxResetAnlgWinRefTrigDigSyncEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRefTrigAutoTrigEnable(taskHandle, data)
    ccall((:DAQmxGetRefTrigAutoTrigEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetRefTrigAutoTrigEnable(taskHandle, data)
    ccall((:DAQmxSetRefTrigAutoTrigEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetRefTrigAutoTrigEnable(taskHandle)
    ccall((:DAQmxResetRefTrigAutoTrigEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRefTrigAutoTriggered(taskHandle, data)
    ccall((:DAQmxGetRefTrigAutoTriggered, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetRefTrigTimestampEnable(taskHandle, data)
    ccall((:DAQmxGetRefTrigTimestampEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetRefTrigTimestampEnable(taskHandle, data)
    ccall((:DAQmxSetRefTrigTimestampEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetRefTrigTimestampEnable(taskHandle)
    ccall((:DAQmxResetRefTrigTimestampEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRefTrigTimestampTimescale(taskHandle, data)
    ccall((:DAQmxGetRefTrigTimestampTimescale, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetRefTrigTimestampTimescale(taskHandle, data)
    ccall((:DAQmxSetRefTrigTimestampTimescale, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetRefTrigTimestampTimescale(taskHandle)
    ccall((:DAQmxResetRefTrigTimestampTimescale, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRefTrigTimestampVal(taskHandle, data)
    ccall((:DAQmxGetRefTrigTimestampVal, nidaqmx), int32, (TaskHandle, Ptr{CVIAbsoluteTime}), taskHandle, data)
end

function DAQmxGetRefTrigDelay(taskHandle, data)
    ccall((:DAQmxGetRefTrigDelay, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetRefTrigDelay(taskHandle, data)
    ccall((:DAQmxSetRefTrigDelay, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetRefTrigDelay(taskHandle)
    ccall((:DAQmxResetRefTrigDelay, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRefTrigRetriggerable(taskHandle, data)
    ccall((:DAQmxGetRefTrigRetriggerable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetRefTrigRetriggerable(taskHandle, data)
    ccall((:DAQmxSetRefTrigRetriggerable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetRefTrigRetriggerable(taskHandle)
    ccall((:DAQmxResetRefTrigRetriggerable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRefTrigTrigWin(taskHandle, data)
    ccall((:DAQmxGetRefTrigTrigWin, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetRefTrigTrigWin(taskHandle, data)
    ccall((:DAQmxSetRefTrigTrigWin, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetRefTrigTrigWin(taskHandle)
    ccall((:DAQmxResetRefTrigTrigWin, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRefTrigRetriggerWin(taskHandle, data)
    ccall((:DAQmxGetRefTrigRetriggerWin, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetRefTrigRetriggerWin(taskHandle, data)
    ccall((:DAQmxSetRefTrigRetriggerWin, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetRefTrigRetriggerWin(taskHandle)
    ccall((:DAQmxResetRefTrigRetriggerWin, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetRefTrigMaxNumTrigsToDetect(taskHandle, data)
    ccall((:DAQmxGetRefTrigMaxNumTrigsToDetect, nidaqmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxSetRefTrigMaxNumTrigsToDetect(taskHandle, data)
    ccall((:DAQmxSetRefTrigMaxNumTrigsToDetect, nidaqmx), int32, (TaskHandle, uInt32), taskHandle, data)
end

function DAQmxResetRefTrigMaxNumTrigsToDetect(taskHandle)
    ccall((:DAQmxResetRefTrigMaxNumTrigsToDetect, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAdvTrigType(taskHandle, data)
    ccall((:DAQmxGetAdvTrigType, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAdvTrigType(taskHandle, data)
    ccall((:DAQmxSetAdvTrigType, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAdvTrigType(taskHandle)
    ccall((:DAQmxResetAdvTrigType, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeAdvTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigEdgeAdvTrigSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigEdgeAdvTrigSrc(taskHandle, data)
    ccall((:DAQmxSetDigEdgeAdvTrigSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetDigEdgeAdvTrigSrc(taskHandle)
    ccall((:DAQmxResetDigEdgeAdvTrigSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeAdvTrigEdge(taskHandle, data)
    ccall((:DAQmxGetDigEdgeAdvTrigEdge, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetDigEdgeAdvTrigEdge(taskHandle, data)
    ccall((:DAQmxSetDigEdgeAdvTrigEdge, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetDigEdgeAdvTrigEdge(taskHandle)
    ccall((:DAQmxResetDigEdgeAdvTrigEdge, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeAdvTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxGetDigEdgeAdvTrigDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetDigEdgeAdvTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxSetDigEdgeAdvTrigDigFltrEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetDigEdgeAdvTrigDigFltrEnable(taskHandle)
    ccall((:DAQmxResetDigEdgeAdvTrigDigFltrEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetHshkTrigType(taskHandle, data)
    ccall((:DAQmxGetHshkTrigType, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetHshkTrigType(taskHandle, data)
    ccall((:DAQmxSetHshkTrigType, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetHshkTrigType(taskHandle)
    ccall((:DAQmxResetHshkTrigType, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetInterlockedHshkTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetInterlockedHshkTrigSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetInterlockedHshkTrigSrc(taskHandle, data)
    ccall((:DAQmxSetInterlockedHshkTrigSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetInterlockedHshkTrigSrc(taskHandle)
    ccall((:DAQmxResetInterlockedHshkTrigSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetInterlockedHshkTrigAssertedLvl(taskHandle, data)
    ccall((:DAQmxGetInterlockedHshkTrigAssertedLvl, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetInterlockedHshkTrigAssertedLvl(taskHandle, data)
    ccall((:DAQmxSetInterlockedHshkTrigAssertedLvl, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetInterlockedHshkTrigAssertedLvl(taskHandle)
    ccall((:DAQmxResetInterlockedHshkTrigAssertedLvl, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetPauseTrigType(taskHandle, data)
    ccall((:DAQmxGetPauseTrigType, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetPauseTrigType(taskHandle, data)
    ccall((:DAQmxSetPauseTrigType, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetPauseTrigType(taskHandle)
    ccall((:DAQmxResetPauseTrigType, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetPauseTrigTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetPauseTrigTerm, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetAnlgLvlPauseTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgLvlPauseTrigSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgLvlPauseTrigSrc(taskHandle, data)
    ccall((:DAQmxSetAnlgLvlPauseTrigSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetAnlgLvlPauseTrigSrc(taskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgLvlPauseTrigWhen(taskHandle, data)
    ccall((:DAQmxGetAnlgLvlPauseTrigWhen, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAnlgLvlPauseTrigWhen(taskHandle, data)
    ccall((:DAQmxSetAnlgLvlPauseTrigWhen, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAnlgLvlPauseTrigWhen(taskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigWhen, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgLvlPauseTrigLvl(taskHandle, data)
    ccall((:DAQmxGetAnlgLvlPauseTrigLvl, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgLvlPauseTrigLvl(taskHandle, data)
    ccall((:DAQmxSetAnlgLvlPauseTrigLvl, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgLvlPauseTrigLvl(taskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigLvl, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgLvlPauseTrigHyst(taskHandle, data)
    ccall((:DAQmxGetAnlgLvlPauseTrigHyst, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgLvlPauseTrigHyst(taskHandle, data)
    ccall((:DAQmxSetAnlgLvlPauseTrigHyst, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgLvlPauseTrigHyst(taskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigHyst, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgLvlPauseTrigCoupling(taskHandle, data)
    ccall((:DAQmxGetAnlgLvlPauseTrigCoupling, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAnlgLvlPauseTrigCoupling(taskHandle, data)
    ccall((:DAQmxSetAnlgLvlPauseTrigCoupling, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAnlgLvlPauseTrigCoupling(taskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigCoupling, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgLvlPauseTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxGetAnlgLvlPauseTrigDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAnlgLvlPauseTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxSetAnlgLvlPauseTrigDigFltrEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAnlgLvlPauseTrigDigFltrEnable(taskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigDigFltrEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgLvlPauseTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxGetAnlgLvlPauseTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgLvlPauseTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxSetAnlgLvlPauseTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgLvlPauseTrigDigFltrMinPulseWidth(taskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgLvlPauseTrigDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgLvlPauseTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgLvlPauseTrigDigFltrTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetAnlgLvlPauseTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetAnlgLvlPauseTrigDigFltrTimebaseSrc(taskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgLvlPauseTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetAnlgLvlPauseTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgLvlPauseTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetAnlgLvlPauseTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgLvlPauseTrigDigFltrTimebaseRate(taskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgLvlPauseTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxGetAnlgLvlPauseTrigDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAnlgLvlPauseTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxSetAnlgLvlPauseTrigDigSyncEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAnlgLvlPauseTrigDigSyncEnable(taskHandle)
    ccall((:DAQmxResetAnlgLvlPauseTrigDigSyncEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinPauseTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgWinPauseTrigSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgWinPauseTrigSrc(taskHandle, data)
    ccall((:DAQmxSetAnlgWinPauseTrigSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetAnlgWinPauseTrigSrc(taskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinPauseTrigWhen(taskHandle, data)
    ccall((:DAQmxGetAnlgWinPauseTrigWhen, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAnlgWinPauseTrigWhen(taskHandle, data)
    ccall((:DAQmxSetAnlgWinPauseTrigWhen, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAnlgWinPauseTrigWhen(taskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigWhen, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinPauseTrigTop(taskHandle, data)
    ccall((:DAQmxGetAnlgWinPauseTrigTop, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgWinPauseTrigTop(taskHandle, data)
    ccall((:DAQmxSetAnlgWinPauseTrigTop, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgWinPauseTrigTop(taskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigTop, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinPauseTrigBtm(taskHandle, data)
    ccall((:DAQmxGetAnlgWinPauseTrigBtm, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgWinPauseTrigBtm(taskHandle, data)
    ccall((:DAQmxSetAnlgWinPauseTrigBtm, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgWinPauseTrigBtm(taskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigBtm, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinPauseTrigCoupling(taskHandle, data)
    ccall((:DAQmxGetAnlgWinPauseTrigCoupling, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetAnlgWinPauseTrigCoupling(taskHandle, data)
    ccall((:DAQmxSetAnlgWinPauseTrigCoupling, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetAnlgWinPauseTrigCoupling(taskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigCoupling, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinPauseTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxGetAnlgWinPauseTrigDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAnlgWinPauseTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxSetAnlgWinPauseTrigDigFltrEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAnlgWinPauseTrigDigFltrEnable(taskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigDigFltrEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinPauseTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxGetAnlgWinPauseTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgWinPauseTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxSetAnlgWinPauseTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgWinPauseTrigDigFltrMinPulseWidth(taskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinPauseTrigDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetAnlgWinPauseTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetAnlgWinPauseTrigDigFltrTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetAnlgWinPauseTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetAnlgWinPauseTrigDigFltrTimebaseSrc(taskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinPauseTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetAnlgWinPauseTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetAnlgWinPauseTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetAnlgWinPauseTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetAnlgWinPauseTrigDigFltrTimebaseRate(taskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetAnlgWinPauseTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxGetAnlgWinPauseTrigDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetAnlgWinPauseTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxSetAnlgWinPauseTrigDigSyncEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetAnlgWinPauseTrigDigSyncEnable(taskHandle)
    ccall((:DAQmxResetAnlgWinPauseTrigDigSyncEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigLvlPauseTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigLvlPauseTrigSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigLvlPauseTrigSrc(taskHandle, data)
    ccall((:DAQmxSetDigLvlPauseTrigSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetDigLvlPauseTrigSrc(taskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigLvlPauseTrigWhen(taskHandle, data)
    ccall((:DAQmxGetDigLvlPauseTrigWhen, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetDigLvlPauseTrigWhen(taskHandle, data)
    ccall((:DAQmxSetDigLvlPauseTrigWhen, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetDigLvlPauseTrigWhen(taskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigWhen, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigLvlPauseTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxGetDigLvlPauseTrigDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetDigLvlPauseTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxSetDigLvlPauseTrigDigFltrEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetDigLvlPauseTrigDigFltrEnable(taskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigDigFltrEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigLvlPauseTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxGetDigLvlPauseTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetDigLvlPauseTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxSetDigLvlPauseTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetDigLvlPauseTrigDigFltrMinPulseWidth(taskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigLvlPauseTrigDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigLvlPauseTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigLvlPauseTrigDigFltrTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetDigLvlPauseTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetDigLvlPauseTrigDigFltrTimebaseSrc(taskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigLvlPauseTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetDigLvlPauseTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetDigLvlPauseTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetDigLvlPauseTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetDigLvlPauseTrigDigFltrTimebaseRate(taskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigLvlPauseTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxGetDigLvlPauseTrigDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetDigLvlPauseTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxSetDigLvlPauseTrigDigSyncEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetDigLvlPauseTrigDigSyncEnable(taskHandle)
    ccall((:DAQmxResetDigLvlPauseTrigDigSyncEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigPatternPauseTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigPatternPauseTrigSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigPatternPauseTrigSrc(taskHandle, data)
    ccall((:DAQmxSetDigPatternPauseTrigSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetDigPatternPauseTrigSrc(taskHandle)
    ccall((:DAQmxResetDigPatternPauseTrigSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigPatternPauseTrigPattern(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigPatternPauseTrigPattern, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigPatternPauseTrigPattern(taskHandle, data)
    ccall((:DAQmxSetDigPatternPauseTrigPattern, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetDigPatternPauseTrigPattern(taskHandle)
    ccall((:DAQmxResetDigPatternPauseTrigPattern, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigPatternPauseTrigWhen(taskHandle, data)
    ccall((:DAQmxGetDigPatternPauseTrigWhen, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetDigPatternPauseTrigWhen(taskHandle, data)
    ccall((:DAQmxSetDigPatternPauseTrigWhen, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetDigPatternPauseTrigWhen(taskHandle)
    ccall((:DAQmxResetDigPatternPauseTrigWhen, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetArmStartTrigType(taskHandle, data)
    ccall((:DAQmxGetArmStartTrigType, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetArmStartTrigType(taskHandle, data)
    ccall((:DAQmxSetArmStartTrigType, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetArmStartTrigType(taskHandle)
    ccall((:DAQmxResetArmStartTrigType, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetArmStartTerm(taskHandle, data, bufferSize)
    ccall((:DAQmxGetArmStartTerm, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetDigEdgeArmStartTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigEdgeArmStartTrigSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigEdgeArmStartTrigSrc(taskHandle, data)
    ccall((:DAQmxSetDigEdgeArmStartTrigSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetDigEdgeArmStartTrigSrc(taskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeArmStartTrigEdge(taskHandle, data)
    ccall((:DAQmxGetDigEdgeArmStartTrigEdge, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetDigEdgeArmStartTrigEdge(taskHandle, data)
    ccall((:DAQmxSetDigEdgeArmStartTrigEdge, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetDigEdgeArmStartTrigEdge(taskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigEdge, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeArmStartTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxGetDigEdgeArmStartTrigDigFltrEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetDigEdgeArmStartTrigDigFltrEnable(taskHandle, data)
    ccall((:DAQmxSetDigEdgeArmStartTrigDigFltrEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetDigEdgeArmStartTrigDigFltrEnable(taskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigDigFltrEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeArmStartTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxGetDigEdgeArmStartTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetDigEdgeArmStartTrigDigFltrMinPulseWidth(taskHandle, data)
    ccall((:DAQmxSetDigEdgeArmStartTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetDigEdgeArmStartTrigDigFltrMinPulseWidth(taskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigDigFltrMinPulseWidth, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeArmStartTrigDigFltrTimebaseSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigEdgeArmStartTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigEdgeArmStartTrigDigFltrTimebaseSrc(taskHandle, data)
    ccall((:DAQmxSetDigEdgeArmStartTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetDigEdgeArmStartTrigDigFltrTimebaseSrc(taskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigDigFltrTimebaseSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeArmStartTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxGetDigEdgeArmStartTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetDigEdgeArmStartTrigDigFltrTimebaseRate(taskHandle, data)
    ccall((:DAQmxSetDigEdgeArmStartTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetDigEdgeArmStartTrigDigFltrTimebaseRate(taskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigDigFltrTimebaseRate, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeArmStartTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxGetDigEdgeArmStartTrigDigSyncEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetDigEdgeArmStartTrigDigSyncEnable(taskHandle, data)
    ccall((:DAQmxSetDigEdgeArmStartTrigDigSyncEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetDigEdgeArmStartTrigDigSyncEnable(taskHandle)
    ccall((:DAQmxResetDigEdgeArmStartTrigDigSyncEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetArmStartTrigTrigWhen(taskHandle, data)
    ccall((:DAQmxGetArmStartTrigTrigWhen, nidaqmx), int32, (TaskHandle, Ptr{CVIAbsoluteTime}), taskHandle, data)
end

function DAQmxSetArmStartTrigTrigWhen(taskHandle, data)
    ccall((:DAQmxSetArmStartTrigTrigWhen, nidaqmx), int32, (TaskHandle, CVIAbsoluteTime), taskHandle, data)
end

function DAQmxResetArmStartTrigTrigWhen(taskHandle)
    ccall((:DAQmxResetArmStartTrigTrigWhen, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetArmStartTrigTimescale(taskHandle, data)
    ccall((:DAQmxGetArmStartTrigTimescale, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetArmStartTrigTimescale(taskHandle, data)
    ccall((:DAQmxSetArmStartTrigTimescale, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetArmStartTrigTimescale(taskHandle)
    ccall((:DAQmxResetArmStartTrigTimescale, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetArmStartTrigTimestampEnable(taskHandle, data)
    ccall((:DAQmxGetArmStartTrigTimestampEnable, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetArmStartTrigTimestampEnable(taskHandle, data)
    ccall((:DAQmxSetArmStartTrigTimestampEnable, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetArmStartTrigTimestampEnable(taskHandle)
    ccall((:DAQmxResetArmStartTrigTimestampEnable, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetArmStartTrigTimestampTimescale(taskHandle, data)
    ccall((:DAQmxGetArmStartTrigTimestampTimescale, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetArmStartTrigTimestampTimescale(taskHandle, data)
    ccall((:DAQmxSetArmStartTrigTimestampTimescale, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetArmStartTrigTimestampTimescale(taskHandle)
    ccall((:DAQmxResetArmStartTrigTimestampTimescale, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetArmStartTrigTimestampVal(taskHandle, data)
    ccall((:DAQmxGetArmStartTrigTimestampVal, nidaqmx), int32, (TaskHandle, Ptr{CVIAbsoluteTime}), taskHandle, data)
end

function DAQmxGetTriggerSyncType(taskHandle, data)
    ccall((:DAQmxGetTriggerSyncType, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetTriggerSyncType(taskHandle, data)
    ccall((:DAQmxSetTriggerSyncType, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetTriggerSyncType(taskHandle)
    ccall((:DAQmxResetTriggerSyncType, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetWatchdogTimeout(taskHandle, data)
    ccall((:DAQmxGetWatchdogTimeout, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetWatchdogTimeout(taskHandle, data)
    ccall((:DAQmxSetWatchdogTimeout, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetWatchdogTimeout(taskHandle)
    ccall((:DAQmxResetWatchdogTimeout, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetWatchdogExpirTrigType(taskHandle, data)
    ccall((:DAQmxGetWatchdogExpirTrigType, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetWatchdogExpirTrigType(taskHandle, data)
    ccall((:DAQmxSetWatchdogExpirTrigType, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetWatchdogExpirTrigType(taskHandle)
    ccall((:DAQmxResetWatchdogExpirTrigType, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetWatchdogExpirTrigTrigOnNetworkConnLoss(taskHandle, data)
    ccall((:DAQmxGetWatchdogExpirTrigTrigOnNetworkConnLoss, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxSetWatchdogExpirTrigTrigOnNetworkConnLoss(taskHandle, data)
    ccall((:DAQmxSetWatchdogExpirTrigTrigOnNetworkConnLoss, nidaqmx), int32, (TaskHandle, bool32), taskHandle, data)
end

function DAQmxResetWatchdogExpirTrigTrigOnNetworkConnLoss(taskHandle)
    ccall((:DAQmxResetWatchdogExpirTrigTrigOnNetworkConnLoss, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeWatchdogExpirTrigSrc(taskHandle, data, bufferSize)
    ccall((:DAQmxGetDigEdgeWatchdogExpirTrigSrc, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxSetDigEdgeWatchdogExpirTrigSrc(taskHandle, data)
    ccall((:DAQmxSetDigEdgeWatchdogExpirTrigSrc, nidaqmx), int32, (TaskHandle, Cstring), taskHandle, data)
end

function DAQmxResetDigEdgeWatchdogExpirTrigSrc(taskHandle)
    ccall((:DAQmxResetDigEdgeWatchdogExpirTrigSrc, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetDigEdgeWatchdogExpirTrigEdge(taskHandle, data)
    ccall((:DAQmxGetDigEdgeWatchdogExpirTrigEdge, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetDigEdgeWatchdogExpirTrigEdge(taskHandle, data)
    ccall((:DAQmxSetDigEdgeWatchdogExpirTrigEdge, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetDigEdgeWatchdogExpirTrigEdge(taskHandle)
    ccall((:DAQmxResetDigEdgeWatchdogExpirTrigEdge, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetWatchdogDOExpirState(taskHandle, lines, data)
    ccall((:DAQmxGetWatchdogDOExpirState, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, lines, data)
end

function DAQmxSetWatchdogDOExpirState(taskHandle, lines, data)
    ccall((:DAQmxSetWatchdogDOExpirState, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, lines, data)
end

function DAQmxResetWatchdogDOExpirState(taskHandle, lines)
    ccall((:DAQmxResetWatchdogDOExpirState, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, lines)
end

function DAQmxGetWatchdogAOOutputType(taskHandle, lines, data)
    ccall((:DAQmxGetWatchdogAOOutputType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, lines, data)
end

function DAQmxSetWatchdogAOOutputType(taskHandle, lines, data)
    ccall((:DAQmxSetWatchdogAOOutputType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, lines, data)
end

function DAQmxResetWatchdogAOOutputType(taskHandle, lines)
    ccall((:DAQmxResetWatchdogAOOutputType, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, lines)
end

function DAQmxGetWatchdogAOExpirState(taskHandle, lines, data)
    ccall((:DAQmxGetWatchdogAOExpirState, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{float64}), taskHandle, lines, data)
end

function DAQmxSetWatchdogAOExpirState(taskHandle, lines, data)
    ccall((:DAQmxSetWatchdogAOExpirState, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, float64), taskHandle, lines, data)
end

function DAQmxResetWatchdogAOExpirState(taskHandle, lines)
    ccall((:DAQmxResetWatchdogAOExpirState, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, lines)
end

function DAQmxGetWatchdogCOExpirState(taskHandle, lines, data)
    ccall((:DAQmxGetWatchdogCOExpirState, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, Ptr{int32}), taskHandle, lines, data)
end

function DAQmxSetWatchdogCOExpirState(taskHandle, lines, data)
    ccall((:DAQmxSetWatchdogCOExpirState, nidaqmx), int32, (TaskHandle, Ptr{UInt8}, int32), taskHandle, lines, data)
end

function DAQmxResetWatchdogCOExpirState(taskHandle, lines)
    ccall((:DAQmxResetWatchdogCOExpirState, nidaqmx), int32, (TaskHandle, Ptr{UInt8}), taskHandle, lines)
end

function DAQmxGetWatchdogHasExpired(taskHandle, data)
    ccall((:DAQmxGetWatchdogHasExpired, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetWriteRelativeTo(taskHandle, data)
    ccall((:DAQmxGetWriteRelativeTo, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetWriteRelativeTo(taskHandle, data)
    ccall((:DAQmxSetWriteRelativeTo, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetWriteRelativeTo(taskHandle)
    ccall((:DAQmxResetWriteRelativeTo, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetWriteOffset(taskHandle, data)
    ccall((:DAQmxGetWriteOffset, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetWriteOffset(taskHandle, data)
    ccall((:DAQmxSetWriteOffset, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetWriteOffset(taskHandle)
    ccall((:DAQmxResetWriteOffset, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetWriteRegenMode(taskHandle, data)
    ccall((:DAQmxGetWriteRegenMode, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetWriteRegenMode(taskHandle, data)
    ccall((:DAQmxSetWriteRegenMode, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetWriteRegenMode(taskHandle)
    ccall((:DAQmxResetWriteRegenMode, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetWriteCurrWritePos(taskHandle, data)
    ccall((:DAQmxGetWriteCurrWritePos, nidaqmx), int32, (TaskHandle, Ptr{uInt64}), taskHandle, data)
end

function DAQmxGetWriteOvercurrentChansExist(taskHandle, data)
    ccall((:DAQmxGetWriteOvercurrentChansExist, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetWriteOvercurrentChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetWriteOvercurrentChans, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetWriteOvertemperatureChansExist(taskHandle, data)
    ccall((:DAQmxGetWriteOvertemperatureChansExist, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetWriteOvertemperatureChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetWriteOvertemperatureChans, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetWriteExternalOvervoltageChansExist(taskHandle, data)
    ccall((:DAQmxGetWriteExternalOvervoltageChansExist, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetWriteExternalOvervoltageChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetWriteExternalOvervoltageChans, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetWriteOverloadedChansExist(taskHandle, data)
    ccall((:DAQmxGetWriteOverloadedChansExist, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetWriteOverloadedChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetWriteOverloadedChans, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetWriteOpenCurrentLoopChansExist(taskHandle, data)
    ccall((:DAQmxGetWriteOpenCurrentLoopChansExist, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetWriteOpenCurrentLoopChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetWriteOpenCurrentLoopChans, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetWritePowerSupplyFaultChansExist(taskHandle, data)
    ccall((:DAQmxGetWritePowerSupplyFaultChansExist, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetWritePowerSupplyFaultChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetWritePowerSupplyFaultChans, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetWriteSyncUnlockedChansExist(taskHandle, data)
    ccall((:DAQmxGetWriteSyncUnlockedChansExist, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetWriteSyncUnlockedChans(taskHandle, data, bufferSize)
    ccall((:DAQmxGetWriteSyncUnlockedChans, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetWriteSpaceAvail(taskHandle, data)
    ccall((:DAQmxGetWriteSpaceAvail, nidaqmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxGetWriteTotalSampPerChanGenerated(taskHandle, data)
    ccall((:DAQmxGetWriteTotalSampPerChanGenerated, nidaqmx), int32, (TaskHandle, Ptr{uInt64}), taskHandle, data)
end

function DAQmxGetWriteAccessoryInsertionOrRemovalDetected(taskHandle, data)
    ccall((:DAQmxGetWriteAccessoryInsertionOrRemovalDetected, nidaqmx), int32, (TaskHandle, Ptr{bool32}), taskHandle, data)
end

function DAQmxGetWriteDevsWithInsertedOrRemovedAccessories(taskHandle, data, bufferSize)
    ccall((:DAQmxGetWriteDevsWithInsertedOrRemovedAccessories, nidaqmx), int32, (TaskHandle, Cstring, uInt32), taskHandle, data, bufferSize)
end

function DAQmxGetWriteRawDataWidth(taskHandle, data)
    ccall((:DAQmxGetWriteRawDataWidth, nidaqmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxGetWriteNumChans(taskHandle, data)
    ccall((:DAQmxGetWriteNumChans, nidaqmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxGetWriteWaitMode(taskHandle, data)
    ccall((:DAQmxGetWriteWaitMode, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetWriteWaitMode(taskHandle, data)
    ccall((:DAQmxSetWriteWaitMode, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetWriteWaitMode(taskHandle)
    ccall((:DAQmxResetWriteWaitMode, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetWriteSleepTime(taskHandle, data)
    ccall((:DAQmxGetWriteSleepTime, nidaqmx), int32, (TaskHandle, Ptr{float64}), taskHandle, data)
end

function DAQmxSetWriteSleepTime(taskHandle, data)
    ccall((:DAQmxSetWriteSleepTime, nidaqmx), int32, (TaskHandle, float64), taskHandle, data)
end

function DAQmxResetWriteSleepTime(taskHandle)
    ccall((:DAQmxResetWriteSleepTime, nidaqmx), int32, (TaskHandle,), taskHandle)
end

function DAQmxGetWriteDigitalLinesBytesPerChan(taskHandle, data)
    ccall((:DAQmxGetWriteDigitalLinesBytesPerChan, nidaqmx), int32, (TaskHandle, Ptr{uInt32}), taskHandle, data)
end

function DAQmxGetSampClkTimingResponseMode(taskHandle, data)
    ccall((:DAQmxGetSampClkTimingResponseMode, nidaqmx), int32, (TaskHandle, Ptr{int32}), taskHandle, data)
end

function DAQmxSetSampClkTimingResponseMode(taskHandle, data)
    ccall((:DAQmxSetSampClkTimingResponseMode, nidaqmx), int32, (TaskHandle, int32), taskHandle, data)
end

function DAQmxResetSampClkTimingResponseMode(taskHandle)
    ccall((:DAQmxResetSampClkTimingResponseMode, nidaqmx), int32, (TaskHandle,), taskHandle)
end
