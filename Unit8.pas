unit Unit8;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm8 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Memo2: TMemo;
    Memo3: TMemo;
    Memo4: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

procedure TForm8.Button1Click(Sender: TObject);
begin
Form8.Close;
end;

procedure TForm8.Button2Click(Sender: TObject);
begin
Memo2.Visible:=True;
Memo3.Visible:=False;
end;

procedure TForm8.Button3Click(Sender: TObject);
begin
Memo2.Visible:=False;
Memo3.Visible:=True;
Memo4.Visible:=False;
end;

procedure TForm8.Button4Click(Sender: TObject);
begin
Memo4.Visible:=True;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
Memo2.Visible:=False;
Memo3.Visible:=False;
Memo4.Visible:=False;
end;

end.
