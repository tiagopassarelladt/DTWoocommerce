object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Demo - Woocommerce'
  ClientHeight = 517
  ClientWidth = 511
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 511
    Height = 177
    Align = alTop
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAME'
        Width = 324
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARENT'
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 8
    Top = 183
    Width = 113
    Height = 25
    Caption = 'Listar Categorias'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 127
    Top = 183
    Width = 98
    Height = 25
    Caption = 'Listar Pedidos'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 0
    Top = 214
    Width = 511
    Height = 303
    Align = alBottom
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
  object Woocommerce1: TWoocommerce
    Left = 400
    Top = 64
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 256
    Top = 40
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 160
    Top = 40
    object ClientDataSet1ID: TIntegerField
      FieldName = 'ID'
    end
    object ClientDataSet1NAME: TStringField
      FieldName = 'NAME'
      Size = 200
    end
    object ClientDataSet1PARENT: TStringField
      FieldName = 'PARENT'
      Size = 10
    end
  end
end
