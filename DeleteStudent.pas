unit DeleteStudent;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Student, System.Generics.Collections;

type
  TDeleteStudentForm = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    StudentsCBOX: TComboBox;
    DeleteStudentBtn: TButton;
    procedure DeleteStudentBtnClick(Sender: TObject);
    procedure StudentsCBOXChange(Sender: TObject);
    private procedure FillStudentCBOX();
    public function DeleteStudent(StudentsList: TList<TStudent>): TList<TStudent>;
  private
    Students: TList<TStudent>;
  public
    { Public declarations }
  end;

var
  DeleteStudentForm: TDeleteStudentForm;

implementation

{$R *.dfm}

procedure TDeleteStudentForm.DeleteStudentBtnClick(Sender: TObject);
var
    CanDelete: Integer;
begin
    CanDelete := MessageBox(Application.Handle, 'Вы точно хотите удалить ученика?', 'Удаление ученика', MB_YESNO);
    if CanDelete = IDYES then
    begin
        Self.Students.Remove(Self.Students[Self.StudentsCBOX.Items.IndexOf(Self.StudentsCBOX.Text)]);
        MessageBox(Application.Handle, 'Ученик успешно удален.', 'Удаление ученика', MB_ICONINFORMATION);
        Self.Close;
    end;
end;

procedure TDeleteStudentForm.FillStudentCBOX();
var
    Student: TStudent;
begin
    for Student in Students do
        StudentsCBOX.Items.Add(Student.GetLastName + ' ' +  Student.GetName + ' (' + IntToStr(Student.GetId) + ')');
end;

procedure TDeleteStudentForm.StudentsCBOXChange(Sender: TObject);
begin
    if StudentsCBOX.Text = '' then
        DeleteStudentBtn.Enabled := false
    else
        DeleteStudentBtn.Enabled := true;
end;

function TDeleteStudentForm.DeleteStudent(StudentsList: TList<TStudent>): TList<TStudent>;
begin
    Self.Students := StudentsList;
    Self.FillStudentCBOX();
    Self.ShowModal;
    Result := Self.Students;
end;

end.
