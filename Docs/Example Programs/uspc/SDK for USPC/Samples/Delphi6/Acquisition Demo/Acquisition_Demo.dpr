program Acquisition_Demo;

uses
  Forms,
  Acquisition_Demo_Unit in 'Acquisition_Demo_Unit.pas' {Acq_Demo},
  DLL_pcxus in '..\DLL_pcxus.pas',
  Acquisition_global in 'Acquisition_global.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TAcq_Demo, Acq_Demo);
  Application.Run;
end.
