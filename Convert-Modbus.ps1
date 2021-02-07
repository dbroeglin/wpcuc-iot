# Use the following line to generate the names table:
#  $data.folder.item.tag | % { "# '$($_.name)', # $($_.caption_EN)" }
$names = (
 'RTCTime', # time
# 'RTCDate', # date
# 'LngSelect', # language
 'OutdoorTemp', # T outdoor
 'OutdoorTemp1h', # T outdoor 1h
 'OutdoorTemp24h', # T outdoor 24h
 'ReturnTempNominal', # T return target
 'ReturnTemp', # T return real
 'FlowTemp', # T heating out
 'DomesticWaterTNominal', # T water target
 'DomesticWaterTemp', # T water real
# 'RoomTemp', # T pilot room
# 'RoomTemp1h', # T room 1h
 'HeatSourceIn', # T source in
 'HeatSourceOut', # T source out
 'EvaporationTemp', # T evaporator
 'CondensationTemp', # T condenser
 'SuctionGasTemp', # T suction line
# 'PoolTemp', # T pool
 'EvaporationPress', # p evaporator
 'CondensationPress', # p condenser
# 'HeatOff', # manual turn off
# 'HeatTimeOn', # time start
# 'HeatTimeOff', # time stop
# 'HeatCharacteristicSetPoint', # T out base
# 'HeatCharacteristicSetPointBaseTemp', # T return base
# 'HeatCharacteristicGradient', # T curve gradient
# 'HeatCharacteristicLimit', # T curve limit
 'HeatReturnTemp', # T return real
 'HeatReturnTempNominal', # T return target
 'HeatTempHyst', # hysteresis
# 'RoomTempNominal', # T room target
# 'RoomTempFactor', # T room influence
# 'HeatIncreaseOff', #
# 'HeatIncreaseTimeOn', # setpt chg start
# 'HeatIncreaseTimeOff', # setpt chg stop
# 'HeatIncreaseSetPtOffset', # setpoint change
 'AuxilaryModeHeating', # auxilary mode
# 'AuxilaryMaxDifference', # aux. Max diff.
# 'CoolOff', # manual turn off
# 'CoolTimeOn', # time start
# 'CoolTimeOff', # time stop
# 'CoolCharacteristicSetPoint', # T out base
# 'CoolCharacteristicSetPointBaseTemp', # T return base
# 'CoolCharacteristicGradient', # T curve gradient
# 'CoolCharacteristicLimit', # T curve limit
# 'CoolReturnTemp', # T return real
# 'CoolReturnTempNominal', # T return target
# 'CoolReturnTempHyst', # hysteresis
# 'DomesticWaterOff', # manual turn off
# 'DomesticWaterTimeOn', # time start
# 'DomesticWaterTimeOff', # time stop
 'DomesticWaterTempActual', # T return real
 'DomesticWaterTempNominal', # T return target
 'DomesticWaterTempHyst', # hysteresis
# 'LegionellaSchedule', # NEW act MDMDFSSP
# 'LegionellaTimeOn', # E-NEW Begin
# 'LegionellaTimeOff', # E-NEW End
# 'LegionellaTempNominal', # E-NEW Nominal
# 'DWNumberOfCompressors', # auxilary compr.
# 'PoolOff', # manual turn off
# 'PoolTimeOn', # time start
# 'PoolTimeOff', # time stop
# 'PoolTempActual', # T return real
# 'PoolTempNominal', # T return target
# 'PoolTempHyst', # hysteresis
# 'PoolMaxRunTime', # max run period
# 'PoolNumberOfCompressors', # auxilary compr.
 'AuxiliaryHeatMode', # step 2 mode
# 'AuxiliaryHeatTempLimitSourceIn', # LimitHeatSrcIn
 'OHCompressor1', # compressor 1
 'OHCompressor2', # compressor 2
 'OHHeatingCompressor', # heating  comp.
 'OHDomesticWaterCompressor', # hot water comp.
 'OHHeatingAuxilary', # heating  aux.
 'OHDomesticWaterAuxilary', # hot water aux.
 'OHPoolCompressor', # pool
 'OHCooling', # cooling
# 'View', # view
 'Pincode', # PIN-code
# 'SetDefaultSettings', # factory reset
# 'SoftwareReset', # Software Reset
# 'DOManualOperatingModeOn', # DO-manual on
# 'HeatingUpScreed', # first heating 7d
# 'ScreedTempNominal', #
# 'SourcePumpPreRunPeriod', #
# 'HeatingPumpPreRunPeriod', #
# 'HeatingPumpAfterRunPeriod', # after run period
# 'OffsetPn', # offset press low
# 'OffsetPh', # offset pressHigh
# 'OperatingHoursSelector', # select oh
# 'OperatingHoursValue', # oh value new
# 'NDStatus', # ND Status
# 'FailureTimeStampTIME', # time
# 'FailureTimeStampDATE', # date
# 'FailureOperatingMode', # running mode
# 'FailureDOBuffer', # DO-buffer
# 'FailureDIBuffer', # DI-buffer
# 'FailureAIError', # senor
# 'FailureEvaporationPress', # P evaporator
# 'FailureCondensationPress', # P condenser
# 'FailureTempReturn', # T return
 'FailureTempFlow', # T heating out
 'FailureTempHeatSourceIn', # T source in
 'FailureTempHeatSourceOut', # T source out
 'FailureTempSuctionGas', # T suction line
# 'FailureTempOutdoor', #
# 'FailureTempDomesticWater', # T hot water
# 'FailureTempPool', # T pool
# 'Failure', # failure
# 'Interruption', # interruption
# 'WarningsInput', # warning source
# 'WarningsOutput', # warning outlet
# 'WarningsDiv', # warning sensors
# 'WarningsOthers', # warning diff.
# 'WarningInMask', # suppr.warn.sourc
# 'WarningOutMask', # suppr.warn.outl.
# 'WarningDivMask', # suppr.warn.sens.
# 'WarningOthersMask', # suppr. warn diff.
# 'CommMode', # comm. mode
# 'Ringtones', # ringtones
# 'ModemPhoneNum1', # call number 1
# 'ModemPhoneNum2', # call number 2
# 'ServiceHeating', # heating mode
# 'ServiceDomesticWater', # hot water mode
# 'ServiceCooling', # cooling mode
# 'ServicePool', # pool mode
# 'ServiceAuxiliaryHeating', # step 2
# 'HeatSourceMinT', # heat source Tmin
# 'Refrigerant', # refrigerant
# 'NumberOfCompressors', # num. Compr.
# 'TimeScaler', # time factor
# 'ModemType', # modem type
# 'ExtControlCode', # external control
# 'FirmwareVersion', # firmware version
# 'FirmwareDate', # firmware date
# 'ManufType', # model
# 'ManufSerialNum', # serial number
# 'SetManufType', # set model
# 'SetManufSerialNum', # set serial nr
# 'OperatingState', # operating state
# 'DOBuffer', # DO-buffer
# 'DIBuffer', # DI-buffer
# 'ADC_Enabled', # ADC enabled
# 'ADC_Error', # ADC error
# 'ADC_ErrorHiLo', # ADC errorHiLo
# 'ADC_ErrorEnabled', # ADC ErrorEnabled
# 'ADC_Result1', # ADC Counter 1
# 'ADC_Result2', # ADC Counter 2
# 'ADC_Result3', # ADC Counter 3
# 'ADC_Result4', # ADC Counter 4
# 'ADC_Result5', # ADC Counter 5
# 'ADC_Result6', # ADC Counter 6
# 'ADC_Result7', # ADC Counter 7
# 'ADC_Result8', # ADC Counter 8
# 'ADC_Result9', # ADC Counter 9
# 'ADC_Result10', # ADC Counter 10
# 'ADC_Result11', # ADC Counter 11
# 'ADC_Result12', # ADC Counter 12
# 'ADC_Result13', # ADC Counter Ref
# 'ADC_CorrFct', # ADC CorrFct
# 'LastStartTime', # Last Start Time
# 'LastStartDate', # Last Start Date
# 'LCD_Display_Line_1', # LCD line 1
# 'LCD_Display_Line_2', # LCD line 2
# 'DebugCh1', # debug1
# 'SourcePumpLastRunTimer', # SourcePumpLastRunTimer
# 'HeatingPumpLastRunTimer', # HeatingPumpLastRunTimer
# 'OperatingCyclesTimer', # TimerSwitchFrequency
# 'SourcePumpPreRunTimer', # SourcePumpPreRunTimer
# 'CompressorPreRunTimer', # CompressorPreRunTimer
# 'HeatingPumpPreRunTimer', # HeatingPumpPreRunTimer
# 'HeatingPumpRunTimer', # HeatingPumpRunTimer
# 'SourcePumpRunTimer', # SourcePumpRunTimer
# 'CompressorRunTimer', # CompressorRunTimer
# 'ServiceStatus', # servicestatus
# 'OperatingMode', # operatingmode
# 'ScreedHeatingUp', # ScreedHeatingUp
# 'PoolWater', # PoolWater
# 'DWater', # DWater
# 'Heating', # Heating
# 'Cooling', # Cooling
# 'ExternalRequest', # ExternalRequest
# 'ModemStatus', # modemstatus
 'PlaceHolderToCloseTheList'
)

$data = [xml](Get-Content -raw "../modbus_xmlfiles/_10011d.xml" -Encoding "ISO-8859-1")
$data.folder.item.tag | 
    Where-Object {
        $names -contains $_.Name 	
    } |
    ForEach-Object { 
	$name = $_.name
	$datatype = switch ($_.datatype) {
            "VT_R4"   { "Float" }
            "VT_DATE" { "DateTime" }
            "VT_UI1"  { "Byte" }
            "VT_I4"   { "Int" }
            default { throw "Unrecognized data type: '$($_)' for '$name'" }
        }
        "{ 'name': '$($_.name)', 'function': $($_.regplc), 'addr': $($_.regaddr), 'size': $($_.regcnt), 'datatype': DATA_TYPES['$datatype'] }," 
    }
