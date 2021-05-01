unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AddClass, SelectClassToEdit,
  Vcl.Menus, SelectJournal, System.Generics.Collections, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TBaseForm = class(TForm)
    AddClass: TButton;
    ViewJournal: TButton;
    EditJournal: TButton;
    EditClass: TButton;
    MainMenu1: TMainMenu;
    HelpBTN: TMenuItem;
    Image1: TImage;
    procedure AddClassClick(Sender: TObject);
    procedure ViewJournalClick(Sender: TObject);
    procedure EditJournalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditClassClick(Sender: TObject);
    procedure CheckClasses;
    procedure HelpBTNClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BaseForm: TBaseForm;

implementation

const
    HELP = 'Программное средство "Электронный журнал".'#13#10#13#10'В данной программе можно создавать учебные классы, редактировать классы, просматривать и редактировать электронные журналы классов.';

{$R *.dfm}

procedure MakeDefaultDir();
begin
    if not DirectoryExists('common') then
        CreateDir('common');
    if not DirectoryExists('common/classes') then
        CreateDir('common/classes');
end;

procedure TBaseForm.AddClassClick(Sender: TObject);
begin
    AddClassForm := TAddClassForm.Create(Self);
    AddClassForm.ShowModal;
    AddClassForm.Destroy;
    CheckClasses;
end;

procedure TBaseForm.EditClassClick(Sender: TObject);
begin
    SelectClassToEditForm := TSelectClassToEditForm.Create(Self);
    SelectClassToEditForm.ShowModal;
    SelectClassToEditForm.Destroy;
    CheckClasses;
end;

procedure TBaseForm.EditJournalClick(Sender: TObject);
begin
    SelectJournalForm := TSelectJournalForm.Create(Self);
    SelectJournalForm.SelectJournalToEdit;
    SelectJournalForm.Destroy;
end;

procedure TBaseForm.CheckClasses();
var
    sr: TSearchRec;
    Classes: TList<String>;
begin
    Classes := TList<String>.Create;
    If FindFirst('common/classes/*', faDirectory, sr) = 0 then
        repeat
            If (sr.Name <> '') and (sr.Name <> '.') and (sr.Name <> '..') then
                if sr.Attr = faDirectory then
                    Classes.Add(sr.Name);
        until (FindNext(sr) <> 0);
    FindClose(sr);
    if Classes.Count = 0 then
    begin
        ViewJournal.Enabled := false;
        EditJournal.Enabled := false;
        EditClass.Enabled := false;
    end
    else
    begin
        ViewJournal.Enabled := true;
        EditJournal.Enabled := true;
        EditClass.Enabled := true;
    end;
end;

procedure TBaseForm.FormCreate(Sender: TObject);
begin
    MakeDefaultDir();
    CheckClasses;
end;

procedure TBaseForm.HelpBTNClick(Sender: TObject);
begin
    MessageBox(Application.Handle, HELP, 'Справка', MB_ICONINFORMATION);
end;

procedure TBaseForm.ViewJournalClick(Sender: TObject);
begin
    SelectJournalForm := TSelectJournalForm.Create(Self);
    SelectJournalForm.SelectJournalToView;
    SelectJournalForm.Destroy;
end;

end.
