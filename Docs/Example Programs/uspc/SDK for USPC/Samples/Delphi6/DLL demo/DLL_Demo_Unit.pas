unit DLL_Demo_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls,
  DLL_pcxus;

type
  TForm1 = class(TForm)
    Open: TButton;
    Load: TButton;
    Save: TButton;
    Close: TButton;
    StatusBar: TStatusBar;
    GainBar: TTrackBar;
    Label1: TLabel;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    procedure OpenClick(Sender: TObject);
    procedure CloseClick(Sender: TObject);
    procedure LoadClick(Sender: TObject);
    procedure OnCreate(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure GainBarChange(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;
  hPCXUS: LongWord;
  USPC_opened: Boolean;

implementation

{$R *.dfm}
//------------------------------------------------------------------------------
procedure TForm1.OnCreate(Sender: TObject);
begin
       USPC_opened:= False;
end;
//------------------------------------------------------------------------------
procedure TForm1.OpenClick(Sender: TObject);

var error: LongWord;

begin
  if not USPC_opened then
  begin
    error := PCXUS_Open(hPCXUS, 2);
    if error <> 0 then
    begin
      StatusBar.Panels.Items[0].Text:='';
      StatusBar.Panels.Items[1].Text:='Error = 0x'+ Format('%08x',[error]);
      StatusBar.Panels.Items[1].Text:='';
    end
    else
    begin
      StatusBar.Panels.Items[0].Text:='USPC opened';
      StatusBar.Panels.Items[1].Text:='No error';
      StatusBar.Panels.Items[1].Text:='';
      USPC_opened:= True;
    end
  end
  else
  begin
    StatusBar.Panels.Items[1].Text:='Error = USPC opened yet';
    StatusBar.Panels.Items[2].Text:='';
  end
end;
//------------------------------------------------------------------------------
procedure TForm1.CloseClick(Sender: TObject);

var error: LongWord;

begin
  if USPC_opened then
  begin
    error := PCXUS_Close(hPCXUS);
    if error <> 0 then
    begin
      StatusBar.Panels.Items[1].Text:='Error = 0x'+ Format('%08x',[error]);
      StatusBar.Panels.Items[2].Text:='';
    end
    else
    begin
      StatusBar.Panels.Items[0].Text:='USPC closed';
      StatusBar.Panels.Items[1].Text:='No error';
      StatusBar.Panels.Items[2].Text:='';
      USPC_opened:= False;
    end
  end
  else
  begin
    StatusBar.Panels.Items[1].Text:='Error = USPC closed yet';
    StatusBar.Panels.Items[2].Text:='';
  end
end;
//------------------------------------------------------------------------------
procedure TForm1.LoadClick(Sender: TObject);

var error: LongWord;

begin
  if USPC_opened then
  begin
    if OpenDialog.Execute then
    begin
      error := PCXUS_Load(-1,-1, PChar(OpenDialog.FileName));
      if error <> 0 then
      begin
        StatusBar.Panels.Items[1].Text:='Error = 0x'+ Format('%08x',[error]);
        StatusBar.Panels.Items[2].Text:='';
      end
      else
      begin
        StatusBar.Panels.Items[1].Text:='No error';
        StatusBar.Panels.Items[2].Text:=OpenDialog.FileName;
      end
    end
  end
  else
  begin
    StatusBar.Panels.Items[1].Text:='Error = USPC closed';
    StatusBar.Panels.Items[2].Text:='';
  end
end;
//------------------------------------------------------------------------------
procedure TForm1.SaveClick(Sender: TObject);

var error: LongWord;

begin
  if USPC_opened then
  begin
    if SaveDialog.Execute then
    begin
      error := PCXUS_Save(-1,-1, PChar(SaveDialog.FileName));
      if error <> 0 then
      begin
        StatusBar.Panels.Items[1].Text:='Error = 0x'+ Format('%08x',[error]);
        StatusBar.Panels.Items[2].Text:='';
      end
      else
      begin
        StatusBar.Panels.Items[1].Text:='No error';
        StatusBar.Panels.Items[2].Text:=SaveDialog.FileName;
      end
    end
  end
  else
  begin
    StatusBar.Panels.Items[1].Text:='Error = USPC closed';
    StatusBar.Panels.Items[2].Text:='';
  end
end;
//------------------------------------------------------------------------------
procedure TForm1.GainBarChange(Sender: TObject);
var
  error: LongWord;
  Clip: Integer;
  Gain: Double;
  T1,T2: TarrayDbl;

begin
  Gain := GainBar.Position;
  if USPC_opened then
  begin
    error := PCXUS_WRITE(hPCXUS,0,0,0,PChar('receiver_gain'),Gain,T1,T2,PChar(''),Clip);
    if error <> 0 then
    begin
      StatusBar.Panels.Items[1].Text:='Error = 0x'+ Format('%08x',[error]);
      StatusBar.Panels.Items[2].Text:='';
    end
    else
    begin
      StatusBar.Panels.Items[1].Text:='No error';
    end
  end
  else
  begin
    StatusBar.Panels.Items[1].Text:='Error = USPC closed';
  end
end;
//------------------------------------------------------------------------------

end.
