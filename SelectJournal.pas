unit SelectJournal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, JournalInfo, ViewJournal, EditJournal;

type
    TSelectJournalForm = class(TForm)
        Label1: TLabel;
        Label3: TLabel;
        ClassesCBOX: TComboBox;
        Label2: TLabel;
        LessonsCBOX: TComboBox;
        SelectJournalBtn: TButton;
        Label4: TLabel;
        QuaterCBOX: TComboBox;
        procedure FormShow(Sender: TObject);
        procedure ClassesCBOXChange(Sender: TObject);
        procedure LessonsCBOXChange(Sender: TObject);
        procedure SelectJournalBtnClick(Sender: TObject);
        procedure QuaterCBOXChange(Sender: TObject);
        public procedure SelectJournalToView;
        public procedure SelectJournalToEdit;
        private procedure FillClassesCBOX;
        private procedure FillQuaterCBOX;
        private procedure FillLessonsCBOX;
    private
    Context: Byte;
    public
    { Public declarations }
    end;

var
    SelectJournalForm: TSelectJournalForm;

implementation

const
    EDIT = 1;
    VIEW = 2;

{$R *.dfm}

procedure TSelectJournalForm.SelectJournalToView;
begin
    Self.Caption := 'Просмотр журнала';
    SelectJournalBtn.Caption := 'Просмотреть журнал';
    Self.Context := VIEW;
    Self.ShowModal;
end;

procedure TSelectJournalForm.FillQuaterCBOX;
var
    sr: TSearchRec;
begin
    If FindFirst('common/classes/' + ClassesCBOX.Text + '/journal/*', faDirectory, sr) = 0 then
        repeat
            If (sr.Name <> '') and (sr.Name <> '.') and (sr.Name <> '..') then
                if sr.Attr = faDirectory then
                    QuaterCBOX.Items.Add(sr.Name);
        until (FindNext(sr) <> 0);
    FindClose(sr);
end;

procedure TSelectJournalForm.FillLessonsCBOX;
var
    sr: TSearchRec;
begin
    If FindFirst('common/classes/' + ClassesCBOX.Text + '/journal/' + QuaterCBOX.Text + '/*', faDirectory, sr) = 0 then
        repeat
            If (sr.Name <> '') and (sr.Name <> '.') and (sr.Name <> '..') then
                if sr.Attr = faDirectory then
                    LessonsCBOX.Items.Add(sr.Name);
        until (FindNext(sr) <> 0);
    FindClose(sr);
end;

procedure TSelectJournalForm.ClassesCBOXChange(Sender: TObject);
begin
    LessonsCBOX.Items.Clear;
    LessonsCBOX.Enabled := false;
    LessonsCBOX.Text := '';
    QuaterCBOX.Items.Clear;
    QuaterCBOX.Enabled := false;
    QuaterCBOX.Text := '';
    SelectJournalBtn.Enabled := false;
    if ClassesCBOX.Items.IndexOf(ClassesCBOX.Text) <> -1 then
    begin
        FillQuaterCBOX;
        QuaterCBOX.Enabled := true;
    end;
end;

procedure TSelectJournalForm.FillClassesCBOX;
var
    sr: TSearchRec;
begin
    ClassesCBOX.Clear;
    If FindFirst('common/classes/*', faDirectory, sr) = 0 then
        repeat
            If (sr.Name <> '') and (sr.Name <> '.') and (sr.Name <> '..') then
                if sr.Attr = faDirectory then
                    ClassesCBOX.Items.Add(sr.Name);
        until (FindNext(sr) <> 0);
    FindClose(sr);
end;

procedure TSelectJournalForm.FormShow(Sender: TObject);
begin
    FillClassesCBOX;
    QuaterCBOX.Enabled := false;
    QuaterCBOX.Text := '';
    LessonsCBOX.Enabled := false;
    LessonsCBOX.Text := '';
    SelectJournalBtn.Enabled := false;
end;

