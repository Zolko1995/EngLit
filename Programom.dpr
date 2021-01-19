program Programom;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {frmLogin},
  Unit2 in 'Unit2.pas' {frmAddUser},
  Unit3 in 'Unit3.pas' {frmSendMail},
  Vcl.Themes,
  Vcl.Styles,
  Unit4 in 'Unit4.pas' {frmMainMenu},
  about in 'about.pas' {frmAbout},
  Unit5 in 'Unit5.pas' {frmManageUsers},
  Unit6 in 'Unit6.pas' {frmAddNewQuestion},
  Unit7 in 'Unit7.pas' {frmGame},
  Unit8 in 'Unit8.pas' {Form8};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 SlateGray');
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmAddUser, frmAddUser);
  Application.CreateForm(TfrmSendMail, frmSendMail);
  Application.CreateForm(TfrmMainMenu, frmMainMenu);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.CreateForm(TfrmManageUsers, frmManageUsers);
  Application.CreateForm(TfrmAddNewQuestion, frmAddNewQuestion);
  Application.CreateForm(TfrmGame, frmGame);
  Application.CreateForm(TForm8, Form8);
  Application.Run;
end.
