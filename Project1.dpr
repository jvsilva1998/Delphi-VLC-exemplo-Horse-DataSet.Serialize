program Project1;

uses
  Vcl.Forms,
  UHorse in 'UHorse.pas' {frmHorse};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmHorse, frmHorse);
  Application.Run;
end.
