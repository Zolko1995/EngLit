object frmMainMenu: TfrmMainMenu
  Left = 0
  Top = 0
  VertScrollBar.ParentColor = False
  AlphaBlendValue = 155
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'EngLit'
  ClientHeight = 249
  ClientWidth = 645
  Color = clBtnFace
  TransparentColor = True
  TransparentColorValue = clLime
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmUser
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblUserName: TLabel
    Left = 8
    Top = 13
    Width = 26
    Height = 13
    Caption = 'User:'
  end
  object lblQuestion: TLabel
    Left = 177
    Top = 29
    Width = 47
    Height = 13
    Caption = 'Question:'
    Visible = False
  end
  object lblAnswer: TLabel
    Left = 184
    Top = 48
    Width = 40
    Height = 13
    Caption = 'Answer:'
    Visible = False
  end
  object lblPoints: TLabel
    Left = 8
    Top = 32
    Width = 93
    Height = 13
    Caption = 'Correct Answers: 0'
  end
  object Date: TLabel
    Left = 8
    Top = 67
    Width = 27
    Height = 13
    Caption = 'Date:'
  end
  object lblUserRights: TLabel
    Left = 74
    Top = 13
    Width = 3
    Height = 13
  end
  object lblPoints2: TLabel
    Left = 8
    Top = 48
    Width = 101
    Height = 13
    Caption = 'Incorrect Answers: 0'
  end
  object edtQuestion: TEdit
    Left = 223
    Top = 21
    Width = 346
    Height = 21
    Color = clBtnFace
    DoubleBuffered = False
    ParentDoubleBuffered = False
    ReadOnly = True
    TabOrder = 0
    Visible = False
    StyleElements = [seClient, seBorder]
  end
  object edtAnswer: TEdit
    Left = 223
    Top = 48
    Width = 346
    Height = 21
    TabOrder = 1
    Visible = False
  end
  object btnNext: TButton
    Left = 223
    Top = 102
    Width = 75
    Height = 25
    Hint = 'Next'
    Caption = '&Next'
    ImageIndex = 2
    TabOrder = 2
    Visible = False
    OnClick = btnNextClick
  end
  object edtCorrectAnswer: TEdit
    Left = 223
    Top = 75
    Width = 346
    Height = 21
    TabOrder = 3
    Visible = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 149
    Width = 629
    Height = 172
    DataSource = DataSource1
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
  end
  object mmUser: TMainMenu
    Left = 576
    Top = 8
    object LearnMenuLocked: TMenuItem
      Caption = '&Content'
      object LearningMenuLocked: TMenuItem
        Bitmap.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
          333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
          C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
          F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
          F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
          00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
          3333333373FF7333333333333000333333333333377733333333333333333333
          3333333333333333333333333333333333333333333333333333}
        Caption = '&Topics...'
        ImageIndex = 5
        ShortCut = 113
        OnClick = LearningMenuLockedClick
      end
    end
    object PracticeMenuLocked: TMenuItem
      Caption = '&Exercise'
      object TestMenuLocked: TMenuItem
        Bitmap.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555500000000
          0555555F7777777775F55500FFFFFFFFF0555577F5FFFFFFF7F550F0FEEEEEEE
          F05557F7F777777757F550F0FFFFFFFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
          F05557F7F777777757F550F0FF777FFFF05557F7F5FFFFFFF7F550F0FEEEEEEE
          F05557F7F777777757F550F0FF7F777FF05557F7F5FFFFFFF7F550F0FEEEEEEE
          F05557F7F777777757F550F0FF77F7FFF05557F7F5FFFFFFF7F550F0FEEEEEEE
          F05557F7F777777757F550F0FFFFFFFFF05557F7FF5F5F5F57F550F00F0F0F0F
          005557F77F7F7F7F77555055070707070555575F7F7F7F7F7F55550507070707
          0555557575757575755555505050505055555557575757575555}
        Caption = '&Test...'
        ImageIndex = 6
        ShortCut = 117
        OnClick = TestMenuLockedClick
      end
      object GameMenuLocked: TMenuItem
        Caption = '&Game...'
        ShortCut = 118
        OnClick = GameMenuLockedClick
      end
    end
    object HelpMenuLocked: TMenuItem
      Bitmap.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333F797F3333333333F737373FF333333BFB999BFB
        33333337737773773F3333BFBF797FBFB33333733337333373F33BFBFBFBFBFB
        FB3337F33333F33337F33FBFBFB9BFBFBF3337333337F333373FFBFBFBF97BFB
        FBF37F333337FF33337FBFBFBFB99FBFBFB37F3333377FF3337FFBFBFBFB99FB
        FBF37F33333377FF337FBFBF77BF799FBFB37F333FF3377F337FFBFB99FB799B
        FBF373F377F3377F33733FBF997F799FBF3337F377FFF77337F33BFBF99999FB
        FB33373F37777733373333BFBF999FBFB3333373FF77733F7333333BFBFBFBFB
        3333333773FFFF77333333333FBFBF3333333333377777333333}
      Caption = '&Help'
      object SendEmail: TMenuItem
        Caption = '&Contact...'
        ImageIndex = 3
        ShortCut = 122
        OnClick = SendEmailClick
      end
      object AboutMenuLocked: TMenuItem
        Bitmap.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
          333333333337FF3333333333330003333333333333777F333333333333080333
          3333333333777F3333333333330003333333333333777F3333333333330F0333
          33333333337F7F3333333333330F033333333333337373F33333333330F7F033
          333333333737F73F333333330FF7FF03333333337F37F37F333333330FF7FF03
          333333337F37337F333333330FFFFF033333333373F333733333333330FFF033
          33333333373FF733333333333300033333333333337773333333333333333333
          3333333333333333333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        Caption = '&Impressum...'
        ImageIndex = 4
        ShortCut = 123
        OnClick = AboutMenuLockedClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object ExitMenuLocked: TMenuItem
        Bitmap.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300130000031
          00333773F77777FF7733331000909000133333377737F777FF33330098F0F890
          0333337733F733F77F33370980FFF08907333373373F373373F33099FF0FFFF9
          903337F3F373F33FF7F33090FFF0FF00903337F73337F37737F33099FFF0FFF9
          9033373F33F7F3F33733370980F0F0890733337FF737F7337F33330098F0F890
          03333F77FF3733377FFF000009999900000377777FFFFF77777F088700000008
          77037F3377777773337F088887707888870373F3337773F33373307880707088
          7033373FF737F73FF733337003303300733333777337FF777333333333000333
          3333333333777333333333333333333333333333333333333333}
        Caption = '&Exit...'
        ImageIndex = 0
        ShortCut = 32883
        OnClick = ExitMenuLockedClick
      end
    end
  end
  object mmAdmin: TMainMenu
    Left = 608
    Top = 8
    object LearnMenuAdmin: TMenuItem
      Caption = '&Content'
      object LearningMenuAdmin: TMenuItem
        Caption = '&Topics'
        ImageIndex = 5
        ShortCut = 113
      end
    end
    object PracticeMenuAdmin: TMenuItem
      Caption = '&Exercise'
      object TestMenuAdmin: TMenuItem
        Caption = '&Test'
        ImageIndex = 6
        ShortCut = 117
        OnClick = TestMenuAdminClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object AddNewQuestionMenuAdmin: TMenuItem
        Caption = 'Add questions...'
        ImageIndex = 8
        ShortCut = 118
        OnClick = AddNewQuestionMenuAdminClick
      end
    end
    object HelpMenuAdmin: TMenuItem
      Caption = '&Help'
      object SendEmailAdmin: TMenuItem
        Caption = '&Contact'
        ImageIndex = 3
        ShortCut = 123
        OnClick = SendEmailAdminClick
      end
      object AboutMenuAdmin: TMenuItem
        Caption = '&Impressum...'
        ImageIndex = 4
        ShortCut = 112
        OnClick = AboutMenuAdminClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object ManageUserAdmin: TMenuItem
        Caption = '&User options...'
        ImageIndex = 1
        ShortCut = 114
        OnClick = ManageUserAdminClick
      end
      object ExitMenuAdmin: TMenuItem
        Caption = '&Exit'
        ImageIndex = 0
        ShortCut = 32883
      end
    end
  end
  object ADOConnection1GameForm: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.ACE.OLEDB.12.0;Data Source=c:\Programom\users' +
      '.accdb;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 616
    Top = 128
  end
  object ADOQuery1GameForm: TADOQuery
    Connection = ADOConnection1GameForm
    Parameters = <>
    Left = 616
    Top = 160
  end
  object ADOTable1GameForm: TADOTable
    Connection = ADOConnection1GameForm
    TableName = 'users'
    Left = 616
    Top = 192
  end
  object ADOConnection2GameForm: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.ACE.OLEDB.12.0;Data Source=c:\Programom\quest' +
      'ion.accdb;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 584
    Top = 296
  end
  object ADOTable2GameForm: TADOTable
    Connection = ADOConnection2GameForm
    MasterSource = DataSource1
    TableName = 'questions'
    Left = 520
    Top = 296
  end
  object ADOQuery2GameForm: TADOQuery
    Connection = ADOConnection2GameForm
    Parameters = <>
    Left = 552
    Top = 296
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery2GameForm
    Left = 616
    Top = 296
  end
end
