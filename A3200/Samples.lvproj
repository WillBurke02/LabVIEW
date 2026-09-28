<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="26008000">
	<Item Name="My Computer" Type="My Computer">
		<Property Name="NI.SortType" Type="Int">3</Property>
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Initialize" Type="Folder">
			<Item Name="Connect.vi" Type="VI" URL="../Initialize/Connect.vi"/>
			<Item Name="Disconnect.vi" Type="VI" URL="../Initialize/Disconnect.vi"/>
			<Item Name="Reset.vi" Type="VI" URL="../Initialize/Reset.vi"/>
		</Item>
		<Item Name="Motion" Type="Folder">
			<Item Name="Enable.vi" Type="VI" URL="../Motion/Enable.vi"/>
			<Item Name="Disable.vi" Type="VI" URL="../Motion/Disable.vi"/>
			<Item Name="Home.vi" Type="VI" URL="../Motion/Home.vi"/>
			<Item Name="Abort.vi" Type="VI" URL="../Motion/Abort.vi"/>
			<Item Name="FaultAck.vi" Type="VI" URL="../Motion/FaultAck.vi"/>
			<Item Name="Freerun.vi" Type="VI" URL="../Motion/Freerun.vi"/>
			<Item Name="MoveInc.vi" Type="VI" URL="../Motion/MoveInc.vi"/>
			<Item Name="MoveAbs.vi" Type="VI" URL="../Motion/MoveAbs.vi"/>
			<Item Name="Linear.vi" Type="VI" URL="../Motion/Linear.vi"/>
			<Item Name="Inc.vi" Type="VI" URL="../Motion/Inc.vi"/>
			<Item Name="Abs.vi" Type="VI" URL="../Motion/Abs.vi"/>
			<Item Name="Circular.vi" Type="VI" URL="../Motion/Circular.vi"/>
			<Item Name="Oscillate.vi" Type="VI" URL="../Motion/Oscillate.vi"/>
			<Item Name="Wait.vi" Type="VI" URL="../Motion/Wait.vi"/>
			<Item Name="AnalogControl.vi" Type="VI" URL="../Motion/AnalogControl.vi"/>
			<Item Name="AnalogTrack.vi" Type="VI" URL="../Motion/AnalogTrack.vi"/>
			<Item Name="Servo.vi" Type="VI" URL="../Motion/Servo.vi"/>
			<Item Name="RampRate.vi" Type="VI" URL="../Motion/RampRate.vi"/>
		</Item>
		<Item Name="Utility" Type="Folder">
			<Item Name="ParseError.vi" Type="VI" URL="../Utility/ParseError.vi"/>
			<Item Name="AlertError.vi" Type="VI" URL="../Utility/AlertError.vi"/>
			<Item Name="GetAxisIndex.vi" Type="VI" URL="../Utility/GetAxisIndex.vi"/>
			<Item Name="GetAxisName.vi" Type="VI" URL="../Utility/GetAxisName.vi"/>
			<Item Name="GetAxisNames.vi" Type="VI" URL="../Utility/GetAxisNames.vi"/>
			<Item Name="GetVersion.vi" Type="VI" URL="../Utility/GetVersion.vi"/>
			<Item Name="AxisControl.ctl" Type="VI" URL="../Utility/AxisControl.ctl"/>
		</Item>
		<Item Name="Status" Type="Folder">
			<Item Name="AxisDiagPacket.ctl" Type="VI" URL="../Status/AxisDiagPacket.ctl"/>
			<Item Name="ControllerDiagPacket.ctl" Type="VI" URL="../Status/ControllerDiagPacket.ctl"/>
			<Item Name="ConvertDiagPacket.vi" Type="VI" URL="../Status/ConvertDiagPacket.vi"/>
			<Item Name="RetrieveDiagPacket.vi" Type="VI" URL="../Status/RetrieveDiagPacket.vi"/>
			<Item Name="RegisterForDiagPackets.vi" Type="VI" URL="../Status/RegisterForDiagPackets.vi"/>
			<Item Name="UnregisterForDiagPackets.vi" Type="VI" URL="../Status/UnregisterForDiagPackets.vi"/>
			<Item Name="NewDiagPacketArrivedCallback.vi" Type="VI" URL="../Status/NewDiagPacketArrivedCallback.vi"/>
			<Item Name="SetStatus.vi" Type="VI" URL="../Status/SetStatus.vi"/>
			<Item Name="RetrieveCustomDiagPacket.vi" Type="VI" URL="../Status/RetrieveCustomDiagPacket.vi"/>
			<Item Name="CustomDiagPacketItem.ctl" Type="VI" URL="../Status/CustomDiagPacketItem.ctl"/>
			<Item Name="TaskStatus.ctl" Type="VI" URL="../Status/TaskStatus.ctl"/>
			<Item Name="GetTaskStatus.vi" Type="VI" URL="../Status/GetTaskStatus.vi"/>
		</Item>
		<Item Name="Commands" Type="Folder">
			<Item Name="ExecuteCommand.vi" Type="VI" URL="../Commands/ExecuteCommand.vi"/>
			<Item Name="ExecuteProgram.vi" Type="VI" URL="../Commands/ExecuteProgram.vi"/>
			<Item Name="StopProgram.vi" Type="VI" URL="../Commands/StopProgram.vi"/>
			<Item Name="InitializeQueue.vi" Type="VI" URL="../Commands/InitializeQueue.vi"/>
			<Item Name="SetAnalogOutput.vi" Type="VI" URL="../Commands/SetAnalogOutput.vi"/>
			<Item Name="SetDigitalOutput.vi" Type="VI" URL="../Commands/SetDigitalOutput.vi"/>
			<Item Name="GetGlobalVariable.vi" Type="VI" URL="../Commands/GetGlobalVariable.vi"/>
			<Item Name="GetGlobalVariables.vi" Type="VI" URL="../Commands/GetGlobalVariables.vi"/>
			<Item Name="SetGlobalVariable.vi" Type="VI" URL="../Commands/SetGlobalVariable.vi"/>
			<Item Name="SetGlobalVariables.vi" Type="VI" URL="../Commands/SetGlobalVariables.vi"/>
			<Item Name="AcknowledgeAll.vi" Type="VI" URL="../Commands/AcknowledgeAll.vi"/>
			<Item Name="GetDoubleTaskVariable.vi" Type="VI" URL="../Commands/GetDoubleTaskVariable.vi"/>
			<Item Name="GetDoubleTaskVariables.vi" Type="VI" URL="../Commands/GetDoubleTaskVariables.vi"/>
			<Item Name="SetDoubleTaskVariable.vi" Type="VI" URL="../Commands/SetDoubleTaskVariable.vi"/>
			<Item Name="SetDoubleTaskVariables.vi" Type="VI" URL="../Commands/SetDoubleTaskVariables.vi"/>
		</Item>
		<Item Name="Parameters" Type="Folder">
			<Item Name="GetSystemParameter.vi" Type="VI" URL="../Parameters/GetSystemParameter.vi"/>
			<Item Name="GetAxisParameter.vi" Type="VI" URL="../Parameters/GetAxisParameter.vi"/>
			<Item Name="GetTaskParameter.vi" Type="VI" URL="../Parameters/GetTaskParameter.vi"/>
			<Item Name="SetSystemParameter.vi" Type="VI" URL="../Parameters/SetSystemParameter.vi"/>
			<Item Name="SetAxisParameter.vi" Type="VI" URL="../Parameters/SetAxisParameter.vi"/>
			<Item Name="SetTaskParameter.vi" Type="VI" URL="../Parameters/SetTaskParameter.vi"/>
			<Item Name="SaveParameterFile.vi" Type="VI" URL="../Parameters/SaveParameterFile.vi"/>
			<Item Name="SendParameterFile.vi" Type="VI" URL="../Parameters/SendParameterFile.vi"/>
		</Item>
		<Item Name="Scope" Type="Folder">
			<Item Name="AddDataConfiguration.vi" Type="VI" URL="../Scope/AddDataConfiguration.vi"/>
			<Item Name="ClearDataConfiguration.vi" Type="VI" URL="../Scope/ClearDataConfiguration.vi"/>
			<Item Name="StartDataCollection.vi" Type="VI" URL="../Scope/StartDataCollection.vi"/>
			<Item Name="CollectionStatus.vi" Type="VI" URL="../Scope/CollectionStatus.vi"/>
			<Item Name="RetrieveData.vi" Type="VI" URL="../Scope/RetrieveData.vi"/>
			<Item Name="GetDataResults.vi" Type="VI" URL="../Scope/GetDataResults.vi"/>
			<Item Name="ConvertData.vi" Type="VI" URL="../Scope/ConvertData.vi"/>
			<Item Name="SetSampleTrigger.vi" Type="VI" URL="../Scope/SetSampleTrigger.vi"/>
		</Item>
		<Item Name="Examples" Type="Folder">
			<Item Name="SimpleMotion.vi" Type="VI" URL="../Examples/SimpleMotion.vi"/>
			<Item Name="SimpleMotion2.vi" Type="VI" URL="../Examples/SimpleMotion2.vi"/>
			<Item Name="SingleAxisControl.vi" Type="VI" URL="../Examples/SingleAxisControl.vi"/>
			<Item Name="MultiAxisControl.vi" Type="VI" URL="../Examples/MultiAxisControl.vi"/>
			<Item Name="SimpleFreerun.vi" Type="VI" URL="../Examples/SimpleFreerun.vi"/>
			<Item Name="SimpleOscillate.vi" Type="VI" URL="../Examples/SimpleOscillate.vi"/>
			<Item Name="Display.vi" Type="VI" URL="../Examples/Display.vi"/>
			<Item Name="IO.vi" Type="VI" URL="../Examples/IO.vi"/>
			<Item Name="Parameters.vi" Type="VI" URL="../Examples/Parameters.vi"/>
			<Item Name="PlotScopeData.vi" Type="VI" URL="../Examples/PlotScopeData.vi"/>
			<Item Name="SystemCheck.vi" Type="VI" URL="../Examples/SystemCheck.vi"/>
			<Item Name="CustomDiagnostics.vi" Type="VI" URL="../Examples/CustomDiagnostics.vi"/>
			<Item Name="BufferedRunQueue.vi" Type="VI" URL="../Examples/BufferedRunQueue.vi"/>
		</Item>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="A3200 LabVIEW Operator Interface" Type="EXE">
				<Property Name="App_INI_aliasGUID" Type="Str">{6D59F4EE-1BAE-44D6-82AF-4D4371FDACBD}</Property>
				<Property Name="App_INI_GUID" Type="Str">{40C00584-0D42-4602-9973-E78D575BDA39}</Property>
				<Property Name="App_serverConfig.httpPort" Type="Int">8002</Property>
				<Property Name="App_serverType" Type="Int">1</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{410866B9-AD68-42B6-9169-883FBA04A309}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">A3200 LabVIEW Operator Interface</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_excludeTypedefs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../2010/bin</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{E3BE78C8-C402-4B1D-AC83-9631367B48CA}</Property>
				<Property Name="Bld_targetDestDir" Type="Path"></Property>
				<Property Name="Bld_version.build" Type="Int">8</Property>
				<Property Name="Bld_version.major" Type="Int">6</Property>
				<Property Name="Bld_version.minor" Type="Int">4</Property>
				<Property Name="Bld_version.patch" Type="Int">9</Property>
				<Property Name="Destination[0].destName" Type="Str">A3200 LabVIEW Operator Interface.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../2010/bin/A3200 LabVIEW Operator Interface.exe</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../2010/bin/data</Property>
				<Property Name="Destination[2].destName" Type="Str">Destination Directory</Property>
				<Property Name="Destination[2].path" Type="Path">../2010/bin</Property>
				<Property Name="DestinationCount" Type="Int">3</Property>
				<Property Name="Source[0].Container.applyDestination" Type="Bool">true</Property>
				<Property Name="Source[0].Container.applyInclusion" Type="Bool">true</Property>
				<Property Name="Source[0].Container.applyProperties" Type="Bool">true</Property>
				<Property Name="Source[0].itemID" Type="Str">{011CF334-91F3-4E09-9B10-22C6AABF8719}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/Examples/MultiAxisControl.vi</Property>
				<Property Name="Source[1].properties[0].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[1].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[1].propertiesCount" Type="Int">1</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="Source[2].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[2].itemID" Type="Ref">/My Computer/Examples/Display.vi</Property>
				<Property Name="Source[2].properties[0].type" Type="Str">Remove front panel</Property>
				<Property Name="Source[2].properties[0].value" Type="Bool">false</Property>
				<Property Name="Source[2].propertiesCount" Type="Int">1</Property>
				<Property Name="Source[2].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[2].type" Type="Str">VI</Property>
				<Property Name="SourceCount" Type="Int">3</Property>
				<Property Name="SourceItem[10].Destination" Type="Int">0</Property>
				<Property Name="SourceItem[10].IsFolder" Type="Bool">true</Property>
				<Property Name="SourceItem[10].ItemID" Type="Ref"></Property>
				<Property Name="TgtF_companyName" Type="Str">Aerotech, Inc.</Property>
				<Property Name="TgtF_internalName" Type="Str">A3200 LabVIEW Operator Interface</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2010-2023 Aerotech, Inc.</Property>
				<Property Name="TgtF_productName" Type="Str">A3200 LabVIEW Operator Interface</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{C2873CB0-5DAB-4090-A109-5CF8B2498048}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">A3200 LabVIEW Operator Interface.exe</Property>
			</Item>
		</Item>
	</Item>
</Project>
