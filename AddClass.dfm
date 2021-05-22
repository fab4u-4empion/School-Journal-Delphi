object AddClassForm: TAddClassForm
  Left = 560
  Top = 216
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1082#1083#1072#1089#1089#1072
  ClientHeight = 448
  ClientWidth = 388
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
    Left = 10
    Top = 0
    Width = 370
    Height = 38
    Alignment = taCenter
    AutoSize = False
    Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1082#1083#1072#1089#1089#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Roboto Lt'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 52
    Width = 125
    Height = 23
    Caption = #1053#1086#1084#1077#1088' '#1082#1083#1072#1089#1089#1072
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 81
    Width = 217
    Height = 23
    Caption = #1041#1091#1082#1074#1077#1085#1085#1086#1077' '#1086#1073#1086#1079#1085#1072#1095#1077#1085#1080#1077
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 111
    Width = 370
    Height = 23
    Alignment = taCenter
    AutoSize = False
    Caption = #1048#1079#1091#1095#1072#1077#1084#1099#1077' '#1087#1088#1077#1076#1084#1077#1090#1099
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object NumberOfClassEdit: TSpinEdit
    Left = 152
    Top = 52
    Width = 226
    Height = 24
    EditorEnabled = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = []
    MaxValue = 11
    MinValue = 1
    ParentFont = False
    TabOrder = 0
    Value = 1
  end
  object ClassLetterEdit: TEdit
    Left = 231
    Top = 82
    Width = 147
    Height = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnChange = ClassLetterEditChange
    OnKeyPress = ClassLetterEditKeyPress
  end
  object ScrollBox: TScrollBox
    Left = 8
    Top = 139
    Width = 370
    Height = 254
    VertScrollBar.Increment = 22
    VertScrollBar.ParentColor = False
    VertScrollBar.Tracking = True
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 3
    object CheckBox1: TCheckBox
      Left = 3
      Top = 3
      Width = 345
      Height = 17
      Caption = #1041#1077#1083#1086#1088#1091#1089#1089#1082#1080#1081' '#1103#1079#1099#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object CheckBox2: TCheckBox
      Left = 3
      Top = 26
      Width = 345
      Height = 17
      Caption = #1041#1077#1083#1086#1088#1091#1089#1089#1082#1072#1103' '#1083#1080#1090#1077#1088#1072#1090#1091#1088#1072' ('#1083#1080#1090#1077#1088#1072#1090#1091#1088#1085#1086#1077' '#1095#1090#1077#1085#1080#1077')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object CheckBox3: TCheckBox
      Left = 3
      Top = 49
      Width = 345
      Height = 17
      Caption = #1056#1091#1089#1089#1082#1080#1081' '#1103#1079#1099#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object CheckBox4: TCheckBox
      Left = 3
      Top = 72
      Width = 345
      Height = 17
      Caption = #1056#1091#1089#1089#1082#1072#1103' '#1083#1080#1090#1077#1088#1072#1090#1091#1088#1072' ('#1083#1080#1090#1077#1088#1072#1090#1091#1088#1085#1086#1077' '#1095#1090#1077#1085#1080#1077')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object CheckBox5: TCheckBox
      Left = 3
      Top = 95
      Width = 345
      Height = 17
      Caption = #1048#1085#1086#1089#1090#1088#1072#1085#1085#1099#1081' '#1103#1079#1099#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object CheckBox6: TCheckBox
      Left = 3
      Top = 118
      Width = 345
      Height = 17
      Caption = #1052#1072#1090#1077#1084#1072#1090#1080#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object CheckBox7: TCheckBox
      Left = 3
      Top = 141
      Width = 345
      Height = 17
      Caption = #1048#1085#1092#1086#1088#1084#1072#1090#1080#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object CheckBox8: TCheckBox
      Left = 3
      Top = 164
      Width = 345
      Height = 17
      Caption = #1063#1077#1083#1086#1074#1077#1082' '#1080' '#1084#1080#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object CheckBox9: TCheckBox
      Left = 3
      Top = 187
      Width = 345
      Height = 17
      Caption = #1042#1089#1077#1084#1080#1088#1085#1072#1103' '#1080#1089#1090#1086#1088#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object CheckBox10: TCheckBox
      Left = 3
      Top = 210
      Width = 345
      Height = 17
      Caption = #1048#1089#1090#1086#1088#1080#1103' '#1041#1077#1083#1072#1088#1091#1089#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
    end
    object CheckBox11: TCheckBox
      Left = 3
      Top = 233
      Width = 345
      Height = 17
      Caption = #1054#1073#1097#1077#1089#1090#1074#1086#1074#1077#1076#1077#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
    end
    object CheckBox12: TCheckBox
      Left = 3
      Top = 256
      Width = 345
      Height = 17
      Caption = #1043#1077#1086#1075#1088#1072#1092#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
    object CheckBox13: TCheckBox
      Left = 3
      Top = 279
      Width = 345
      Height = 17
      Caption = #1041#1080#1086#1083#1086#1075#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
    end
    object CheckBox14: TCheckBox
      Left = 3
      Top = 302
      Width = 345
      Height = 17
      Caption = #1060#1080#1079#1080#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
    end
    object CheckBox15: TCheckBox
      Left = 3
      Top = 325
      Width = 345
      Height = 17
      Caption = #1040#1089#1090#1088#1086#1085#1086#1084#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
    end
    object CheckBox16: TCheckBox
      Left = 3
      Top = 348
      Width = 345
      Height = 17
      Caption = #1061#1080#1084#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
    end
    object CheckBox17: TCheckBox
      Left = 3
      Top = 371
      Width = 345
      Height = 17
      Caption = #1048#1079#1086#1073#1088#1072#1079#1080#1090#1077#1083#1100#1085#1086#1077' '#1080#1089#1082#1091#1089#1089#1090#1074#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 16
    end
    object CheckBox18: TCheckBox
      Left = 3
      Top = 394
      Width = 345
      Height = 17
      Caption = #1052#1091#1079#1099#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 17
    end
    object CheckBox19: TCheckBox
      Left = 3
      Top = 417
      Width = 345
      Height = 17
      Caption = #1058#1088#1091#1076#1086#1074#1086#1077' '#1086#1073#1091#1095#1077#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 18
    end
    object CheckBox20: TCheckBox
      Left = 3
      Top = 440
      Width = 345
      Height = 17
      Caption = #1048#1089#1082#1091#1089#1089#1090#1074#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 19
    end
    object CheckBox21: TCheckBox
      Left = 3
      Top = 463
      Width = 345
      Height = 17
      Caption = #1063#1077#1088#1095#1077#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 20
    end
    object CheckBox22: TCheckBox
      Left = 3
      Top = 486
      Width = 345
      Height = 17
      Caption = #1060#1080#1079#1080#1095#1077#1089#1082#1072#1103' '#1082#1091#1083#1100#1090#1091#1088#1072' '#1080' '#1079#1076#1086#1088#1086#1074#1100#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 21
    end
    object CheckBox23: TCheckBox
      Left = 3
      Top = 509
      Width = 345
      Height = 17
      Caption = #1044#1086#1087#1088#1080#1079#1099#1074#1085#1072#1103' '#1080' '#1084#1077#1076#1080#1094#1080#1085#1089#1082#1072#1103' '#1087#1086#1076#1075#1086#1090#1086#1074#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 22
    end
    object CheckBox24: TCheckBox
      Left = 3
      Top = 532
      Width = 345
      Height = 17
      Caption = #1054#1089#1085#1086#1074#1099' '#1073#1077#1079#1086#1087#1072#1089#1085#1086#1089#1090#1080' '#1078#1080#1079#1085#1077#1076#1077#1103#1090#1077#1083#1100#1085#1086#1089#1090#1080' '#1095#1077#1083#1086#1074#1077#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 23
    end
  end
  object AddClassBtn: TButton
    Left = 8
    Top = 397
    Width = 372
    Height = 43
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1083#1072#1089#1089
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = AddClassBtnClick
  end
  object MainMenu1: TMainMenu
    Left = 272
    Top = 160
    object HelpBTN: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      ShortCut = 112
      OnClick = HelpBTNClick
    end
  end
end
