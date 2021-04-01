program HelloFile;
const
	message = 'Hello, world!';
	filename = 'data.log';
var
	f: text;
begin
	{$I-}
	assign(f, filename);
	{rewrite(f);}
	append(f);
	if IOResult <> 0 then
	begin
		writeln('Couldn''t open file ', filename);
		halt(1)
	end;
	writeln(f, 'Данил вычислил синус');
	if IOResult <> 0 then
	begin
		writeln('Couldn''t write to the file');
		halt(1)
	end;
	close(f)
end.
