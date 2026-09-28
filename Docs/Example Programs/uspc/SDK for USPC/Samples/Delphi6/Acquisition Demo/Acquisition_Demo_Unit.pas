// -------------------------------------------------------------------------------------------
// Acquisition demo
//
// Description:
// This program shows how to use acquisition function of USPC DLL.
// This program only acquires C-scan data (not A-scan) and start acquisition on software
// command.
//
// Revision:
// 24 Febuary 2003 First version created by Alain Zins
// 26 September 2006 Add test before update graph ( if Number of data > 0)
// -------------------------------------------------------------------------------------------
unit Acquisition_Demo_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TeEngine, Series, ExtCtrls, TeeProcs, Chart, math, ShellAPI,
  Acquisition_sort_data, Acquisition_global, DLL_pcxus;

type
  TAcq_Demo = class(TForm)
    Cscan: TChart;
    EditBoard: TEdit;
    EditChannel: TEdit;
    EditBufferSize: TEdit;
    EditNbScans: TEdit;
    EditTimeOut: TEdit;
    EditFluidity: TEdit;
    cbShow: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    btStartContinously: TButton;
    btStartN: TButton;
    btStop: TButton;
    Series1: TFastLineSeries;
    ReadTimer: TTimer;
    lbHelp: TLabel;
    procedure BoardOnChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ChannelOnChange(Sender: TObject);
    procedure BufferSizeOnChange(Sender: TObject);
    procedure NbScansOnChange(Sender: TObject);
    procedure TimeoutOnChange(Sender: TObject);
    procedure FluidityOnChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btStartNClick(Sender: TObject);
    procedure btStartContinouslyClick(Sender: TObject);
    procedure btStopClick(Sender: TObject);
    procedure ReadTimerTimer(Sender: TObject);
    procedure lbHelpClick(Sender: TObject);
  private
	procedure StopAndClear();
  public
  end;

var
  	Acq_Demo: TAcq_Demo;

implementation

{$R *.dfm}
//---------------------------------------------------------------------------------------------
procedure TAcq_Demo.FormCreate(Sender: TObject);
var
	error : Longword;
begin
	error:=PCXUS_Open(hPCXUS,2);
  	if(error<>0)then
    begin
    	ShowMessage('Open error : ' + IntToHex(error,8) );
        Exit;
    end;
    // Display default values
	EditBoard.Text:=IntToStr(Board+1);
	EditChannel.Text:=IntToStr(Channel+1);
	EditBufferSize.Text:=IntToStr(BufferSize);
	EditNbScans.Text:=IntToStr(NumberOfScansToAcquire);
	EditTimeout.Text:=IntToStr(Timeout);
	EditFluidity.Text:=IntToStr(Fluidity);
    cbShow.ItemIndex:=2;
	btStop.Enabled:=false;
end;
//---------------------------------------------------------------------------------------------
procedure TAcq_Demo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	// Close USPC
	PCXUS_Close(hPCXUS);
end;
//---------------------------------------------------------------------------------------------
procedure TAcq_Demo.BoardOnChange(Sender: TObject);
var
	localBoard : integer;
begin
    try
    	localBoard := StrToInt(EditBoard.Text);
    except
    	localBoard := Board+1;
    end;
    if(localBoard < 1)then localBoard:=1;
    if(localBoard > 10)then localBoard:=10;
    Board:=localBoard-1;
    EditBoard.Text:=IntToStr(Board+1);
end;
//---------------------------------------------------------------------------------------------
procedure TAcq_Demo.ChannelOnChange(Sender: TObject);
var
	localChannel : integer;
begin

    try
    	localChannel := StrToInt(EditChannel.Text);
    except
    	localChannel := Channel+1;
    end;
    if(localChannel < 1)then localChannel:=1;
    if(localChannel > 8)then localChannel:=8;
    Channel:=localChannel-1;
    EditChannel.Text:=IntToStr(Channel+1);
end;
//---------------------------------------------------------------------------------------------
procedure TAcq_Demo.BufferSizeOnChange(Sender: TObject);
var
	localBufferSize : longword;
