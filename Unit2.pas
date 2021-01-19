unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB;

type
  TfrmAddUser = class(TForm)
    btnAddUser: TButton;
    btnExit: TButton;
    UserName: TLabel;
    UserPassword: TLabel;
    PasswordSecond: TLabel;
    edtUserName: TEdit;
    edtPassword: TEdit;
    edtPasswordSecond: TEdit;
    ADOTable1: TADOTable;
    ADOQuery1AddNewUser: TADOQuery;
    procedure btnExitClick(Sender: TObject);
    procedure btnAddUserClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddUser: TfrmAddUser;

implementation

uses Unit1, Unit3, Unit4, Unit5;

var
  Users: String;

{$R *.dfm}

procedure TfrmAddUser.btnAddUserClick(Sender: TObject);
begin
  if edtPassword.Text <> '' then
  begin
    if edtPassword.Text = edtPasswordSecond.Text then
    begin
      with ADOTable1 do
      begin
        ADOTable1.Active := True;
        // ADOTable1.Append;
        ADOTable1.Insert;
        ADOTable1['UserName'] := edtUserName.Text;
        ADOTable1['Password'] := edtPassword.Text;
        ADOTable1['Admin'] := False;
        ADOTable1.Post;
        edtUserName.Text := '';
        edtPassword.Text := '';
        edtPasswordSecond.Text := '';
        edtUserName.SetFocus;
        // ADOTable1.Refresh;
        // ADOTable1.Last;
        ADOTable1.Close;
      end;
    end
    else
      ShowMessage('The passwords does not match!');
  end
  else
    ShowMessage('Please fill the spaces!');
end;

procedure TfrmAddUser.btnExitClick(Sender: TObject);
begin
  frmAddUser.Close;
end;

procedure TfrmAddUser.FormActivate(Sender: TObject);
begin
  btnAddUser.Enabled := True;
  ADOQuery1AddNewUser.Close;
  ADOQuery1AddNewUser.SQL.Clear;
  ADOQuery1AddNewUser.SQL.Add
    ('SELECT ID, Username, Password, Admin FROM users');
  ADOQuery1AddNewUser.Open;
  ADOQuery1AddNewUser.Last;
end;

procedure TfrmAddUser.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  ADOQuery1AddNewUser.SQL.Clear;
  ADOQuery1AddNewUser.SQL.Add('SELECT ID, Username, Password, Admin ' +
    'FROM users ');
  ADOQuery1AddNewUser.Active := True;
  ADOQuery1AddNewUser.Last;
  Users := ADOQuery1AddNewUser.FieldByName('UserName').AsString;
  frmManageUsers.lstUsers.Items.Add(Users);
end;

procedure TfrmAddUser.FormCreate(Sender: TObject);
begin
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);
end;

end.
