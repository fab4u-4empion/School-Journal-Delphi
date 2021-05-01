unit EditClass;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, System.Generics.Collections, Student,
  AddStudent, ViewStudentList, System.Generics.Defaults, DeleteStudent;

type
  TEditClassForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MainMenu1: TMainMenu;
    HelpBTN: TMenuItem;
    ClassNameLabel: TLabel;
    Label4: TLabel;
    ScrollBox: TScrollBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    CheckBox22: TCheckBox;
    CheckBox23: TCheckBox;
    CheckBox24: TCheckBox;
    SaveClassBtn: TButton;
    DeleteClass: TMenuItem;
    N2: TMenuItem;
    AddStudentBTN: TMenuItem;
    DeleteStudentBTN: TMenuItem;
    ListOfStudentsBTN: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FillLessonsList();
    procedure CheckLessons;
    procedure CheckBoxClick(Sender: TObject);
    procedure SaveClassBtnClick(Sender: TObject);
    procedure SaveClass();
    procedure DeleteClassInfo;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DeleteClassClick(Sender: TObject);
    procedure ListOfStudentsBTNClick(Sender: TObject);
    procedure DeleteStudentBTNClick(Sender: TObject);
    procedure AddStudentBTNClick(Sender: TObject);
    procedure FillStudentList;
    procedure UpdateJournal;
    procedure HelpBTNClick(Sender: TObject);
  private
    LessonsList: TList<String>;
    NeedSave: Boolean;
    StudentList: TList<TStudent>;
  public
    ClassName: String;
  end;

var
  EditClassForm: TEditClassForm;

implementation

{$R *.dfm}
var
    Comparer: TDelegatedComparer<TStudent>;

Const
    HELP = 'Редактирование класса.'#13#10#13#10'В этом разделе можно отредактировать изучаемые классом предметы, добавить в класс ученика или удалить ученика из класса, удалить класс.';

procedure TEditClassForm.FillLessonsList;
var
    LessonsFile: TextFile;
    tempStr: String;
begin
    AssignFile(LessonsFile, 'common/classes/' + ClassName + '/lessons.lessons');
    reset(LessonsFile);
    while not eof(LessonsFile) do
    begin
        readln(LessonsFile, tempStr);
        if LessonsList.IndexOf(tempStr) = -1 then
            LessonsList.Add(tempStr);
    end;
    CloseFile(LessonsFile);
end;

procedure TEditClassForm.FillStudentList;
var
    StudentFile: File of TStudent;
    Student: TStudent;
begin
    AssignFile(StudentFile, 'common/classes/' + ClassName + '/students.students');
    reset(StudentFile);
    while not eof(StudentFile) do
    begin
        read(StudentFile, Student);
            StudentList.Add(Student);
    end;
    CloseFile(StudentFile);
end;

procedure TEditClassForm.UpdateJournal;
var
    LetterNumber, JournalDir: String;
    I, J: Integer;
    NotesFile, LessonsFile: TextFile;
begin
    LetterNumber := ClassName;
    LetterNumber := LetterNumber.ToUpper;
    JournalDir := 'common/classes/' + ClassName + '/journal';
    CreateDir(JournalDir);
    CreateDir(JournalDir + '/1');
    CreateDir(JournalDir + '/2');
    CreateDir(JournalDir + '/3');
    CreateDir(JournalDir + '/4');
    for J := 1 to 4 do
        for I := 0 to ComponentCount - 1 do
            if Components[I] is TCheckBox then
                if (Components[I] as TCheckBox).Checked then
                begin
                    CreateDir(JournalDir + '/' + IntToStr(J) + '/' + (Components[I] as TCheckBox).Caption);
                    AssignFile(NotesFile, JournalDir + '/' + IntToStr(J) + '/' + (Components[I] as TCheckBox).Caption + '/notes.notes');
                    Rewrite(NotesFile);
                    Write(NotesFile, '');
                    CloseFile(NotesFile);

                    CreateDir(JournalDir + '/' + IntToStr(J) + '/' + (Components[I] as TCheckBox).Caption);
                    AssignFile(NotesFile, JournalDir + '/' + IntToStr(J) + '/' + (Components[I] as TCheckBox).Caption + '/quater.notes');
                    Rewrite(NotesFile);
                    Write(NotesFile, '');
                    CloseFile(NotesFile);

                    AssignFile(LessonsFile, JournalDir + '/' + IntToStr(J) + '/' + (Components[I] as TCheckBox).Caption + '/lessons.lessons');
                    Rewrite(LessonsFile);
                    Write(LessonsFile, '');
                    CloseFile(LessonsFile);
                end;
