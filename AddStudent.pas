unit AddStudent;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Student, Vcl.Menus, System.RegularExpressions,
  System.Math;

type
  TAddStudentForm = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    StudentNameEdit: TEdit;
    StudentLastNameEdit: TEdit;
    AddStudentBtn: TButton;
    MainMenu1: TMainMenu;
    HelpBTN: TMenuItem;
    procedure EditKeyPress(Sender: TObject; var Key: Char);
    procedure EditChange(Sender: TObject);
    procedure AddStudentBtnClick(Sender: TObject);
    function CreateNewStudent(): TStudent;
    procedure HelpBTNClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddStudentForm: TAddStudentForm;

implementation

const
    StudentNameAdnLastnamePattern = '^([А-Я])([А-Яа-я]){1,19}$';


var
    Student: TStudent;

Const
    HELP = 'Добавление ученика.'#13#10#13#10'Для добавления ученика нужно указать его имя и фамилию с большой буквы на русском языке.';

{$R *.dfm}

procedure TAddStudentForm.EditKeyPress(Sender: TObject; var Key: Char);
begin
    if ((Key < #128) or (Key > #159)) and (Key <> #8) then
        Key := #0;
    if (Length((Sender as TEdit).Text) > 19) and (Key <> #8) then
        Key := #0;
end;

procedure TAddStudentForm.HelpBTNClick(Sender: TObject);
begin
    MessageBox(Application.Handle, HELP, 'Справка', MB_ICONINFORMATION);
end;

procedure TAddStudentForm.AddStudentBtnClick(Sender: TObject);
begin
    Student.NewStudent(StudentNameEdit.Text, StudentLastNameEdit.Text);
    MessageBox(Application.Handle, 'Ученик успешно добавлен.', 'Добавление ученика', MB_ICONINFORMATION);
    Self.Close;
end;

procedure TAddStudentForm.EditChange(Sender: TObject);
var
    regEx: TRegEx;
    match: TMatch;
begin
    regEx.Create('^([А-Яа-я]){1,20}$');
    match := regEx.Match((Sender as TEdit).Text);
    if (match.Value = '') then
        (Sender as TEdit).Text := '';
    regEx.Create(StudentNameAdnLastnamePattern);
    if (regEx.Match(StudentNameEdit.Text).Value <> '') and (regEx.Match(StudentLastNameEdit.Text).Value <> '') then
        AddStudentBtn.Enabled := true
    else
        AddStudentBtn.Enabled := false;
end;

function TAddStudentForm.CreateNewStudent;
begin
    Student.NewStudent('', '');
    Self.ShowModal;
    Result := Student;
end;

end.
