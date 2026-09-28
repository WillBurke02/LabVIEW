// -------------------------------------------------------------------------------------------
// Acquisition demo
//
// Description:
// This program shows how to use acquisition function of USPC DLL.
// This program only acquires C-scan data (not A-scan) and start acquisition on software
// command.
//
// Revision:
// 25 Febuary 2003 First version created by Alain Zins
// 26 September 2006 Add condition to update graph (if number of data > 0)
// -------------------------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "Acquisition_Demo_Unit.h"
#include "Acquisition_sort_data.h"
#include "..\DLL_pcxus_exports.h"
#include <stdio.h>
#include <algorithm.h>

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "CSPIN"
#pragma resource "*.dfm"
TAcquisition_Demo *Acquisition_Demo;
//---------------------------------------------------------------------------
__fastcall TAcquisition_Demo::TAcquisition_Demo(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAcquisition_Demo::OnCreate(TObject *Sender)
{
	ULONG	error;

	//Open USPC
    error =  PCXUS_Open(&hPCXUS, 1);
    if(error)
    {
    	MessageBox(NULL,"A handle to the driver could not be obtained properly","Error",MB_OK);
		Close();
		Application->Terminate();
    }
    // Initialize variables
    EditBoard->Text=Board+1;
    EditChannel->Text=Channel+1;
    EditBufferSize->Text=BufferSize;
    EditNbScans->Text=NumberOfScansToAcquire;
    EditTimeOut->Text=TimeOut;
    EditFluidity->Text=Fluidity;
    cbShow->ItemIndex=2;
    BtStop->Enabled=false;
}
//---------------------------------------------------------------------------
void __fastcall TAcquisition_Demo::OnClose(TObject *Sender,
      TCloseAction &Action)
{
	// Close USPC
    PCXUS_Close(hPCXUS);
}
//---------------------------------------------------------------------------
void __fastcall TAcquisition_Demo::BoardOnChange(TObject *Sender)
{
    int localBoard;
	try
    {
    	localBoard = StrToInt(EditBoard->Text);
    }
    catch (Exception& exception)
    {
    	localBoard = Board+1;
    }
    if(localBoard < 1)localBoard=1;
    if(localBoard > 10)localBoard=10;
    Board = localBoard-1;
    EditBoard->Text=Board+1;
}
//---------------------------------------------------------------------------
void __fastcall TAcquisition_Demo::ChannelOnChange(TObject *Sender)
{
    int localChannel;
	try
    {
    	localChannel = StrToInt(EditChannel->Text);
    }
    catch (Exception& exception)
    {
    	localChannel = Channel+1;
    }
    if(localChannel < 1)localChannel=1;
    if(localChannel > 8)localChannel=8;
	Channel = localChannel-1;
    EditChannel->Text=Channel+1;
}
//---------------------------------------------------------------------------
void __fastcall TAcquisition_Demo::BufferSizeOnChange(TObject *Sender)
{
    ULONG localBufferSize;
	try
    {
    	localBufferSize = StrToInt(EditBufferSize->Text);
    }
    catch (Exception& exception)
    {
    	localBufferSize = BufferSize;
    }
    if(localBufferSize < 0)localBufferSize=0;
	BufferSize = localBufferSize;
    EditBufferSize->Text=BufferSize;
}
//---------------------------------------------------------------------------
void __fastcall TAcquisition_Demo::NbScansOnChange(TObject *Sender)
{
    int localNbScans;
	try
    {
    	localNbScans = StrToInt(EditNbScans->Text);
    }
    catch (Exception& exception)
    {
    	localNbScans = NumberOfScansToAcquire;
    }
    if(localNbScans < -1)localNbScans=-1;
	NumberOfScansToAcquire = localNbScans;
    EditNbScans->Text=NumberOfScansToAcquire;
}
//---------------------------------------------------------------------------
void __fastcall TAcquisition_Demo::TimeOutOnChange(TObject *Sender)
{
    ULONG localTimeOut;
	try
    {
    	localTimeOut = StrToInt(EditTimeOut->Text);
    }
    catch (Exception& exception)
    {
    	localTimeOut = TimeOut;
    }
    if(localTimeOut < 0)localTimeOut=0;
	TimeOut = localTimeOut;
    EditTimeOut->Text=TimeOut;
}
//---------------------------------------------------------------------------
void __fastcall TAcquisition_Demo::FluidityOnChange(TObject *Sender)
{
    int	localFluidity;
	try
    {
    	localFluidity = StrToInt(EditFluidity->Text);
    }
    catch (Exception& exception)
    {
    	localFluidity = Fluidity;
    }
    if(localFluidity < 0)localFluidity=0;
	Fluidity = localFluidity;
    EditFluidity->Text=Fluidity;
}
//---------------------------------------------------------------------------
void __fastcall TAcquisition_Demo::BtStartNClick(TObject *Sender)
{
	ULONG	error;
	ULONG	AcqMode= 0x800, StartMode=1;
	ULONG	Conditions[]={0,0,0,0,0,0,0,0};
	ULONG	NumberRead;
	ULONG	ScansBacklog;
	ULONG	Status, Status_NumberOfScansAcquired, Status_NumberOfScansRead, Status_BufferSize;
    int     NumberOfData;

    // Check Mode
    if(cbShow->ItemIndex<2)
    {
       	MessageBox(NULL,"Select only a C-scan signal","Function not supplied",MB_OK);
        return;
    }

    // Disable buttons
    BtStartN-> Enabled=false;
    BtStartContinously->Enabled=false;
    BtStop->Enabled=true;

	// Setup acquisition
    error = PCXUS_ACQ_CONFIG(
    			hPCXUS,
	        	Board,
    	        AcqMode,
	            StartMode,
    	        Conditions,
        	    0,
            	0,
	            BufferSize,
    	        &Fluidity,
        	    NULL);
	// Display Fluidity come back
	EditFluidity->Text=Fluidity;

	if(error)
    {
    	sprintf(ErrorMessage,"PCXUS_ACQ_CONFIG error : %08x", error);
    	MessageBox(NULL,ErrorMessage,"Error",MB_OK);
		StopAndClear();
        return;
    }

    // Memory allocation
	PCXUS_ACQ_GET_STATUS(
    	Board,
        &Status,
        &Status_NumberOfScansAcquired,
        &Status_NumberOfScansRead,
        &Status_BufferSize,            // Get size of buffer (normaly equal to BufferSize)
        &BlockSize);				   // Get size of one scan

    pData = (BYTE *) malloc(Status_BufferSize*BlockSize*sizeof(ULONG));
    if(pData == NULL)
    {
    	MessageBox(NULL,"Memory allocation failed","Error",MB_OK);
		StopAndClear();
        return;
    }

	// Start acquisition
    error = PCXUS_ACQ_START(
    			hPCXUS,
                Board,
                NumberOfScansToAcquire);
	if(error)
    {
    	sprintf(ErrorMessage,"PCXUS_ACQ_START error : %08x", error);
    	MessageBox(NULL,ErrorMessage,"Error",MB_OK);
		StopAndClear();
        return;
    }
    // Read acquisition
    error = PCXUS_ACQ_READ(
    			hPCXUS,
                Board,
                NumberOfScansToAcquire,
                TimeOut,
                &NumberRead,
                &ScansBacklog, pData);
	if(error)
    {
    	sprintf(ErrorMessage,"PCXUS_ACQ_READ error : %08x", error);
    	MessageBox(NULL,ErrorMessage,"Error",MB_OK);
		StopAndClear();
        return;
    }

    if(NumberRead <= 0)
    {
    	// No data
    	StopAndClear();
    	return;
    }

   	// Update display

    // Memory allocate for your signal
	pCscan = (double *) malloc(NumberRead*sizeof(double));
   	if(pCscan == NULL)
    {
   		MessageBox(NULL,"Memory allocation failed","Error",MB_OK);
		StopAndClear();
        return;
    }
    // Extract data into Cscan data stream
	NumberOfData = acq_sort_data( cbShow->ItemIndex, pData, Channel, NumberRead, BlockSize, 0, 0, pCscan, NULL);

	// Clear C-scan graph
	Series1->Clear();

    if(NumberOfData > 0)
    {
    	// Update graph scales
	    Cscan->BottomAxis->Automatic=false;
    	Cscan->BottomAxis->Minimum=0;
	    Cscan->BottomAxis->Maximum=NumberOfData;
    	Series1->AddArray(pCscan,NumberOfData-1);

   	    switch(cbShow->ItemIndex)
        {
        case 2: // Amplitude Gate 1
        case 3: // Amplitude Gate 2
    	    Cscan->LeftAxis->AutomaticMaximum=false;
        	Cscan->LeftAxis->Maximum=100.0;
            break;
        case 4: // TOF Gate 1
        case 5: // TOF Gate 2
        case 6: // TOF Gate IF
        	Cscan->LeftAxis->AutomaticMaximum=true;
            Cscan->Update();
        	Cscan->LeftAxis->AutomaticMaximum=false;
        	Cscan->LeftAxis->Maximum+=1;
            break;
        case 7: // Counter 1
        case 8: // Counter 2
        	Cscan->LeftAxis->AutomaticMaximum=true;
            break;
        case 9:		// DET 1
        case 10:	// Alarm mimi 1
        case 11:	// Alarm maxi 1
        case 12:	// Coupling alarm 1
        case 13:	// DET 2
        case 14:	// Alarm mini 2
        case 15:	// Alarm maxi 2
        case 16:	// Coupling alarm 2
        case 17:	// DET IF
        case 18:	// ENABLE (IN 1)
        	Cscan->LeftAxis->AutomaticMaximum=false;
        	Cscan->LeftAxis->Maximum=1.5;
            break;
        case 19:
        	Cscan->LeftAxis->AutomaticMaximum=false;
        	Cscan->LeftAxis->Maximum=256;
            break;
        }
    }

    StopAndClear();
}
//---------------------------------------------------------------------------
void __fastcall TAcquisition_Demo::BtStartContinouslyClick(TObject *Sender)
{
	ULONG	error;
	ULONG	AcqMode = 0x800, StartMode = 1;
	ULONG	Conditions[]={0,0,0,0,0,0,0,0};
	ULONG	Status, Status_NumberOfScansAcquired, Status_NumberOfScansRead, Status_BufferSize;

    // Check Mode
    if(cbShow->ItemIndex<1)
    {
       	MessageBox(NULL,"Select only a C-scan signal","Function not supplied",MB_OK);
        return;
    }

    // Disable buttons
    BtStartN->Enabled=false;
    BtStartContinously->Enabled=false;
    BtStop->Enabled=true;

	// Setup acquisition
    error = PCXUS_ACQ_CONFIG(
    			hPCXUS,
	        	Board,
    	        AcqMode,
	            StartMode,
    	        Conditions,
        	    0,
            	0,
	            BufferSize,
    	        &Fluidity,
        	    NULL);
	// Update Fluidity come back
	EditFluidity->Text=Fluidity;
	if(error)
    {
    	sprintf(ErrorMessage,"PCXUS_ACQ_CONFIG error : %08x", error);
    	MessageBox(NULL,ErrorMessage,"Error",MB_OK);
		StopAndClear();
        return;
    }

    // Memory allocation
	PCXUS_ACQ_GET_STATUS(
    	Board,
        &Status,
        &Status_NumberOfScansAcquired,
        &Status_NumberOfScansRead,
        &Status_BufferSize,				// Get size of buffer (normaly equal to BufferSize)
        &BlockSize);					// Get size of one scan

    pData = (BYTE *) malloc(Status_BufferSize*BlockSize*sizeof(ULONG));
    pCscan = (double *) malloc(BufferSize*sizeof(double));
    if(pData == NULL || pCscan == NULL)
    {
    	MessageBox(NULL,"Memory allocation failed","Error",MB_OK);
		StopAndClear();
        return;
    }

    // Clear Graph
	Series1->Clear();

    // Setup graph scales
	Acquisition_Demo->Cscan->BottomAxis->Automatic=false;
	Acquisition_Demo->Cscan->BottomAxis->AutomaticMaximum=false;
	Acquisition_Demo->Cscan->BottomAxis->AutomaticMinimum=false;
	Acquisition_Demo->Cscan->BottomAxis->Minimum=0;
	Acquisition_Demo->Cscan->BottomAxis->Maximum=1000;
	iPoints=0;

    switch(cbShow->ItemIndex)
    {
    case 2: // Amplitude Gate 1
    case 3: // Amplitude Gate 2
    	Cscan->LeftAxis->AutomaticMaximum=false;
    	Cscan->LeftAxis->Maximum=100.0;
        break;
    case 4: // TOF Gate 1
    case 5: // TOF Gate 2
    case 6: // TOF Gate IF
    	Cscan->LeftAxis->AutomaticMaximum=true;
        break;
    case 7: // Counter 1
    case 8: // Counter 2
    	Cscan->LeftAxis->AutomaticMaximum=true;
        break;
    case 9:		// DET 1
    case 10:	// Alarm mimi 1
    case 11:	// Alarm maxi 1
    case 12:	// Coupling alarm 1
    case 13:	// DET 2
    case 14:	// Alarm mini 2
    case 15:	// Alarm maxi 2
    case 16:	// Coupling alarm 2
    case 17:	// DET IF
    case 18:	// ENABLE (IN 1)
    	Cscan->LeftAxis->AutomaticMaximum=false;
    	Cscan->LeftAxis->Maximum=1.5;
        break;
    case 19:
    	Cscan->LeftAxis->AutomaticMaximum=false;
    	Cscan->LeftAxis->Maximum=256;
        break;
    }

	// Start acquisition
    error = PCXUS_ACQ_START(
    			hPCXUS,
                Board,
                -1);
	if(error)
    {
    	sprintf(ErrorMessage,"PCXUS_ACQ_START error : %08x", error);
    	MessageBox(NULL,ErrorMessage,"Error",MB_OK);
		StopAndClear();
        return;
    }

    // Start Read acqusition loop (periode = 100 ms)
	ReadTimer->Enabled=true;
}
//---------------------------------------------------------------------------
void __fastcall TAcquisition_Demo::ReadTimerTimer(TObject *Sender)
{
	ULONG	error;
	ULONG	NumberRead;
	ULONG	ScansBacklog;
    int     NumberOfData;

    // Read acquisition
    error = PCXUS_ACQ_READ(
    			hPCXUS,
                Board,
                -1,
                0,
                &NumberRead,
                &ScansBacklog,
                pData);
    if(error)
    {
        StopAndClear();
        sprintf(ErrorMessage,"PCXUS_ACQ READ rrror= %08x",error);
    	MessageBox(NULL,ErrorMessage,"Error",MB_OK);
    	return;
    }

    if(NumberRead>0)
    {
    	// Extract C-scan into data stream
        NumberOfData = acq_sort_data( cbShow->ItemIndex,
        			pData,
            	    Channel,
                	NumberRead,
	                BlockSize,
    	            0, 0,
        	        pCscan,
            	    NULL);

        // Update display
        if(NumberOfData > 0)
        {
    	    Series1->AddArray(pCscan,NumberOfData-1);
	    	iPoints+=NumberOfData;
    	    Cscan->BottomAxis->Maximum = max(iPoints-1,1000);
    	    Cscan->BottomAxis->Minimum = max(iPoints-1,1000) - 1000;
        }
    }
}
//---------------------------------------------------------------------------
void __fastcall TAcquisition_Demo::BtStopClick(TObject *Sender)
{
    StopAndClear();
}
//---------------------------------------------------------------------------
void __fastcall TAcquisition_Demo::StopAndClear(void)
{
    // Stop read loop (continous mode)
    ReadTimer->Enabled = false;

    // Stop and clear acquisition
    PCXUS_ACQ_STOP(hPCXUS, Board);
    PCXUS_ACQ_CLEAR(hPCXUS, Board);

    // Free memories
    if(pData != NULL)free(pData);
    if(pCscan != NULL)free(pCscan);

    // Enable buttons
    BtStartN->Enabled=true;
    BtStartContinously->Enabled=true;
    BtStop->Enabled=false;
}
//---------------------------------------------------------------------------
void __fastcall TAcquisition_Demo::lbHelpClick(TObject *Sender)
{
    ShellExecute(NULL,"open","c:\\uspc\\SDK for USPC\\Help\\SDK USPC.htm",0,0,SW_SHOW);
}


