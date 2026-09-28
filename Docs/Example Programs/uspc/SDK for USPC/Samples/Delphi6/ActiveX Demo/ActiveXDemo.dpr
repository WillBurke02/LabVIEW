program ActiveXDemo;

uses
  Forms,
  ActiveXDemo_Unit in 'ActiveXDemo_Unit.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
