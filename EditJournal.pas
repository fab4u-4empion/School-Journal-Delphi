unit EditJournal;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JournalInfo, Vcl.Menus, Vcl.StdCtrls,
    Vcl.Grids, System.Generics.Collections, Student, AddLesson, Lesson, System.Generics.Defaults, Note,
    DateUtils;

type
    TEditJournalForm = class(TForm)
        Label1: TLabel;
        MainMenu1: TMainMenu;
        HelpBTN: TMenuItem;
        Label3: TLabel;
        Label2: TLabel;
        LessonLabel: TLabel;
        ClassNameLabel: TLabel;
        Label4: TLabel;
        QuaterLabel: TLabel;
        StudentsSTRG: TStringGrid;
        IsNotUnderStudy: TLabel;
        AddLessonBTN: TMenuItem;
        SaveJournalBTN: TMenuItem;
        procedure FormShow(Sender: TObject);
        procedure GetStudents;
        procedure FillStudentStrg;
        function CheckLesson: Boolean;
        procedure AddLessonBTNClick(Sender: TObject);
        procedure GetLessons;
        procedure GetNotes;
        procedure SaveJournalBTNClick(Sender: TObject);
        procedure UpdateSTRGLesson;
        procedure UpdateSTRG;
        procedure UpdateSTRGNotes;
        procedure UpdateNotesList;
        procedure UpdateSTRGQuaterNotes;
        function FindLesson(ID: Int64): Integer;
        function FindStudent(ID: Int64): Integer;
        procedure ImportJournal;
        procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
        procedure StudentsSTRGKeyPress(Sender: TObject; var Key: Char);
        procedure StudentsSTRGSetEditText(Sender: TObject; ACol, ARow: Integer;
          const Value: string);
        procedure StudentsSTRGDrawCell(Sender: TObject; ACol, ARow: Integer;
          Rect: TRect; State: TGridDrawState);
        procedure StudentsSTRGFixedCellClick(Sender: TObject; ACol, ARow: Integer);
        procedure HelpBTNClick(Sender: TObject);
    private
        StudentList: TList<TStudent>;
        LessonsList: TList<TLesson>;
        NotesList: TList<TNote>;
        NeedSave: Boolean;
    public
        Journal: TJournal;
    end;

var
    EditJournalForm: TEditJournalForm;

implementation

{$R *.dfm}
var
    Comparer: TDelegatedComparer<TLesson>;

Const
    HELP = 'Редактирование журнала.'#13#10#13#10'В данном разделе можно редактировать оценки учеников и выставлять пропуски учениками занятий (вместо оценки ввести маленькую букву "н"), добавлять уроки, выставлять четвертные отметки.';

procedure TEditJournalForm.GetStudents;
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

procedure TEditJournalForm.HelpBTNClick(Sender: TObject);
begin
    MessageBox(Application.Handle, HELP, 'Справка', MB_ICONINFORMATION);
end;

function TEditJournalForm.FindLesson(ID: Int64): Integer;
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

function TEditJournalForm.FindStudent(ID: Int64): Integer;
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

procedure TEditJournalForm.UpdateSTRGLesson;
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

procedure TEditJournalForm.UpdateNotesList;
var
    Note: TNote;
    I, J: Integer;
begin
    NotesList.Clear;
    for I := 1 to StudentsSTRG.RowCount - 1 do
        for J := 5 to StudentsStrg.ColCount - 1 do
            if StudentsSTRG.Cells[J, I] <> '' then
            begin
                Note.SetNote(StudentsSTRG.Cells[J, I]);
                Note.SetStudenID(StudentList[I - 1].GetID);
                Note.SetLessonID(LessonsList[J - 5].GetID);
                NotesList.Add(Note);
            end;
end;

procedure TEditJournalForm.UpdateSTRGNotes;
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

procedure TEditJournalForm.UpdateSTRG;
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


procedure TEditJournalForm.SaveJournalBTNClick(Sender: TObject);
var
    LessonsFile: File of TLesson;
    Lesson: TLesson;
    NoteFile: File of TNote;
    Note: TNote;
    I, J: Integer;
