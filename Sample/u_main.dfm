object F_main: TF_main
  Left = 0
  Top = 0
  Caption = 'F_main'
  ClientHeight = 187
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    635
    187)
  PixelsPerInch = 96
  TextHeight = 13
  object lblWellcome: TLabel
    Left = 8
    Top = 8
    Width = 619
    Height = 41
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'lblWellcome'
    WordWrap = True
  end
  object btnPortuguese: TButton
    Left = 8
    Top = 59
    Width = 75
    Height = 25
    Hint = 'Load the portugues language'
    Caption = 'btnPortuguese'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = btnPortugueseClick
  end
  object btnEnglish: TButton
    Left = 89
    Top = 59
    Width = 75
    Height = 25
    Hint = 'Load the english language'
    Caption = 'btnEnglish'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btnEnglishClick
  end
  object btnSpanish: TButton
    Left = 170
    Top = 59
    Width = 75
    Height = 25
    Hint = 'Load the spanish language'
    Caption = 'btnSpanish'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnSpanishClick
  end
  object memMessage: TMemo
    Left = 8
    Top = 90
    Width = 619
    Height = 89
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'Memo with '
      'multiple lines')
    TabOrder = 3
  end
  object btnMessage1: TButton
    Left = 251
    Top = 59
    Width = 75
    Height = 25
    Caption = 'btnPortuguese'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = btnMessage1Click
  end
  object btnMessage2: TButton
    Left = 332
    Top = 59
    Width = 75
    Height = 25
    Caption = 'btnPortuguese'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = btnMessage2Click
  end
  object btnSeccondForm: TButton
    Left = 413
    Top = 59
    Width = 75
    Height = 25
    Caption = 'btnPortuguese'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = btnSeccondFormClick
  end
  object EzTranslate1: TEzTranslate
    Left = 344
    Top = 104
  end
  object MainMenu1: TMainMenu
    Left = 376
    Top = 104
    object File1: TMenuItem
      Caption = 'File'
      object New1: TMenuItem
        Caption = 'New'
      end
      object Open1: TMenuItem
        Caption = 'Open'
      end
      object Close1: TMenuItem
        Caption = 'Close'
      end
    end
    object About1: TMenuItem
      Caption = 'About'
      OnClick = About1Click
    end
  end
end
