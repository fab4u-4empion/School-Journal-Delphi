object AddStudentForm: TAddStudentForm
  Left = 544
  Top = 332
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1091#1095#1077#1085#1080#1082#1072
  ClientHeight = 166
  ClientWidth = 396
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 0
    Width = 377
    Height = 38
    Alignment = taCenter
    AutoSize = False
    Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1091#1095#1077#1085#1080#1082#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Roboto Lt'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 52
    Width = 38
    Height = 23
    Caption = #1048#1084#1103
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 81
    Width = 81
    Height = 23
    Caption = #1060#1072#1084#1080#1083#1080#1103
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object StudentNameEdit: TEdit
    Left = 101
    Top = 56
    Width = 287
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = EditChange
    OnKeyPress = EditKeyPress
  end
  object StudentLastNameEdit: TEdit
    Left = 101
    Top = 85
    Width = 287
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = EditChange
    OnKeyPress = EditKeyPress
  end
  object AddStudentBtn: TButton
    Left = 8
    Top = 115
    Width = 380
    Height = 43
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1095#1077#1085#1080#1082#1072
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = AddStudentBtnClick
  end
  object MainMenu1: TMainMenu
    Left = 216
    object HelpBTN: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      ShortCut = 112
      OnClick = HelpBTNClick
    end
  end
end
