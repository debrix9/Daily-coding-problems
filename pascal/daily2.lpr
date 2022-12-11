program daily2;

{$mode objfpc}{$H+}

uses
  Classes, SysUtils;

{
  Given an array of integers, return a new array such that each element at index i of the new array is the product of all the numbers
  in the original array except the one at i.
  For example, if our input was [1, 2, 3, 4, 5], the expected output would be [120, 60, 40, 30, 24]. If our input was [3, 2, 1], the
  expected output would be [2, 3, 6].
  Follow-up: what if you can't use division?
}

type
  TArrayOfInteger = array of Integer;

const
  arr1 : TArrayOfInteger = (1, 2, 3, 4, 5);
  arr2 : TArrayOfInteger = (3, 2, 1);

  function prettyPrintArray(arr: TArrayOfInteger): String;
  var
    stringList: TStrings;
    i: integer;
  begin
    result := '[]';
    stringList := TStringList.Create;
    try
      for i := 0 to high(arr) do
        stringList.Append(IntToStr(arr[i]));
      result := '[' + stringList.CommaText + ']';
    finally
      stringList.Free;
    end;
  end;

  function getProductArray(values: TArrayOfInteger): TArrayOfInteger;
  var
    totalProduct, value, i: integer;
  begin
    totalProduct := 1;
    for value in values do
      totalProduct *= value;

    Result := Copy(values, 0, length(values));
    for i := 0 to high(Result) do
      Result[i] := totalProduct div Result[i];
  end;

  function getProductArrayNoDivision(values: TArrayOfInteger): TArrayOfInteger;
  var
    leftArray, rightArray: TArrayOfInteger;
    leftProduct, rightProduct, i, lastIndex: integer;
  begin
    Result := [];
    leftArray := [];
    rightArray := [];
    leftProduct := 1;
    rightProduct := 1;

    lastIndex := high(values);

    SetLength(leftArray, lastIndex + 1);
    SetLength(rightArray, lastIndex + 1);

    // build left array product
    leftArray[0] := 1;
    for i := 0 to lastIndex - 1  do begin
      leftProduct *= values[i];
      leftArray[i + 1] := leftProduct;
    end;

    // build right array product
    rightArray[lastIndex] := 1;
    for i := lastIndex downto 1 do begin
      rightProduct *= values[i];
      rightArray[i - 1] := rightProduct;
    end;

    // combine product
    SetLength(Result, lastIndex + 1);
    for i := 0 to lastIndex do
      Result[i] := leftArray[i] * rightArray[i];
  end;

begin
  WriteLn('productArray1 = ', prettyPrintArray(getProductArray(arr1)));
  WriteLn('productArray2 = ', prettyPrintArray(getProductArray(arr2)));

  WriteLn('productArray1 = ', prettyPrintArray(getProductArrayNoDivision(arr1)));
  WriteLn('productArray2 = ', prettyPrintArray(getProductArrayNoDivision(arr2)));

  ReadLn;
end.

