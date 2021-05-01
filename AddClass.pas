unit AddClass;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin, System.RegularExpressions,
  System.Math, System.Generics.Collections, Vcl.Menus;

type
  TAddClassForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    NumberOfClassEdit: TSpinEdit;
    Label3: TLabel;
    ClassLetterEdit: TEdit;
    ScrollBox: TScrollBox;
    CheckBox1: TCheckBox;
    Label4: TLabel;
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
    AddClassBtn: TButton;
    MainMenu1: TMainMenu;
    HelpBTN: TMenuItem;
    procedure ClassLetterEditKeyPress(Sender: TObject; var Key: Char);
    procedure ClassLetterEditChange(Sender: TObject);
    procedure AddClassBtnClick(Sender: TObject);
    procedure MakeDir;
    procedure MakeClassLessonsFile;
    procedure MakeClassStudentsFile;
    procedure MakeClassJournal;
    function DataValidation: Boolean;
    procedure HelpBTNClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddClassForm: TAddClassForm;

implementation

{$R *.dfm}

const
    ClassLetterPattern = '^[А-Яа-я]$';
    HELP = 'Добавление класса.'#13#10#13#10'Для добавления класса нужно указать его номер (число от 1 до 11), буквенное обозначение (любая буква русского алфавита), указать хотя бы один изучаемый предмет.'#13#10#13#10'';

procedure TAddClassForm.MakeDir();
var
    ClassDir: String;
    LetterNumber: String;
begin
    LetterNumber := ClassLetterEdit.Text;
    LetterNumber := LetterNumber.ToUpper;
    ClassDir := IntToStr(NumberOfClassEdit.Value) + ' ' +  LetterNumber;
    if not DirectoryExists('common/classes/' + ClassDir) then
        CreateDir('common/classes/' + ClassDir)
    else
        MessageBox(Application.Handle, 'Класс уже существует.', 'Добавление класса', MB_ICONERROR);
end;

procedure TAddClassForm.HelpBTNClick(Sender: TObject);
begin
    MessageBox(Application.Handle, HELP, 'Справка', MB_ICONINFORMATION);
end;

function TAddClassForm.DataValidation: Boolean;
var
    IsCorrect, IsChecked: Boolean;
    I: Integer;
begin
    IsCorrect := true;
    IsChecked := false;
    if ClassLetterEdit.Text = '' then
    begin
        IsCorrect := false;
        MessageBox(Application.Handle, 'Вы не ввели буквенное обозначение класса.', 'Добавление класса', MB_ICONERROR);
    end;
    if IsCorrect then
    begin
        I := 0;
        while (I < ComponentCount) and not IsChecked do
        begin
            if Components[I] is TCheckBox then
                IsChecked := (Components[I] as TCheckBox).Checked;
            Inc(I);
        end;
        if not IsChecked then
        begin
            IsCorrect := false;
            MessageBox(Application.Handle, 'Вы не выбрали изучаемые предметы.', 'Добавление класса', MB_ICONERROR);
        end;
    end;
    Result := IsCorrect;
end;

procedure TAddClassForm.MakeClassLessonsFile;
var
    I: Integer;
    ClassLessonsFile: TextFile;
    ClassLessonsDir: String;
    LetterNumber: String;
begin
    LetterNumber := ClassLetterEdit.Text;
    LetterNumber := LetterNumber.ToUpper;
    ClassLessonsDir := 'common/classes/' +  IntToStr(NumberOfClassEdit.Value) + ' ' + LetterNumber + '/lessons.lessons';
    AssignFile(ClassLessonsFile, ClassLessonsDir);
    Rewrite(ClassLessonsFile);
    for I := 0 to ComponentCount - 1 do
        if Components[I] is TCheckBox then
            if (Components[I] as TCheckBox).Checked then
                Writeln(ClassLessonsFile, (Components[I] as TCheckBox).Caption);
     closeFile(ClassLessonsFile);
end;

procedure TAddClassForm.MakeClassStudentsFile;
var
    ClassStudentsDir: String;
    LetterNumber: String;
    ClassStudentsFile: TextFile;
begin
    LetterNumber := ClassLetterEdit.Text;
    LetterNumber := LetterNumber.ToUpper;
    ClassStudentsDir := 'common/classes/' +  IntToStr(NumberOfClassEdit.Value) + ' ' +  LetterNumber + '/students.students';
    AssignFile(ClassStudentsFile, ClassStudentsDir);
    Rewrite(ClassStudentsFile);
    write(ClassStudentsFile, '');
    closeFile(ClassStudentsFile);
end;

procedure TAddClassForm.MakeClassJournal;
var
    LetterNumber, JournalDir: String;
    I, J: Integer;
    NotesFile, LessonsFile: TextFile;
begin
    LetterNumber := ClassLetterEdit.Text;
    LetterNumber := LetterNumber.ToUpper;
    JournalDir := 'common/classes/' +  IntToStr(NumberOfClassEdit.Value) + ' ' +  LetterNumber + '/journal';
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

procedure TAddClassForm.AddClassBtnClick(Sender: TObject);
begin
    if DataValidation then
    begin
         MakeDir;
         MakeClassLessonsFile;
         MakeClassStudentsFile;
         MakeClassJournal;
         MessageBox(Application.Handle, 'Класс успешно создан.', 'Добавление класса', MB_ICONINFORMATION);
         Self.Close;
    end;
end;

procedure TAddClassForm.ClassLetterEditChange(Sender: TObject);
var
    regEx: TRegEx;
    match: TMatch;
begin
    regEx.Create(ClassLetterPattern);
    match := regEx.Match(ClassLetterEdit.Text);
    if match.Value = '' then
        ClassLetterEdit.Text := '';
end;

procedure TAddClassForm.ClassLetterEditKeyPress(Sender: TObject; var Key: Char);
var
    regEx: TRegEx;
    match: TMatch;
begin
    if ((Key < #128) or (Key > #159)) and (Key <> #8) then
        Key := #0;
    regEx.Create(ClassLetterPattern);
    match := regEx.Match(ClassLetterEdit.Text);
    if (match.Value <> '') and (Key <> #8) then
        Key := #0;
end;

end.
