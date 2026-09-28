object Acq_Demo: TAcq_Demo
  Left = 292
  Top = 220
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Acquisition Demo'
  ClientHeight = 349
  ClientWidth = 733
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 160
    Width = 30
    Height = 13
    Caption = 'Show:'
  end
  object Label2: TLabel
    Left = 8
    Top = 16
    Width = 28
    Height = 13
    Caption = 'Board'
  end
  object Label3: TLabel
    Left = 8
    Top = 40
    Width = 39
    Height = 13
    Caption = 'Channel'
  end
  object Label4: TLabel
    Left = 8
    Top = 64
    Width = 68
    Height = 13
    Caption = 'DLL RAM size'
  end
  object Label5: TLabel
    Left = 8
    Top = 88
    Width = 80
    Height = 13
    Caption = 'Number of scans'
  end
  object Label6: TLabel
    Left = 8
    Top = 112
    Width = 63
    Height = 13
    Caption = 'Time out (ms)'
  end
  object Label7: TLabel
    Left = 8
    Top = 136
    Width = 71
    Height = 13
    Caption = 'Transfer fluidity'
  end
  object lbHelp: TLabel
    Left = 392
    Top = 328
    Width = 116
    Height = 13
    Caption = 'Help: SDK for USPC'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    OnClick = lbHelpClick
  end
  object Cscan: TChart
    Left = 160
    Top = 8
    Width = 561
    Height = 313
    BackWall.Brush.Color = clWhite
    BackWall.Color = clGradientActiveCaption
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clBlue
    Title.Font.Height = -13
    Title.Font.Name = 'Arial'
    Title.Font.Style = [fsBold]
    Title.Text.Strings = (
      'C-scans')
    BackColor = clGradientActiveCaption
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMaximum = False
    LeftAxis.AutomaticMinimum = False
    LeftAxis.Maximum = 100
    Legend.Visible = False
    View3D = False
    TabOrder = 0
    object Series1: TFastLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      ShowInLegend = False
      LinePen.Color = clRed
      XValues.DateTime = False
      XValues.Name = 'X '
      XValues.Multiplier = 1
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y '
      YValues.Multiplier = 1
      YValues.Order = loNone
    end
  end
  object EditBoard: TEdit
    Left = 120
    Top = 16
    Width = 25
    Height = 21
    TabOrder = 1
    Text = 'EditBoard'
    OnChange = BoardOnChange
  end
  object EditChannel: TEdit
    Left = 120
    Top = 40
    Width = 25
    Height = 21
    TabOrder = 2
    Text = 'EditChannel'
    OnChange = ChannelOnChange
  end
  object EditBufferSize: TEdit
    Left = 96
    Top = 64
    Width = 49
    Height = 21
    TabOrder = 3
    Text = 'EditBufferSize'
    OnChange = BufferSizeOnChange
  end
  object EditNbScans: TEdit
    Left = 96
    Top = 88
    Width = 49
    Height = 21
    TabOrder = 4
    Text = 'EditNbScans'
    OnChange = NbScansOnChange
  end
  object EditTimeOut: TEdit
    Left = 96
    Top = 112
    Width = 49
    Height = 21
    TabOrder = 5
    Text = 'EditTimeOut'
    OnChange = TimeoutOnChange
  end
  object EditFluidity: TEdit
    Left = 96
    Top = 136
    Width = 49
    Height = 21
    TabOrder = 6
    Text = 'EditFluidity'
    OnChange = FluidityOnChange
  end
  object cbShow: TComboBox
    Left = 8
    Top = 176
    Width = 113
    Height = 21
    ItemHeight = 13
    TabOrder = 7
    Text = 'cbShow'
    Items.Strings = (
      'A-scan'
      'A-scan HR'
      'Amplitude Gate 1'
      'Amplitude Gate 2'
      'TOF Gate 1'
      'TOF Gate 2'
      'TOF Gate IF'
      'Pulse counter'
      'Scan counter'
      'Alarm amp. 1'
      'Min. alarm TOF 1'
      'Max. alarm TOF 1'
      'Coupling alarm gate 1'
      'Alarm amp. 2'
      'Min. alarm TOF 2'
      'Max. alarm TOF 2'
      'Coupling alarm gate 2'
      'Alarm amp. IF'
      'ENABLE (IN 1)'
      'Specific byte')
  end
  object btStartContinously: TButton
    Left = 8
    Top = 248
    Width = 137
    Height = 33
    Caption = 'Start acq. continously'
    TabOrder = 8
    OnClick = btStartContinouslyClick
  end
  object btStartN: TButton
    Left = 8
    Top = 208
    Width = 137
    Height = 33
    Caption = 'Start acq. N scans'
    TabOrder = 9
    OnClick = btStartNClick
  end
  object btStop: TButton
    Left = 8
    Top = 288
    Width = 137
    Height = 33
    Caption = 'Stop acq.'
    TabOrder = 10
    OnClick = btStopClick
  end
  object ReadTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = ReadTimerTimer
    Left = 128
    Top = 176
  end
end
