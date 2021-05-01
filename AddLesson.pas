unit AddLesson;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ComCtrls, Lesson;

type
  TAddLessonForm = class(TForm)
    Label1: TLabel;
    MainMenu1: TMainMenu;
    HelpBTN: TMenuItem;
    Label3: TLabel;
    LessonInfoEdit: TEdit;
    Label2: TLabel;
    HomeWorkEdit: TEdit;
    Label4: TLabel;
    LessonDate: TDateTimePicker;
    AddLessonBTN: TButton;
    procedure AddLessonBTNClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure HelpBTNClick(Sender: TObject);
    public function CreateLesson(): TLesson;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddLessonForm: TAddLessonForm;

implementation

{$R *.dfm}

var
    Lesson: TLesson;

Const
    HELP = '���������� �����.'#13#10#13#10'��� ���������� ����� ����� ������� ���������� �� ����� (��������, ���������� �� ����� ����), �������� �������, ������� ���� ������ �� ���� �����, ���� ���������� �����.';

procedure TAddLessonForm.HelpBTNClick(Sender: TObject);
begin
    MessageBox(Application.Handle, HELP, '�������', MB_ICONINFORMATION);
end;

function TAddLessonForm.CreateLesson: TLesson;
var
    Date: TDate;
begin
    Date := Now;
    Lesson.NewLesson(Date, '', '');
    Self.ShowModal;
    Result := Lesson;
end;

procedure TAddLessonForm.FormShow(Sender: TObject);
begin
    LessonDate.Date := Now;
end;

procedure TAddLessonForm.AddLessonBTNClick(Sender: TObject);
begin
    if LessonInfoEdit.Text = '' then
        MessageBox(Application.Handle, '�� �� ����� ���������� �� �����.', '���������� �����', MB_ICONERROR)
    else
    if HomeWorkEdit.Text = '' then
         MessageBox(Application.Handle, '�� �� ����� �������� �������.', '���������� �����', MB_ICONERROR)
    else
    begin
        Lesson.NewLesson(LessonDate.Date, LessonInfoEdit.Text, HomeWorkEdit.Text);
        MessageBox(Application.Handle, '���� ������� ��������.', '���������� �����', MB_ICONINFORMATION);
        Self.Close;
    end;

end;

end.