end;

procedure TEditClassForm.SaveClass;
var
    LessonsFile: TextFile;
    StudentsFile: File of TStudent;
    I: Integer;
    Student: TStudent;
begin
    NeedSave := false;
    SaveClassBtn.Enabled := NeedSave;
    AssignFile(LessonsFile, 'common/classes/' + ClassName + '/lessons.lessons');
    rewrite(LessonsFile);
    for I := 0 to ComponentCount - 1 do
        if Components[I] is TCheckBox then
            if (Components[I] as TCheckBox).Checked then
                Writeln(LessonsFile, (Components[I] as TCheckBox).Caption);
    CloseFile(LessonsFile);
    UpdateJournal;

    StudentList.Sort(Comparer);
    AssignFile(StudentsFile, 'common/classes/' + ClassName + '/students.students');
    Rewrite(StudentsFile);
    for Student in StudentList do
        Write(StudentsFile, Student);
    CloseFile(StudentsFile);
end;

procedure TEditClassForm.DeleteClassInfo;
var
    sr: TSearchRec;
    I: Integer;
begin
    DeleteFile('common/classes/' + ClassName + '/lessons.lessons');
    DeleteFile('common/classes/' + ClassName + '/students.students');

    for I := 1 to 4 do
        If FindFirst('common/classes/' + ClassName + '/journal/' + IntToStr(I) + '/*', faDirectory, sr) = 0 then
            repeat
                If (sr.Name <> '') and (sr.Name <> '.') and (sr.Name <> '..') then
                    if sr.Attr = faDirectory then
                    begin
                        DeleteFile('common/classes/' + ClassName + '/journal/' + IntToStr(I) + '/' + sr.Name + '/notes.notes');
                        DeleteFile('common/classes/' + ClassName + '/journal/' + IntToStr(I) + '/' + sr.Name + '/quater.notes');
                        DeleteFile('common/classes/' + ClassName + '/journal/' + IntToStr(I) + '/' + sr.Name + '/lessons.lessons');
                        RemoveDir('common/classes/' + ClassName + '/journal/' + IntToStr(I) + '/' + sr.Name);
                    end;
            until (FindNext(sr) <> 0);
    FindClose(sr);
    RemoveDir('common/classes/' + ClassName + '/journal/1');
    RemoveDir('common/classes/' + ClassName + '/journal/2');
    RemoveDir('common/classes/' + ClassName + '/journal/3');
    RemoveDir('common/classes/' + ClassName + '/journal/4');
    RemoveDir('common/classes/' + ClassName + '/journal');
    RemoveDir('common/classes/' + ClassName);
end;

procedure TEditClassForm.DeleteStudentBTNClick(Sender: TObject);
var
    StudentsFile: File of TStudent;
    Count: Integer;
begin
    AssignFile(StudentsFile, 'common/classes/' + ClassName + '/students.students');
    reset(StudentsFile);
    if FileSize(StudentsFile) = 0 then
    begin
        CloseFile(StudentsFile);
        MessageBox(Application.Handle, 'В классе нет учеников.', 'Удаление ученика', MB_ICONERROR);
    end
    else
    begin
        CloseFile(StudentsFile);
        Count := StudentList.Count;
        DeleteStudentForm := TDeleteStudentForm.Create(Self);
        StudentList := DeleteStudentForm.DeleteStudent(StudentList);
        DeleteStudentForm.Destroy;
        if StudentList.Count <> Count then
        begin
            NeedSave := true;
            SaveClassBtn.Enabled := NeedSave;
        end;
    end;