begin

    try
    	localBufferSize := StrToInt(EditBufferSize.Text);
    except
    	localBufferSize := BufferSize;
    end;
    if(localBufferSize < 0)then localBufferSize:=0;
	BufferSize:=localBufferSize;
    EditBufferSize.Text:=IntToStr(BufferSize);
end;
//---------------------------------------------------------------------------------------------
procedure TAcq_Demo.NbScansOnChange(Sender: TObject);
var
	localNbScans : integer;
begin

    try
    	localNbScans := StrToInt(EditNbScans.Text);
    except
    	localNbScans := NumberOfScansToAcquire;
    end;
    if(localNbScans < -1)then localNbScans:=-1;
    NumberOfScansToAcquire:=localNbScans;
    EditNbScans.Text:=IntToStr(NumberOfScansToAcquire);
end;
//---------------------------------------------------------------------------------------------
procedure TAcq_Demo.TimeoutOnChange(Sender: TObject);
var
	localTimeOut : integer;
begin

    try
    	localTimeOut := StrToInt(EditTimeOut.Text);
    except
    	localTimeOut := Timeout;
    end;
    if(localTimeOut < 0)then localTimeOut:=0;
    Timeout:=localTimeOut;
    EditTimeOut.Text:=IntToStr(Timeout);
end;
//---------------------------------------------------------------------------------------------
procedure TAcq_Demo.FluidityOnChange(Sender: TObject);
var
	localFluidity : integer;
begin

    try
    	localFluidity := StrToInt(EditFluidity.Text);
    except
    	localFluidity := Fluidity;
    end;
    if(localFluidity < 0)then localFluidity:=0;
    Fluidity:=localFluidity;
    EditFluidity.Text:=IntToStr(Fluidity);
end;
//---------------------------------------------------------------------------------------------
procedure TAcq_Demo.btStartNClick(Sender: TObject);
Const
AcqMode : Longword = $800;
StartMode : Longword = 1;
Conditions : TCondition =(0,0,0,0,0,0,0,0);
var
error : Longword;
NumberRead : Longword;
ScansBacklog : Longword;
pData : array of Byte;
pCscan : Array1D;
pAscan : Array2D;
Status, Status_NumberOfScansAcquired, Status_NumberOfScansRead, Status_BufferSize, Param : Longword;
NumberOfData : integer;
begin
	// Check signal selected
    if cbShow.ItemIndex < 2 then
    begin
    	ShowMessage('Select only a C-scan signal');
    	Exit;
    end;

    // Enable & Disable buttons
	btStop.Enabled:=true;
    btStartN.Enabled:=false;
    btStartContinously.Enabled:=false;

    // Setup acquisition
    error:=PCXUS_ACQ_CONFIG(
    		hPCXUS,
            Board,
            AcqMode,
            StartMode,
            Conditions,
            0,
            0,
            BufferSize,
            Fluidity,
            Param);

	// Update Fluidity
    EditFluidity.Text:=IntToStr(Fluidity);

    if error<>0 then
    begin
    	ShowMessage('Config error : '+IntToHex(error,8));
        StopAndClear;
        Exit;
    end;

    // Memory allocation
    PCXUS_ACQ_GET_STATUS(
    		Board,
            Status,
            Status_NumberOfScansAcquired,
            Status_NumberOfScansRead,
            Status_BufferSize,		// Get size of buffer ( normaly equal to BufferSize)
            BlockSize);				// Get size of one scan

    try
	    SetLength(pData,Status_BufferSize*BlockSize*sizeof(Longword));
    except
    	ShowMessage('Memory allocation failed');
        StopAndClear;
        Exit;
    end;

    // Start acquisition
    error:=PCXUS_ACQ_START(
    		hPCXUS,
            Board,
            NumberOfScansToAcquire);

    if error<>0 then
    begin
    	ShowMessage('Start error : '+IntToHex(error,8));
		StopAndClear;
        Exit;
    end;

    // Read acquisition
    error:=PCXUS_ACQ_READ(
    		hPCXUS,
            Board,
            NumberOfScansToAcquire,
            Timeout,
            NumberRead,
            ScansBacklog,
            pData);

    if error<>0 then
    begin
    	ShowMessage('Read error : '+IntToHex(error,8));
		StopAndClear;
        Exit;
    end;

	// Update display
    if NumberRead <= 0 then
    begin
    	StopAndClear;
        Exit;
    end;

    // Memory allocation for your signal
    try
	    SetLength(pCscan,NumberRead);
    except
    	ShowMessage('Memory allocation failed');
		StopAndClear;
        Exit;
    end;

    // Extract the signal into C-scan data stream
	NumberOfData := acq_sort_data(
    		cbShow.ItemIndex,
    		pData,
            Channel,
            NumberRead,
            BlockSize,
            0, 0,
            pCscan, pAscan);

	// Clear previous C-scan graph
    Series1.Clear;

    if NumberOfData > 0 then
    begin
        // Update scales
        Cscan.BottomAxis.Automatic:=false;
        Cscan.BottomAxis.Minimum:=0;
        Cscan.BottomAxis.Maximum:=NumberOfData-1;
        Series1.AddArray(pCscan);

        case cbShow.ItemIndex of
        2..3:
        	begin
	        	Cscan.LeftAxis.AutomaticMaximum:=false;
                Cscan.LeftAxis.Maximum:=100;
            end;
        4..6:
    	    begin
	    	    Cscan.LeftAxis.AutomaticMaximum:=true;
                Cscan.Update;
	        	Cscan.LeftAxis.AutomaticMaximum:=false;
                Cscan.LeftAxis.Maximum:=Cscan.LeftAxis.Maximum+1;
            end;
        7..8:
    	    Cscan.LeftAxis.AutomaticMaximum:=true;
        9..18:
        	begin
            	Cscan.LeftAxis.AutomaticMaximum:=false;
        	    Cscan.LeftAxis.Maximum:=1.5;
            end;
        19:
    	    begin
        	    Cscan.LeftAxis.AutomaticMaximum:=false;
            	Cscan.LeftAxis.Maximum:=256;
            end;
        end;
    end;
    // Stop and clear acquisition
    StopAndClear;
