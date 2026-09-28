unit DLL_pcxus;

interface

Const MAX_PCXUS=10;	// Maximum boards

Type
  TarrayAscan = array[0..1000] of byte;
  TarrayDbl = array[0..99] of Double;
  TarrayAlarm = array[0..MAX_PCXUS-1] of Integer;
  TCondition = array[0..7] of Longword;
  TData = array of byte;
  TarrayHeader = array[0..49] of Double;

function PCXUS_Open(var hPCXUS: LongWord; Boot: Integer):LongWord; stdcall;external 'dll_pcxus.dll' name 'PCXUS_Open';
function PCXUS_Close(hPCXUS: LongWord):LongWord; stdcall;external 'dll_pcxus.dll' name 'PCXUS_Close';
function PCXUS_Load(Board: Integer; Channel: Integer; FileName: Pchar):LongWord;stdcall;external 'dll_pcxus.dll' name 'PCXUS_Load';
function PCXUS_Save(Board: Integer; Channel: Integer; FileName: Pchar):LongWord;stdcall;external 'dll_pcxus.dll' name 'PCXUS_Save';
function PCXUS_WRITE(hPCXUS: LongWord; Board: Integer; Channel: Integer; ParamUnit: Integer; strParam: PChar; var dblValue: Double; dblArrayValue1: TarrayDbl; dblArrayValue2: TarrayDbl; StrValue: PChar; var Clip: Integer):LongWord;stdcall;external 'dll_pcxus.dll' name 'PCXUS_WRITE';
function PCXUS_READ(hPCXUS: LongWord; Board: Integer; Channel: Integer; ParamUnit: Integer; strParam: PChar; var dblValue: Double; dblArrayValue1: TarrayDbl; dblArrayValue2: TarrayDbl; StrValue: PChar):LongWord;stdcall;external 'dll_pcxus.dll' name 'PCXUS_READ';
function PCXUS_ACQ_ASCAN(Board: Integer; Channel: Integer; A_scan: TarrayAscan; Timeout: Integer):LongWord;stdcall;external 'dll_pcxus.dll' name 'PCXUS_ACQ_ASCAN';

function PCXUS_Get_number_of_boards:LongWord;stdcall;external 'dll_pcxus.dll' name 'PCXUS_Get_number_of_boards';
function PCXUS_Get_Serial_Number(Board: Integer; var SerialNumber: Integer):LongWord;stdcall;external 'dll_pcxus.dll' name 'PCXUS_Get_Serial_Number';
function PCXUS_Get_MUX_RCPP_Serial_Number(Board: Integer; var SerialNumber: Integer):LongWord;stdcall;external 'dll_pcxus.dll' name 'PCXUS_Get_MUX_RCPP_Serial_Number';

function PCXUS_Notify(hPCXUS: LongWord):boolean;stdcall;external 'dll_pcxus.dll' name 'PCXUS_Notify';
procedure PCXUS_Get_Flag_Alarm(var Alarm: Integer);stdcall;external 'dll_pcxus.dll' name 'PCXUS_Get_Flag_Alarm';
procedure PCXUS_Get_Alarms(Alarm1: TarrayAlarm; Alarm2: TarrayAlarm; Alarm3: TarrayAlarm);stdcall;external 'dll_pcxus.dll' name 'PCXUS_Get_Alarms';
procedure PCXUS_Clear_All_Alarms;stdcall;external 'dll_pcxus.dll' name 'PCXUS_Clear_All_Alarms';

function PCXUS_ACQ_CONFIG(hPCXUS: LongWord; Board: Integer; Acq_mode: LongWord; Start_mode: LongWord; ACQ_condition: TCondition; PrePost_trigger: Integer; Discriminant: Integer; NumberOfScans: LongWord; var InterruptFluidity: Integer; var Param: LongWord):LongWord; stdcall;external 'dll_pcxus.dll' name 'PCXUS_ACQ_CONFIG';
function PCXUS_ACQ_START(hPCXUS: LongWord; Board: Integer; NumberOfScansToAcquire: Integer):LongWord; stdcall;external 'dll_pcxus.dll' name 'PCXUS_ACQ_START';
function PCXUS_ACQ_READ(hPCXUS: LongWord; Board: Integer; NumberOfScansToRead: Integer; TimeOut: Integer; var NumberRead: LongWord; var ScansBacklog: LongWord; pData: array of byte):LongWord; stdcall;external 'dll_pcxus.dll' name 'PCXUS_ACQ_READ';
function PCXUS_ACQ_STOP(hPCXUS: LongWord; Board: Integer):LongWord; stdcall;external 'dll_pcxus.dll' name 'PCXUS_ACQ_STOP';
function PCXUS_ACQ_CLEAR(hPCXUS: LongWord; Board: Integer):LongWord; stdcall;external 'dll_pcxus.dll' name 'PCXUS_ACQ_CLEAR';
function PCXUS_ACQ_GET_STATUS(Board: Integer; var Status: LongWord; var NumberOfScansAcquired: LongWord; var NumberOfScansRead: LongWord; var BufferSize: LongWord; var BlocSize: LongWord):LongWord; stdcall;external 'dll_pcxus.dll' name 'PCXUS_ACQ_GET_STATUS';

procedure PCXUS_Build_Header_Ascan(Header: TarrayHeader; Ascan: TarrayAscan);stdcall;external 'dll_pcxus.dll' name 'PCXUS_Build_Header_Ascan';

implementation

end.
