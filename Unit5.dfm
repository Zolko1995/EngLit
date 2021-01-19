object frmManageUsers: TfrmManageUsers
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'User Settings'
  ClientHeight = 336
  ClientWidth = 306
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001001010000000002000680400001600000028000000100000002000
    000001002000000000004004000000000000000000000000000000000000FFFF
    FF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF016D6D6D63585858BF5151
    51BF52525263FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFF
    FF01FFFFFF01FFFFFF016F6F6F296A6A6A0F7A7A7A03818181EBBDBDBDFFB2B2
    B2FF5B5B5BEB5A5A5A035C5C5C0F4E4E4E29FFFFFF01FFFFFF01FFFFFF01FFFF
    FF01FFFFFF018181819B6F6F6FFD646464E776767619838383E7CBCBCBFFC7C7
    C7FF626262E75A5A5A19585858E74E4E4EFD4949499BFFFFFF01FFFFFF01FFFF
    FF01A4A4A47BBCBCBCFFDEDEDEFFA6A6A6FF838383F5858585FFC4C4C4FFC2C2
    C2FF6D6D6DFF6E6E6EF5A6A6A6FFD2D2D2FF808080FF5252527BFFFFFF01FFFF
    FF01ABABAB7DA6A6A6FFD5D5D5FFC5C5C5FFCBCBCBFFD1D1D1FFC9C9C9FFC7C7
    C7FFCCCCCCFFC5C5C5FFBDBDBDFFCBCBCBFF6E6E6EFF6767677DFFFFFF01FFFF
    FF01FFFFFF01ACACAC85C5C5C5FFC1C1C1FFC5C5C5FFC7C7C7FFAAAAAAFFA7A7
    A7FFC1C1C1FFBEBEBEFFB5B5B5FFAAAAAAFF69696985FFFFFF01FFFFFF01A3A3
    A3CD8F8F8FE3A0A0A0EFCFCFCFFFC6C6C6FFCCCCCCFF9E9E9EC7999999459494
    94458F8F8FC7C1C1C1FFBCBCBCFFB9B9B9FF646464EF585858E3535353CDBFBF
    BFFDE2E2E2FFD2D2D2FFC6C6C6FFCDCDCDFFB1B1B1FF93939345FFFFFF01FFFF
    FF0195959545A8A8A8FFC2C2C2FFB7B7B7FFC0C0C0FFD2D2D2FF616161FDC4C4
    C4FDE9E9E9FFD6D6D6FFC9C9C9FFCECECEFFA5A5A5FF84848445FFFFFF01FFFF
    FF019A9A9A45ACACACFFC4C4C4FFBABABAFFC6C6C6FFDDDDDDFF6B6B6BFDC8C8
    C8CDC4C4C4E3C0C0C0EFD8D8D8FFCDCDCDFFBCBCBCFF828282C7777777457E7E
    7E458F8F8FC7C3C3C3FFC2C2C2FFCDCDCDFF8C8C8CEF878787E3838383CDFFFF
    FF01FFFFFF01C5C5C585D4D4D4FFCCCCCCFFC9C9C9FFBABABAFF9C9C9CFFA1A1
    A1FFC2C2C2FFC6C6C6FFC1C1C1FFB7B7B7FF89898985FFFFFF01FFFFFF01FFFF
    FF01CACACA7DC4C4C4FFDCDCDCFFD4D4D4FFD9D9D9FFDBDBDBFFD6D6D6FFD4D4
    D4FFD9D9D9FFD2D2D2FFCBCBCBFFC8C8C8FF797979FF7171717DFFFFFF01FFFF
    FF01D0D0D07BDCDCDCFFEDEDEDFFDBDBDBFFC2C2C2F5BEBEBEFFD6D6D6FFD4D4
    D4FFB0B0B0FFACACACF5CBCBCBFFE7E7E7FFB7B7B7FF8B8B8B7BFFFFFF01FFFF
    FF01FFFFFF01D1D1D19BCECECEFDCACACAE7C6C6C619C2C2C2E7DEDEDEFFDDDD
    DDFFB2B2B2E7B1B1B119ACACACE7A7A7A7FDA3A3A39BFFFFFF01FFFFFF01FFFF
    FF01FFFFFF01FFFFFF01D1D1D129CECECE0FCBCBCB03C7C7C7EBE5E5E5FFE4E4
    E4FFACACACEBB6B6B603B2B2B20FADADAD29FFFFFF01FFFFFF01FFFFFF01FFFF
    FF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01CBCBCB63C7C7C7BFC4C4
    C4BFBFBFBF63FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF01FFFFFF010000
    FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000
    FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF}
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grpboxUsers: TGroupBox
    Left = 8
    Top = 8
    Width = 129
    Height = 233
    Caption = 'Users'
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 340
    Width = 290
    Height = 100
    DataSource = DataSource1ManageUsers
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
  end
  object lstUsers: TListBox
    Left = 16
    Top = 24
    Width = 113
    Height = 209
    Columns = 1
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
    OnClick = lstUsersClick
  end
  object grpboxPassword: TGroupBox
    Left = 143
    Top = 8
    Width = 154
    Height = 113
    Caption = 'Change Password'
    TabOrder = 3
    object lblNewPassword: TLabel
      Left = 19
      Top = 16
      Width = 74
      Height = 13
      Caption = 'New Password:'
    end
    object lblPasswordSecond: TLabel
      Left = 19
      Top = 62
      Width = 90
      Height = 13
      Caption = 'Confirm Password:'
    end
    object edtPassword: TEdit
      Left = 19
      Top = 35
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 0
    end
    object edtPasswordSecond: TEdit
      Left = 19
      Top = 81
      Width = 121
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
  end
  object grpboxAdminSettings: TGroupBox
    Left = 143
    Top = 127
    Width = 154
    Height = 114
    Caption = 'Administration Settings'
    TabOrder = 4
    object chckPlayer: TCheckBox
      Left = 24
      Top = 27
      Width = 97
      Height = 17
      Caption = 'User'
      TabOrder = 0
      OnClick = chckPlayerClick
    end
    object chckAdmin: TCheckBox
      Left = 24
      Top = 75
      Width = 97
      Height = 17
      Caption = 'Admin'
      TabOrder = 1
      OnClick = chckAdminClick
    end
  end
  object btnSaveSettings: TButton
    Left = 8
    Top = 278
    Width = 289
    Height = 25
    Caption = 'Save Settings'
    TabOrder = 6
    OnClick = btnSaveSettingsClick
  end
  object btnExit: TButton
    Left = 8
    Top = 309
    Width = 289
    Height = 25
    Caption = 'Exit'
    TabOrder = 7
    OnClick = btnExitClick
  end
  object btnDeleteCurrentUser: TButton
    Left = 8
    Top = 247
    Width = 289
    Height = 25
    Caption = 'Delete User'
    TabOrder = 5
    OnClick = btnDeleteCurrentUserClick
  end
  object ADOConnection1ManageUsers: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.ACE.OLEDB.12.0;Data Source=c:\Programom\users' +
      '.accdb;Persist Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 304
    Top = 144
  end
  object ADOTable1ManageUsers: TADOTable
    Active = True
    Connection = ADOConnection1ManageUsers
    CursorType = ctStatic
    TableName = 'users'
    Left = 304
    Top = 96
  end
  object DataSource1ManageUsers: TDataSource
    DataSet = ADOTable1ManageUsers
    Left = 304
    Top = 48
  end
  object ADOQuery1ManageUsers: TADOQuery
    Connection = ADOConnection1ManageUsers
    DataSource = DataSource1ManageUsers
    Parameters = <>
    Left = 304
    Top = 8
  end
end
