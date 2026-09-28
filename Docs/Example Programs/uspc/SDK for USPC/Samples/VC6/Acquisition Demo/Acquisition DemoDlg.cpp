// Acquisition DemoDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Acquisition Demo.h"
#include "Acquisition DemoDlg.h"
#include <process.h>
#include "..\Dll_pcxus_exports.h"
#include "Acquisition sort data.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

//---------------------------------------------------------------------------
ULONG	hPCXUS;		// handle to USPC
int		Board, Channel, Fluidity, TimeOut;
ULONG	BufferSize, BlockSize, NumberOfScansToAcquire;
BYTE   	*pData;
double	*pCscan;
char	ErrorMessage[255];
//---------------------------------------------------------------------------

/////////////////////////////////////////////////////////////////////////////
// CAcquisitionDemoDlg dialog

CAcquisitionDemoDlg::CAcquisitionDemoDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CAcquisitionDemoDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CAcquisitionDemoDlg)
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CAcquisitionDemoDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAcquisitionDemoDlg)
	DDX_Control(pDX, IDC_btStartContinously, m_StartContinously);
	DDX_Control(pDX, IDC_btStartN, m_StartN);
	DDX_Control(pDX, IDC_STOP, m_StopAndClear);
	DDX_Control(pDX, IDC_SHOW, m_show);
	DDX_Control(pDX, IDC_CWBOARD, m_Board);
	DDX_Control(pDX, IDC_CWCHANNEL, m_Channel);
	DDX_Control(pDX, IDC_CWFLUIDITY, m_Fluidity);
	DDX_Control(pDX, IDC_CWBUFFER_SIZE, m_BufferSize);
	DDX_Control(pDX, IDC_CWNUMBER_OF_SCANS_TO_ACQUIRE, m_NumberOfScansToAcquire);
	DDX_Control(pDX, IDC_CWTIMEOUT, m_TimeOut);
	DDX_Control(pDX, IDC_CWGRAPH1, m_Graph);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAcquisitionDemoDlg, CDialog)
	//{{AFX_MSG_MAP(CAcquisitionDemoDlg)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_WM_CLOSE()
	ON_BN_CLICKED(IDC_btHelp, OnbtHelp)
	ON_WM_TIMER()
	ON_BN_CLICKED(IDC_btStartN, OnbtStartN)
	ON_BN_CLICKED(IDC_btStartContinously, OnbtStartContinously)
	ON_BN_CLICKED(IDC_STOP, OnStopAndClear)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

BEGIN_EVENTSINK_MAP(CAcquisitionDemoDlg, CDialog)
    //{{AFX_EVENTSINK_MAP(CAcquisitionDemoDlg)
	//}}AFX_EVENTSINK_MAP
END_EVENTSINK_MAP()

/////////////////////////////////////////////////////////////////////////////
// CAcquisitionDemoDlg message handlers

