Attribute VB_Name = "USPC_DLL_declarations"
'USPC DLL declarations

Const MAX_PCXUS = 10    'Maximum boards
Const MAX_ROW = 100     'Size of parameter's array

Declare Function PCXUS_Open Lib "DLL_PCXUS" (ByRef handle As Long, ByVal iBoot As Long) As Long
Declare Function PCXUS_Close Lib "DLL_PCXUS" (ByVal handle As Long) As Long
Declare Function PCXUS_Load Lib "DLL_PCXUS" (ByVal Board As Long, ByVal Test As Long, ByVal file As String) As Long
Declare Function PCXUS_Save Lib "DLL_PCXUS" (ByVal Board As Long, ByVal Test As Long, ByVal file As String) As Long
Declare Function PCXUS_READ Lib "DLL_PCXUS" (ByVal hPCXUS As Long, ByVal Board As Long, ByVal Test As Long, ByVal unit As Long, ByVal strParam As String, ByRef dblValue As Double, dblArrayValue1 As Any, dblArrayValue2 As Any, ByVal StringValue As String) As Long
Declare Function PCXUS_WRITE Lib "DLL_PCXUS" (ByVal hPCXUS As Long, ByVal Board As Long, ByVal Test As Long, ByVal unit As Long, ByVal strParam As String, ByRef dblValue As Double, dblArrayValue1 As Any, dblArrayValue2 As Any, ByVal StringValue As String, ByRef clip As Long) As Long
Declare Function PCXUS_ACQ_ASCAN Lib "DLL_PCXUS" (ByVal Board As Long, ByVal Test As Long, ByRef Ascan As Any, ByVal TimeOut As Long) As Long

Declare Function PCXUS_Get_number_of_boards Lib "DLL_PCXUS" () As Long
Declare Function PCXUS_Get_Serial_Number Lib "DLL_PCXUS" (ByVal Board As Long, ByRef SerialNumber As Long)
Declare Function PCXUS_Get_MUX_RCPP_Serial_Number Lib "DLL_PCXUS" (ByVal Board As Long, ByRef SerialNumber As Long)

Declare Function PCXUS_Notify Lib "DLL_PCXUS" (ByVal hPCXUS As Long) As Boolean
Declare Sub PCXUS_Get_Flag_Alarm Lib "DLL_PCXUS" (ByRef Alarm As Long)
Declare Sub PCXUS_Get_Alarms Lib "DLL_PCXUS" (Alarm1() As Long, Alarm2() As Long, Alarm3() As Long)
Declare Sub PCXUS_Clear_All_Alarms Lib "DLL_PCXUS" ()


Declare Function PCXUS_ACQ_CONFIG Lib "DLL_PCXUS" (ByVal handle As Long, ByVal Board As Long, ByVal Acq_mode As Long, ByVal Start_mode As Long, Alarm As Any, ByVal PrePost_trigger As Long, ByVal Discriminant As Long, ByVal NumberOfScans As Long, ByRef InterruptFluidity As Long, ByRef Param As Long) As Long
Declare Function PCXUS_ACQ_START Lib "DLL_PCXUS" (ByVal handle As Long, ByVal Board As Long, ByVal NumberOfScansToAcquire As Long) As Long

Declare Function PCXUS_ACQ_READ Lib "DLL_PCXUS" (ByVal handle As Long, ByVal Board As Long, ByVal NumberOfScansToRead As Long, ByVal TimeOut As Long, ByRef NumberRead As Long, ByRef ScansBacklog As Long, pData As Any) As Long

Declare Function PCXUS_ACQ_STOP Lib "DLL_PCXUS" (ByVal handle As Long, ByVal Board As Long) As Long
Declare Function PCXUS_ACQ_CLEAR Lib "DLL_PCXUS" (ByVal handle As Long, ByVal Board As Long) As Long
Declare Function PCXUS_ACQ_GET_STATUS Lib "DLL_PCXUS" (ByVal Board As Long, ByRef Status As Long, ByRef NumberOfScansAcquired As Long, ByRef NumberOfScansRead As Long, ByRef BufferSize As Long, ByRef BlocSize As Long) As Long

'Declare Sub PCXUS_Build_Header_Ascan Lib "DLL_PCXUS" (ByVal Gate_Trigger_1 As Long, ByVal Gate_Position_1 As Double, ByVal Gate_Width_1 As Double, ByVal Gate_Level_1 As Long, ByVal Gate_Trigger_2 As Long, ByVal Gate_Position_2 As Double, ByVal Gate_Width_2 As Double, ByVal Gate_Level_2 As Long, ByVal Gate_Position_IF As Double, ByVal Gate_Width_IF As Double, ByVal Gate_Level_IF As Long, ByVal Scope_Trigger As Long, ByVal Scope_Offset As Double, pAscan() As Byte)
Declare Sub PCXUS_Build_Header_Ascan Lib "DLL_PCXUS" (Header As Any, pAscan() As Byte)


