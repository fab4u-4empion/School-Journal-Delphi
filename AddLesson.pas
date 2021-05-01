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
    HELP = 'Добавление урока.'#13#10#13#10'Для добавления урока нужно указать информацию об уроке (например, пройденную на уроке тему), домашнее задание, которое было задано на этом уроке, дату проведения урока.';

procedure TAddLessonForm.HelpBTNClick(Sender: TObject);
begin
    MessageBox(Application.Handle, HELP, 'Справка', MB_ICONINFORMATION);
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
        MessageBox(Application.Handle, 'Вы не ввели информацию об уроке.', 'Добавление урока', MB_ICONERROR)
    else
    if HomeWorkEdit.Text = '' then
         MessageBox(Application.Handle, 'Вы не ввели домашнее задание.', 'Добавление урока', MB_ICONERROR)
    else
    begin
        Lesson.NewLesson(LessonDate.Date, LessonInfoEdit.Text, HomeWorkEdit.Text);
        MessageBox(Application.Handle, 'Урок успешно добавлен.', 'Добавление урока', MB_ICONINFORMATION);
        Self.Close;
    end;

end;

end.