end;
//--------------------------------------------------------------------------------------------
procedure TAcq_Demo.btStartContinouslyClick(Sender: TObject);
Const
AcqMode : Longword = $800;
StartMode : Longword = 1;
Conditions : TCondition =(0,0,0,0,0,0,0,0);
var
error : Longword;
NumberRead : Longword;
ScansBacklog : Longword;
Status, Status_NumberOfScansAcquired, Status_NumberOfScansRead, Status_BufferSize, Param : Longword;
begin
	// Check signal selected
    if cbShow.ItemIndex < 2 then
    begin
    	ShowMessage('Select only a C-scan signal');
    	Exit;
    end;

    // Enable & Disable buttons
	btStop.Enabled:=true;
    btStartN.Enabled:=false;
    btStartContinously.Enabled:=false;

    // Setup acquisition
    error:=PCXUS_ACQ_CONFIG(
    		hPCXUS,
            Board,
            AcqMode,
            StartMode,
            Conditions,
            0,
            0,
            BufferSize,
            Fluidity,
            Param);

	// Update Fluidity
    EditFluidity.Text:=IntToStr(Fluidity);

    if error<>0 then
    begin
    	ShowMessage('Config error : '+IntToHex(error,8));
        StopAndClear;
        Exit;
    end;

    // Memory allocation
    PCXUS_ACQ_GET_STATUS(
    		Board,
            Status,
            Status_NumberOfScansAcquired,
            Status_NumberOfScansRead,
            Status_BufferSize,		// Get size of buffer ( normaly equal to BufferSize)
            BlockSize);				// Get size of one scan

    try
	    SetLength(pData,BufferSize*BlockSize*sizeof(Longword));
        SetLength(pCscan,BufferSize);
        SetLength(pAscan,0);
    except
    	ShowMessage('Memory allocation failed');
        StopAndClear;
        Exit;
    end;

    // Clear previous C-scan graph
    Series1.Clear;

    // Update scales
    Cscan.BottomAxis.Automatic:=false;
    Cscan.BottomAxis.AutomaticMaximum:=false;
    Cscan.BottomAxis.AutomaticMinimum:=false;
    Cscan.BottomAxis.Minimum:=0;
    Cscan.BottomAxis.Maximum:=1000;
    iPoints:=0;
	iPointsSerie:=0;

    case cbShow.ItemIndex of
    2..3:
    	begin
	    	Cscan.LeftAxis.AutomaticMaximum:=false;
            Cscan.LeftAxis.Maximum:=100;
        end;
    4..6:
    	begin
	    	Cscan.LeftAxis.AutomaticMaximum:=true;
        end;
    7..8:
    	Cscan.LeftAxis.AutomaticMaximum:=true;
    9..18:
    	begin
        	Cscan.LeftAxis.AutomaticMaximum:=false;
        	Cscan.LeftAxis.Maximum:=1.5;
        end;
    19:
    	begin
        	Cscan.LeftAxis.AutomaticMaximum:=false;
        	Cscan.LeftAxis.Maximum:=256;
        end;
    end;

    // Start acquisition
    error:=PCXUS_ACQ_START(
    		hPCXUS,
            Board,
            -1);
    if error<>0 then
    begin
    	StopAndClear;
    	ShowMessage('Start error : '+IntToHex(error,8));
        Exit;
    end;
    // Start Read
	ReadTimer.Enabled:=true;
