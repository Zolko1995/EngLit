unit Unit5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Data.Win.ADODB, Vcl.ExtActns, System.Actions, Vcl.ActnList,
  Vcl.DBCtrls, System.UITypes;

type
  TfrmManageUsers = class(TForm)
    DBGrid1: TDBGrid;
    lstUsers: TListBox;
    grpboxUsers: TGroupBox;
    grpboxPassword: TGroupBox;
    lblNewPassword: TLabel;
    edtPassword: TEdit;
    lblPasswordSecond: TLabel;
    edtPasswordSecond: TEdit;
    grpboxAdminSettings: TGroupBox;
    chckPlayer: TCheckBox;
    chckAdmin: TCheckBox;
    btnSaveSettings: TButton;
    btnExit: TButton;
    btnDeleteCurrentUser: TButton;
    ADOConnection1ManageUsers: TADOConnection;
    ADOTable1ManageUsers: TADOTable;
    DataSource1ManageUsers: TDataSource;
    ADOQuery1ManageUsers: TADOQuery;
    procedure btnExitClick(Sender: TObject);
    procedure btnSaveSettingsClick(Sender: TObject);
    procedure AddNewUserButtonClick(Sender: TObject);
    procedure btnDeleteCurrentUserClick(Sender: TObject);
    procedure chckPlayerClick(Sender: TObject);
    procedure chckAdminClick(Sender: TObject);
    procedure lstUsersClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManageUsers: TfrmManageUsers;

implementation

uses Unit1, Unit2, Unit3, Unit4;

var
  Users, Passwords: String;
  Administrators: Boolean;
  IDs: integer;

{$R *.dfm}

procedure TfrmManageUsers.AddNewUserButtonClick(Sender: TObject);
begin
  frmAddUser.ShowModal;
end;

procedure TfrmManageUsers.chckAdminClick(Sender: TObject);
begin
  if chckAdmin.Checked = True then
    chckPlayer.Checked := False;
end;

procedure TfrmManageUsers.btnDeleteCurrentUserClick(Sender: TObject);
begin
  showmessage('A(z) ' + lstUsers.Items.Strings[lstUsers.ItemIndex] +
    ' nevû felhasználót töröltük!');
  while ADOTable1ManageUsers.Locate('UserName',
    lstUsers.Items.Strings[lstUsers.ItemIndex], []) do
    ADOTable1ManageUsers.Delete;
  lstUsers.DeleteSelected;
end;

procedure TfrmManageUsers.btnExitClick(Sender: TObject);
begin
  frmManageUsers.Close;
end;

procedure TfrmManageUsers.FormActivate(Sender: TObject);
// var
// DBGridColumns: integer;
begin
  lstUsers.Clear;
  ADOQuery1ManageUsers.Close;
  ADOQuery1ManageUsers.SQL.Clear;
  ADOQuery1ManageUsers.SQL.Add
    ('SELECT ID, Username, Password, Admin FROM users');
  ADOQuery1ManageUsers.Open;
  // HIBAKEZELÉS!!!
  try
    ADOTable1ManageUsers.Open;
  except
    on E: Exception do
    begin
      MessageDlg('Az adatbázist nem sikerült megnyitni!' + E.ClassName, mtError,
        [mbOK], 0);
    end;
  end;
  // DBGrid sorok leméreztezése
  // for DBGridColumns := 0 to DBGrid1.Columns.Count - 1 do
  // DBGrid1.Columns[DBGridColumns].Width := 5 + DBGrid1.Canvas.TextWidth
  // (DBGrid1.Columns[DBGridColumns].Title.Caption);
  ADOQuery1ManageUsers.First;
  while not ADOQuery1ManageUsers.Eof do
  begin
    IDs := ADOQuery1ManageUsers.FieldByName('ID').AsInteger;
    Users := ADOQuery1ManageUsers.FieldByName('UserName').AsString;
    Passwords := ADOQuery1ManageUsers.FieldByName('Password').AsString;
    Administrators := ADOQuery1ManageUsers.FieldByName('Admin').AsBoolean;
    lstUsers.Items.Add(Users { +
        BoolToStr(Administrator) } );
    ADOQuery1ManageUsers.Next;
  end;
end;

procedure TfrmManageUsers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ADOQuery1ManageUsers.Close;
end;

procedure TfrmManageUsers.FormCreate(Sender: TObject);
begin
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);
end;

procedure TfrmManageUsers.lstUsersClick(Sender: TObject);
begin
  edtPassword.Text := '';
  edtPasswordSecond.Text := '';
  ADOQuery1ManageUsers.Close;
  ADOQuery1ManageUsers.SQL.Clear;
  ADOQuery1ManageUsers.SQL.Add
    ('SELECT ID, Username, Password, Admin FROM users');
  ADOQuery1ManageUsers.Open;
  ADOQuery1ManageUsers.Locate('UserName',
    lstUsers.Items.Strings[lstUsers.ItemIndex], []);
  if ADOQuery1ManageUsers.FieldByName('Admin').AsBoolean = True then
    chckAdmin.Checked := True
  else
    chckPlayer.Checked := True;
end;

procedure TfrmManageUsers.chckPlayerClick(Sender: TObject);
begin
  if chckPlayer.Checked = True then
    chckAdmin.Checked := False;
end;

procedure TfrmManageUsers.btnSaveSettingsClick(Sender: TObject);
begin
  if edtPassword.Text = edtPasswordSecond.Text then
    if chckPlayer.Checked then
    begin
      ADOQuery1ManageUsers.Close;
      ADOQuery1ManageUsers.SQL.Clear;
      ADOQuery1ManageUsers.SQL.Add
        ('SELECT ID, Username, Password, Admin FROM users');
      ADOQuery1ManageUsers.Open;
      ADOQuery1ManageUsers.Locate('UserName',
        lstUsers.Items.Strings[lstUsers.ItemIndex], []);
      ADOQuery1ManageUsers.Edit;
      ADOQuery1ManageUsers.FieldByName('Admin').AsBoolean := False;
      ADOQuery1ManageUsers.FieldByName('Password').AsString := edtPassword.Text;
      ADOQuery1ManageUsers.Post;
      ADOQuery1ManageUsers.Close;
    end
    else
    begin
      ADOQuery1ManageUsers.Close;
      ADOQuery1ManageUsers.SQL.Clear;
      ADOQuery1ManageUsers.SQL.Add
        ('SELECT ID, Username, Password, Admin FROM users');
      ADOQuery1ManageUsers.Open;
      ADOQuery1ManageUsers.Locate('UserName',
        lstUsers.Items.Strings[lstUsers.ItemIndex], []);
      ADOQuery1ManageUsers.Edit;
      ADOQuery1ManageUsers.FieldByName('Admin').AsBoolean := True;
      ADOQuery1ManageUsers.FieldByName('Password').AsString := edtPassword.Text;
      ADOQuery1ManageUsers.Post;
      ADOQuery1ManageUsers.Close;
    end;
end;

end.
