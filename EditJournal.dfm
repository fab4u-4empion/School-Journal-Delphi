object EditJournalForm: TEditJournalForm
  Left = 144
  Top = 100
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1078#1091#1088#1085#1072#1083#1072'.'
  ClientHeight = 538
  ClientWidth = 1290
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesigned
  OnCloseQuery = FormCloseQuery
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
    Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1078#1091#1088#1085#1072#1083#1072
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
    Left = 104
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
    Left = 8
    Top = 145
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
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing, goAlwaysShowEditor, goFixedRowClick]
    ParentFont = False
    TabOrder = 0
    OnDrawCell = StudentsSTRGDrawCell
    OnFixedCellClick = StudentsSTRGFixedCellClick
    OnKeyPress = StudentsSTRGKeyPress
    OnSetEditText = StudentsSTRGSetEditText
    ColWidths = (
      236
      242
      95
      113
      143)
  end
  object MainMenu1: TMainMenu
    Left = 392
    Top = 48
    object HelpBTN: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      ShortCut = 112
      OnClick = HelpBTNClick
    end
    object AddLessonBTN: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1088#1086#1082
      OnClick = AddLessonBTNClick
    end
    object SaveJournalBTN: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnClick = SaveJournalBTNClick
    end
  end
end