end;
//--------------------------------------------------------------------------------------------
procedure TAcq_Demo.StopAndClear;
begin
	// Disable Timer (stop acquisition in continous mode)
	ReadTimer.Enabled:=false;
	// Stop and clear acquisition
    try
        PCXUS_ACQ_STOP(hPCXUS, Board);
		PCXUS_ACQ_CLEAR(hPCXUS, Board);
    except
        ShowMessage('Acquisition not configured');
    end;
    // Enable buttons
    btStartN.Enabled:=true;
    btStartContinously.Enabled:=true;
	btStop.Enabled:=false;
end;
//--------------------------------------------------------------------------------------------
procedure TAcq_Demo.btStopClick(Sender: TObject);
begin
	// Call stop function
	StopAndClear;
end;
//--------------------------------------------------------------------------------------------
// This procedure reads data each 100 ms
procedure TAcq_Demo.ReadTimerTimer(Sender: TObject);
var
error : Longword;
ScansBacklog : Longword;
localCscan : Array1D;
NumberOfData : integer;
begin
	// Read acquisition
    error:=PCXUS_ACQ_READ(
        		hPCXUS,
                Board,
                -1,
                0,
                NumberRead,
                ScansBacklog,
                pData);
    if error<>0 then
    begin
        StopAndClear;
    	ShowMessage('Acquisition error : '+IntToHex(error,8));
        Exit;
    end;

    if NumberRead > 0 then
    begin
       	// Update C-scan into data stream
        NumberOfData:=acq_sort_data(
        		Acq_Demo.cbShow.ItemIndex,
                pData,
                Channel,
                NumberRead,
                BlockSize,
                0, 0,
                pCscan,
                pAscan);
        // Update display
        if NumberOfData > 0 then
        begin
    		localCscan := pCscan;
	    	setlength(localCscan,NumberOfData);
		    Series1.AddArray(localCscan);
    	    iPoints:=iPoints+NumberOfData;
	        iPointsSerie:=iPointsSerie+NumberOfData;
    	    Cscan.BottomAxis.Maximum:=Max(iPoints-1,1000);
	        Cscan.BottomAxis.Minimum:=Max(iPoints-1,1000) - 1000;
        end;
    end;
end;
//--------------------------------------------------------------------------------------------
// Show Help
procedure TAcq_Demo.lbHelpClick(Sender: TObject);
begin
	ShellExecute(0,'open','c:\uspc\SDK for USPC\help\SDK USPC.htm',nil,nil,SW_SHOW);
end;

end.
