program Caesar;

function Encode(code: String; shift: Integer): String;
var
    i, charASCII: Integer;
    result: String;
begin
    result := code;
    {Loop through each character in the input string}
    for i := 1 to Length(code) do
    begin
        {Convert character to ASCII value}
        charASCII := Ord(code[i]);
        
        {Convert lowercase to uppercase (ASCII 97-122 to 65-90)}
        if (charASCII >= 97) and (charASCII <= 122) then
            charASCII := charASCII - 32;  
        
        {Only shift uppercase alphabeter characters}    
        if (charASCII >= 65) and (charASCII <= 90) then
        begin
            charASCII := charASCII + shift;
            
            {Wrap around if shifted beyond Z (ASCII 90)}
            while (charASCII > 90) do
                charASCII := charASCII - 26;
            
            {Wrap around if shifted before A (ASCII 65)}    
            while (charASCII < 65) do
                charASCII := charASCII + 26;
            
            result[i] := Chr(charASCII);
        end
        else
        begin
            {Keep non-alphabetic characters unchanged}
            result[i] := Chr(charASCII);
        end;
    end;
    Encode := result;
end;


function Decode(code: String; shift: Integer): String;
begin
    {Decode is same as a negatively shifting encode}
    Decode := Encode(code, -shift);
end;

{--- Solving Function ---}
{Attempts all possible shifts (1-26) to solve unknown cipher}
procedure Solve(code: String);
var
    i: Integer;
begin
    writeln('- Solve Cipher -');

    {Try each possible shift value}
    for i:= 1 to 26 do
    begin
        writeln('Cipher ', i, ': ', encode(code, i));
    end;
end;

{Main program procedure}
var
    shift: Integer;
    code: String;
begin
    shift := 2;
    code := 'YOU GO TELL THAT VAPID EXISTENTIALIST QUACK FREDDY NIETZSCHE THAT HE CAN JUST BITE ME, TWICE.';
    writeln('-- Caesar Cipher --');

    code := Encode(code, shift);
    writeln('Encrypted: ', code);

    code := Decode(code, shift);
    writeln('Decrypted: ', code);
    
    code := 'HAL';
    Solve(code);

end.