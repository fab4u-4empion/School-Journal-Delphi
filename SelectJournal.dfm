object SelectJournalForm: TSelectJournalForm
  Left = 576
  Top = 349
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'SelectJournalForm'
  ClientHeight = 179
  ClientWidth = 421
  Color = clWhite
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
    Left = 8
    Top = -3
    Width = 405
    Height = 40
    Alignment = taCenter
    AutoSize = False
    Caption = #1042#1099#1073#1086#1088' '#1078#1091#1088#1085#1072#1083#1072
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
    Top = 101
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
  object Label4: TLabel
    Left = 8
    Top = 72
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
  object ClassesCBOX: TComboBox
    Left = 104
    Top = 46
    Width = 309
    Height = 23
    DropDownCount = 10
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = ClassesCBOXChange
  end
  object LessonsCBOX: TComboBox
    Left = 104
    Top = 104
    Width = 309
    Height = 23
    DropDownCount = 10
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = LessonsCBOXChange
  end
  object SelectJournalBtn: TButton
    Left = 8
    Top = 133
    Width = 405
    Height = 43
    Caption = 'f'
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = SelectJournalBtnClick
  end
  object QuaterCBOX: TComboBox
    Left = 104
    Top = 75
    Width = 309
    Height = 23
    DropDownCount = 10
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = QuaterCBOXChange
  end
end
