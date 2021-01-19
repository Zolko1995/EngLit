unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP, IdBaseComponent, IdMessage;

type
  TfrmSendMail = class(TForm)
    edtPassword: TEdit;
    edtSubject: TEdit;
    edtTo: TEdit;
    edtUserName: TEdit;
    memoBody: TMemo;
    grpLogin: TGroupBox;
    grpEmail: TGroupBox;
    btnSend: TButton;
    IdMessage: TIdMessage;
    IdSMTP: TIdSMTP;
    IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
    Exit: TButton;
    procedure btnSendClick(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSendMail: TfrmSendMail;
  mail_username: string;
  mail_password: string;
  mail_to: string;
  mail_subject: string;
  mail_body: string;

implementation

uses Unit1, Unit2, Unit4;

{$R *.dfm}

procedure GmailSend(username, password, totarget, subject, body: string);
var
  DATA: TIdMessage;
  SMTP: TIdSMTP;
  SSL: TIdSSLIOHandlerSocketOpenSSL;
begin
  SMTP := TIdSMTP.Create(nil);
  DATA := TIdMessage.Create(nil);
  SSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  SSL.SSLOptions.Method := sslvTLSv1;
  SSL.SSLOptions.Mode := sslmUnassigned;
  SSL.SSLOptions.VerifyMode := [];
  SSL.SSLOptions.VerifyDepth := 0;
  DATA.From.Address := username;
  DATA.Recipients.EMailAddresses := totarget;
  DATA.subject := subject;
  DATA.body.text := body;
  SMTP.IOHandler := SSL;
  SMTP.Host := 'smtp.gmail.com';
  SMTP.Port := 587;
  SMTP.username := username;
  SMTP.password := password;
  SMTP.UseTLS := utUseExplicitTLS;
  SMTP.Connect;
  SMTP.Send(DATA);
  SMTP.Disconnect;
  SMTP.Free;
  DATA.Free;
  SSL.Free;
end;

procedure TfrmSendMail.ExitClick(Sender: TObject);
begin
  frmSendMail.Close;
end;

procedure TfrmSendMail.FormActivate(Sender: TObject);
begin
  edtUserName.SetFocus;
end;

procedure TfrmSendMail.btnSendClick(Sender: TObject);
begin
  if memoBody.Lines.Count = 0 then
    ShowMessage('Empty message cannot be sent!')
  else
  begin
    mail_username := edtUserName.text;
    mail_password := edtPassword.text;
    mail_to := edtTo.text;
    mail_subject := edtSubject.text;
    mail_body := memoBody.text;
    try
      begin
        GmailSend(mail_username, mail_password, mail_to, mail_subject,
          mail_body);
      end;
    except
      // vmiért hiba eséten nem küld jelzést
      btnSend.Enabled := False;
    end;
  end;
end;

end.
