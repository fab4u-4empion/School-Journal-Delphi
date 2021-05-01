object AddLessonForm: TAddLessonForm
  Left = 496
  Top = 233
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1091#1088#1086#1082#1072
  ClientHeight = 272
  ClientWidth = 532
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesigned
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 529
    Height = 40
    Alignment = taCenter
    AutoSize = False
    Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1091#1088#1086#1082#1072
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
    Width = 125
    Height = 23
    Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 101
    Width = 180
    Height = 23
    Caption = #1044#1086#1084#1072#1096#1085#1077#1077' '#1079#1072#1076#1072#1085#1080#1077':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 159
    Width = 50
    Height = 23
    Caption = #1044#1072#1090#1072':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object LessonInfoEdit: TEdit
    Left = 8
    Top = 72
    Width = 516
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object HomeWorkEdit: TEdit
    Left = 8
    Top = 130
    Width = 516
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object LessonDate: TDateTimePicker
    Left = 8
    Top = 188
    Width = 516
    Height = 23
    Date = 44313.000000000000000000
    Time = 0.966616226854967000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object AddLessonBTN: TButton
    Left = 8
    Top = 217
    Width = 516
    Height = 49
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1088#1086#1082
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = AddLessonBTNClick
  end
  object MainMenu1: TMainMenu
    Left = 216
    Top = 72
    object HelpBTN: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      ShortCut = 112
      OnClick = HelpBTNClick
    end
  end
end
