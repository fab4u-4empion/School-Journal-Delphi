unit ViewJournal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.WinXPickers, JournalInfo,
  Vcl.StdCtrls, Vcl.Grids, Vcl.Menus, System.Generics.Collections, Student, Lesson, Note;

type
  TViewJournalForm = class(TForm)
    StudentsSTRG: TStringGrid;
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    LessonLabel: TLabel;
    ClassNameLabel: TLabel;
    Label4: TLabel;
    QuaterLabel: TLabel;
    IsNotUnderStudy: TLabel;
    procedure FormShow(Sender: TObject);
    procedure GetStudents;
    procedure GetLessons;
    procedure GetNotes;
    procedure UpdateSTRGNotes;
    function CheckLesson: Boolean;
    procedure FillStudentStrg;
    procedure UpdateSTRGLesson;
    procedure UpdateSTRG;
    procedure UpdateSTRGQuaterNotes;
    function FindLesson(ID: Int64): Integer;
    function FindStudent(ID: Int64): Integer;
    procedure StudentsSTRGDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StudentsSTRGFixedCellClick(Sender: TObject; ACol, ARow: Integer);
  private
    StudentList: TList<TStudent>;
    LessonsList: TList<TLesson>;
    NotesList: TList<TNote>;
  public
    Journal: TJournal;
  end;

var
  ViewJournalForm: TViewJournalForm;

implementation

{$R *.dfm}

function TViewJournalForm.FindLesson(ID: Int64): Integer;
var
    Lesson: TLesson;
begin
    for Lesson in LessonsList do
        if Lesson.GetID = ID then
        begin
            Result := LessonsList.IndexOf(Lesson);
            break
        end;
end;

function TViewJournalForm.FindStudent(ID: Int64): Integer;
var
    Student: TStudent;
begin
    for Student in StudentList do
        if Student.GetID = ID then
        begin
            Result := StudentList.IndexOf(Student);
            break
        end;
end;

procedure TViewJournalForm.GetStudents;
var
    StudentFile: File of TStudent;
    Student: Tstudent;
begin
    StudentList := TList<TStudent>.Create;
    AssignFile(StudentFile, 'common/classes/' + Journal.GetClassName + '/students.students');
    reset(StudentFile);
    while not eof(StudentFile) do
    begin
        Read(StudentFile, Student);
        StudentList.Add(Student);
    end;
    CloseFile(StudentFile);
end;

procedure TViewJournalForm.StudentsSTRGDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
    with StudentsSTRG, StudentsSTRG.Canvas do
    if (ARow = 0) then
    begin
        Brush.Color := clWindow;
        Font.Style := [fsBold];
        Canvas.Font.Size := 11;
        FillRect(Rect);
        TextOut(Rect.Left + 2, Rect.Top + 5, Cells[ACol, ARow]);
    end;
end;

procedure TViewJournalForm.StudentsSTRGFixedCellClick(Sender: TObject; ACol,
  ARow: Integer);
var
    Info: String;
    Lesson: TLesson;
    WideChars: array[0..1000] of WideChar;
begin
    if ACol > 4 then
    begin
        Lesson := LessonsList[ACol - 5];
        Info := 'Дата: ' + FormatDateTime('dd.mm.yyyy', Lesson.GetDate) + #13#10#13#10 + 'Информация: ' + Lesson.GetInfo + #13#10#13#10 + 'Домашнее задание: ' + Lesson.GetHomeWork;
        MessageBox(Application.Handle, StringToWideChar(Info, WideChars, 1000), 'Информайия об уроке', MB_ICONINFORMATION);
    end;
end;

procedure TViewJournalForm.GetLessons;
var
    LessonsFile: File of TLesson;
    Lesson: TLesson;
begin
    LessonsList := TList<TLesson>.Create;
    AssignFile(LessonsFile, 'common/classes/' + Journal.GetClassName + '/journal/' + Journal.GetQuater + '/' + Journal.GetLesson + '/lessons.lessons');
    reset(LessonsFile);
    while not eof(LessonsFile) do
    begin
        Read(LessonsFile, Lesson);
        LessonsList.Add(Lesson);
    end;
    CloseFile(LessonsFile);
end;

procedure TViewJournalForm.GetNotes;
var
    NoteFile: File of TNote;
    Note: TNote;
begin
    NotesList := TList<TNote>.Create;
    AssignFile(NoteFile, 'common/classes/' + Journal.GetClassName + '/journal/' + Journal.GetQuater + '/' + Journal.GetLesson + '/notes.notes');
    reset(NoteFile);
    while not eof(NoteFile) do
    begin
        Read(NoteFile, Note);
        NotesList.Add(Note);
    end;
    CloseFile(NoteFile);
end;

procedure TViewJournalForm.UpdateSTRGNotes;
var
    Note: TNote;
    Row, Col: Integer;
