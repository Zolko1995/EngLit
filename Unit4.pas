unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Data.DB,
  Data.Win.ADODB, Vcl.DBActns, System.Actions, Vcl.ActnList, System.UITypes,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmMainMenu = class(TForm)
    mmUser: TMainMenu;
    LearnMenuLocked: TMenuItem;
    PracticeMenuLocked: TMenuItem;
    HelpMenuLocked: TMenuItem;
    AboutMenuLocked: TMenuItem;
    ExitMenuLocked: TMenuItem;
    lblUserName: TLabel;
    TestMenuLocked: TMenuItem;
    edtQuestion: TEdit;
    lblQuestion: TLabel;
    lblAnswer: TLabel;
    edtAnswer: TEdit;
    btnNext: TButton;
    edtCorrectAnswer: TEdit;
    mmAdmin: TMainMenu;
    LearnMenuAdmin: TMenuItem;
    PracticeMenuAdmin: TMenuItem;
    TestMenuAdmin: TMenuItem;
    HelpMenuAdmin: TMenuItem;
    AboutMenuAdmin: TMenuItem;
    ExitMenuAdmin: TMenuItem;
    N1: TMenuItem;
    ManageUserAdmin: TMenuItem;
    LearningMenuLocked: TMenuItem;
    N2: TMenuItem;
    SendEmail: TMenuItem;
    SendEmailAdmin: TMenuItem;
    LearningMenuAdmin: TMenuItem;
    lblPoints: TLabel;
    Date: TLabel;
    ADOConnection1GameForm: TADOConnection;
    ADOQuery1GameForm: TADOQuery;
    ADOTable1GameForm: TADOTable;
    lblUserRights: TLabel;
    N3: TMenuItem;
    AddNewQuestionMenuAdmin: TMenuItem;
    GameMenuLocked: TMenuItem;
    ADOConnection2GameForm: TADOConnection;
    ADOTable2GameForm: TADOTable;
    ADOQuery2GameForm: TADOQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    lblPoints2: TLabel;
    procedure ExitMenuLockedClick(Sender: TObject);
    procedure TestMenuLockedClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNextClick(Sender: TObject);
    procedure SendEmailClick(Sender: TObject);
    procedure AboutMenuLockedClick(Sender: TObject);
    procedure AboutMenuAdminClick(Sender: TObject);
    procedure ManageUserAdminClick(Sender: TObject);
    procedure AddNewQuestionMenuAdminClick(Sender: TObject);
    procedure GameMenuLockedClick(Sender: TObject);
    procedure TestMenuAdminClick(Sender: TObject);
    procedure SendEmailAdminClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LearningMenuLockedClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMainMenu: TfrmMainMenu;
  Points, Points2, ID: Integer;
  Questions, Answers: String;
  WelcomeLabel2: TLabel;
  Today: TDateTime;
  Users, Passwords: String;
  Administrator: Boolean;
  IDs: Integer;
  f: TextFile;

implementation

uses Unit1, Unit2, Unit3, About, Unit5, Unit6, Unit7, Unit8;

{$R *.dfm}

procedure TfrmMainMenu.AboutMenuAdminClick(Sender: TObject);
begin
  frmAbout.Showmodal;
end;

procedure TfrmMainMenu.AboutMenuLockedClick(Sender: TObject);
begin
  frmAbout.Showmodal;
end;

procedure TfrmMainMenu.AddNewQuestionMenuAdminClick(Sender: TObject);
begin
  frmAddNewQuestion.Show;
end;

procedure TfrmMainMenu.ExitMenuLockedClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainMenu.FormActivate(Sender: TObject);
begin

  Today := Now;
  Date.Caption := DateToStr(Today);
  ADOQuery1GameForm.Close;
  ADOQuery1GameForm.SQL.Clear;
  ADOQuery1GameForm.SQL.Add('SELECT ID, Username, Password, Admin FROM users');
  ADOQuery1GameForm.Open;
  ADOQuery1GameForm.Locate('UserName', lblUserRights.Caption,
    [loCaseInsensitive, loPartialKey]);
  Users := ADOQuery1GameForm.FieldByName('UserName').AsString;
  Administrator := ADOQuery1GameForm.FieldByName('Admin').AsBoolean;
  if Administrator = True then
    frmMainMenu.Menu := frmMainMenu.mmAdmin
  else
    frmMainMenu.Menu := frmMainMenu.mmUser;
end;

procedure TfrmMainMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmLogin.Close;
end;

procedure TfrmMainMenu.FormCreate(Sender: TObject);
begin
  AssignFile(f, 'c:\Programom\score.txt');
  Append(f);
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);
end;

procedure TfrmMainMenu.GameMenuLockedClick(Sender: TObject);
begin
  frmGame.Show;
end;

procedure TfrmMainMenu.LearningMenuLockedClick(Sender: TObject);
begin
  Form8.Show;
end;

procedure TfrmMainMenu.ManageUserAdminClick(Sender: TObject);
begin
  frmManageUsers.Showmodal;
end;

procedure TfrmMainMenu.SendEmailAdminClick(Sender: TObject);
begin
  frmSendMail.Show;
