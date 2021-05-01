program MainLab;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {BaseForm},
  AddClass in 'AddClass.pas' {AddClassForm},
  EditClass in 'EditClass.pas' {EditClassForm},
  ViewJournal in 'ViewJournal.pas' {ViewJournalForm},
  EditJournal in 'EditJournal.pas' {EditJournalForm},
  Student in 'Student.pas',
  SelectClassToEdit in 'SelectClassToEdit.pas' {SelectClassToEditForm},
  AddStudent in 'AddStudent.pas' {AddStudentForm},
  ViewStudentList in 'ViewStudentList.pas' {ViewStudentListForm},
  DeleteStudent in 'DeleteStudent.pas' {DeleteStudentForm},
  SelectJournal in 'SelectJournal.pas' {SelectJournalForm},
  JournalInfo in 'JournalInfo.pas',
  Lesson in 'Lesson.pas',
  AddLesson in 'AddLesson.pas' {AddLessonForm},
  Note in 'Note.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Sky');
  Application.CreateForm(TBaseForm, BaseForm);
  Application.CreateForm(TAddClassForm, AddClassForm);
  Application.CreateForm(TEditClassForm, EditClassForm);
  Application.CreateForm(TViewJournalForm, ViewJournalForm);
  Application.CreateForm(TEditJournalForm, EditJournalForm);
  Application.CreateForm(TSelectClassToEditForm, SelectClassToEditForm);
  Application.CreateForm(TAddStudentForm, AddStudentForm);
  Application.CreateForm(TViewStudentListForm, ViewStudentListForm);
  Application.CreateForm(TDeleteStudentForm, DeleteStudentForm);
  Application.CreateForm(TSelectJournalForm, SelectJournalForm);
  Application.CreateForm(TAddLessonForm, AddLessonForm);
  Application.Run;
end.
