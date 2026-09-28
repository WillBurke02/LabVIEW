VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Object = "{2BEA765B-8C94-4D2C-BCAB-EC7B45BFB11D}#1.0#0"; "ActiveXUspc.ocx"
Begin VB.Form ActiveXDemo 
   Caption         =   "ActiveX Demo"
   ClientHeight    =   4470
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8985
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   ScaleHeight     =   4470
   ScaleWidth      =   8985
   StartUpPosition =   3  'Windows Default
   Begin ActiveXUspc.Xuspc Xuspc1 
      Height          =   3495
      Left            =   120
      TabIndex        =   8
      Top             =   120
      Width           =   6135
      _ExtentX        =   10821
      _ExtentY        =   6165
      AscanNumber     =   1
      Cols            =   1
      Rows            =   1
      AscanFrameStyle =   0
      AscanFrameVisible=   -1  'True
      AscanFrameColor =   12632256
      AscanBackColor  =   0
      AscanGridVisible=   -1  'True
      AscanGridColor  =   4210752
      AscanFrameColor =   12632256
      AscanTicksLabelsColor=   -2147483640
      AscanCaptionVisible=   0   'False
      AscanCaptionColor=   -2147483640
      BorderStyle     =   0
      BackColor       =   12632256
      BackStyle       =   0
      AscanColor      =   65280
      gateIFColor     =   65535
      gate1Color      =   255
      gate2Color      =   16711680
      AscanAutoSize   =   -1  'True
      TimeOutServer   =   10000
   End
   Begin VB.TextBox Gain 
      Height          =   285
      Left            =   4440
      TabIndex        =   6
      Text            =   "0"
      Top             =   3960
      Width           =   975
   End
   Begin VB.CommandButton btDACVisible 
      Caption         =   "DAC visible OFF"
      Height          =   495
      Left            =   1920
      TabIndex        =   5
      Top             =   3720
      Width           =   1695
   End
   Begin VB.CommandButton btAutoRedraw 
      Caption         =   "Auto Redraw OFF"
      Height          =   495
      Left            =   120
      TabIndex        =   4
      Top             =   3720
      Width           =   1695
   End
   Begin VB.ComboBox Unit 
      Height          =   315
      Left            =   6360
      TabIndex        =   3
      Text            =   "Combo1"
      Top             =   3240
      Width           =   1215
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   7920
      Top             =   3240
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton BtClose 
      Caption         =   "Close"
      Height          =   495
      Left            =   6360
      TabIndex        =   2
      Top             =   1680
      Width           =   2415
   End
   Begin VB.CommandButton BtLoad 
      Caption         =   "Load"
      Height          =   495
      Left            =   6360
      TabIndex        =   1
      Top             =   960
      Width           =   2415
   End
   Begin VB.CommandButton BtOpen 
      Caption         =   "Open"
      Height          =   495
      Left            =   6360
      TabIndex        =   0
      Top             =   240
      Width           =   2415
   End
   Begin VB.Label Label2 
      Caption         =   "Gain (dB)"
      Height          =   255
      Left            =   5520
      TabIndex        =   7
      Top             =   3960
      Width           =   855
   End
End
Attribute VB_Name = "ActiveXDemo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'---------------------------------------------------------------------------------------------
'   USPC ActiveX demo application
'   Socomate International
'
'   This program performs various basic functions to demonstrate how a "real" app would use
'   the USPC ActiveX component to interact with USPC boards (local or network).
'
'   NB: If you want to control USPC board by a network, don't forget to run USPC-Server program
'   on computer and enter computer name into Server name control.
'
'   Revision history
'       18 Jan 2002 - Created by Alain ZINS
'---------------------------------------------------------------------------------------------
Const Server = ""
Private OldGain As Double

Private Sub Form_Load()
    ' Disable buttons while Open is not made.
    BtLoad.Enabled = False
    BtClose.Enabled = False
    'Do not refresh Ascan
    CWbtAutoRedraw = False
    ' Build Unit list
    Unit.AddItem "µs"
    Unit.AddItem "mm"
    Unit.AddItem "inch"
    ' Select µs
    Unit.ListIndex = 0
End Sub

Private Sub Form_Unload(Cancel As Integer)
    'Close
    BtClose_Click
End Sub

' Change AutoRedraw property of Ascan
Private Sub btAutoRedraw_Click()
    Xuspc1.AutoRedraw = Not Xuspc1.AutoRedraw
    If Xuspc1.AutoRedraw Then
        btAutoRedraw.Caption = "Auto redraw ON"
    Else
        btAutoRedraw.Caption = "Auto redraw OFF"
    End If
End Sub

