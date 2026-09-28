//  dll_pcxus_exports.h
//
//  Prototypes
//
//  Revision history : 07 March 2002 - Created by Alain Zins
//  Revision history : 16 September 2002 - Add Acquisition prototypes
//  Revision history : 07 March 2003 - Add Scope_range parameter to build Ascan header
//  Revision history : 10 September 2003 - prototype of PCXUS_Build_Header_Ascan changed
//  Revision history : 15 September 2003 - Relook prototypes with [in] and [out] description
//  Revision history : 05 March 2004 - Correction of structs 
//                                      PCXUS_GATEHEADER (alignment)
//                                      PCXUS_ASCANHEADER (alignment + moving of channel number)
//                                      PCXUS_DATAHEADER (alignment)
//  Revision history : 13 April 2004 - Add Debug function
//  Revision history : 22 April 2005 - Maximum boards is increase from 10 to 16.
//  Revision history : 26 September 2006 - Increase PCXUS_MAX_HEADER and MAX_HEADER from 30 to 50.
//
//  SOCOMATE INTERNATIONAL
//

//  New define names to prevent possible namespace clashes.
//
#define PCXUS_MAX_BOARDS    16  // Maximum boards
#define PCXUS_MAX_ROW       100 // Size of parameter's array
#define PCXUS_MAX_HEADER    50  // Size of parameter's array to build header of A-scan

// Old defines for backward compatibility if they are not defined yet.
#ifndef MAX_PCXUS
#  define MAX_PCXUS  16 // Maximum boards
#endif
#ifndef MAX_ROW
#  define MAX_ROW   100 // Size of parameter's array
#endif
#ifndef MAX_HEADER
#  define MAX_HEADER   50 // Size of parameter's array to build header of A-scan
#endif


