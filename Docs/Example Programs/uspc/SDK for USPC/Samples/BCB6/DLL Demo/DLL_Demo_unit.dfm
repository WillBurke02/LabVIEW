object DLL_Demo_Frorm: TDLL_Demo_Frorm
  Left = 350
  Top = 351
  Width = 717
  Height = 236
  Caption = 'DLL demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = OnClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 388
    Top = 72
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
  object Close: TButton
    Left = 16
    Top = 144
    Width = 105
    Height = 33
    Caption = 'Close'
    TabOrder = 1
    OnClick = CloseClick
  end
  object Load: TButton
    Left = 16
    Top = 58
    Width = 105
    Height = 33
    Caption = 'Load'
    TabOrder = 2
    OnClick = LoadClick
  end
  object Save: TButton
    Left = 16
    Top = 101
    Width = 105
    Height = 33
    Caption = 'Save'
    TabOrder = 3
    OnClick = SaveClick
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 185
    Width = 709
    Height = 17
    Panels = <
      item
        Width = 100
      end
      item
        Width = 150
      end
      item
        Width = 100
      end>
    SimplePanel = False
  end
  object GainBar: TTrackBar
    Left = 212
    Top = 88
    Width = 393
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
    OnChange = OnChange
  end
  object OpenDialog: TOpenDialog
    Filter = 'USPC files (*.us)|*.us'
    InitialDir = 'c:\uspc\ut_files'
    Left = 132
    Top = 108
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'us'
    Filter = 'USPC Files (*.us)|*.us'
    InitialDir = 'c:\uspc\ut_files'
    Left = 132
    Top = 64
  end
end
