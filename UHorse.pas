unit UHorse;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Horse, DataSet.Serialize;

type
  TfrmHorse = class(TForm)
    conn: TFDConnection;
    qry: TFDQuery;
    lblHorse: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHorse: TfrmHorse;

implementation

{$R *.dfm}

procedure GetProduto(Req: THorseRequest; Res: THorseResponse);
begin
  frmHorse.qry.Close;
  frmHorse.qry.Open;
  Res.Send(frmHorse.qry.ToJSONArray.ToString);
end;

procedure TfrmHorse.FormShow(Sender: TObject);
begin
  THorse.Get('/',
    procedure(Req: THorseRequest; Res: THorseResponse)
    begin
      Res.Send('Servidor ativo');
    end);

  THorse.Get('/produto', GetProduto);

  THorse.Listen(9000);

  lblHorse.Caption := 'Servidor Horse: ' + THorse.Port.ToString;
end;

end.
