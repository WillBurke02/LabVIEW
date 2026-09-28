VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form DLL_Demo 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "DLL Demo"
   ClientHeight    =   2970
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   9675
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2970
   ScaleWidth      =   9675
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog SaveDialog 
      Left            =   1920
      Top             =   1320
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComDlg.CommonDialog LoadDialog 
      Left            =   1920
      Top             =   720
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      DefaultExt      =   ".us"
      Filter          =   "UT files (*.us)|*.us|"
      InitDir         =   "c:\uspc\ut_files"
   End
   Begin MSComctlLib.StatusBar StatusBar 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   5
      Top             =   2655
      Width           =   9675
      _ExtentX        =   17066
      _ExtentY        =   556
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   3
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Object.Width           =   2716
            MinWidth        =   2716
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   11695
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.Slider Gain 
      Height          =   495
      Left            =   3000
      TabIndex        =   4
      Top             =   960
      Width           =   6015
      _ExtentX        =   10610
      _ExtentY        =   873
      _Version        =   393216
      Max             =   70
   End
   Begin VB.CommandButton Close 
      Caption         =   "Close"
      Height          =   495
      Left            =   120
      TabIndex        =   3
      Top             =   1920
      Width           =   1695
   End
   Begin VB.CommandButton Save 
      Caption         =   "Save"
      Height          =   495
      Left            =   120
      TabIndex        =   2
      Top             =   1320
      Width           =   1695
   End
   Begin VB.CommandButton Load 
      Caption         =   "Load"
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   720
      Width           =   1695
   End
   Begin VB.CommandButton Open 
      Caption         =   "Open"
      Height          =   495
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1695
   End
End
Attribute VB_Name = "DLL_Demo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'DLL_Demo program
'
'Created by: Alain ZINS 4 November 2002
'
'This program uses DLL_pcxus.DLL (see USPC_DLL_declarations.bas)
'
Dim error As Long
Dim hPCXUS As Long
Dim USPC_opened As Boolean
Dim LineSize As Long


Private Sub Command1_Click()
    Timer1.Enabled = Not Timer1.Enabled
End Sub

Private Sub btstart_Click()
    ' Set acquisition configuration
    Dim Fluidity As Long
    Dim Conditions(0 To 7) As Long

    Fluidity = 150
    error = PCXUS_ACQ_CONFIG(hPCXUS, 0, &H800, 1, Conditions(0), 0, 0, 4000, Fluidity, Param)
    ' Start configuration
    If error = 0 Then
        PCXUS_ACQ_START hPCXUS, 0, -1
        ' Start timer
        Timer1.Enabled = True
        Timer1.Interval = 100
    Else
        StatusBar.Panels.Item(2) = "Error = start"
    End If
End Sub

Private Sub btstop_Click()
    ' Stop timer
    Timer1.Enabled = False
    ' Stop acquisition
    PCXUS_ACQ_STOP hPCXUS, 0
    ' Clear Acquisition configuration
    PCXUS_ACQ_CLEAR hPCXUS, 0
End Sub

Private Sub Form_Load()
    USPC_opened = False
End Sub

Private Sub Open_Click()
    If Not USPC_opened Then
        'Open an access to USPC
        error = PCXUS_Open(hPCXUS, 2)
        If (error = 0) Then
            StatusBar.Panels.Item(1) = "USPC opened"
            StatusBar.Panels.Item(2) = "No error"
            StatusBar.Panels.Item(3) = ""
            USPC_opened = True
        Else
            StatusBar.Panels.Item(1) = "USPC not opened "
            StatusBar.Panels.Item(2) = "Error = 0x" + Hex(error)
            StatusBar.Panels.Item(3) = ""
        End If
    Else
        StatusBar.Panels.Item(2) = "Error = Uspc is already opened "
    End If
End Sub

Private Sub Load_Click()
    If USPC_opened Then
        On Error GoTo Jump
        'Select an UT file
        With LoadDialog
            .CancelError = True
            .InitDir = "c:\uspc\ut_files"
            .Filter = "UT files (*.us)|*.us"
            .ShowOpen
        End With
        'Load this file into all board(s) and all channel(s)
        error = PCXUS_Load(-1, -1, LoadDialog.FileName)
        If (error = 0) Then
            StatusBar.Panels.Item(2) = "No error"
            StatusBar.Panels.Item(3) = LoadDialog.FileName
        Else
            StatusBar.Panels.Item(2) = "Error = 0x" + Hex(error)
            StatusBar.Panels.Item(3) = ""
        End If
        Exit Sub
        
Jump:   'Cancel section

    Else
        StatusBar.Panels.Item(2) = "Error = USPC is not opened "
        StatusBar.Panels.Item(3) = ""
    End If
End Sub

Private Sub Save_Click()
    If USPC_opened Then
        On Error GoTo Jump
        'Select an UT file
        With SaveDialog
            .CancelError = True
            .InitDir = "c:\uspc\ut_files"
            .Filter = "UT files (*.us)|*.us"
            .ShowSave
        End With
        'Save the parameters of all board(s) and all channel(s) into this file
        error = PCXUS_Save(-1, -1, SaveDialog.FileName)
        If (error = 0) Then
            StatusBar.Panels.Item(2) = "No error"
            StatusBar.Panels.Item(3) = SaveDialog.FileName
        Else
            StatusBar.Panels.Item(2) = "Error = 0x" + Hex(error)
            StatusBar.Panels.Item(3) = ""
        End If
        Exit Sub
Jump:
    Else
        StatusBar.Panels.Item(2) = "Error = USPC is not opened "
        StatusBar.Panels.Item(3) = ""
    End If
End Sub

Private Sub Close_Click()
    If USPC_opened Then
        'Close the access to USPC board
        error = PCXUS_Close(hPCXUS)
        If (error = 0) Then
            StatusBar.Panels.Item(1) = "USPC closed"
            StatusBar.Panels.Item(2) = "No error"
            StatusBar.Panels.Item(3) = ""
            USPC_opened = False
        Else
            StatusBar.Panels.Item(1) = ""
            StatusBar.Panels.Item(2) = "Error = 0x" + Hex(error)
            StatusBar.Panels.Item(3) = ""
        End If
    Else
        StatusBar.Panels.Item(2) = "Error = Uspc is already closed "
    End If
End Sub

Private Sub Gain_Scroll()
    Dim dblGain As Double
    Dim T1(100) As Double
    Dim T2(100) As Double
    Dim strValue As String
    dblGain = Gain.Value
    strValue = ""
    If USPC_opened Then
        'Change the gain of channel 0 of board 0
        error = PCXUS_WRITE(hPCXUS, 0, 0, 0, "receiver_gain", Gain, T1(0), T2(0), strValue, clip)
        If (error = 0) Then
            StatusBar.Panels.Item(2) = "No error"
        Else
            StatusBar.Panels.Item(2) = "Error = 0x" + Hex(error)
        End If
    Else
        StatusBar.Panels.Item(2) = "Error = Uspc is not opened "
    End If
End Sub

