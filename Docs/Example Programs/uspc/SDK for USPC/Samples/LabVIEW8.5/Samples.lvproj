<?xml version='1.0'?>
<Project Type="Project" LVVersion="8508002">
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
      <Item Name="Acquisitions Demo" Type="Folder">
         <Item Name="Acquisition.vi" Type="VI" URL="Acquisitions Demo/Acquisition.vi"/>
         <Item Name="Clear error.vi" Type="VI" URL="Acquisitions Demo/Clear error.vi"/>
         <Item Name="Conditions.vi" Type="VI" URL="Acquisitions Demo/Conditions.vi"/>
         <Item Name="Sub Read data to build A-scan.vi" Type="VI" URL="Acquisitions Demo/Sub Read data to build A-scan.vi"/>
         <Item Name="Visu cpt+DET.vi" Type="VI" URL="Acquisitions Demo/Visu cpt+DET.vi"/>
      </Item>
      <Item Name="DLL Demo" Type="Folder">
         <Item Name="DLL Demo.vi" Type="VI" URL="DLL Demo/DLL Demo.vi"/>
      </Item>
      <Item Name="ActiveX Demo" Type="Folder">
         <Item Name="ActiveX Demo.vi" Type="VI" URL="ActiveX Demo/ActiveX Demo.vi"/>
      </Item>
      <Item Name="Dependencies" Type="Dependencies">
         <Item Name="vi.lib" Type="Folder">
            <Item Name="Registry RtKey.ctl" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Registry RtKey.ctl"/>
            <Item Name="Open Registry Key.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Open Registry Key.vi"/>
            <Item Name="Registry SAM.ctl" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Registry SAM.ctl"/>
            <Item Name="Registry refnum.ctl" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Registry refnum.ctl"/>
            <Item Name="STR_ASCII-Unicode.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/STR_ASCII-Unicode.vi"/>
            <Item Name="Registry WinErr-LVErr.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Registry WinErr-LVErr.vi"/>
            <Item Name="Registry Handle Master.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Registry Handle Master.vi"/>
            <Item Name="Read Registry Value Simple.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Read Registry Value Simple.vi"/>
            <Item Name="Read Registry Value Simple STR.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Read Registry Value Simple STR.vi"/>
            <Item Name="Read Registry Value.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Read Registry Value.vi"/>
            <Item Name="Read Registry Value STR.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Read Registry Value STR.vi"/>
            <Item Name="Read Registry Value DWORD.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Read Registry Value DWORD.vi"/>
            <Item Name="Registry Simplify Data Type.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Registry Simplify Data Type.vi"/>
            <Item Name="Read Registry Value Simple U32.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Read Registry Value Simple U32.vi"/>
            <Item Name="Close Registry Key.vi" Type="VI" URL="/&lt;vilib&gt;/registry/registry.llb/Close Registry Key.vi"/>
            <Item Name="compatReadText.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatReadText.vi"/>
            <Item Name="compatOverwrite.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatOverwrite.vi"/>
            <Item Name="DDE Open Conversation.vi" Type="VI" URL="/&lt;vilib&gt;/platform/dde.llb/DDE Open Conversation.vi"/>
            <Item Name="DDE Master Control.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/dde.llb/DDE Master Control.vi"/>
            <Item Name="DDE Request.vi" Type="VI" URL="/&lt;vilib&gt;/platform/dde.llb/DDE Request.vi"/>
            <Item Name="DDE Close Conversation.vi" Type="VI" URL="/&lt;vilib&gt;/platform/dde.llb/DDE Close Conversation.vi"/>
            <Item Name="System Exec.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/system.llb/System Exec.vi"/>
            <Item Name="Close Panel.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/victl.llb/Close Panel.vi"/>
            <Item Name="Merge Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Merge Errors.vi"/>
            <Item Name="Simple Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Simple Error Handler.vi"/>
            <Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
            <Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
            <Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
            <Item Name="General Error Handler CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler CORE.vi"/>
            <Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
            <Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
            <Item Name="Set String Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set String Value.vi"/>
            <Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
            <Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
            <Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
            <Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
            <Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
            <Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
            <Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi"/>
            <Item Name="Set Bold Text.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set Bold Text.vi"/>
            <Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
            <Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
            <Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
            <Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
            <Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
            <Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
            <Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
            <Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
            <Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
            <Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
            <Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
            <Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
         </Item>
         <Item Name="user.lib" Type="Folder">
            <Item Name="Message Window Dialog Box w/ Sound.vi" Type="VI" URL="/&lt;userlib&gt;/Winevent.llb/Message Window Dialog Box w/ Sound.vi"/>
         </Item>
         <Item Name="USPC Read a parameter.vi" Type="VI" URL="../../../Programs applications/LabView8.5/USPC.llb/USPC Read a parameter.vi"/>
         <Item Name="USPC global.vi" Type="VI" URL="../../../Programs applications/LabView8.5/USPC.llb/USPC global.vi"/>
         <Item Name="USPC Open.vi" Type="VI" URL="../../../Programs applications/LabView8.5/USPC.llb/USPC Open.vi"/>
         <Item Name="USPC Get Alarms.vi" Type="VI" URL="../../../Programs applications/LabView8.5/USPC.llb/USPC Get Alarms.vi"/>
         <Item Name="USPC number?.vi" Type="VI" URL="../../../Programs applications/LabView8.5/USPC.llb/USPC number?.vi"/>
         <Item Name="USPC Get install path.vi" Type="VI" URL="../../../Programs applications/LabView8.5/USPC.llb/USPC Get install path.vi"/>
         <Item Name="Open Help URL.vi" Type="VI" URL="../../../Programs applications/LabView8.5/Help.llb/Open Help URL.vi"/>
         <Item Name="Open URL In Browser.vi" Type="VI" URL="../../../Programs applications/LabView8.5/Help.llb/Open URL In Browser.vi"/>
         <Item Name="Get Web Browser Path.vi" Type="VI" URL="../../../Programs applications/LabView8.5/Help.llb/Get Web Browser Path.vi"/>
         <Item Name="Get System Web Browser.vi" Type="VI" URL="../../../Programs applications/LabView8.5/Help.llb/Get System Web Browser.vi"/>
         <Item Name="_browser WREG Open Key.vi" Type="VI" URL="../../../Programs applications/LabView8.5/Help.llb/_browser WREG Open Key.vi"/>
         <Item Name="_browser WREG Read Value.vi" Type="VI" URL="../../../Programs applications/LabView8.5/Help.llb/_browser WREG Read Value.vi"/>
         <Item Name="_browser WREG Close Key.vi" Type="VI" URL="../../../Programs applications/LabView8.5/Help.llb/_browser WREG Close Key.vi"/>
         <Item Name="Prompt Web Browser Path.vi" Type="VI" URL="../../../Programs applications/LabView8.5/Help.llb/Prompt Web Browser Path.vi"/>
         <Item Name="USPC Clear All Alarms.vi" Type="VI" URL="../../../Programs applications/LabView8.5/USPC.llb/USPC Clear All Alarms.vi"/>
         <Item Name="USPC Acquisition Config.vi" Type="VI" URL="../../../Programs applications/LabView8.5/USPC.llb/USPC Acquisition Config.vi"/>
         <Item Name="USPC Acquisition Status.vi" Type="VI" URL="../../../Programs applications/LabView8.5/USPC.llb/USPC Acquisition Status.vi"/>
         <Item Name="USPC Acquisition Start.vi" Type="VI" URL="../../../Programs applications/LabView8.5/USPC.llb/USPC Acquisition Start.vi"/>
         <Item Name="USPC Acquisition Read.vi" Type="VI" URL="../../../Programs applications/LabView8.5/USPC.llb/USPC Acquisition Read.vi"/>
         <Item Name="USPC Acquisition Sort data.vi" Type="VI" URL="../../../Programs applications/LabView8.5/USPC.llb/USPC Acquisition Sort data.vi"/>
         <Item Name="USPC Display A-scan.vi" Type="VI" URL="../../../Programs applications/LabView8.5/USPC.llb/USPC Display A-scan.vi"/>
         <Item Name="USPC Build Ascan header.vi" Type="VI" URL="../../../Programs applications/LabView8.5/USPC.llb/USPC Build Ascan header.vi"/>
         <Item Name="Convert µs =&gt; µs, mm or inch.vi" Type="VI" URL="../../../Programs applications/LabView8.5/Pcxus.llb/Convert µs =&gt; µs, mm or inch.vi"/>
         <Item Name="USPC Acquisition Stop.vi" Type="VI" URL="../../../Programs applications/LabView8.5/USPC.llb/USPC Acquisition Stop.vi"/>
         <Item Name="USPC Acquisition Clear.vi" Type="VI" URL="../../../Programs applications/LabView8.5/USPC.llb/USPC Acquisition Clear.vi"/>
         <Item Name="USPC Close.vi" Type="VI" URL="../../../Programs applications/LabView8.5/USPC.llb/USPC Close.vi"/>
         <Item Name="USPC Load.vi" Type="VI" URL="../../../Programs applications/LabView8.5/USPC.llb/USPC Load.vi"/>
         <Item Name="USPC Save.vi" Type="VI" URL="../../../Programs applications/LabView8.5/USPC.llb/USPC Save.vi"/>
         <Item Name="USPC Set a parameter.vi" Type="VI" URL="../../../Programs applications/LabView8.5/USPC.llb/USPC Set a parameter.vi"/>
         <Item Name="Read country file.vi" Type="VI" URL="../../../Programs applications/LabView8.5/Pcxus.llb/Read country file.vi"/>
         <Item Name="Verify type of file.vi" Type="VI" URL="../../../Programs applications/LabView8.5/Pcxus.llb/Verify type of file.vi"/>
         <Item Name="Select country.vi" Type="VI" URL="../../../Programs applications/LabView8.5/Pcxus.llb/Select country.vi"/>
         <Item Name="DLL_PCXUS.dll" Type="Document" URL="DLL_PCXUS.dll"/>
         <Item Name="Advapi32.dll" Type="Document" URL="Advapi32.dll"/>
         <Item Name="kernel32.dll" Type="Document" URL="kernel32.dll"/>
         <Item Name="user32.dll" Type="Document" URL="user32.dll"/>
      </Item>
      <Item Name="Build Specifications" Type="Build">
         <Item Name="Acquisition" Type="EXE">
            <Property Name="App_applicationGUID" Type="Str">{393BC037-1EED-45B4-8881-99C439040BFF}</Property>
            <Property Name="App_applicationName" Type="Str">Acquisition.exe</Property>
            <Property Name="App_companyName" Type="Str">Socomate</Property>
            <Property Name="App_fileDescription" Type="Str">Acquisition</Property>
            <Property Name="App_fileType" Type="Int">1</Property>
            <Property Name="App_fileVersion.major" Type="Int">1</Property>
            <Property Name="App_INI_aliasGUID" Type="Str">{33DABFFC-01AC-4E85-85BB-365A3432401C}</Property>
            <Property Name="App_INI_GUID" Type="Str">{532D45E0-C29F-4BF1-A361-02185204E06B}</Property>
            <Property Name="App_internalName" Type="Str">Acquisition</Property>
            <Property Name="App_legalCopyright" Type="Str">Copyright © 2007 Socomate</Property>
            <Property Name="App_productName" Type="Str">Acquisition</Property>
            <Property Name="Bld_buildSpecName" Type="Str">Acquisition</Property>
            <Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
            <Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
            <Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
            <Property Name="Destination[0].destName" Type="Str">Acquisition.exe</Property>
            <Property Name="Destination[0].path" Type="Path">/C/uspc/applications/internal.llb</Property>
            <Property Name="Destination[0].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="Destination[0].type" Type="Str">App</Property>
            <Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
            <Property Name="Destination[1].path" Type="Path">/C/uspc/applications/data</Property>
            <Property Name="Destination[1].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="DestinationCount" Type="Int">2</Property>
            <Property Name="Source[0].itemID" Type="Str">{0D1B854F-37A5-4FF0-9DA5-7F78DB564CA7}</Property>
            <Property Name="Source[0].type" Type="Str">Container</Property>
            <Property Name="Source[1].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[1].itemID" Type="Ref">/My Computer/Acquisitions Demo/Acquisition.vi</Property>
            <Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
            <Property Name="Source[1].type" Type="Str">VI</Property>
            <Property Name="SourceCount" Type="Int">2</Property>
         </Item>
         <Item Name="DLL demo" Type="EXE">
            <Property Name="App_applicationGUID" Type="Str">{7CDE9119-49D2-4BEB-B638-01EB63373BB2}</Property>
            <Property Name="App_applicationName" Type="Str">DLLDemo.exe</Property>
            <Property Name="App_companyName" Type="Str">Socomate</Property>
            <Property Name="App_fileDescription" Type="Str">DLL demo</Property>
            <Property Name="App_fileType" Type="Int">1</Property>
            <Property Name="App_fileVersion.major" Type="Int">1</Property>
            <Property Name="App_INI_aliasGUID" Type="Str">{3DF10023-E955-404B-B4F6-F07C0D699FA1}</Property>
            <Property Name="App_INI_GUID" Type="Str">{D755A9EF-B950-4C65-B175-F52F15ADC2D5}</Property>
            <Property Name="App_internalName" Type="Str">DLL demo</Property>
            <Property Name="App_legalCopyright" Type="Str">Copyright © 2007 Socomate</Property>
            <Property Name="App_productName" Type="Str">DLL demo</Property>
            <Property Name="Bld_buildSpecName" Type="Str">DLL demo</Property>
            <Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
            <Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
            <Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
            <Property Name="Destination[0].destName" Type="Str">DLLDemo.exe</Property>
            <Property Name="Destination[0].path" Type="Path">/C/uspc/applications/internal.llb</Property>
            <Property Name="Destination[0].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="Destination[0].type" Type="Str">App</Property>
            <Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
            <Property Name="Destination[1].path" Type="Path">/C/uspc/applications/data</Property>
            <Property Name="Destination[1].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="DestinationCount" Type="Int">2</Property>
            <Property Name="Source[0].itemID" Type="Str">{0D1B854F-37A5-4FF0-9DA5-7F78DB564CA7}</Property>
            <Property Name="Source[0].type" Type="Str">Container</Property>
            <Property Name="Source[1].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[1].itemID" Type="Ref">/My Computer/DLL Demo/DLL Demo.vi</Property>
            <Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
            <Property Name="Source[1].type" Type="Str">VI</Property>
            <Property Name="SourceCount" Type="Int">2</Property>
         </Item>
         <Item Name="ActiveX Demo" Type="EXE">
            <Property Name="App_applicationGUID" Type="Str">{5DE4BA70-35D5-45E7-96F0-6A1EB00475DD}</Property>
            <Property Name="App_applicationName" Type="Str">ActiveXDemo.exe</Property>
            <Property Name="App_companyName" Type="Str">Socomate</Property>
            <Property Name="App_fileDescription" Type="Str">ActiveX Demo</Property>
            <Property Name="App_fileType" Type="Int">1</Property>
            <Property Name="App_fileVersion.major" Type="Int">1</Property>
            <Property Name="App_INI_aliasGUID" Type="Str">{833C5BA2-B588-41C4-B2BB-F5F0A1B90AB3}</Property>
            <Property Name="App_INI_GUID" Type="Str">{336F8204-CB21-46EB-A0F8-81E4BBBCBBF0}</Property>
            <Property Name="App_internalName" Type="Str">ActiveX Demo</Property>
            <Property Name="App_legalCopyright" Type="Str">Copyright © 2007 Socomate</Property>
            <Property Name="App_productName" Type="Str">ActiveX Demo</Property>
            <Property Name="Bld_buildSpecName" Type="Str">ActiveX Demo</Property>
            <Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
            <Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
            <Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
            <Property Name="Destination[0].destName" Type="Str">ActiveXDemo.exe</Property>
            <Property Name="Destination[0].path" Type="Path">/C/uspc/applications/internal.llb</Property>
            <Property Name="Destination[0].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="Destination[0].type" Type="Str">App</Property>
            <Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
            <Property Name="Destination[1].path" Type="Path">/C/uspc/applications/data</Property>
            <Property Name="Destination[1].path.type" Type="Str">&lt;none&gt;</Property>
            <Property Name="DestinationCount" Type="Int">2</Property>
            <Property Name="Source[0].itemID" Type="Str">{0D1B854F-37A5-4FF0-9DA5-7F78DB564CA7}</Property>
            <Property Name="Source[0].type" Type="Str">Container</Property>
            <Property Name="Source[1].destinationIndex" Type="Int">0</Property>
            <Property Name="Source[1].itemID" Type="Ref">/My Computer/ActiveX Demo/ActiveX Demo.vi</Property>
            <Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
            <Property Name="Source[1].type" Type="Str">VI</Property>
            <Property Name="SourceCount" Type="Int">2</Property>
         </Item>
      </Item>
   </Item>
</Project>
