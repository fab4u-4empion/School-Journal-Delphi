object DeleteStudentForm: TDeleteStudentForm
  Left = 512
  Top = 299
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1091#1095#1077#1085#1080#1082#1072
  ClientHeight = 158
  ClientWidth = 561
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 6
    Width = 545
    Height = 40
    Alignment = taCenter
    AutoSize = False
    Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1091#1095#1077#1085#1080#1082#1072
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
    Width = 156
    Height = 23
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1091#1095#1077#1085#1080#1082#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object StudentsCBOX: TComboBox
    Left = 8
    Top = 81
    Width = 545
    Height = 23
    DropDownCount = 10
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = StudentsCBOXChange
  end
  object DeleteStudentBtn: TButton
    Left = 8
    Top = 110
    Width = 545
    Height = 43
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1091#1095#1077#1085#1080#1082#1072
    Enabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = DeleteStudentBtnClick
  end
end
