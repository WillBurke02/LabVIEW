object Acquisition_Demo: TAcquisition_Demo
  Left = 245
  Top = 235
  BorderStyle = bsSingle
  Caption = 'Acquisition Demo'
  ClientHeight = 368
  ClientWidth = 727
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = OnClose
  OnCreate = OnCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 28
    Height = 13
    Caption = 'Board'
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 39
    Height = 13
    Caption = 'Channel'
  end
  object Label3: TLabel
    Left = 8
    Top = 64
    Width = 68
    Height = 13
    Caption = 'DLL RAM size'
  end
  object Label4: TLabel
    Left = 8
    Top = 88
    Width = 80
    Height = 13
    Caption = 'Number of scans'
  end
  object Label5: TLabel
    Left = 8
    Top = 112
    Width = 43
    Height = 13
    Caption = 'Time Out'
  end
  object Label6: TLabel
    Left = 12
    Top = 180
    Width = 33
    Height = 13
    Caption = 'Show :'
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
    Top = 348
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
  object EditBoard: TEdit
    Left = 92
    Top = 12
    Width = 25
    Height = 21
    TabOrder = 0
    Text = '0'
    OnChange = BoardOnChange
  end
  object EditChannel: TEdit
    Left = 92
    Top = 36
    Width = 25
    Height = 21
    TabOrder = 1
    Text = '0'
    OnChange = ChannelOnChange
  end
  object EditBufferSize: TEdit
    Left = 92
    Top = 60
    Width = 41
    Height = 21
    TabOrder = 2
    Text = '0'
    OnChange = BufferSizeOnChange
  end
  object EditNbScans: TEdit
    Left = 92
    Top = 84
    Width = 41
    Height = 21
    TabOrder = 3
    Text = '0'
    OnChange = NBScansOnChange
  end
  object EditTimeOut: TEdit
    Left = 92
    Top = 108
    Width = 41
    Height = 21
    TabOrder = 4
    Text = '0'
    OnChange = TimeOutOnChange
  end
  object Cscan: TChart
    Left = 144
    Top = 8
    Width = 573
    Height = 329
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
    BottomAxis.Automatic = False
    BottomAxis.AutomaticMaximum = False
    BottomAxis.AutomaticMinimum = False
    BottomAxis.Maximum = 25
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMaximum = False
    LeftAxis.AutomaticMinimum = False
    LeftAxis.Maximum = 100
    Legend.Visible = False
    View3D = False
    TabOrder = 5
    object Series1: TFastLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
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
  object BtStartN: TButton
    Left = 12
    Top = 224
    Width = 117
    Height = 33
    Caption = 'Start N acq. '
    TabOrder = 6
    OnClick = BtStartNClick
  end
  object BtStop: TButton
    Left = 12
    Top = 296
    Width = 117
    Height = 33
    Caption = 'Stop Acq'
    TabOrder = 7
    OnClick = BtStopClick
  end
  object BtStartContinously: TButton
    Left = 12
    Top = 260
    Width = 117
    Height = 33
    Caption = 'Start acq. continously'
    TabOrder = 8
    OnClick = BtStartContinouslyClick
  end
  object cbShow: TComboBox
    Left = 12
    Top = 196
    Width = 117
    Height = 21
    ItemHeight = 13
    TabOrder = 9
    Text = 'Amp. Gate 1'
    Items.Strings = (
      'A-scan'
      'A-scan HR'
      'Amp. Gate 1'
      'Amp. Gate 2'
      'TOF Gate 1'
      'TOF Gate 2'
      'TOF Gate IF'
      'Pulse counter'
      'Scan counter'
      'Alarm amp. 1'
      'Min. alarm TOF 1'
      'Max. alarm TOF 1'
      'Coupling alarm 1'
      'Alarm amp. 2'
      'Min. alarm TOF 2'
      'Max. alarm TOF 2'
      'Coupling alarm 2'
      'Alarm amp. IF'
      'ENABLE (IN1)'
      'Any byte')
  end
  object EditFluidity: TEdit
    Left = 92
    Top = 132
    Width = 41
    Height = 21
    TabOrder = 10
    Text = '0'
    OnChange = FluidityOnChange
  end
  object ReadTimer: TTimer
    Enabled = False
    Interval = 100
    OnTimer = ReadTimerTimer
    Left = 92
    Top = 164
  end
end
