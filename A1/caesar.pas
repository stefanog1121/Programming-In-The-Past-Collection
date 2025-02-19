program Caesar;

function Encode(code: String; shift: Integer): String;
var
    i, charASCII: Integer;
    result: String;
begin
    result := code;
    for i := 1 to Length(code) do
    begin
        charASCII := Ord(code[i]);
        
        if (charASCII >= 97) and (charASCII <= 122) then
            charASCII := charASCII - 32;  
            
        if (charASCII >= 65) and (charASCII <= 90) then
        begin
            charASCII := charASCII + shift;
            
            while (charASCII > 90) do
                charASCII := charASCII - 26;
                
            while (charASCII < 65) do
                charASCII := charASCII + 26;
            
            result[i] := Chr(charASCII);
        end
        else
        begin
            result[i] := Chr(charASCII);
        end;
    end;
    Encode := result;
end;

function Decode(code: String; shift: Integer): String;
begin
    Decode := Encode(code, -shift);
end;

procedure Solve(code: String);
var
    i: Integer;
begin
    writeln('- Solve Cipher -');

    for i:= 1 to 26 do
    begin
        writeln('Cipher ', i, ': ', encode(code, i));
    end;
end;

// Main program
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