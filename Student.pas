unit Student;

interface

uses
    DateUtils, SysUtils, StrUtils;

Type
    TStudent = record
        private Name: String[20];
        private LastName: String[20];
        private ID: Int64;
        public procedure NewStudent(StudentName, StudentLastName: String);
        function GetName: String;
        function GetLastName: String;
        function GetID: Int64;
    end;

implementation

procedure TStudent.NewStudent(StudentName: string; StudentLastName: string);
begin
    Self.Name := StudentName;
    Self.LastName := StudentLastName;
    Self.ID := DateTimeToUnix(Now);
end;

function TStudent.GetName: String;
begin
    Result := Self.Name;
end;

function TStudent.GetLastName: String;
begin
    Result := Self.LastName;
end;

function TStudent.GetID: Int64;
begin
    Result := Self.ID;
end;

end.
