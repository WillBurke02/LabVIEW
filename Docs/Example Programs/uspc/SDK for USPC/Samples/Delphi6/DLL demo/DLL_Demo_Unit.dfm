object Form1: TForm1
  Left = 382
  Top = 265
  Width = 555
  Height = 241
  Caption = 'DLL Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = OnCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 312
    Top = 64
    Width = 22
    Height = 13
    Caption = 'Gain'
  end
  object Open: TButton
    Left = 16
    Top = 16
    Width = 105
    Height = 33
    Caption = 'Open'
    TabOrder = 0
    OnClick = OpenClick
  end
  object Load: TButton
    Left = 16
    Top = 56
    Width = 105
    Height = 33
    Caption = 'Load'
    TabOrder = 1
    OnClick = LoadClick
  end
  object Save: TButton
    Left = 16
    Top = 96
    Width = 105
    Height = 33
    Caption = 'Save'
    TabOrder = 2
    OnClick = SaveClick
  end
  object Close: TButton
    Left = 16
    Top = 136
    Width = 105
    Height = 33
    Caption = 'Close'
    TabOrder = 3
    OnClick = CloseClick
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 194
    Width = 547
    Height = 20
    Panels = <
      item
        Width = 100
      end
      item
        Width = 150
      end
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object GainBar: TTrackBar
    Left = 152
    Top = 80
    Width = 353
    Height = 33
    Max = 70
    Orientation = trHorizontal
    Frequency = 1
    Position = 0
    SelEnd = 0
    SelStart = 0
    TabOrder = 5
    TickMarks = tmBottomRight
    TickStyle = tsAuto
    OnChange = GainBarChange
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'us'
    Filter = 'UT Files (*.us)|*.us'
    InitialDir = 'c:\uspc\ut_files'
    Left = 128
    Top = 64
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'us'
    Filter = 'UT Files (*.us)|*.us'
    InitialDir = 'c:\uspc\ut_files'
    Left = 128
    Top = 104
  end
end
