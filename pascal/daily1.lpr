program daily1;

{$mode objfpc}{$H+}

{
  Given a list of numbers and a number k, return whether any two numbers from the list add up to k.
  For example, given [10, 15, 3, 7] and k of 17, return true since 10 + 7 is 17.
}

uses
  SysUtils, DateUtils;

type
  TArrayOfInt = array of Integer;

  function addUp(list: TArrayOfInt; sum: Integer; out access: Integer): boolean;
  var
    listLength, leftIndex, currentIndex, n: Integer;
  begin
    Result := False;
    access := 0;
    leftIndex := 0;
    currentIndex := 0;
    listLength := length(list);
    n := list[leftIndex];
    inc(access);

    while leftIndex < listLength - 1 do begin
      inc(currentIndex);
      inc(access);
      if sum = n + list[currentIndex] then begin
        //WriteLn(IntToStr(n) + ' + ' + IntToStr(list[currentIndex]) + ' = ' + IntToStr(sum));
        exit(True);
      end;

      if currentIndex >= listLength - 1 then begin
        currentIndex := leftIndex + 1;
        n := list[leftIndex];
        inc(access);
        inc(leftIndex);
      end;
    end;
  end;

  function addUp2(list: TArrayOfInt; sum: Integer; out access: Integer): boolean;
  var
    item, value: Integer;
    tempSum: Integer;
    auxList: TArrayOfInt;
  begin
    access := 0;
    Result := False;
    auxList := [];
    for item in list do begin
      tempSum := sum - item;
      inc(access);
      for value in list do begin
         inc(access);
         if value = tempSum then begin
           //WriteLn(IntToStr(item) + ' + ' + IntToStr(tempSum) + ' = ' + IntToStr(sum));
           exit(True);
        end;
      end;
      SetLength(auxList, Length(auxList) + 1);
      auxList[high(auxList)] := item;
    end;
  end;

const
  List: TArrayOfInt = (10, 15, 3, 7);
  List2: TArrayOfInt = (10, 15, 3, 34);
  K: Integer = 17;
  runTimes = 1000;

var
  Res: Boolean;
  StartTime, EndTime: TDateTime;
  i, access: integer;

begin
  StartTime := Now;
  for i := 1 to runTimes do
    res := addUp(List, k, access);
  EndTime := Now;

  WriteLn(res);
  WriteLn('Took ', MilliSecondsBetween(EndTime, StartTime), ' ms to run ', runTimes, ' times.', ' Array accesses: ', access);

  StartTime := Now;
  for i := 1 to runTimes do
    res := addUp2(List, k, access);
  EndTime := Now;

  WriteLn(res);
  WriteLn('Took ', MilliSecondsBetween(EndTime, StartTime), ' ms to run ', runTimes, ' times.', ' Array accesses: ', access);
  Write('Press enter to exit ');
  ReadLn;
end.

