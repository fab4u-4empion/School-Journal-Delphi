unit Note;

interface

type
    TNote = record
        private Note: String[2];
        private StudentID: Int64;
        private LessonID: Int64;
        public function GetNote: String;
        public function GetStudenID: Int64;
        public function GetLessonID: Int64;
        public procedure SetNote(Note: String);
        public procedure SetStudenID(StudentID: Int64);
        public procedure SetLessonID(LessonID: Int64);
    end;

implementation

function TNote.GetNote: String;
begin
    Result := Self.Note;
end;

function TNote.GetStudenID: Int64;
begin
    Result := Self.StudentID;
end;

function TNote.GetLessonID: Int64;
begin
    Result := Self.LessonID;
end;

procedure TNote.SetNote(Note: string);
begin
    Self.Note := Note;
end;

procedure TNote.SetStudenID(StudentID: Int64);
begin
    Self.StudentID := StudentID;
end;

procedure TNote.SetLessonID(LessonID: Int64);
begin
    Self.LessonID := LessonID;
end;

end.
