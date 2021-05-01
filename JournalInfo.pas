unit JournalInfo;

interface

Type
    TJournal = record
        private ClassName: String;
        private Lesson: String;
        private Quater: String;
        public function GetClassName: String;
        public function GetLesson: String;
        public function GetQuater: String;
        public procedure SetClassName(ClassName: String);
        public procedure SetLesson(Lesson: String);
        public procedure SetQuater(Quater: String);
    end;

implementation

function TJournal.GetClassName: String;
begin
    Result := Self.ClassName;
end;

function TJournal.GetLesson: String;
begin
    Result := Self.Lesson;
end;

function TJournal.GetQuater: String;
begin
    Result := Self.Quater;
end;

procedure TJournal.SetClassName(ClassName: string);
begin
    Self.ClassName := ClassName;
end;

procedure TJournal.SetLesson(Lesson: string);
begin
    Self.Lesson := Lesson;
end;

procedure TJournal.SetQuater(Quater: string);
begin
    Self.Quater := Quater;
end;

end.
