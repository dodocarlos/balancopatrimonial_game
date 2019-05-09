object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Balan'#231'o Patrimonial'
  ClientHeight = 496
  ClientWidth = 686
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
    Left = 343
    Top = 171
    Width = 343
    Height = 243
    Align = alRight
    DragMode = dmAutomatic
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemHeight = 17
    ParentFont = False
    TabOrder = 1
    ExplicitHeight = 268
  end
  object lstDebitos: TListBox
    Tag = 1
    Left = 0
    Top = 171
    Width = 343
    Height = 243
    Align = alLeft
    DragMode = dmAutomatic
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemHeight = 17
    ParentFont = False
    TabOrder = 2
    ExplicitHeight = 268
  end
  object lstGeral: TListBox
    Left = 0
    Top = 0
    Width = 686
    Height = 166
    Align = alTop
    DragMode = dmAutomatic
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemHeight = 17
    ParentFont = False
    TabOrder = 0
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 414
    Width = 686
    Height = 82
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitTop = 413
    object Label1: TLabel
      Left = 104
      Top = 31
      Width = 63
      Height = 13
      Caption = 'Total D'#233'bitos'
    end
    object Label2: TLabel
      Left = 312
      Top = 31
      Width = 64
      Height = 13
      Caption = 'Total Balan'#231'o'
    end
    object Label3: TLabel
      Left = 504
      Top = 31
      Width = 67
      Height = 13
      Caption = 'Total Cr'#233'ditos'
    end
    object lblTotal: TStaticText
      Left = 312
      Top = 6
      Width = 67
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
      Left = 504
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
    object btnValidar: TButton
      Left = 304
      Top = 50
      Width = 75
      Height = 25
      Caption = 'Validar'
      TabOrder = 3
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 166
    Width = 686
    Height = 5
    Align = alTop
    BevelOuter = bvNone
    Color = clBlack
    ParentBackground = False
    TabOrder = 4
  end
  object Panel2: TPanel
    Left = 343
    Top = 171
    Width = 5
    Height = 243
    Align = alLeft
    BevelOuter = bvNone
    Color = clBlack
    ParentBackground = False
    TabOrder = 5
    ExplicitHeight = 268
  end
end
