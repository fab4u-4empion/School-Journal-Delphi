unit SchoolClass;

interface

Uses
    Student, System.Generics.Collections;

Type
    TSchoolClass = class
        private Number: Byte;
        private LetterNumber: String[1];
        public constructor Create;
    end;

implementation

constructor TSchoolClass.Create;
begin
    Self.Number := 0;
    Self.LetterNumber := 'f';
end;

end.
