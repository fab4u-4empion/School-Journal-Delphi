unit ViewStudentList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Student, System.Generics.Collections,
  Vcl.Grids, System.Generics.Defaults;

type
  TViewStudentListForm = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    ClassNameLabel: TLabel;
    Label4: TLabel;
    StudentListSTRG: TStringGrid;
    public procedure ViewStudentList(StudentList: TList<TStudent>; ClassName: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewStudentListForm: TViewStudentListForm;

implementation

{$R *.dfm}

procedure TViewStudentListForm.ViewStudentList(StudentList: TList<Student.TStudent>; ClassName: string);
var
    I: Integer;
    Comparer: TDelegatedComparer<TStudent>;
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
    StudentList.Sort(Comparer);
    ClassNameLabel.Caption := ClassName;
    StudentListStrg.RowCount := StudentList.Count + 1;
    StudentListStrg.Cells[0, 0] := 'Фамилия';
    StudentListStrg.Cells[1, 0] := 'Имя';
    for I := 0 to StudentList.Count - 1 do
    begin
        StudentListStrg.Cells[0, I + 1] := StudentList[I].GetLastName;
        StudentListStrg.Cells[1, I + 1] := StudentList[I].GetName;
    end;
    Self.ShowModal;
end;

end.
