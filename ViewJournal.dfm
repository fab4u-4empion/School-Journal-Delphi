object ViewJournalForm: TViewJournalForm
  Left = 160
  Top = 100
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1078#1091#1088#1085#1072#1083#1072
  ClientHeight = 539
  ClientWidth = 1285
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 1282
    Height = 40
    Alignment = taCenter
    AutoSize = False
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1078#1091#1088#1085#1072#1083#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Roboto Lt'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 43
    Width = 58
    Height = 23
    Caption = #1050#1083#1072#1089#1089':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 91
    Width = 85
    Height = 23
    Caption = #1055#1088#1077#1076#1084#1077#1090':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object LessonLabel: TLabel
    Left = 112
    Top = 96
    Width = 90
    Height = 19
    Caption = 'LessonLabel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto Lt'
    Font.Style = []
    ParentFont = False
  end
  object ClassNameLabel: TLabel
    Left = 112
    Top = 46
    Width = 48
    Height = 19
    Caption = 'Label4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto Lt'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 67
    Width = 90
    Height = 23
    Caption = #1063#1077#1090#1074#1077#1088#1090#1100':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object QuaterLabel: TLabel
    Left = 112
    Top = 71
    Width = 90
    Height = 19
    Caption = 'LessonLabel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto Lt'
    Font.Style = []
    ParentFont = False
  end
  object IsNotUnderStudy: TLabel
    Left = 8
    Top = 120
    Width = 235
    Height = 19
    Caption = '*'#1055#1088#1077#1076#1084#1077#1090' '#1073#1086#1083#1100#1096#1077' '#1085#1077' '#1080#1079#1091#1095#1072#1077#1090#1089#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'Roboto Lt'
    Font.Style = []
    ParentFont = False
  end
  object StudentsSTRG: TStringGrid
    Left = 3
    Top = 149
    Width = 1274
    Height = 385
    DefaultColWidth = 46
    FixedColor = clSilver
    FixedCols = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect, goFixedRowClick]
    ParentFont = False
    TabOrder = 0
    OnDrawCell = StudentsSTRGDrawCell
    OnFixedCellClick = StudentsSTRGFixedCellClick
    ColWidths = (
      236
      242
      95
      113
      143)
  end
end
