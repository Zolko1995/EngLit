object frmAddNewQuestion: TfrmAddNewQuestion
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'New Question'
  ClientHeight = 88
  ClientWidth = 193
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblQuestion: TLabel
    Left = 8
    Top = 8
    Width = 47
    Height = 13
    Caption = 'Question:'
  end
  object lblAnswer: TLabel
    Left = 15
    Top = 32
    Width = 40
    Height = 13
    Caption = 'Answer:'
  end
  object edtQuestion: TEdit
    Left = 51
    Top = 5
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtAnswer: TEdit
    Left = 51
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 8
    Top = 59
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 105
    Top = 59
    Width = 75
    Height = 25
    Caption = 'Exit'
    TabOrder = 3
    OnClick = Button2Click
  end
  object ADOQuery1AddNewQuestion: TADOQuery
    Connection = frmMainMenu.ADOConnection2GameForm
    Parameters = <>
    Left = 272
    Top = 8
  end
  object ADOTable1AddNewQuestion: TADOTable
    Connection = frmMainMenu.ADOConnection2GameForm
    TableName = 'questions'
    Left = 240
    Top = 64
  end
end
