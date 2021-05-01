unit Lesson;

interface

uses
    DateUtils, SysUtils;

Type
    TLesson = record
        private Date: TDate;
        private ID: Int64;
        private Info: String[100];
        private HomeWork: String[50];
        public procedure NewLesson(Date: TDate; Info, HomeWork: String);
        public function GetID: Int64;
        public function GetDate: TDate;
        public function GetInfo: String;
        public function GetHomeWork: String;
    end;

implementation

procedure TLesson.NewLesson(Date: TDate; Info, HomeWork: String);
begin
    Self.Date := Date;
    Self.ID := DateTimeToUnix(Now);
    Self.Info := Info;
    Self.HomeWork := HomeWork;
end;

function TLesson.GetDate: TDate;
begin
    Result := Self.Date;
end;

function TLesson.GetID: Int64;
begin
    Result := Self.ID;
end;

function TLesson.GetInfo: String;
begin
    Result := Self.Info;
end;

function TLesson.GetHomeWork: String;
begin
    Result := Self.HomeWork;
end;

end.
