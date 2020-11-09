unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    ComboBox1: TComboBox;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  List1, List2, List3: TStringList;
  Param: Integer;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
List1:=TStringList.Create;
List2:=TStringList.Create;
List3:=TStringList.Create;
StringGrid1.Cells[0, 1]:='Иванов';
StringGrid1.Cells[0, 2]:='Петров';
StringGrid1.Cells[0, 3]:='Сидоров';
StringGrid1.Cells[0, 4]:='Ковалёв';
StringGrid1.Cells[0, 0]:='Фамилия';
StringGrid1.Cells[1, 0]:='Рост';
StringGrid1.Cells[2, 0]:='Вес';
ComboBox1.ItemIndex:=0;
end;

procedure TForm1.Button1Click(Sender: TObject);
var i, k: Integer;
begin
Caption:='';
List1.Clear; List2.Clear; List3.Clear;
Param:=ComboBox1.ItemIndex+1;
for i:=1 to StringGrid1.RowCount-1 do
 begin
k:=List1.IndexOf(StringGrid1.Cells[Param, i]);
if k=-1
  then  begin
   List1.Add(StringGrid1.Cells[Param, i]);
   List2.Add(StringGrid1.Cells[0, i]);
   List3.Add('1');
        end
  else begin
   List2[k]:=List2[k]+', '+StringGrid1.Cells[0, i];
   List3[k]:=IntToStr(StrToInt(List3[k])+1);
  end;
 end;
k:=0;
for i:=0 to List3.Count-1 do
  if StrToInt(List3[i])>k then
      k:=StrToInt(List3[i]);
for i:=0 to List2.Count-1 do
  if StrToInt(List3[i])=k then Caption:=Caption+List2[i]+': '+List1[i]+'; ';
end;

end.
