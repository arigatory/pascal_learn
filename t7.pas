function value(c: char): integer;
begin
	value:=-1;
	if c = 'I' then value:=1;
	if c = 'V' then value:=5;
	if c = 'X' then value:=10;
	if c = 'L' then value:=50;
	if c = 'C' then value:=100;
	if c = 'D' then value:=500;
	if c = 'M' then value:=1000;

end;

function romanToDecimal(s: string):integer;
var res, i, n1, n2:integer;
begin
	res:=0;
	i:=1;
	while i <= length(s) do
	begin
		n1 := value(s[i]);
		if i+1 <= length(s) then 
		begin
			n2 := value(s[i+1]);
			if (n1 >= n2) then
				res := res + n1
			else begin
				res := res + n2 - n1;
				i := i + 1;
			end
		end 
		else
			res := res + n1;		
		i := i + 1;
	end;
	romantoDecimal := res;		
end;

function decimalToRoman(n: integer):string;

type
	arr4 = array[0..3] of string;
	arr9 = array[0..9] of string;
var 
	thousands, hundreds,tens,ones:string;
	m: arr4 = ('','M','MM','MMM');
	c: arr9 = ('','C','CC','CCC','CD','D','DC','DCC','DCCC','CM');
	x: arr9 = ('','X','XX','XXX','XL','L','LX','LXX','LXXX','XC');
	i: arr9 = ('','I','II','III','IV','V','VI','VII','VIII','IX');
begin
	thousands := m[n div 1000];
	hundreds := c[(n mod 1000) div 100];
	tens := x[(n mod 100) div 10];
	ones := i[n mod 10];

	decimalToRoman := thousands + hundreds + tens + ones;
end;


var 
	s, s1, s2: string;
	num1, num2, i:integer;
	before: boolean;
begin
	before := true;
	readln(s);
	s1 := '';
	s2 := '';	
	for i:=1 to length(s) do begin
		if s[i] = '+' then
			before := false
		else 
			if before then
				s1 := s1 + s[i]
			else
				s2 := s2 + s[i];
	end;

	writeln(decimalToRoman(romanToDecimal(s1) + romanToDecimal(s2)));
end.