procedure TSelectJournalForm.LessonsCBOXChange(Sender: TObject);
begin
    SelectJournalBtn.Enabled := false;
    if LessonsCBOX.Items.IndexOf(LessonsCBOX.Text) <> -1 then
    begin
        SelectJournalBtn.Enabled := true;
    end;
end;

procedure TSelectJournalForm.QuaterCBOXChange(Sender: TObject);
begin
    LessonsCBOX.Items.Clear;
    LessonsCBOX.Enabled := false;
    LessonsCBOX.Text := '';
    SelectJournalBtn.Enabled := false;
    if QuaterCBOX.Items.IndexOf(QuaterCBOX.Text) <> -1 then
    begin
        FillLessonsCBOX;
        LessonsCBOX.Enabled := true;
    end;
end;

procedure TSelectJournalForm.SelectJournalBtnClick(Sender: TObject);
var
    Journal: TJournal;
    JournalFile, StudentsFile, TestFile: TextFile;
    Flag: Boolean;
begin
    Flag := true;
    Journal.SetClassName(ClassesCBOX.Text);
    Journal.SetLesson(LessonsCBOX.Text);
    Journal.SetQuater(QuaterCBOX.Text);
    try
        AssignFile(TestFile, 'common/classes/' + Journal.GetClassName + '/lessons.lessons');
        reset(TestFile);
        closefile(TestFile);
        AssignFile(TestFile, 'common/classes/' + Journal.GetClassName + '/students.students');
        reset(TestFile);
        closefile(TestFile);
        AssignFile(TestFile, 'common/classes/' + Journal.GetClassName + '/journal/' + Journal.GetQuater + '/' + Journal.GetLesson + '/lessons.lessons');
        reset(TestFile);
        closefile(TestFile);
        AssignFile(TestFile, 'common/classes/' + Journal.GetClassName + '/journal/' + Journal.GetQuater + '/' + Journal.GetLesson + '/notes.notes');
        reset(TestFile);
        closefile(TestFile);
        AssignFile(TestFile, 'common/classes/' + Journal.GetClassName + '/journal/' + Journal.GetQuater + '/' + Journal.GetLesson + '/quater.notes');
        reset(TestFile);
        closefile(TestFile);
    except
        flag := false;
        MessageBox(Application.Handle, 'Не удается получить доступ к файлам класса или журнала.', 'Выбор журнала', MB_ICONERROR);
    end;
    if (Self.Context = EDIT) and flag then
    begin
        EditJournalForm := TEditJournalForm.Create(Self);
        EditJournalForm.Journal := Journal;
        AssignFile(StudentsFile, 'common/classes/' + Journal.GetClassName + '/students.students');
        Reset(StudentsFile);
        if eof(StudentsFile)  then
        begin
            CloseFile(StudentsFile);
            MessageBox(Application.Handle, 'В классе нет учеников.', 'Редактирование журнала', MB_ICONERROR);
        end
        else
        begin
            CloseFile(StudentsFile);
            Self.Hide;
            EditJournalForm.ShowModal;
            Self.Show;
            EditJournalForm.Destroy;
        end;
    end
    else
    if (Self.Context = VIEW) and flag then
    begin
        ViewJournalForm := TViewJournalForm.Create(Self);
        ViewJournalForm.Journal := Journal;
        AssignFile(JournalFile, 'common/classes/' + Journal.GetClassName + '/journal/' + Journal.GetQuater + '/' + Journal.GetLesson + '/lessons.lessons');
        Reset(JournalFile);
        if eof(JournalFile)  then
        begin
            CloseFile(JournalFile);
            MessageBox(Application.Handle, 'У класса еще не было уроков по этому предмету.', 'Журнал класса', MB_ICONERROR);
        end
        else
        begin
            CloseFile(JournalFile);
            Self.Hide;
            ViewJournalForm.ShowModal;
            Self.Show;
            ViewJournalForm.Destroy;
        end;
    end;
end;

procedure TSelectJournalForm.SelectJournalToEdit;
begin
    Self.Caption := 'Редактирование журнала';
    SelectJournalBtn.Caption := 'Редактировать журнал';
    Self.Context := EDIT;
    Self.ShowModal;
end;

end.