//
// Add extern "C" when this file is included in a C++ code file.
//
#if __cplusplus
extern "C" {
#endif

typedef void (CALLBACK *PCXUS_DebugFunc)(LPCSTR);

VOID WINAPI PCXUS_SetDebugFunc(PCXUS_DebugFunc func);
    
// Prototypes
ULONG WINAPI PCXUS_Open
    (
    ULONG *hPCXUS,                          // [out]
    INT boot                                // [in]
    );

ULONG WINAPI PCXUS_Load
    (
    INT Board,                              // [in]
    INT Test,                               // [in]
    LPCSTR file                             // [in]
    );

ULONG WINAPI PCXUS_WRITE
    (
    ULONG hPCXUS,                           // [in]
    INT Board,                              // [in]
    INT Test,                               // [in]
    INT Unit,                               // [in]
    LPCSTR strParam,                        // [in]
    DOUBLE* dblValue,                       // [in/out]
    DOUBLE dblArrayValue1[PCXUS_MAX_ROW],   // [in/out]
    DOUBLE dblArrayValue2[PCXUS_MAX_ROW],   // [in/out]
    LPSTR StrValue,                         // [in/out]
    PINT Clipped                            // [out]
    );

ULONG WINAPI PCXUS_READ
    (
    ULONG hPCXUS,                           // [in]
    INT Board,                              // [in]
    INT Test,                               // [in]
    INT Unit,                               // [in]
    LPCSTR strParam,                        // [in]
    DOUBLE* dblValue,                       // [out]
    DOUBLE dblArrayValue1[PCXUS_MAX_ROW],   // [out]
    DOUBLE dblArrayValue2[PCXUS_MAX_ROW],   // [out]
    LPSTR StringValue                       // [out]
    );

ULONG WINAPI PCXUS_Save
    (
    INT Board,                              // [in]
    INT Test,                               // [in]
    LPCSTR file                             // [in]
    );

ULONG WINAPI PCXUS_Close
    (
    ULONG hPCXUS                            // [in]
    );

ULONG WINAPI PCXUS_ACQ_ASCAN
    (
    INT Board,                              // [in]
    INT Test,                               // [in]
    ULONG *A_scan,                          // [out]
    INT Timeout                             // [in]
    );


ULONG WINAPI PCXUS_Get_number_of_boards();

ULONG WINAPI PCXUS_Get_Serial_Number
    (
    INT Board,                              // [in]
    INT* SerialNumber                       // [out]
    );

ULONG WINAPI PCXUS_Get_MUX_RCPP_Serial_Number
    (
    INT Board,                              // [in]
    INT *SerialNumber                       // [out]
    );

BOOL  WINAPI PCXUS_Notify
    (
    ULONG hPCXUS                            // [in]
    );

VOID  WINAPI PCXUS_Get_Flag_Alarm
    (
    INT *Alarm                              // [out]
    );

VOID  WINAPI PCXUS_Get_Alarms
    (
    INT Alarm1[PCXUS_MAX_BOARDS],           // [out]
    INT Alarm2[PCXUS_MAX_BOARDS],           // [out]
    INT Alarm3[PCXUS_MAX_BOARDS]            // [out]
    );



void  WINAPI PCXUS_Clear_All_Alarms();

ULONG WINAPI PCXUS_ACQ_CONFIG
    (
    ULONG hPCXUS,                           // [in]
    INT Board,                              // [in]
    ULONG Acq_mode,                         // [in]
    ULONG Start_mode,                       // [in]
    ULONG Alarm[8],                         // [in]
    INT PrePost_trigger,                    // [in]
    INT Discriminant,                       // [in]
    ULONG NumberOfScans,                    // [in]
    INT *InterruptFluidity,                 // [in/out]
    ULONG *Param                            // Future extension.
    );

ULONG WINAPI PCXUS_ACQ_START
    (
    ULONG hPCXUS,                           // [in]
    INT Board,                              // [in]
    INT NumberOfScansToAcquire              // [in]
    );

ULONG WINAPI PCXUS_ACQ_READ
    (
    ULONG hPCXUS,                           // [in]
    INT Board,                              // [in]
    INT NumberOfScansToRead,                // [in]
    INT TimeOut,                            // [in]
    ULONG *NumberRead,                      // [out]
    ULONG *ScansBacklog,                    // [out]
    UCHAR *pData                            // [out]
    );

ULONG WINAPI PCXUS_ACQ_STOP
    (
    ULONG hPCXUS,                           // [in]
    INT Board                               // [in]
    );

ULONG WINAPI PCXUS_ACQ_CLEAR
    (
    ULONG hPCXUS,                           // [in]
    INT Board                               // [in]
    );

ULONG WINAPI PCXUS_ACQ_GET_STATUS
    (
    INT Board,                              // [in]
    ULONG *Status,                          // [out]
    ULONG *NumberOfScansAcquired,           // [out]
    ULONG *NumberOfScansRead,               // [out]
    ULONG *BufferSize,                      // [out]
    ULONG *BlocSize                         // [out]
    );


// 10-09-03 void  WINAPI PCXUS_Build_Header_Ascan               (int Gate_Trigger_1, double Gate_Position_1, double Gate_Width_1, int Gate_Level_1, int Gate_Trigger_2, double Gate_Position_2, double Gate_Width_2, int Gate_Level_2, double Gate_Position_IF, double Gate_Width_IF, int Gate_Level_IF, int Scope_Trigger, double Scope_Offset, double Scope_Range, ULONG *pAscan);

VOID WINAPI PCXUS_Build_Header_Ascan
    (
    double Header[PCXUS_MAX_HEADER],        // [in]
    ULONG *pAscan                           // [in/out]
    );

 


// Set byte alignment from here
#pragma pack(push, previous_pack)
#pragma pack(1)
// Description of the data block returned by ReadAscan(...)
typedef struct
{
    BYTE G1Amp;              // Gate 1 amplitude in [%].
    BYTE G1Quality;          // Gate 1 quality in [%].
    BYTE G1CouplingAlarm: 1; // Gate 1 coupling alarm.
    BYTE G1Det: 1;           // Gate 1 DET.
    BYTE G1ThickMin: 1;      // Gate 1 Minimum thickness alarm.
    BYTE G1ThickMax: 1;      // Gate 1 Maximum thickness alarm.
    BYTE Spare: 4;
    BYTE Spare1: 1;
    BYTE G1BeginInAscan: 1;  // Gate 1 begin is in a-scan range.
    BYTE Spare2: 2;
    BYTE G1InAscan: 1;       // Gate 1 end is in a-scan range.
    BYTE Input: 1;           // State of ENABLE input
    BYTE Spare3: 2;
    UINT G1Tof: 24;          // Gate TOF in steps of 5 [ns]
    UINT WallThick: 8;       // WallThick put on DAC output.
} PCXUS_GATEHEADER;
//
//
//
typedef struct
{
    DWORD G1Begin;              // Begin of gate 1 in ns.
    DWORD G1End;                // Begin of gate 1 in ns.
    DWORD G2Begin;              // Begin of gate 2 in ns.
    DWORD G2End;                // Begin of gate 2 in ns.
    DWORD IfBegin;              // Begin of IF gate in ns.
    DWORD IfEnd;                // Begin of IF gate in [ns].
    BYTE G1Level;               // Gate 1 level in [%].
    BYTE G2Level;               // Gate 2 level in [%].
    BYTE IfLevel;               // IF gate level in [%].
    BYTE G1AlarmFilterLevel: 4; // Gate 1 alarm filter level [dB].
    BYTE G2AlarmFilterLevel: 4; // Gate 2 alarm filter level [dB].
    DWORD AscanBegin;           // Begin of the A-scan in [ns].
    DWORD Spare1[6];
    PCXUS_GATEHEADER Gates[2];
    UINT Spare2: 8;
    UINT Channel: 8;            // Channel number
    UINT Spare3: 1;
    UINT IfDet: 1;
    UINT Spare4: 7;
    UINT IfBeginInAscan: 1;     // If gate begin is in a-scan range.
    UINT Spare5: 2;             // 05-03-04
    UINT IfEndInAscan: 1;       // If gate end is in a-scan range.
    UINT Spare4bis: 3;       
    DWORD IfTof;                // If gate TOF in steps of 5 [ns].
    UINT Spare6: 1;
    UINT PrfAlarm: 1;
    UINT Spare7: 14;
    UINT DspAscanStat: 1;       // DSP A-scan status.
    UINT HwLogicStat: 1;        // HW logic status.
    UINT DspGateStat: 1;        // DSP A-scan status.
    UINT UtParamStat: 1;        // Ultrasonic parameter status.
    UINT SyncCycErrStat: 1;     // Sybchrone cycle error status.
    UINT PrfFiltAlarm: 1;       // Filtered PRF alarms.
    UINT Spare8: 7;
    UINT PowerAlarm: 1;         // Power alarm.
    UINT Spare9: 2;
    DWORD Spare10[2];
    WORD DataSize;              // Size of the data.
    WORD Spare11;
    DWORD TimeEqu;              // Time equivalent in [ns].
    BYTE Points[1];             // First data point.
} PCXUS_ASCANHEADER;
//
// Data header type for acquisition modes 0x0800 ansd 0x1000.
// Used in ReadData(...) function.
//
typedef struct
{
    DWORD PulseCounter;
    DWORD ScanCounter;
    struct
    {
        BYTE Amp;               // Amplitude in [%]
        BYTE Quality;           // Quality in [%]
        BYTE CouplingAlarm: 1;  // On/off.
        BYTE Det: 1;            // On/off.
        BYTE ThickMin: 1;       // On/off.
        BYTE ThickMax: 1;       // On/off.
        BYTE Spare: 4;         
        BYTE Spare1;         
        DWORD Tof: 24;          // In steps of 5 [ns].
        DWORD WallThick :8;      // WallThick put on DAC output.
    } Gates[2];
    BYTE TranferCounter;
    BYTE Channel;
    BYTE Spare2: 1;
    BYTE IfDet: 1;
    BYTE Pin6Enable: 1;
    BYTE Spare3: 5;
    BYTE Spare4;
    DWORD IfTof;
} PCXUS_DATAHEADER;

typedef struct
{
    PCXUS_DATAHEADER hdr;      // Header
    // From here acquisition mode 0x1000 applies.
    UINT Spare: 20;
    UINT CycleAlarm: 1;
    UINT PrfAlarm: 1;
    UINT Spare1: 7;
    UINT PowerAlarm: 1;
    UINT Spare2: 2;
    DWORD Spare3;
    WORD _Channel;
    WORD Spare4;
    WORD Points;              // Amount of points in the a-scan.
    WORD Spare5;
    DWORD TimeEqu;
    BYTE Point[1];
} PCXUS_ASCANDATAHEADER;
// Restore the aligment as it was before.
#pragma pack(pop, previous_pack)

#if __cplusplus
} // extern "C"
#endif