begin
    for Row := 1 to StudentsSTRG.RowCount - 1 do
        for Col := 5 to StudentsStrg.ColCount - 1 do
            if StudentsSTRG.Cells[Col, Row] <> '' then
                StudentsStrg.Cells[Col, Row] := '';
    for Note in NotesList do
    begin
        Row := FindStudent(Note.GetStudenID) + 1;
        Col := FindLesson(Note.GetLessonID) + 5;
        StudentsStrg.Cells[Col, Row] := Note.GetNote;
    end;
end;

function TViewJournalForm.CheckLesson(): Boolean;
var
    LessosnsFile: TextFile;
    Lesson: String;
    IsUnderStudy: Boolean;
begin
    IsUnderStudy := false;
    AssignFile(LessosnsFile, 'common/classes/' + Journal.GetClassName + '/lessons.lessons');
    reset(LessosnsFile);
    while not eof(LessosnsFile) do
    begin
        Readln(LessosnsFile, Lesson);
        if Journal.GetLesson = Lesson then
            IsUnderStudy := true;
    end;
    CloseFile(LessosnsFile);
    CheckLesson := IsUnderStudy;
end;

procedure TViewJournalForm.FillStudentStrg;
var
    Student: Tstudent;
begin
    if StudentList.Count > 0 then
        StudentsSTRG.RowCount := StudentList.Count + 1
    else
        StudentsSTRG.RowCount := 2;
    if StudentsSTRG.RowCount > 1 then
        StudentsSTRG.FixedRows := 1;
    for Student in StudentList do
    begin
        StudentsStrg.Cells[0, StudentList.IndexOf(Student) + 1] := Student.GetLastName;
        StudentsStrg.Cells[1, StudentList.IndexOf(Student) + 1] := Student.GetName;
    end;
end;

procedure TViewJournalForm.UpdateSTRGLesson;
var
    Lesson: TLesson;
    I: Integer;
begin
    I := 5;
    for Lesson in LessonsList do
    begin
        StudentsStrg.Cells[I, 0] := FormatDateTime('dd.mm', Lesson.GetDate);
        Inc(I);
    end;
end;

procedure TViewJournalForm.UpdateSTRG;
var
    MissedLessons, I, J, NoteSum, NoteCount: Integer;
    Middle: Double;
begin
    for I := 1 to StudentsSTRG.RowCount - 1 do
    begin
        MissedLessons := 0;
        NoteCount := 0;
        NoteSum := 0;
        StudentsSTRG.Cells[3, I] := '';
        for J := 5 to StudentsStrg.ColCount - 1 do
        begin
            if StudentsStrg.Cells[J, I] = 'н' then
                Inc(MissedLessons)
            else
                if StudentsStrg.Cells[J, I] <> '' then
                begin
                    NoteSum := NoteSum + StrToInt(StudentsStrg.Cells[J, I]);
                    Inc(NoteCount);
                end;
        end;
        StudentsSTRG.Cells[2, I] := IntToStr(MissedLessons);
        if NoteCount <> 0 then
        begin
            Middle := NoteSum / NoteCount;
            StudentsSTRG.Cells[3, I] := FormatFloat('#.#0', Middle);
        end;
    end;
end;

procedure TViewJournalForm.UpdateSTRGQuaterNotes;
var
    NoteFile: File of TNote;
    Note: TNote;
begin
    NotesList := TList<TNote>.Create;
    AssignFile(NoteFile, 'common/classes/' + Journal.GetClassName + '/journal/' + Journal.GetQuater + '/' + Journal.GetLesson + '/quater.notes');
    reset(NoteFile);
    while not eof(NoteFile) do
    begin
        Read(NoteFile, Note);
        StudentsSTRG.Cells[4, FindStudent(Note.GetStudenID) + 1] := Note.GetNote;
    end;
    CloseFile(NoteFile);
end;

procedure TViewJournalForm.FormShow(Sender: TObject);
begin
    Self.Caption := Self.Caption + ' ' + Journal.GetClassName + '. ' + Journal.GetLesson + '.';
    ClassNameLabel.Caption := Journal.GetClassName;
    LessonLabel.Caption := Journal.GetLesson;
    QuaterLabel.Caption := Journal.GetQuater;
    GetStudents;
    GetLessons;
    GetNotes;
    if NotesList.Count > 0 then
        UpdateSTRGNotes;
    StudentsStrg.ColCount := 5 + LessonsList.Count;
    StudentsStrg.Cells[0, 0] := 'Фамилия';
    StudentsStrg.Cells[1, 0] := 'Имя';
    StudentsStrg.Cells[2, 0] := 'Пропуски';
    StudentsStrg.Cells[3, 0] := 'Средний' + #13#10 + 'балл';
    StudentsStrg.Cells[4, 0] := 'Четвертная' + #13#10 + 'оценка';
    StudentsStrg.FixedCols := 4;
    if CheckLesson then
        IsNotUnderStudy.Visible := false;
    FillStudentSTRG;
    UpdateSTRGLesson;
    UpdateSTRG;
    UpdateSTRGQuaterNotes;
end;

end.