end;

procedure TEditClassForm.AddStudentBTNClick(Sender: TObject);
var
    Student: TStudent;
begin
    Student := TAddStudentForm.Create(Self).CreateNewStudent;
    if Student.GetName <> '' then
    begin
        StudentList.Add(Student);
        StudentList.Sort(Comparer);
        NeedSave := true;
        SaveClassBtn.Enabled := NeedSave;
    end;
    AddStudentForm.Destroy;
end;

procedure TEditClassForm.CheckBoxClick(Sender: TObject);
begin
    NeedSave := true;
    SaveClassBtn.Enabled := NeedSave;
end;

procedure TEditClassForm.CheckLessons;
var
    I: Integer;
begin
    while (I < ComponentCount) do
    begin
        if Components[I] is TCheckBox then
            if LessonsList.Contains((Components[I] as TCheckBox).Caption) then
                (Components[I] as TCheckBox).Checked := true;
        Inc(I);
        NeedSave := false;
        SaveClassBtn.Enabled := NeedSave;
    end;
end;

procedure TEditClassForm.DeleteClassClick(Sender: TObject);
var
    CanDelete: Integer;
begin
    CanDelete := MessageBox(Application.Handle, 'Вы точно хотите удалить класс?'#13#10'Вся информация о классе будет утеряна.', 'Удаление класса', MB_YESNO);
    if CanDelete = IDYES then
    begin
        DeleteClassInfo;
        MessageBox(Application.Handle, 'Класс усешно удален.', 'Удаление класса', MB_ICONINFORMATION);
        Self.Close;
    end;
end;

procedure TEditClassForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
    CanSave: Integer;
begin
    if NeedSave then
    begin
        CanSave := MessageBox(Application.Handle, 'Сохранить внесенные изменения?'#13#10'Несохраненные данные будут утеряны.', 'Редактирование класса', MB_YESNOCANCEL);
        if CanSave = IDYES then
        begin
            SaveClass;
            CanClose := true;
        end
        else if CanSave = IDCANCEL then
            CanClose := false;
    end
    else
        CanClose := true;
end;

procedure TEditClassForm.FormShow(Sender: TObject);
begin
    Comparer := TDelegatedComparer<TStudent>.Create(
    function (const Left, Right: TStudent): Integer
    begin
        if Left.GetLastName < Right.GetLastName then
            Result := -1 else
        if Left.GetLastName > Right.GetLastName then
            Result := 1 else
        Result := 0;
    end);

    NeedSave := false;
    SaveClassBtn.Enabled := NeedSave;
    StudentList := TList<TStudent>.Create;
    ClassNameLabel.Caption := ClassName;
    LessonsList := TList<String>.create;
    FillLessonsList;
    CheckLessons;
    FillStudentList;
end;

procedure TEditClassForm.HelpBTNClick(Sender: TObject);
begin
    MessageBox(Application.Handle, HELP, 'Справка', MB_ICONINFORMATION);
end;

procedure TEditClassForm.ListOfStudentsBTNClick(Sender: TObject);
begin
    if StudentList.Count = 0 then
    begin
        MessageBox(Application.Handle, 'В классе нет учеников.', 'Список учеников', MB_ICONERROR);
    end
    else
    begin
        ViewStudentListForm := TViewStudentListForm.Create(Self);
        ViewStudentListForm.ViewStudentList(StudentList, ClassName);
        ViewStudentListForm.Destroy;
    end;
end;

procedure TEditClassForm.SaveClassBtnClick(Sender: TObject);
var
    LessonsFile: TextFile;
    I, CanSave: Integer;
begin
    CanSave := MessageBox(Application.Handle, 'Вы точно хотите сохранить изменения?', 'Редактирование класса', MB_YESNO);
    if CanSave = IDYES then
    begin
        SaveClass;
        MessageBox(Application.Handle, 'Информация сохранена.', 'Редактирование класса', MB_ICONINFORMATION);
    end;
end;


end.
