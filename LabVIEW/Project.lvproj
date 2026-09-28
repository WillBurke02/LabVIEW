<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="26008000">
	<Property Name="NI.LV.All.SaveVersion" Type="Str">26.0</Property>
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="A3200" Type="Folder">
			<Item Name="[TEST] A3200 Control.vi" Type="VI" URL="../[TEST] A3200 Control.vi"/>
			<Item Name="A3200 Motion Control.vi" Type="VI" URL="../A3200 Motion Control.vi"/>
			<Item Name="GoTo Popup.vi" Type="VI" URL="../GoTo Popup.vi"/>
			<Item Name="Test A3200 Axis.vi" Type="VI" URL="../Test A3200 Axis.vi"/>
		</Item>
		<Item Name="Helpers" Type="Folder">
			<Item Name="ConvertTestDataToMm.vi" Type="VI" URL="../ConvertTestDataToMm.vi"/>
		</Item>
		<Item Name="Tab Pages" Type="Folder">
			<Item Name="BeamWidthPage.vi" Type="VI" URL="../Tab Pages/BeamWidthPage.vi"/>
			<Item Name="C-ScanPage.vi" Type="VI" URL="../Tab Pages/C-ScanPage.vi"/>
			<Item Name="InfoAndSetupPage.vi" Type="VI" URL="../Tab Pages/InfoAndSetupPage.vi"/>
			<Item Name="SystemDiagnostics.vi" Type="VI" URL="../Tab Pages/SystemDiagnostics.vi"/>
		</Item>
		<Item Name="DistanceToTime_mm_us.vi" Type="VI" URL="../DistanceToTime_mm_us.vi"/>
		<Item Name="EnabledChannelsEnumDisable.vi" Type="VI" URL="../EnabledChannelsEnumDisable.vi"/>
		<Item Name="Front End.vi" Type="VI" URL="../Front End.vi"/>
		<Item Name="Main.vi" Type="VI" URL="../Main.vi"/>
		<Item Name="Program.vi" Type="VI" URL="../Program.vi"/>
		<Item Name="SimpleFreerun.vi" Type="VI" URL="/&lt;instrlib&gt;/A3200/Examples/SimpleFreerun.vi"/>
		<Item Name="SingleAxisControl.vi" Type="VI" URL="/&lt;instrlib&gt;/A3200/Examples/SingleAxisControl.vi"/>
		<Item Name="TableAutosizeColumnsFromHeaders.vi" Type="VI" URL="../TableAutosizeColumnsFromHeaders.vi"/>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
