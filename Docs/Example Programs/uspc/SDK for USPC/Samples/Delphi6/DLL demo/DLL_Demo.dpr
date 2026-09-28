program DLL_Demo;

uses
  Forms,
  DLL_Demo_Unit in 'DLL_Demo_Unit.pas' {Form1},
  DLL_pcxus in '..\DLL_pcxus.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
