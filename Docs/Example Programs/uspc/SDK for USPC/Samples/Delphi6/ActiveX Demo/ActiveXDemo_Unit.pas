unit ActiveXDemo_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, StdCtrls, ComCtrls, ActiveXUspc_TLB;

type
  TForm1 = class(TForm)
    Open: TButton;
    Load: TButton;
    Close: TButton;
    GainBar: TTrackBar;
    AutoRedraw: TButton;
    ShowDAC: TButton;
    Label2: TLabel;
    OpenDialog: TOpenDialog;
    UnitBox: TComboBox;
    Xuspc1: TXuspc;
    procedure GainBarChange(Sender: TObject);
    procedure OpenClick(Sender: TObject);
    procedure CloseClick(Sender: TObject);
    procedure LoadClick(Sender: TObject);
    procedure AutoRedrawClick(Sender: TObject);
    procedure ShowDACClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure UnitBoxChange(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
//------------------------------------------------------------------------------
procedure TForm1.OpenClick(Sender: TObject);
var
  error: Integer;
begin
  error:=Xuspc1.USPC_Open('',2);
end;
//------------------------------------------------------------------------------
procedure TForm1.CloseClick(Sender: TObject);
var
  error: Integer;
begin
  error:=Xuspc1.USPC_Close('');
end;
//------------------------------------------------------------------------------
procedure TForm1.GainBarChange(Sender: TObject);
var
  error: Integer;
  Gain: Double;
  T1,T2: OleVariant;
  strValue: OleVariant;
  clip: Integer;
begin
  Gain:=GainBar.Position;
  strValue:='';
  T1 := VarArrayCreate([0,99], varDouble);
  T2 := VarArrayCreate([0,99], varDouble);
  error:=Xuspc1.USPC_Write('',0,0,0,'receiver_gain',Gain, T1,T2, strValue, clip);
end;
//------------------------------------------------------------------------------
procedure TForm1.LoadClick(Sender: TObject);
var
  error: Integer;
begin
  if OpenDialog.Execute then
  begin
    error:=Xuspc1.USPC_Load('',-1,-1,OpenDialog.FileName);
  end
end;
//------------------------------------------------------------------------------
procedure TForm1.AutoRedrawClick(Sender: TObject);
begin
  Xuspc1.AutoRedraw:= not Xuspc1.AutoRedraw;
end;
//------------------------------------------------------------------------------
procedure TForm1.ShowDACClick(Sender: TObject);
begin
  Xuspc1.DACVisible:=not Xuspc1.DACVisible;
end;
//------------------------------------------------------------------------------
procedure TForm1.FormCreate(Sender: TObject);
begin
  UnitBox.ItemIndex:=0; // µs
end;
//------------------------------------------------------------------------------
procedure TForm1.UnitBoxChange(Sender: TObject);
begin
  Xuspc1.unit_:=UnitBox.ItemIndex;
end;

end.