begin
    try
        AssignFile(LessonsFile, 'common/classes/' + Journal.GetClassName + '/journal/' + Journal.GetQuater + '/' + Journal.GetLesson + '/lessons.lessons');
        rewrite(LessonsFile);
        for Lesson in LessonsList do
            write(LessonsFile, Lesson);
        CloseFile(LessonsFile);
    except
        MessageBox(Application.Handle, 'Не удается получить доступ к файлу с уроками. Данные сохранены не будут.', 'Редактирование класса', MB_ICONERROR);
    end;

    try
        AssignFile(NoteFile, 'common/classes/' + Journal.GetClassName + '/journal/' + Journal.GetQuater + '/' + Journal.GetLesson + '/notes.notes');
        rewrite(NoteFile);
        for I := 1 to StudentsSTRG.RowCount - 1 do
            for J := 5 to StudentsStrg.ColCount - 1 do
                if StudentsSTRG.Cells[J, I] <> '' then
                begin
                    Note.SetNote(StudentsSTRG.Cells[J, I]);
                    Note.SetStudenID(StudentList[I - 1].GetID);
                    Note.SetLessonID(LessonsList[J -5].GetID);
                    write(NoteFile, Note);
                end;
        CloseFile(NoteFile);
    except
          MessageBox(Application.Handle, 'Не удается получить доступ к файлу с оценками. Данные сохранены не будут.', 'Редактирование класса', MB_ICONERROR);
    end;

    try
        AssignFile(NoteFile, 'common/classes/' + Journal.GetClassName + '/journal/' + Journal.GetQuater + '/' + Journal.GetLesson + '/quater.notes');
        rewrite(NoteFile);
        for I := 1 to StudentsSTRG.RowCount - 1 do
            if StudentsSTRG.Cells[4, I] <> '' then
            begin
                Note.SetNote(StudentsSTRG.Cells[4, I]);
                Note.SetStudenID(StudentList[I - 1].GetID);
                Note.SetLessonID(DateTimeToUnix(Now));
                write(NoteFile, Note);
            end;
        CloseFile(NoteFile);
    except
        MessageBox(Application.Handle, 'Не удается получить доступ к файлу с четветными оценками. Данные сохранены не будут.', 'Редактирование класса', MB_ICONERROR);
    end;
    NeedSave := false;
    MessageBox(Application.Handle, 'Информация сохранена.', 'Редактирование журнала', MB_ICONINFORMATION);
end;

procedure TEditJournalForm.StudentsSTRGDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
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

procedure TEditJournalForm.StudentsSTRGFixedCellClick(Sender: TObject; ACol, ARow: Integer);
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

procedure TEditJournalForm.StudentsSTRGKeyPress(Sender: TObject; var Key: Char);
var
    Col, Row: Integer;
