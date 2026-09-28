VERSION 5.00
Object = "{D940E4E4-6079-11CE-88CB-0020AF6845F6}#1.6#0"; "cwui.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form Form1 
   Caption         =   "Acquisition demo"
   ClientHeight    =   5595
   ClientLeft      =   165
   ClientTop       =   855
   ClientWidth     =   11295
   LinkTopic       =   "Form1"
   ScaleHeight     =   5595
   ScaleWidth      =   11295
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog LoadDialog 
      Left            =   3240
      Top             =   5160
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.ComboBox cbShow 
      Height          =   315
      ItemData        =   "Acquisition Demo.frx":0000
      Left            =   240
      List            =   "Acquisition Demo.frx":0040
      TabIndex        =   17
      Text            =   "Amplitude Gate 1"
      Top             =   3120
      Width           =   2055
   End
   Begin VB.Timer ReadTimer 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   2640
      Top             =   5280
   End
   Begin VB.CommandButton btStop 
      Caption         =   "Stop acq."
      Height          =   495
      Left            =   120
      TabIndex        =   15
      Top             =   4920
      Width           =   2295
   End
   Begin VB.CommandButton btStartContinously 
      Caption         =   "Start acq. continously"
      Height          =   495
      Left            =   120
      TabIndex        =   14
      Top             =   4320
      Width           =   2295
   End
   Begin VB.CommandButton btStartN 
      Caption         =   "Start N acq."
      Height          =   495
      Left            =   120
      TabIndex        =   13
      Top             =   3720
      Width           =   2295
   End
   Begin CWUIControlsLib.CWNumEdit CWBoard 
      Height          =   375
      Left            =   480
      TabIndex        =   1
      Top             =   120
      Width           =   615
      _Version        =   393218
      _ExtentX        =   1085
      _ExtentY        =   661
      _StockProps     =   4
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.74
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Reset_0         =   0   'False
      CompatibleVers_0=   393218
      NumEdit_0       =   1
      ClassName_1     =   "CCWNumEdit"
      opts_1          =   458814
      ButtonPosition_1=   1
      TextAlignment_1 =   2
      format_1        =   2
      ClassName_2     =   "CCWFormat"
      scale_1         =   3
      ClassName_3     =   "CCWScale"
      opts_3          =   65536
      dMax_3          =   10
      discInterval_3  =   1
      ValueVarType_1  =   5
      Value_Val_1     =   1
      IncValueVarType_1=   5
      IncValue_Val_1  =   1
      AccelIncVarType_1=   5
      AccelInc_Val_1  =   5
      RangeMinVarType_1=   5
      RangeMin_Val_1  =   1
      RangeMaxVarType_1=   5
      RangeMax_Val_1  =   10
      Bindings_1      =   4
      ClassName_4     =   "CCWBindingHolderArray"
      Editor_4        =   5
      ClassName_5     =   "CCWBindingHolderArrayEditor"
      Owner_5         =   1
   End
   Begin CWUIControlsLib.CWGraph CWGraph1 
      Height          =   5055
      Left            =   2520
      TabIndex        =   0
      Top             =   120
      Width           =   8655
      _Version        =   393218
      _ExtentX        =   15266
      _ExtentY        =   8916
      _StockProps     =   71
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Reset_0         =   0   'False
      CompatibleVers_0=   393218
      Graph_0         =   1
      ClassName_1     =   "CCWGraphFrame"
      opts_1          =   62
      C[0]_1          =   0
      Event_1         =   2
      ClassName_2     =   "CCWGFPlotEvent"
      Owner_2         =   1
      Plots_1         =   3
      ClassName_3     =   "CCWDataPlots"
      Array_3         =   1
      Editor_3        =   4
      ClassName_4     =   "CCWGFPlotArrayEditor"
      Owner_4         =   1
      Array[0]_3      =   5
      ClassName_5     =   "CCWDataPlot"
      opts_5          =   4194367
      Name_5          =   "Plot-1"
      C[0]_5          =   65280
      C[1]_5          =   255
      C[2]_5          =   16711680
      C[3]_5          =   16776960
      Event_5         =   2
      X_5             =   6
      ClassName_6     =   "CCWAxis"
      opts_6          =   575
      Name_6          =   "XAxis"
      Orientation_6   =   2944
      format_6        =   7
      ClassName_7     =   "CCWFormat"
      Scale_6         =   8
      ClassName_8     =   "CCWScale"
      opts_8          =   90112
      rMin_8          =   44
      rMax_8          =   547
      dMax_8          =   1000
      discInterval_8  =   1
      Radial_6        =   0
      Enum_6          =   9
      ClassName_9     =   "CCWEnum"
      Editor_9        =   10
      ClassName_10    =   "CCWEnumArrayEditor"
      Owner_10        =   6
      Font_6          =   0
      tickopts_6      =   2071
      major_6         =   100
      minor_6         =   50
      Caption_6       =   11
      ClassName_11    =   "CCWDrawObj"
      opts_11         =   62
      C[0]_11         =   -2147483640
      Image_11        =   12
      ClassName_12    =   "CCWTextImage"
      style_12        =   54810092
      font_12         =   0
      Animator_11     =   0
      Blinker_11      =   0
      Y_5             =   13
      ClassName_13    =   "CCWAxis"
      opts_13         =   575
      Name_13         =   "YAxis-1"
      Orientation_13  =   2067
      format_13       =   14
      ClassName_14    =   "CCWFormat"
      Scale_13        =   15
      ClassName_15    =   "CCWScale"
      opts_15         =   122880
      rMin_15         =   12
      rMax_15         =   309
      dMax_15         =   100
      discInterval_15 =   1
      Radial_13       =   0
      Enum_13         =   16
      ClassName_16    =   "CCWEnum"
      Editor_16       =   17
      ClassName_17    =   "CCWEnumArrayEditor"
      Owner_17        =   13
      Font_13         =   0
      tickopts_13     =   2711
      major_13        =   10
      minor_13        =   5
      Caption_13      =   18
      ClassName_18    =   "CCWDrawObj"
      opts_18         =   62
      C[0]_18         =   -2147483640
      Image_18        =   19
      ClassName_19    =   "CCWTextImage"
      style_19        =   2
      font_19         =   0
      Animator_18     =   0
      Blinker_18      =   0
      LineStyle_5     =   1
      LineWidth_5     =   1
      BasePlot_5      =   0
      DefaultXInc_5   =   1
      DefaultPlotPerRow_5=   -1  'True
      Axes_1          =   20
      ClassName_20    =   "CCWAxes"
      Array_20        =   2
      Editor_20       =   21
      ClassName_21    =   "CCWGFAxisArrayEditor"
      Owner_21        =   1
      Array[0]_20     =   6
      Array[1]_20     =   13
      DefaultPlot_1   =   22
      ClassName_22    =   "CCWDataPlot"
      opts_22         =   4194367
      Name_22         =   "[Template]"
      C[0]_22         =   65280
      C[1]_22         =   255
      C[2]_22         =   16711680
      C[3]_22         =   16776960
      Event_22        =   2
      X_22            =   6
      Y_22            =   13
      LineStyle_22    =   1
      LineWidth_22    =   1
      BasePlot_22     =   0
      DefaultXInc_22  =   1
      DefaultPlotPerRow_22=   -1  'True
      Cursors_1       =   23
      ClassName_23    =   "CCWCursors"
      Editor_23       =   24
      ClassName_24    =   "CCWGFCursorArrayEditor"
      Owner_24        =   1
      TrackMode_1     =   2
      GraphFrameStyle_1=   1
      GraphBackground_1=   0
      GraphFrame_1    =   25
      ClassName_25    =   "CCWDrawObj"
      opts_25         =   62
      Image_25        =   26
      ClassName_26    =   "CCWPictImage"
      opts_26         =   1280
      Rows_26         =   1
      Cols_26         =   1
      Pict_26         =   450
      F_26            =   -2147483633
      B_26            =   -2147483633
      ColorReplaceWith_26=   8421504
      ColorReplace_26 =   8421504
      Tolerance_26    =   2
      Animator_25     =   0
      Blinker_25      =   0
      PlotFrame_1     =   27
      ClassName_27    =   "CCWDrawObj"
      opts_27         =   62
      C[1]_27         =   0
      Image_27        =   28
      ClassName_28    =   "CCWPictImage"
      opts_28         =   1280
      Rows_28         =   1
      Cols_28         =   1
      Pict_28         =   1
      F_28            =   -2147483633
      B_28            =   0
      ColorReplaceWith_28=   8421504
      ColorReplace_28 =   8421504
      Tolerance_28    =   2
      Animator_27     =   0
      Blinker_27      =   0
      Caption_1       =   29
      ClassName_29    =   "CCWDrawObj"
      opts_29         =   62
      C[0]_29         =   -2147483640
      Image_29        =   30
      ClassName_30    =   "CCWTextImage"
      font_30         =   0
      Animator_29     =   0
      Blinker_29      =   0
      DefaultXInc_1   =   1
      DefaultPlotPerRow_1=   -1  'True
      Bindings_1      =   31
      ClassName_31    =   "CCWBindingHolderArray"
      Editor_31       =   32
      ClassName_32    =   "CCWBindingHolderArrayEditor"
      Owner_32        =   1
      Annotations_1   =   33
      ClassName_33    =   "CCWAnnotations"
      Editor_33       =   34
      ClassName_34    =   "CCWAnnotationArrayEditor"
      Owner_34        =   1
      AnnotationTemplate_1=   35
      ClassName_35    =   "CCWAnnotation"
      opts_35         =   63
      Name_35         =   "[Template]"
      Plot_35         =   36
      ClassName_36    =   "CCWDataPlot"
      opts_36         =   4194367
      Name_36         =   "[Template]"
      C[0]_36         =   65280
      C[1]_36         =   255
      C[2]_36         =   16711680
      C[3]_36         =   16776960
      Event_36        =   2
      X_36            =   6
      Y_36            =   13
      LineStyle_36    =   1
      LineWidth_36    =   1
      BasePlot_36     =   0
      DefaultXInc_36  =   1
      DefaultPlotPerRow_36=   -1  'True
      Text_35         =   "[Template]"
      TextXPoint_35   =   6.7
      TextYPoint_35   =   6.7
      TextColor_35    =   16777215
      TextFont_35     =   37
      ClassName_37    =   "CCWFont"
      bFont_37        =   -1  'True
      BeginProperty Font_37 {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ShapeXPoints_35 =   38
      ClassName_38    =   "CDataBuffer"
      Type_38         =   5
      m_cDims;_38     =   1
      m_cElts_38      =   1
      Element[0]_38   =   3.3
      ShapeYPoints_35 =   39
      ClassName_39    =   "CDataBuffer"
      Type_39         =   5
      m_cDims;_39     =   1
      m_cElts_39      =   1
      Element[0]_39   =   3.3
      ShapeFillColor_35=   16777215
      ShapeLineColor_35=   16777215
      ShapeLineWidth_35=   1
      ShapeLineStyle_35=   1
      ShapePointStyle_35=   10
      ShapeImage_35   =   40
      ClassName_40    =   "CCWDrawObj"
      opts_40         =   62
      Image_40        =   41
      ClassName_41    =   "CCWPictImage"
      opts_41         =   1280
      Rows_41         =   1
      Cols_41         =   1
      Pict_41         =   7
      F_41            =   -2147483633
      B_41            =   -2147483633
      ColorReplaceWith_41=   8421504
      ColorReplace_41 =   8421504
      Tolerance_41    =   2
      Animator_40     =   0
      Blinker_40      =   0
      ArrowVisible_35 =   -1  'True
      ArrowColor_35   =   16777215
      ArrowWidth_35   =   1
      ArrowLineStyle_35=   1
      ArrowHeadStyle_35=   1
   End
   Begin CWUIControlsLib.CWNumEdit CWChannel 
      Height          =   375
      Left            =   480
      TabIndex        =   3
      Top             =   600
      Width           =   615
      _Version        =   393218
      _ExtentX        =   1085
      _ExtentY        =   661
      _StockProps     =   4
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.74
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Reset_0         =   0   'False
      CompatibleVers_0=   393218
      NumEdit_0       =   1
      ClassName_1     =   "CCWNumEdit"
      opts_1          =   458814
      ButtonPosition_1=   1
      TextAlignment_1 =   2
      format_1        =   2
      ClassName_2     =   "CCWFormat"
      scale_1         =   3
      ClassName_3     =   "CCWScale"
      opts_3          =   65536
      dMax_3          =   10
      discInterval_3  =   1
      ValueVarType_1  =   5
      Value_Val_1     =   1
      IncValueVarType_1=   5
      IncValue_Val_1  =   1
      AccelIncVarType_1=   5
      AccelInc_Val_1  =   5
      RangeMinVarType_1=   5
      RangeMin_Val_1  =   1
      RangeMaxVarType_1=   5
      RangeMax_Val_1  =   8
      Bindings_1      =   4
      ClassName_4     =   "CCWBindingHolderArray"
      Editor_4        =   5
      ClassName_5     =   "CCWBindingHolderArrayEditor"
      Owner_5         =   1
   End
   Begin CWUIControlsLib.CWNumEdit CWBufferSize 
      Height          =   375
      Left            =   120
      TabIndex        =   5
      Top             =   1080
      Width           =   975
      _Version        =   393218
      _ExtentX        =   1720
      _ExtentY        =   661
      _StockProps     =   4
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.74
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Reset_0         =   0   'False
      CompatibleVers_0=   393218
      NumEdit_0       =   1
      ClassName_1     =   "CCWNumEdit"
      opts_1          =   393278
      ButtonPosition_1=   1
      TextAlignment_1 =   2
      format_1        =   2
      ClassName_2     =   "CCWFormat"
      scale_1         =   3
      ClassName_3     =   "CCWScale"
      opts_3          =   65536
      dMax_3          =   10
      discInterval_3  =   1
      ValueVarType_1  =   5
      Value_Val_1     =   1000
      IncValueVarType_1=   5
      IncValue_Val_1  =   1
      AccelIncVarType_1=   5
      AccelInc_Val_1  =   5
      RangeMinVarType_1=   5
      RangeMin_Val_1  =   1
      RangeMaxVarType_1=   5
      RangeMax_Val_1  =   10000
      Bindings_1      =   4
      ClassName_4     =   "CCWBindingHolderArray"
      Editor_4        =   5
      ClassName_5     =   "CCWBindingHolderArrayEditor"
      Owner_5         =   1
   End
   Begin CWUIControlsLib.CWNumEdit CWNumberOfScansToAcquire 
      Height          =   375
      Left            =   120
      TabIndex        =   6
      Top             =   1560
      Width           =   975
      _Version        =   393218
      _ExtentX        =   1720
      _ExtentY        =   661
      _StockProps     =   4
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.74
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Reset_0         =   0   'False
      CompatibleVers_0=   393218
      NumEdit_0       =   1
      ClassName_1     =   "CCWNumEdit"
      opts_1          =   393278
      ButtonPosition_1=   1
      TextAlignment_1 =   2
      format_1        =   2
      ClassName_2     =   "CCWFormat"
      scale_1         =   3
      ClassName_3     =   "CCWScale"
      opts_3          =   65536
      dMax_3          =   10
      discInterval_3  =   1
      ValueVarType_1  =   5
      Value_Val_1     =   100
      IncValueVarType_1=   5
      IncValue_Val_1  =   1
      AccelIncVarType_1=   5
      AccelInc_Val_1  =   5
      RangeMinVarType_1=   5
      RangeMin_Val_1  =   1
      RangeMaxVarType_1=   5
      RangeMax_Val_1  =   8
      Bindings_1      =   4
      ClassName_4     =   "CCWBindingHolderArray"
      Editor_4        =   5
      ClassName_5     =   "CCWBindingHolderArrayEditor"
      Owner_5         =   1
   End
   Begin CWUIControlsLib.CWNumEdit CWFluidity 
      Height          =   375
      Left            =   120
      TabIndex        =   7
      Top             =   2040
      Width           =   975
      _Version        =   393218
      _ExtentX        =   1720
      _ExtentY        =   661
      _StockProps     =   4
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.74
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Reset_0         =   0   'False
      CompatibleVers_0=   393218
      NumEdit_0       =   1
      ClassName_1     =   "CCWNumEdit"
      opts_1          =   393278
      ButtonPosition_1=   1
      TextAlignment_1 =   2
      format_1        =   2
      ClassName_2     =   "CCWFormat"
      scale_1         =   3
      ClassName_3     =   "CCWScale"
      opts_3          =   65536
      dMax_3          =   10
      discInterval_3  =   1
      ValueVarType_1  =   5
      Value_Val_1     =   50
      IncValueVarType_1=   5
      IncValue_Val_1  =   1
      AccelIncVarType_1=   5
      AccelInc_Val_1  =   5
      RangeMinVarType_1=   5
      RangeMin_Val_1  =   1
      RangeMaxVarType_1=   5
      RangeMax_Val_1  =   8
      Bindings_1      =   4
      ClassName_4     =   "CCWBindingHolderArray"
      Editor_4        =   5
      ClassName_5     =   "CCWBindingHolderArrayEditor"
      Owner_5         =   1
   End
   Begin CWUIControlsLib.CWNumEdit CWTimeOut 
      Height          =   375
      Left            =   120
      TabIndex        =   8
      Top             =   2520
      Width           =   975
      _Version        =   393218
      _ExtentX        =   1720
      _ExtentY        =   661
      _StockProps     =   4
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   9.74
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Reset_0         =   0   'False
      CompatibleVers_0=   393218
      NumEdit_0       =   1
      ClassName_1     =   "CCWNumEdit"
      opts_1          =   393278
      ButtonPosition_1=   1
      TextAlignment_1 =   2
      format_1        =   2
      ClassName_2     =   "CCWFormat"
      scale_1         =   3
      ClassName_3     =   "CCWScale"
      opts_3          =   65536
      dMax_3          =   10
      discInterval_3  =   1
      ValueVarType_1  =   5
      Value_Val_1     =   5000
      IncValueVarType_1=   5
      IncValue_Val_1  =   1
      AccelIncVarType_1=   5
      AccelInc_Val_1  =   5
      RangeMinVarType_1=   5
      RangeMin_Val_1  =   1
      RangeMaxVarType_1=   5
      RangeMax_Val_1  =   8
      Bindings_1      =   4
      ClassName_4     =   "CCWBindingHolderArray"
      Editor_4        =   5
      ClassName_5     =   "CCWBindingHolderArrayEditor"
      Owner_5         =   1
   End
   Begin VB.Label Help 
      AutoSize        =   -1  'True
      Caption         =   "Help SDK for USPC"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   195
      Left            =   6240
      TabIndex        =   16
      Top             =   5280
      Width           =   1680
   End
   Begin VB.Label Label6 
      AutoSize        =   -1  'True
      Caption         =   "TimeOut"
      Height          =   195
      Left            =   1230
      TabIndex        =   12
      Top             =   2640
      Width           =   600
   End
   Begin VB.Label Label5 
      AutoSize        =   -1  'True
      Caption         =   "Transfer fluidity"
      Height          =   195
      Left            =   1230
      TabIndex        =   11
      Top             =   2160
      Width           =   1065
   End
   Begin VB.Label Label4 
      AutoSize        =   -1  'True
      Caption         =   "Nb to acquire"
      Height          =   195
      Left            =   1230
      TabIndex        =   10
      Top             =   1680
      Width           =   960
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      Caption         =   "DLL RAM size"
      Height          =   195
      Left            =   1230
      TabIndex        =   9
      Top             =   1200
      Width           =   1020
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Channel"
      Height          =   195
      Left            =   1230
      TabIndex        =   4
      Top             =   720
      Width           =   585
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Board"
      Height          =   195
      Left            =   1230
      TabIndex        =   2
      Top             =   240
      Width           =   420
   End
   Begin VB.Menu File 
      Caption         =   "File"
      Begin VB.Menu Load 
         Caption         =   "Load"
      End
      Begin VB.Menu Exit 
         Caption         =   "Exit"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' -------------------------------------------------------------------------------------------
' Acquisition demo
'
' Description:
' This program shows how to use acquisition function of USPC DLL.
' This program only acquires C-scan data (not A-scan) and start acquisition on software
' command.
'
' Note: You need to install cwui.ocx on your computer before to try this application.
'       CWUI.OCX is a component of National Instruments (part of Component Work)
'       This component is distribued (without documentation and free of right) with USPC ActiveX.
'       If you want to use this component for your applications, you must buy it.
'
' Revision:
' 03 Marsh 2003     First version created by Alain Zins
' 01 October 2004   Add check channel number (for MUX)
'                   Correction of bug -> StopAndClear:
'                   Replace
'                   PCXUS_ACQ_STOP hPCXUS, Board
'                   by
'                   PCXUS_ACQ_STOP hPCXUS, CWBoard.Value - 1
' 07 April 2006     Bug: Inversion between Scan and pulse counter
' -------------------------------------------------------------------------------------------
Dim hPCXUS As Long
Dim NumberOfScansToAcquire As Long
Dim BlockSize As Long
Dim error As Long
Dim Data() As Byte
Dim Cscan() As Double
Dim Ascan() As Double
Dim NumberRead As Long
Dim ScansBacklog As Long
Dim Status As Long
Dim Status_NumberOFScansAcquired As Long
Dim Status_NumberOfScansRead As Long
Dim Status_BufferSize As Long
Dim Param As Long
Dim AcqMode As Long
Dim StartMode As Long
Dim Conditions(0 To 7) As Long
Dim Min, Max As Double


Private Sub Exit_Click()
    End
End Sub

Private Sub Form_Load()
    Dim i As Integer
    
    ' Set up default values
    AcqMode = &H800
    StartMode = 1
    For i = 0 To 7
        Conditions(i) = 0
    Next
    CWBoard.Value = 1
    CWChannel.Value = 1
    CWBufferSize.Value = 1000
    CWNumberOfScansToAcquire.Value = 100
    CWFluidity.Value = 50
    CWTimeOut.Value = 5000
    cbShow.ListIndex = 2
    ' Open USPC
    error = PCXUS_Open(hPCXUS, 2)
    If error <> 0 Then
        MsgBox "Open error 0x" + Hex(error)
        End
    Else
        MsgBox "Handle " + Str(hPCXUS)
    End If
   'Enable or disable buttons
    CWBoard.Enabled = True
    btStop.Enabled = False
    btStartN.Enabled = True
    btStartContinously.Enabled = True
End Sub

Private Sub Form_Terminate()
    ' Close USPC
    PCXUS_Close (hPCXUS)
End Sub

Private Sub Help_Click()
    Shell "explorer c:\uspc\SDK for USPC\Help\SDK USPC.htm", vbNormalFocus
End Sub

Private Sub btStartN_Click()
    Dim Board As Integer
    Dim Channel As Integer
    Dim BufferSize As Long
    Dim Fluidity As Long
    Dim TimeOut As Long
    Dim NumberOfScansToAcquire As Integer
    Dim NumberOfData As Integer

    ' Check signal selected
    If (cbShow.ListIndex < 2) Then
        MsgBox "Select only C-scan signal"
        Exit Sub
    End If
    
    'Enable or disable buttons
    CWBoard.Enabled = False
    btStop.Enabled = True
    btStartN.Enabled = False
    btStartContinously = False
    
    ' Setup acquisition
    Board = CWBoard.Value - 1
    Channel = CWChannel.Value - 1
    BufferSize = CWBufferSize.Value
    Fluidity = CWFluidity.Value
    error = PCXUS_ACQ_CONFIG(hPCXUS, Board, AcqMode, StartMode, Conditions(0), 0, 0, BufferSize, Fluidity, Param)
    CWFluidity.Value = Fluidity
    If (error <> 0) Then
        StopAndClear
        MsgBox "Config error 0x" + Hex(error)
        Exit Sub
    End If
    
    ' Memory allocation
    PCXUS_ACQ_GET_STATUS Board, Status, Status_NumberOFScansAcquired, Status_NumberOfScansRead, Status_BufferSize, BlockSize
    On Error GoTo ErrorHandler
    ReDim Data(Status_BufferSize * BlockSize * 4)
    On Error GoTo 0
    
    ' Start acquisition
    NumberOfScansToAcquire = CWNumberOfScansToAcquire.Value
    error = PCXUS_ACQ_START(hPCXUS, Board, NumberOfScansToAcquire)
    If (error <> 0) Then
        StopAndClear
        MsgBox "Start error 0x" + Hex(error)
        Exit Sub
    End If
    
    ' Read acquisition
    TimeOut = CWTimeOut.Value
    error = PCXUS_ACQ_READ(hPCXUS, Board, NumberOfScansToAcquire, TimeOut, NumberRead, ScansBacklog, Data(0))
    If (error <> 0) Then
        StopAndClear
        MsgBox "Read error 0x" + Hex(error)
        Exit Sub
    End If
    
    ' Update display
    If NumberRead <= 0 Then
        StopAndClear
        Exit Sub
    End If
    
    StopAndClear
    
    On Error GoTo ErrorHandler
    ReDim Cscan(NumberRead - 1)
    On Error GoTo 0
    
    ' Extract the signal into Cscans data stream
    NumberOfData = acq_sort_data(cbShow.ListIndex, Data, Channel, NumberRead, BlockSize, 0, 0, Cscan, Ascan)
    If NumberOfData > 0 Then
        ReDim Preserve Cscan(NumberOfData - 1)
        CWGraph1.ClearData
        Select Case cbShow.ListIndex
        Case 2 To 3:
            CWGraph1.Axes.Item(2).AutoScale = False
            CWGraph1.Axes.Item(2).Minimum = 0
            CWGraph1.Axes.Item(2).Maximum = 100
        Case 4 To 8:
            CWGraph1.Axes.Item(2).AutoScale = True
        Case 9 To 18:
            CWGraph1.Axes.Item(2).AutoScale = False
            CWGraph1.Axes.Item(2).Minimum = 0
            CWGraph1.Axes.Item(2).Maximum = 1.5
        Case 19:
            CWGraph1.Axes.Item(2).AutoScale = False
            CWGraph1.Axes.Item(2).Minimum = 0
            CWGraph1.Axes.Item(2).Maximum = 256
        End Select
        CWGraph1.PlotY (Cscan)
        CWGraph1.Axes.Item(1).AutoScaleNow
    End If
    
    Exit Sub

ErrorHandler:
    StopAndClear
    MsgBox "Memory allocation failed"
End Sub

Private Sub btStartContinously_Click()
    Dim Board As Integer
    Dim Channel As Integer
    Dim BufferSize As Long
    Dim Fluidity As Long

    Min = 10000
    Max = 0
    ' Check signal selected
    If (cbShow.ListIndex < 2) Then
        MsgBox "Select only C-scan signal"
        Exit Sub
    End If
    
    'Enable or disable buttons
    CWBoard.Enabled = False
    btStop.Enabled = True
    btStartN.Enabled = False
    btStartContinously = False
    
    ' Setup acquisition
    Board = CWBoard.Value - 1
    Channel = CWChannel.Value - 1
    BufferSize = CWBufferSize.Value
    Fluidity = CWFluidity.Value
    error = PCXUS_ACQ_CONFIG(hPCXUS, Board, AcqMode, StartMode, Conditions(0), 0, 0, BufferSize, Fluidity, Param)
    CWFluidity.Value = Fluidity
    If (error <> 0) Then
        StopAndClear
        MsgBox "Config error 0x" + Hex(error)
        Exit Sub
    End If
    
    ' Memory allocation
    PCXUS_ACQ_GET_STATUS Board, Status, Status_NumberOFScansAcquired, Status_NumberOfScansRead, Status_BufferSize, BlockSize
    On Error GoTo ErrorHandler
    ReDim Data(Status_BufferSize * BlockSize * 4)
    On Error GoTo 0
    
    ' Update Graph scales
    CWGraph1.ClearData
    CWGraph1.ChartLength = 1000
    CWGraph1.Axes.Item(1).AutoScale = False
    CWGraph1.Axes.Item(1).Minimum = 0
    CWGraph1.Axes.Item(1).Maximum = 1000
    
    Select Case cbShow.ListIndex
    Case 2 To 3:
        CWGraph1.Axes.Item(2).AutoScale = False
        CWGraph1.Axes.Item(2).Minimum = 0
        CWGraph1.Axes.Item(2).Maximum = 100
    Case 4 To 8:
    CWGraph1.Axes.Item(2).AutoScale = True
    Case 9 To 18:
        CWGraph1.Axes.Item(2).AutoScale = False
        CWGraph1.Axes.Item(2).Minimum = 0
        CWGraph1.Axes.Item(2).Maximum = 1.5
    Case 19:
        CWGraph1.Axes.Item(2).AutoScale = False
        CWGraph1.Axes.Item(2).Minimum = 0
        CWGraph1.Axes.Item(2).Maximum = 256
    End Select
    
    ' Start acquisition
    error = PCXUS_ACQ_START(hPCXUS, Board, -1)
    If (error <> 0) Then
        StopAndClear
        MsgBox "Start error 0x" + Hex(error)
        Exit Sub
    End If
        
    ' Start read
    ReadTimer.Enabled = True
    Exit Sub
    
ErrorHandler:
    StopAndClear
    MsgBox "Memory allocation failed"
End Sub


Private Sub Load_Click()
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
    If (error <> 0) Then
        MsgBox "Error = 0x" + Hex(error), vbOKOnly, "Load file error"
    End If
    Exit Sub
        
Jump:
    'Cancel section
End Sub


Private Sub ReadTimer_Timer()
    Dim Board As Integer
    Dim Channel As Integer
    Dim BufferSize As Long
    Dim Fluidity As Long
    Dim NumberOfData As Integer
    Board = CWBoard.Value - 1
    Channel = CWChannel.Value - 1
    BufferSize = CWBufferSize.Value
    
    error = PCXUS_ACQ_READ(hPCXUS, Board, -1, 0, NumberRead, ScansBacklog, Data(0))
    If (error <> 0) Then
        StopAndClear
        MsgBox "Read error 0x" + Hex(error), vbOKOnly, "Read data error"
        Exit Sub
    End If
    
    ' Update display
    If NumberRead > 0 Then
        On Error GoTo ErrorHandler
        ReDim Cscan(NumberRead - 1)
        ReDim Ascan(0)
        On Error GoTo 0
        ' Extract the signal into Cscans data stream
        NumberOfData = acq_sort_data(cbShow.ListIndex, Data, Channel, NumberRead, BlockSize, 0, 0, Cscan, Ascan)
        
        If NumberOfData > 0 Then
            ReDim Preserve Cscan(NumberOfData - 1)
            CWGraph1.ChartY (Cscan)
            
            CurrentValue = Str(Cscan(0))
            For i = 0 To NumberOfData - 1
                If (Cscan(i) < Min) Then
                    MinValue = Str(Cscan(i))
                    Min = Cscan(i)
                End If
                If (Cscan(i) > Max) Then
                    MaxValue = Str(Cscan(i))
                    Max = Cscan(i)
                End If
            Next
        End If
    End If
    Exit Sub
    
ErrorHandler:
    MsgBox "Memory allocation failed"
    StopAndClear
End Sub

Private Sub btStop_Click()
    StopAndClear
End Sub

Public Sub StopAndClear()
    ReadTimer.Enabled = False
    PCXUS_ACQ_STOP hPCXUS, CWBoard.Value - 1
    PCXUS_ACQ_CLEAR hPCXUS, CWBoard.Value - 1
    
    'Enable or disable buttons
    CWBoard.Enabled = True
    btStop.Enabled = False
    btStartN.Enabled = True
    btStartContinously.Enabled = True
End Sub

Public Function acq_sort_data(DataToExtract As Integer, Data() As Byte, Channel As Integer, NumberOfScans As Long, SizeOfBlock As Long, ByteNumber As Integer, ByteMask As Integer, ByRef Cscan() As Double, ByRef Array2D() As Double) As Integer
    Dim iblock As Integer
    Dim jblock As Integer
    jblock = 0
    Select Case DataToExtract
    Case 0: ' A-scan
    Case 1: ' A-scan HR
    Case 2: 'Amplitude Gate 1
        For iblock = 0 To NumberOfScans - 1
            If (Data(SizeOfBlock * 4 * iblock + 25) = Channel) Then
                Cscan(jblock) = Data(SizeOfBlock * 4 * iblock + 8)
                jblock = jblock + 1
            End If
        Next iblock
    Case 3: 'Amplitude Gate 2
        For iblock = 0 To NumberOfScans - 1
            If (Data(SizeOfBlock * 4 * iblock + 25) = Channel) Then
                Cscan(jblock) = Data(SizeOfBlock * 4 * iblock + 16)
                jblock = jblock + 1
            End If
        Next iblock
    Case 4: 'TOF Gate 1
        For iblock = 0 To NumberOfScans - 1
            If (Data(SizeOfBlock * 4 * iblock + 25) = Channel) Then
                Cscan(jblock) = Data(SizeOfBlock * 4 * iblock + 12) + 256 * Data(SizeOfBlock * 4 * iblock + 13) + 65536 * Data(SizeOfBlock * 4 * iblock + 14)
                Cscan(jblock) = Cscan(jblock) / 1000# * 5#
                jblock = jblock + 1
            End If
        Next iblock
    Case 5: 'TOF Gate 2
        For iblock = 0 To NumberOfScans - 1
            If (Data(SizeOfBlock * 4 * iblock + 25) = Channel) Then
                Cscan(jblock) = Data(SizeOfBlock * 4 * iblock + 20) + 256 * Data(SizeOfBlock * 4 * iblock + 21) + 65536 * Data(SizeOfBlock * 4 * iblock + 22)
                Cscan(jblock) = Cscan(jblock) / 1000# * 5#
                jblock = jblock + 1
            End If
        Next iblock
    Case 6: 'TOF Gate IF
        For iblock = 0 To NumberOfScans - 1
            If (Data(SizeOfBlock * 4 * iblock + 25) = Channel) Then
                Cscan(jblock) = Data(SizeOfBlock * 4 * iblock + 28) + 256 * Data(SizeOfBlock * 4 * iblock + 29) + 65536 * Data(SizeOfBlock * 4 * iblock + 30)
                Cscan(jblock) = Cscan(jblock) / 1000# * 5#
                jblock = jblock + 1
            End If
        Next iblock
    Case 7: 'Counter 2 - Pulse counter
        For iblock = 0 To NumberOfScans - 1
            If (Data(SizeOfBlock * 4 * iblock + 25) = Channel) Then
                Cscan(jblock) = Data(SizeOfBlock * 4 * iblock + 4) + 256 * Data(SizeOfBlock * 4 * iblock + 5) + 65536 * Data(SizeOfBlock * 4 * iblock + 2) + 16777216 * Data(SizeOfBlock * 4 * iblock + 3)
                jblock = jblock + 1
            End If
        Next iblock
    Case 8: 'Counter 1 - Scan counter
        For iblock = 0 To NumberOfScans - 1
            If (Data(SizeOfBlock * 4 * iblock + 25) = Channel) Then
                Cscan(jblock) = Data(SizeOfBlock * 4 * iblock + 0) + 256 * Data(SizeOfBlock * 4 * iblock + 1) + 65536 * Data(SizeOfBlock * 4 * iblock + 6) + 16777216 * Data(SizeOfBlock * 4 * iblock + 7)
                jblock = jblock + 1
            End If
        Next iblock
    Case 9: 'DET 1
        For iblock = 0 To NumberOfScans - 1
            If (Data(SizeOfBlock * 4 * iblock + 25) = Channel) Then
                If ((Data(SizeOfBlock * 4 * iblock + 10) And 2) <> 0) Then
                    Cscan(jblock) = 1
                Else
                    Cscan(jblock) = 0
                End If
                jblock = jblock + 1
            End If
        Next iblock
    Case 10: 'Alarm mini. 1
        For iblock = 0 To NumberOfScans - 1
            If (Data(SizeOfBlock * 4 * iblock + 25) = Channel) Then
                If ((Data(SizeOfBlock * 4 * iblock + 10) And 4) <> 0) Then
                    Cscan(jblock) = 1
                Else
                    Cscan(jblock) = 0
                End If
                jblock = jblock + 1
            End If
        Next iblock
    Case 11: 'Alarm maxi. 1
        For iblock = 0 To NumberOfScans - 1
            If (Data(SizeOfBlock * 4 * iblock + 25) = Channel) Then
                If ((Data(SizeOfBlock * 4 * iblock + 10) And 8) <> 0) Then
                    Cscan(jblock) = 1
                Else
                    Cscan(jblock) = 0
                End If
                jblock = jblock + 1
            End If
        Next iblock
    Case 12: 'Coupling alarm 1
        For iblock = 0 To NumberOfScans - 1
            If (Data(SizeOfBlock * 4 * iblock + 25) = Channel) Then
                If ((Data(SizeOfBlock * 4 * iblock + 10) And 1) <> 0) Then
                    Cscan(jblock) = 1
                Else
                    Cscan(jblock) = 0
                End If
                jblock = jblock + 1
            End If
        Next iblock
    Case 13: 'DET 2
        For iblock = 0 To NumberOfScans - 1
            If (Data(SizeOfBlock * 4 * iblock + 25) = Channel) Then
                If ((Data(SizeOfBlock * 4 * iblock + 18) And 2) <> 0) Then
                    Cscan(jblock) = 1
                Else
                    Cscan(jblock) = 0
                End If
                jblock = jblock + 1
            End If
        Next iblock
    Case 14: 'Alarm mini. 2
        For iblock = 0 To NumberOfScans - 1
            If (Data(SizeOfBlock * 4 * iblock + 25) = Channel) Then
                If ((Data(SizeOfBlock * 4 * iblock + 18) And 4) <> 0) Then
                    Cscan(jblock) = 1
                Else
                    Cscan(jblock) = 0
                End If
                jblock = jblock + 1
            End If
        Next iblock
    Case 15: 'Alarm maxi. 2
        For iblock = 0 To NumberOfScans - 1
            If (Data(SizeOfBlock * 4 * iblock + 25) = Channel) Then
                If ((Data(SizeOfBlock * 4 * iblock + 18) And 8) <> 0) Then
                    Cscan(jblock) = 1
                Else
                    Cscan(jblock) = 0
                End If
                jblock = jblock + 1
            End If
        Next iblock
    Case 16: 'Coupling alarm 2
        For iblock = 0 To NumberOfScans - 1
            If (Data(SizeOfBlock * 4 * iblock + 25) = Channel) Then
                If ((Data(SizeOfBlock * 4 * iblock + 18) And 1) <> 0) Then
                    Cscan(jblock) = 1
                Else
                    Cscan(jblock) = 0
                End If
                jblock = jblock + 1
            End If
        Next iblock
    Case 17: 'DET IF
        For iblock = 0 To NumberOfScans - 1
            If (Data(SizeOfBlock * 4 * iblock + 25) = Channel) Then
                If ((Data(SizeOfBlock * 4 * iblock + 26) And 2) <> 0) Then
                    Cscan(jblock) = 1
                Else
                    Cscan(jblock) = 0
                End If
                jblock = jblock + 1
            End If
        Next iblock
    Case 18: 'ENABLE (IN1)
        For iblock = 0 To NumberOfScans - 1
            If (Data(SizeOfBlock * 4 * iblock + 25) = Channel) Then
                If ((Data(SizeOfBlock * 4 * iblock + 26) And 4) <> 0) Then
                    Cscan(jblock) = 1
                Else
                    Cscan(jblock) = 0
                End If
                jblock = jblock + 1
            End If
        Next iblock
    Case 19: 'Specific byte
        For iblock = 0 To NumberOfScans - 1
            If (Data(SizeOfBlock * 4 * iblock + 25) = Channel) Then
                Cscan(jblock) = Data(SizeOfBlock * 4 * iblock + ByteNumber) And ByteMask
                jblock = jblock + 1
            End If
        Next iblock
    End Select
    acq_sort_data = jblock
End Function
