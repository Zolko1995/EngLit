unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls;

type
  TfrmAddNewQuestion = class(TForm)
    edtQuestion: TEdit;
    edtAnswer: TEdit;
    Button1: TButton;
    Button2: TButton;
    lblQuestion: TLabel;
    lblAnswer: TLabel;
    ADOQuery1AddNewQuestion: TADOQuery;
    ADOTable1AddNewQuestion: TADOTable;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddNewQuestion: TfrmAddNewQuestion;
  Questions, Answers: string;

implementation

{$R *.dfm}

uses Unit1, Unit2, Unit3, Unit4, Unit5, Unit7;

procedure TfrmAddNewQuestion.Button1Click(Sender: TObject);
begin
  with ADOTable1AddNewQuestion do
  begin
    ADOTable1AddNewQuestion.Active := True;
    ADOTable1AddNewQuestion.Insert;
    ADOTable1AddNewQuestion['Question'] := edtQuestion.Text;
    ADOTable1AddNewQuestion['Answer'] := edtAnswer.Text;
    ADOTable1AddNewQuestion.Post;
    edtQuestion.Text := '';
    edtAnswer.Text := '';
    edtQuestion.SetFocus;
    ADOTable1AddNewQuestion.Close;
  end;
end;

procedure TfrmAddNewQuestion.Button2Click(Sender: TObject);
begin
  frmAddNewQuestion.Close;
end;

procedure TfrmAddNewQuestion.FormActivate(Sender: TObject);
begin
  ADOQuery1AddNewQuestion.Close;
  ADOQuery1AddNewQuestion.SQL.Clear;
  ADOQuery1AddNewQuestion.SQL.Add('SELECT ID, Question, Answer FROM questions');
  ADOQuery1AddNewQuestion.Open;
  ADOQuery1AddNewQuestion.Last;
end;

procedure TfrmAddNewQuestion.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  ADOQuery1AddNewQuestion.SQL.Clear;
  ADOQuery1AddNewQuestion.SQL.Add('SELECT ID, Question, Answer FROM questions');
  ADOQuery1AddNewQuestion.Active := True;
  ADOQuery1AddNewQuestion.Last;
  Questions := ADOQuery1AddNewQuestion.FieldByName('Question').AsString;
  Answers := ADOQuery1AddNewQuestion.FieldByName('Answer').AsString;
end;

procedure TfrmAddNewQuestion.FormCreate(Sender: TObject);
begin
  DeleteMenu(GetSystemMenu(Handle, False), SC_MOVE, MF_BYCOMMAND);
end;

end.