' Change DACVisible property
Private Sub btDACVisible_Click()
    Xuspc1.DACVisible = Not Xuspc1.DACVisible
    If Xuspc1.DACVisible Then
        btDACVisible.Caption = "DAC visible ON"
    Else
        btDACVisible.Caption = "DAC visible OFF"
    End If
End Sub

' Change Unit property of Ascan
Private Sub Unit_Click()
    Xuspc1.Unit = Unit.ListIndex
End Sub

' Change Gain
' Call USPC Write method
Private Sub Gain_KeyDown(KeyCode As Integer, Shift As Integer)
    Dim T1() As Double, T2() As Double
    Dim dblValue As Double
    Dim strValue As String
    Dim clip As Long
    
    ReDim T1(100)
    ReDim T2(100)
    
    dblValue = OldGain
    
    If KeyCode = vbKeyReturn Then
        Gain.Text = Format(Gain.Text, "##0.0")
        If Not IsNumeric(Gain.Text) Then
            Gain.Text = OldGain
        Else
            dblValue = CDbl(Gain.Text)
        End If
    End If
    
    If KeyCode = vbKeyUp Then
        dblValue = OldGain + 1
        Gain.Text = Format(OldGain, "##0.0")
    End If
    
    If KeyCode = vbKeyDown Then
        dblValue = OldGain - 1
        Gain.Text = Format(OldGain, "##0.0")
    End If
    
    If dblValue <> OldGain Then
        strValue = Server
        ErrorUSPC = Xuspc1.USPC_Write(Server, 0, 0, 0, "receiver_gain", dblValue, T1, T2, strValue, clip)
        If (ErrorUSPC <> 0) Then MsgBox "Gain error - " + Str(ErrorUSPC)
        If clip <> 0 Then
            MsgBox "Out of range"
        End If
        OldGain = dblValue
    End If
End Sub

' Load UT file
'   Call USPC Load method
'   Call USPC Read method
Private Sub BtLoad_Click()
    ' Change cursor (because load function is a long task)
    ActiveXDemo.MousePointer = vbHourglass
    
    'Trap error
    On Error GoTo error
    
    'Select an UT file
    With CommonDialog1
        .InitDir = "c:\uspc\ut_files"
        .Filter = "us (*.us)|*.us"
        .ShowOpen
    End With
    
    'Open UT file
    ErrorUSPC = Xuspc1.USPC_Load(Server, -1, -1, CommonDialog1.FileName)
    If (ErrorUSPC <> 0) Then
        MsgBox "Load error - " + Str(ErrorUSPC)
        GoTo error
    End If
    
    'Read Gain
    Dim T1() As Double, T2() As Double
    Dim dblValue As Double
    Dim strValue As String
    
    ErrorUSPC = Xuspc1.USPC_Read(Server, 0, 0, 0, "receiver_gain", dblValue, T1, T2, strValue)
    If (ErrorUSPC <> 0) Then
        MsgBox "Read Gain error - " + Str(ErrorUSPC)
        GoTo error
    End If
    
    OldGain = dblValue
    Gain.Text = OldGain
    
error:
    ' Set default cursor
    ActiveXDemo.MousePointer = vbDefault
End Sub

' Open USPC
'   Call USPC Open method
'   Call USPC AscanSource method
Private Sub BtOpen_Click()
    ' Change cursor (because open function is a long task)
    ActiveXDemo.MousePointer = vbHourglass
    
    ' Do not reboot if another application has booted yet (Boot type = 2)
    ErrorUSPC = Xuspc1.USPC_Open(Server, 2)
    If (ErrorUSPC <> 0) Then
        MsgBox "Open error - " + Str(ErrorUSPC)
        ' Set default cursor
        ActiveXDemo.MousePointer = vbDefault
        Exit Sub
    End If
    ' Set the first Ascan with Board and channel 0 (Remark: the first is 0 and not 1)
    Xuspc1.AscanSource 0, 0, 0, Server
    ' Update button enable stats
    BtOpen.Enabled = False
    BtLoad.Enabled = True
    BtClose.Enabled = True
    ' Set default cursor
    ActiveXDemo.MousePointer = vbDefault
End Sub

' Close USPC
'   Call USPC Close method
'   Set USPC AutoRedraw propertry
Private Sub BtClose_Click()
    ' Stop refresh
    Xuspc1.AutoRedraw = False
    ' Close USPC
    Xuspc1.USPC_Close Server
    ' Update button enable stats
    BtOpen.Enabled = True
    BtLoad.Enabled = False
    BtClose.Enabled = False
    btAutoRedraw.Caption = "Auto redraw OFF"
End Sub
