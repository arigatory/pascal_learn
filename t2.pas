var n: longint;
    res:integer;
begin
	readln(n);
	res := 0;
	repeat
		n := n div 10;
		res := res + 1;
	until n = 0;
	writeln(res);
end.