BOOL CAcquisitionDemoDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	PCXUS_Open(&hPCXUS,2);
	m_show.SetCurSel(2);

    // Enable/Disable buttons
    m_Board.Enabled=true;
	m_StartN.EnableWindow(true);
    m_StartContinously.EnableWindow(true);
    m_StopAndClear.EnableWindow(false);	
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CAcquisitionDemoDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}
// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CAcquisitionDemoDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}
//-------------------------------------------------------------------------------------------------------
void CAcquisitionDemoDlg::OnClose() 
{
	PCXUS_Close(hPCXUS);
	CDialog::OnClose();
}
//-------------------------------------------------------------------------------------------------------
void CAcquisitionDemoDlg::OnbtStartN() 
{

	ULONG	error;
	ULONG	AcqMode= 0x800, StartMode=1;
	ULONG	Conditions[]={0,0,0,0,0,0,0,0};
	ULONG	NumberRead;
	ULONG	ScansBacklog;
	ULONG	Status, Status_NumberOfScansAcquired, Status_NumberOfScansRead, Status_BufferSize;
    int     NumberOfData;

    // Check Mode
    if(m_show.GetCurSel()<2)
    {
       	MessageBox("Select only a C-scan signal","Function not supplied",MB_OK);
        return;
    }


    // Enable/Disable buttons
    m_Board.Enabled=false;
	m_StartN.EnableWindow(false);
    m_StartContinously.EnableWindow(false);
    m_StopAndClear.EnableWindow(true);	

	Board = m_Board.Value - 1;
	Channel = m_Channel.Value - 1;
	BufferSize = m_BufferSize.Value;
	Fluidity = m_Fluidity.Value;
	NumberOfScansToAcquire = m_NumberOfScansToAcquire.Value;
	TimeOut = m_TimeOut.Value;

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
	m_Fluidity.Value = Fluidity;

	if(error)
    {
		OnStopAndClear();
    	sprintf(ErrorMessage,"PCXUS_ACQ_CONFIG error : %08x", error);
    	MessageBox(ErrorMessage,"Error",MB_OK);
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
		OnStopAndClear();
    	MessageBox("Memory allocation failed","Error",MB_OK);
        return;
    }

	// Start acquisition
    error = PCXUS_ACQ_START(
    			hPCXUS,
                Board,
                NumberOfScansToAcquire);
	if(error)
    {
		OnStopAndClear();
    	sprintf(ErrorMessage,"PCXUS_ACQ_START error : %08x", error);
    	MessageBox(ErrorMessage,"Error",MB_OK);
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
		OnStopAndClear();
    	sprintf(ErrorMessage,"PCXUS_ACQ_READ error : %08x", error);
    	MessageBox(ErrorMessage,"Error",MB_OK);
        return;
    }

    if(NumberRead <= 0)
    {
    	// No data
    	OnStopAndClear();
    	return;
    }

    // Memory allocate for your signal
	pCscan = (double *) malloc(NumberRead*sizeof(double));
   	if(pCscan == NULL)
    {
		OnStopAndClear();
   		MessageBox("Memory allocation failed","Error",MB_OK);
        return;
    }
    // Extract data into Cscan data stream
	NumberOfData = acq_sort_data( m_show.GetCurSel(), pData, Channel, NumberRead, BlockSize, 0, 0, pCscan, NULL);

	// Clear C-scan graph
	m_Graph.ClearData();

    if(NumberOfData>0)
    {
	    // Update graph scales
	    m_Graph.Axes.Item("X").AutoScale=false;
	    m_Graph.Axes.Item("X").Minimum=0;
	    m_Graph.Axes.Item("X").Maximum=NumberRead;

	    int	i;
	    double Maximum;
   	    switch(m_show.GetCurSel())
        {
        case 2: // Amplitude Gate 1
        case 3: // Amplitude Gate 2
		    m_Graph.Axes.Item("Y").AutoScale=false;
		    m_Graph.Axes.Item("Y").Minimum=0;
		    m_Graph.Axes.Item("Y").Maximum=100.0;
            break;
        case 4: // TOF Gate 1
        case 5: // TOF Gate 2
        case 6: // TOF Gate IF
		    m_Graph.Axes.Item("Y").AutoScale=true;
		    m_Graph.Axes.Item("Y").Minimum=0;
		    Maximum=0;
		    for(i=0;i<NumberRead;i++)
		    {
			    if(*(pCscan+i) > Maximum)Maximum=*(pCscan+i);
		    }
		    m_Graph.Axes.Item("Y").Maximum=Maximum+1;
            break;
        case 7: // Counter 1
        case 8: // Counter 2
		    m_Graph.Axes.Item("Y").AutoScale=true;
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
		    m_Graph.Axes.Item("Y").AutoScale=false;
		    m_Graph.Axes.Item("Y").Minimum=0;
		    m_Graph.Axes.Item("Y").Maximum=1.5;
            break;
        case 19:
		    m_Graph.Axes.Item("Y").AutoScale=false;
		    m_Graph.Axes.Item("Y").Minimum=0;
		    m_Graph.Axes.Item("Y").Maximum=256;
            break;
        }

   	    // Update display
	    m_Graph.ChartY(CNiReal64Vector(NumberOfData, pCscan));	
    }

	// Stop acquisition
	OnStopAndClear();
}
//-------------------------------------------------------------------------------------------------------
void CAcquisitionDemoDlg::OnbtStartContinously() 
{

	ULONG	error;
	ULONG	AcqMode= 0x800, StartMode=1;
	ULONG	Conditions[]={0,0,0,0,0,0,0,0};
	ULONG	NumberRead;
	ULONG	ScansBacklog;
	ULONG	Status, Status_NumberOfScansAcquired, Status_NumberOfScansRead, Status_BufferSize;

    // Check Mode
    if(m_show.GetCurSel()<2)
    {
       	MessageBox("Select only a C-scan signal","Function not supplied",MB_OK);
        return;
    }

    // Enable/Disable buttons
    m_Board.Enabled=false;
	m_StartN.EnableWindow(false);
    m_StartContinously.EnableWindow(false);
    m_StopAndClear.EnableWindow(true);	

	Board = m_Board.Value - 1;
	Channel = m_Channel.Value - 1;
	BufferSize = m_BufferSize.Value;
	Fluidity = m_Fluidity.Value;
	NumberOfScansToAcquire = m_NumberOfScansToAcquire.Value;
	TimeOut = m_TimeOut.Value;

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
	m_Fluidity.Value = Fluidity;

	if(error)
    {
		OnStopAndClear();
    	sprintf(ErrorMessage,"PCXUS_ACQ_CONFIG error : %08x", error);
    	MessageBox(ErrorMessage,"Error",MB_OK);
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
		OnStopAndClear();
    	MessageBox("Memory allocation failed","Error",MB_OK);
        return;
    }

	// Clear C-scan graph
	m_Graph.ClearData();

	// Update graph scales
	m_Graph.Axes.Item("X").AutoScale=false;
	m_Graph.Axes.Item("X").Minimum=0;
	m_Graph.Axes.Item("X").Maximum=1000;

   	switch(m_show.GetCurSel())
    {
    case 2: // Amplitude Gate 1
    case 3: // Amplitude Gate 2
		m_Graph.Axes.Item("Y").AutoScale=false;
		m_Graph.Axes.Item("Y").Minimum=0;
		m_Graph.Axes.Item("Y").Maximum=100.0;
        break;
    case 4: // TOF Gate 1
    case 5: // TOF Gate 2
    case 6: // TOF Gate IF
		m_Graph.Axes.Item("Y").AutoScale=true;
		//m_Graph.Axes.Item("Y").AutoScale=false;
		m_Graph.Axes.Item("Y").Minimum=0;
        break;
    case 7: // Counter 1
    case 8: // Counter 2
		m_Graph.Axes.Item("Y").AutoScale=true;
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
		m_Graph.Axes.Item("Y").AutoScale=false;
		m_Graph.Axes.Item("Y").Minimum=0;
		m_Graph.Axes.Item("Y").Maximum=1.5;
        break;
    case 19:
		m_Graph.Axes.Item("Y").AutoScale=false;
		m_Graph.Axes.Item("Y").Minimum=0;
		m_Graph.Axes.Item("Y").Maximum=256;
        break;
    }

	// Start acquisition
    error = PCXUS_ACQ_START(
    			hPCXUS,
                Board,
                -1);
	if(error)
    {
		OnStopAndClear();
    	sprintf(ErrorMessage,"PCXUS_ACQ_START error : %08x", error);
    	MessageBox(ErrorMessage,"Error",MB_OK);
        return;
    }
	
	// Set timer to read C-scan each 100 ms
	SetTimer(1, 100, NULL);

}
//-------------------------------------------------------------------------------------------------------
void CAcquisitionDemoDlg::OnTimer(UINT nIDEvent) 
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
                &ScansBacklog, pData);
	if(error)
    {
		OnStopAndClear();
    	sprintf(ErrorMessage,"PCXUS_ACQ_READ error : %08x", error);
    	MessageBox(ErrorMessage,"Error",MB_OK);
        return;
    }

    if(NumberRead <= 0)
    {
    	return;
    }

    // Memory allocate for your signal
	pCscan = (double *) malloc(NumberRead*sizeof(double));
   	if(pCscan == NULL)
    {
		OnStopAndClear();
   		MessageBox("Memory allocation failed","Error",MB_OK);
        return;
    }
    // Extract data into Cscan data stream
	NumberOfData = acq_sort_data( m_show.GetCurSel(), pData, Channel, NumberRead, BlockSize, 0, 0, pCscan, NULL);

    if(NumberOfData > 0)
   	    // Update display
	    m_Graph.ChartY(CNiReal64Vector(NumberOfData, pCscan));	

	CDialog::OnTimer(nIDEvent);
}
//-------------------------------------------------------------------------------------------------------
void CAcquisitionDemoDlg::OnbtHelp() 
{
    STARTUPINFO si;
    PROCESS_INFORMATION pi;

    ZeroMemory( &si, sizeof(si) );
    si.cb = sizeof(si);
    ZeroMemory( &pi, sizeof(pi) );

    CreateProcess( NULL, 
        "explorer c:\\uspc\\SDK for USPC\\Help\\SDK USPC.htm", 
        NULL,             
        NULL,             
        FALSE,            
        0,                
        NULL,             
        NULL,             
        &si,              
        &pi );            

    CloseHandle( pi.hProcess );
    CloseHandle( pi.hThread );
}
//-------------------------------------------------------------------------------------------------------
void CAcquisitionDemoDlg::OnStopAndClear() 
{
	// Stop read loop (continous mode)
    KillTimer(1);

    // Stop and clear acquisition
    PCXUS_ACQ_STOP(hPCXUS, Board);
    PCXUS_ACQ_CLEAR(hPCXUS, Board);

	// Free memories
    if(pData != NULL)free(pData);
    if(pCscan != NULL)free(pCscan);

    // Enable/Disable buttons
    m_Board.Enabled=true;
	m_StartN.EnableWindow(true);
    m_StartContinously.EnableWindow(true);
    m_StopAndClear.EnableWindow(false);	
}
//-------------------------------------------------------------------------------------------------------
void CAcquisitionDemoDlg::OnOK() 
{
	// Do not close Dialog box OnOK	
	//CDialog::OnOK();
}
