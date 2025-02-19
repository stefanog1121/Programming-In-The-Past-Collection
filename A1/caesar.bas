SUB Encode(text AS STRING, shift AS INTEGER, BYREF result AS STRING)
    DIM i AS INTEGER
    DIM char AS INTEGER
    result = ""
    
    FOR i = 1 TO LEN(text)
        char = ASC(UCASE(MID(text, i, 1)))
        IF char = 32 THEN ' Space character
            result = result & " "
        ELSE
            ' Only shift alphabetic characters (A-Z: 65-90)
            IF char >= 65 AND char <= 90 THEN
                char = 65 + ((char - 65 + shift) MOD 26)
                result = result & CHR(char)
            ELSE
                result = result & MID(text, i, 1)
            END IF
        END IF
    NEXT i
END SUB

SUB Decode(text AS STRING, shift AS INTEGER, BYREF result AS STRING)
    DIM decode_shift AS INTEGER
    decode_shift = 26 - shift
    Encode(text, decode_shift, result)
END SUB

SUB Solve(ciphertext AS STRING)
    DIM i AS INTEGER
    DIM attempt AS STRING
    
    PRINT "Solve Cipher:"
    FOR i = 1 TO 26
        attempt = ""
        Encode(ciphertext, i, attempt)
        PRINT "Shift"; i; ": "; attempt
    NEXT i
END SUB

SUB main()
    DIM code AS STRING
    DIM encrypted AS STRING
    DIM decrypted AS STRING
    DIM shift AS INTEGER
    
    code = "YOU GO TELL THAT VAPID EXISTENTIALIST QUACK FREDDY NIETZSCHE THAT HE CAN JUST BITE ME, TWICE."
    shift = 2
    encrypted = ""
    decrypted = ""
    
    Encode(code, shift, encrypted)
    PRINT " -- Caesar Cipher --"
    PRINT ""
    PRINT "Encrypted: "; encrypted
    
    Decode(encrypted, shift, decrypted)
    PRINT "Decrypted: "; decrypted
    
    PRINT ""
    code = "HAL"
    Solve(code)
END SUB

main()
END