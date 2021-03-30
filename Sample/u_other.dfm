object f_other: Tf_other
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'f_other'
  ClientHeight = 97
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    635
    97)
  PixelsPerInch = 96
  TextHeight = 13
  object lblSample: TLabel
    Left = 8
    Top = 8
    Width = 619
    Height = 53
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'lblSample'
    WordWrap = True
  end
  object Button1: TButton
    Left = 552
    Top = 67
    Width = 75
    Height = 25
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 0
  end
  object EzTranslate1: TEzTranslate
    Left = 104
    Top = 16
  end
end