begin
    Col := (Sender as TStringGrid).Col;
    Row := (Sender as TStringGrid).Row;
    if Col = 4 then
        if not (Key in ['0'..'9', #8]) then Key := #0
        else
        begin
            if ((Sender as TStringGrid).Cells[Col, Row].Length = 0) and (Key = '0') then Key := #0;
            if ((Sender as TStringGrid).Cells[Col, Row].Length = 1) then
                if ((Sender as TStringGrid).Cells[Col, Row] <> '1') and (Key <> #8) then Key := #0;
            if ((Sender as TStringGrid).Cells[Col, Row].Length = 2) and (Key <> #8) then Key := #0;
            if ((Sender as TStringGrid).Cells[Col, Row] = '1') and (Key <> '0') and (Key <> #8) then Key := #0;
        end;
     if Col > 4 then
        if not (Key in ['0'..'9', #8]) then
        begin
            if (Key <> 'н') then Key := #0;
            if ((Sender as TStringGrid).Cells[Col, Row].Length = 1) then Key := #0;
        end
        else
        begin
            if ((Sender as TStringGrid).Cells[Col, Row].Length = 0) and (Key = '0') then Key := #0;
            if ((Sender as TStringGrid).Cells[Col, Row].Length = 1) then
            begin
                if ((Sender as TStringGrid).Cells[Col, Row] <> '1') and (Key <> #8) then Key := #0;
                if ((Sender as TStringGrid).Cells[Col, Row] = 'н') and (Key <> #8) then Key := #0;
            end;
            if ((Sender as TStringGrid).Cells[Col, Row].Length = 2) and (Key <> #8) then Key := #0;
            if ((Sender as TStringGrid).Cells[Col, Row] = '1') and (Key <> '0') and (Key <> #8) then Key := #0;
        end;
end;

procedure TEditJournalForm.StudentsSTRGSetEditText(Sender: TObject; ACol, ARow: Integer; const Value: string);
begin
    if ACol = 4 then
    try
        NeedSave := True;
        if (StrToInt(Value) < 1) or (StrToInt(Value) > 10)  then
            (Sender as TstringGrid).Cells[ACol, ARow] := '';
    except
        (Sender as TstringGrid).Cells[ACol, ARow] := '';
    end;
     if ACol > 4 then
    try
        NeedSave := True;
        if (StrToInt(Value) < 1) or (StrToInt(Value) > 10)  then
            (Sender as TstringGrid).Cells[ACol, ARow] := '';
    except
        if Value <> 'н' then
            (Sender as TstringGrid).Cells[ACol, ARow] := '';
    end;
    UpdateSTRG;
    UpdateNotesList;
end;

procedure TEditJournalForm.GetLessons;
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

procedure TEditJournalForm.GetNotes;
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

procedure TEditJournalForm.UpdateSTRGQuaterNotes;
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

procedure TEditJournalForm.FillStudentStrg;
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

procedure TEditJournalForm.AddLessonBTNClick(Sender: TObject);
var
    NewLesson: TLesson;
begin
    AddLessonForm := TAddLessonForm.Create(Self);
    NewLesson := AddLessonForm.CreateLesson;
    if (NewLesson.GetInfo <> '') and (NewLesson.GetHomeWork <> '') then
    begin
        LessonsList.Add(NewLesson);
        LessonsList.Sort(Comparer);
        StudentsStrg.ColCount := 5 + LessonsList.Count;
        UpdateSTRGLesson;
        UpdateSTRGNotes;
        NeedSave := True;
    end;
end;

function TEditJournalForm.CheckLesson(): Boolean;
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

procedure TEditJournalForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
    CanSave: Integer;
begin
    if NeedSave then
    begin
        CanSave := MessageBox(Application.Handle, 'Сохранить внесенные изменения?'#13#10'Несохраненные данные будут утеряны.', 'Редактирование журнала', MB_YESNOCANCEL);
        if CanSave = IDYES then
        begin
            SaveJournalBTNClick(SaveJournalBTN);
            CanClose := true;
        end
        else if CanSave = IDCANCEL then
            CanClose := false;
        end
    else
        CanClose := true;
end;

procedure TEditJournalForm.ImportJournal;
begin
    GetStudents;
    GetLessons;
    GetNotes;
    if NotesList.Count > 0 then
        UpdateSTRGNotes;
    StudentsStrg.ColCount := 5 + LessonsList.Count;
    if CheckLesson then
        IsNotUnderStudy.Visible := false;
    FillStudentSTRG;
    UpdateSTRGLesson;
    UpdateSTRG;
    UpdateSTRGQuaterNotes;
    NeedSave := false;
end;

procedure TEditJournalForm.FormShow(Sender: TObject);
begin
    Comparer := TDelegatedComparer<TLesson>.Create(
    function (const Left, Right: TLesson): Integer
    begin
        if Left.GetDate < Right.GetDate then
            Result := -1 else
        if Left.GetDate > Right.GetDate then
            Result := 1 else
        Result := 0;
    end);

    Self.Caption := Self.Caption + ' ' + Journal.GetClassName + '. ' + Journal.GetLesson + '.';
    ClassNameLabel.Caption := Journal.GetClassName;
    LessonLabel.Caption := Journal.GetLesson;
    QuaterLabel.Caption := Journal.GetQuater;
    ImportJournal;
    StudentsStrg.Cells[0, 0] := 'Фамилия';
    StudentsStrg.Cells[1, 0] := 'Имя';
    StudentsStrg.Cells[2, 0] := 'Пропуски';
    StudentsStrg.Cells[3, 0] := 'Средний' + #13#10 + 'балл';
    StudentsStrg.Cells[4, 0] := 'Четвертная' + #13#10 + 'оценка';
    StudentsStrg.FixedCols := 4;
end;

end.
