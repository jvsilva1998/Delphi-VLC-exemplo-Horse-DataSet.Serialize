object frmHorse: TfrmHorse
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 158
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object lblHorse: TLabel
    Left = 104
    Top = 40
    Width = 124
    Height = 25
    Caption = 'Servidor horse'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object conn: TFDConnection
    Params.Strings = (
      'Database=C:\Users\PC\Downloads\db_teste\DADOS.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 80
  end
  object qry: TFDQuery
    Connection = conn
    SQL.Strings = (
      'select p.codigo, p.descricao from produto p')
    Left = 96
    Top = 80
  end
end
