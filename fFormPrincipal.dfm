object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Balan'#231'o Patrimonial'
  ClientHeight = 446
  ClientWidth = 598
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lstCreditos: TListBox
    Tag = 2
    Left = 300
    Top = 144
    Width = 298
    Height = 248
    Align = alRight
    DragMode = dmAutomatic
    ItemHeight = 13
    TabOrder = 1
  end
  object lstDebitos: TListBox
    Tag = 1
    Left = 0
    Top = 144
    Width = 295
    Height = 248
    Align = alLeft
    DragMode = dmAutomatic
    ItemHeight = 13
    TabOrder = 2
  end
  object lstGeral: TListBox
    Left = 0
    Top = 0
    Width = 598
    Height = 139
    Align = alTop
    DragMode = dmAutomatic
    ItemHeight = 13
    TabOrder = 0
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 392
    Width = 598
    Height = 54
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object Label1: TLabel
      Left = 104
      Top = 31
      Width = 63
      Height = 13
      Caption = 'Total D'#233'bitos'
    end
    object Label2: TLabel
      Left = 264
      Top = 31
      Width = 64
      Height = 13
      Caption = 'Total Balan'#231'o'
    end
    object Label3: TLabel
      Left = 440
      Top = 31
      Width = 67
      Height = 13
      Caption = 'Total Cr'#233'ditos'
    end
    object lblTotal: TStaticText
      Left = 264
      Top = 6
      Width = 64
      Height = 23
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object lblTotalDebitos: TStaticText
      Left = 104
      Top = 6
      Width = 63
      Height = 23
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object lblTotalCreditos: TStaticText
      Left = 440
      Top = 6
      Width = 67
      Height = 23
      Alignment = taCenter
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 139
    Width = 598
    Height = 5
    Align = alTop
    BevelOuter = bvNone
    Color = clBlack
    ParentBackground = False
    TabOrder = 4
  end
  object Panel2: TPanel
    Left = 295
    Top = 144
    Width = 5
    Height = 248
    Align = alLeft
    BevelOuter = bvNone
    Color = clBlack
    ParentBackground = False
    TabOrder = 5
  end
end
