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
		<Item Name="controle setting.vi" Type="VI" URL="../controle setting.vi"/>
		<Item Name="Globals.vi" Type="VI" URL="../Globals.vi"/>
		<Item Name="PC US Ready.vi" Type="VI" URL="../PC US Ready.vi"/>
		<Item Name="ReadINI.vi" Type="VI" URL="../ReadINI.vi"/>
		<Item Name="WINKEY.LLB" Type="Document" URL="../WINKEY.LLB"/>
		<Item Name="Winsys.llb" Type="Document" URL="../Winsys.llb"/>
		<Item Name="WINUTIL.LLB" Type="Document" URL="../WINUTIL.LLB"/>
		<Item Name="acquisition.vi" Type="VI" URL="../acquisition.vi"/>
		<Item Name="control.vi" Type="VI" URL="../control.vi"/>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="CoilControl" Type="EXE">
				<Property Name="App_INI_aliasGUID" Type="Str">{47726871-FD10-4ED7-9B63-F8C0C00646D1}</Property>
				<Property Name="App_INI_GUID" Type="Str">{77274351-07A3-4A4B-B659-B95E8591F90F}</Property>
				<Property Name="App_serverConfig.httpPort" Type="Int">8002</Property>
				<Property Name="App_serverType" Type="Int">1</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{5E6D5C04-E70B-430A-A795-F34BCFF1871C}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">CoilControl</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">../application</Property>
				<Property Name="Bld_localDestDirType" Type="Str">relativeToCommon</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{58A15631-87BF-4AF6-910C-4C0B72C77E94}</Property>
				<Property Name="Bld_targetDestDir" Type="Path"></Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">CoilControl.exe</Property>
				<Property Name="Destination[0].path" Type="Path">../application/CoilControl.exe</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">../application/data</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{F6D1ACC4-72E4-44AD-8F07-413343C0D901}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/control.vi</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="SourceCount" Type="Int">2</Property>
				<Property Name="TgtF_companyName" Type="Str">socomate</Property>
				<Property Name="TgtF_fileDescription" Type="Str">CoilControl</Property>
				<Property Name="TgtF_internalName" Type="Str">CoilControl</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2008 socomate</Property>
				<Property Name="TgtF_productName" Type="Str">CoilControl</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{1FAD544B-78FF-41B1-B659-F19E87A7BB2D}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">CoilControl.exe</Property>
			</Item>
		</Item>
	</Item>
</Project>