end;

procedure TfrmMainMenu.SendEmailClick(Sender: TObject);
begin
  frmSendMail.Show;
end;

procedure TfrmMainMenu.btnNextClick(Sender: TObject);
begin
  with ADOQuery2GameForm do
  begin
    if edtAnswer.Text = edtCorrectAnswer.Text then
    begin
      Points := Points + 1;
      lblPoints.Caption := ('Correct Answer: ' + IntToStr(Points));
      ADOQuery2GameForm.Next;
      edtAnswer.Text := '';
      edtQuestion.Text := ADOQuery2GameForm['Question'];
      edtCorrectAnswer.Text := ADOQuery2GameForm['Answer'];
    end
    else
    begin
      Points2 := Points2 + 1;
      lblPoints2.Caption := ('Incorrect Answer: ' + IntToStr(Points2));
      ADOQuery2GameForm.Next;
      edtAnswer.Text := '';
      edtQuestion.Text := ADOQuery2GameForm['Question'];
      edtCorrectAnswer.Text := ADOQuery2GameForm['Answer'];
    end;
    if ADOQuery2GameForm.Eof then
    begin
      ShowMessage('No more questions!');
      btnNext.Enabled := False;
      Writeln(f, lblUserRights.Caption + ';' + lblPoints.Caption + ';');
      CloseFile(f);
      ShowMessage('Answered questions: ' +
        IntToStr(ADOQuery2GameForm.RecordCount) + sLineBreak +
        lblPoints.Caption);
      if Points = (ADOQuery2GameForm.RecordCount / 2) then
        ShowMessage('Your score: 50%!');
      if Points < (ADOQuery2GameForm.RecordCount / 2) then
        ShowMessage('Keep going on!');
      if Points > (ADOQuery2GameForm.RecordCount / 2) then
        ShowMessage('You reached more then 50% ');
      if Points = ADOQuery2GameForm.RecordCount then
        ShowMessage('PERFECT!!!');
    end;
    edtAnswer.SetFocus;
  end;
end;

procedure TfrmMainMenu.TestMenuAdminClick(Sender: TObject);
begin
  Points := 0;
  Points2 := 0;
  ADOQuery2GameForm.Close;
  btnNext.Visible := True;
  lblQuestion.Visible := True;
  lblAnswer.Visible := True;
  edtQuestion.Visible := True;
  edtAnswer.Visible := True;
  edtAnswer.SetFocus;
  ADOQuery2GameForm.Active := False;
  ADOQuery2GameForm.Close;
  ADOQuery2GameForm.SQL.Clear;
  ADOQuery2GameForm.SQL.Add('SELECT ID, Question, Answer FROM questions');
  ADOQuery2GameForm.Open;
  // HIBAKEZELÉS!!!
  try
    ADOQuery2GameForm.Open;
  except
    on E: Exception do
    begin
      MessageDlg('We could not reach the Database!' + E.ClassName, mtError,
        [mbOK], 0);
    end;
  end;
  ADOQuery2GameForm.First;
  while not ADOQuery2GameForm.Eof do
  begin
    IDs := ADOQuery2GameForm.FieldByName('ID').AsInteger;
    Questions := ADOQuery2GameForm.FieldByName('Question').AsString;
    Answers := ADOQuery2GameForm.FieldByName('Answer').AsString;
    ADOQuery2GameForm.Next;
  end;
  ADOQuery2GameForm.First;
  edtQuestion.Text := ADOQuery2GameForm['Question'];
  edtCorrectAnswer.Text := ADOQuery2GameForm['Answer'];
end;

procedure TfrmMainMenu.TestMenuLockedClick(Sender: TObject);
begin
  edtQuestion.Font.Color := clWhite;
  Points := 0;
  Points2 := 0;
  ADOQuery2GameForm.Close;
  btnNext.Visible := True;
  lblQuestion.Visible := True;
  lblAnswer.Visible := True;
  edtQuestion.Visible := True;
  edtAnswer.Visible := True;
  edtAnswer.SetFocus;
  ADOQuery2GameForm.Active := False;
  ADOQuery2GameForm.Close;
  ADOQuery2GameForm.SQL.Clear;
  ADOQuery2GameForm.SQL.Add('SELECT ID, Question, Answer FROM questions');
  ADOQuery2GameForm.Open;
  // HIBAKEZELÉS!!!
  try
    ADOQuery2GameForm.Open;
  except
    on E: Exception do
    begin
      MessageDlg('We could not reach the Database!' + E.ClassName, mtError,
        [mbOK], 0);
    end;
  end;
  ADOQuery2GameForm.First;
  while not ADOQuery2GameForm.Eof do
  begin
    IDs := ADOQuery2GameForm.FieldByName('ID').AsInteger;
    Questions := ADOQuery2GameForm.FieldByName('Question').AsString;
    Answers := ADOQuery2GameForm.FieldByName('Answer').AsString;
    ADOQuery2GameForm.Next;
  end;
  ADOQuery2GameForm.First;
  edtQuestion.Text := ADOQuery2GameForm['Question'];
  edtCorrectAnswer.Text := ADOQuery2GameForm['Answer'];
end;

end.
