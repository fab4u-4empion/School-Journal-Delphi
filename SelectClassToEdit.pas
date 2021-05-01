unit SelectClassToEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, EditClass;

type
  TSelectClassToEditForm = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    ClassesCBOX: TComboBox;
    EditClassBtn: TButton;
    procedure FormShow(Sender: TObject);
    procedure EditClassBtnClick(Sender: TObject);
    procedure FillCBOX();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectClassToEditForm: TSelectClassToEditForm;

implementation

{$R *.dfm}

procedure TSelectClassToEditForm.FillCBOX();
var
    sr: TSearchRec;
begin
    If FindFirst('common/classes/*', faDirectory, sr) = 0 then
        repeat
            If (sr.Name <> '') and (sr.Name <> '.') and (sr.Name <> '..') then
                if sr.Attr = faDirectory then
                    ClassesCBOX.Items.Add(sr.Name);
        until (FindNext(sr) <> 0);
    FindClose(sr);
end;


procedure TSelectClassToEditForm.EditClassBtnClick(Sender: TObject);
var
    IsCorrect: Boolean;
begin
    IsCorrect := true;
    if ClassesCBOX.Text = '' then
    begin
        MessageBox(Application.Handle, 'Вы не выбрали класс для редактирования.', 'Редактирование класса', MB_ICONERROR);
        IsCorrect := false;
    end;
    if IsCorrect and not DirectoryExists('common/classes/' + ClassesCBOX.Text) then
    begin
        MessageBox(Application.Handle, 'Выбранного класса не существует.', 'Редактирование класса', MB_ICONERROR);
        IsCorrect := false;
    end;
    if IsCorrect then
    begin
        EditClassForm := TEditClassForm.Create(Self);
        EditClassForm.ClassName := ClassesCBOX.Text;
        Self.Hide;
        EditClassForm.ShowModal;
        EditClassForm.Destroy;
        Self.Show;
        ClassesCBOX.Items.Clear;
        ClassesCBOX.Text := '';
        FillCBOX;
        if ClassesCBOX.Items.Count = 0 then
            Self.Close;
    end;
end;

procedure TSelectClassToEditForm.FormShow(Sender: TObject);
begin
    FillCBOX;
end;

end.
