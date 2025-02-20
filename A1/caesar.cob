*> === CAESAR CIPHER ===
IDENTIFICATION DIVISION.
    PROGRAM-ID. IDEONE.
ENVIRONMENT DIVISION.
DATA DIVISION.
WORKING-STORAGE SECTION.
    *> Main storage for input/output text and shift parameters
    01 INPUT-TEXT           PIC X(50) VALUE SPACES.
    01 OUTPUT-TEXT          PIC X(50) VALUE SPACES.
    01 SHIFT-AMOUNT         PIC S99.
    01 MAX-SHIFT            PIC 99.
    
    *> Counter variables for text processing
    01 COUNTERS.
        05 TEXT-LENGTH      PIC 99 VALUE 0.
        05 CHAR-POS         PIC 99 VALUE 1.
    
    *> Working variables for char manipulation
    01 WORK-AREAS.
        05 CURRENT-CHAR     PIC X.
        05 ASCII-VAL        PIC 999.
        05 SHIFTED-VAL      PIC 999.
        05 SOLVE-COUNT      PIC 999.
    
    *> Display formatting
    01 DISPLAY-FORMAT.
        05 FILLER           PIC X(7) VALUE 'Cipher '.
        05 SHIFT-NUM        PIC Z9.
        05 FILLER           PIC X(2) VALUE ': '.
        05 CIPHER-TEXT      PIC X(50).

PROCEDURE DIVISION.
*> --- Encoding Function ---
ENCRYPT-TEXT.
    MOVE 0 TO TEXT-LENGTH
    MOVE SPACES TO OUTPUT-TEXT
    STRING INPUT-TEXT DELIMITED BY SIZE
           INTO OUTPUT-TEXT
    *> Count actual text length without trailing spaces
    INSPECT INPUT-TEXT TALLYING TEXT-LENGTH 
        FOR CHARACTERS
    *> Process each character in the input text
    PERFORM VARYING CHAR-POS FROM 1 BY 1 
        UNTIL CHAR-POS > TEXT-LENGTH
        MOVE INPUT-TEXT(CHAR-POS:1) TO CURRENT-CHAR
        MOVE FUNCTION ORD(CURRENT-CHAR) TO ASCII-VAL
        *> Handle uppercase letters (ASCII 65-90)
        IF (ASCII-VAL >= 65 AND ASCII-VAL <= 90)
            PERFORM PROCESS-CHAR
            MOVE CURRENT-CHAR TO OUTPUT-TEXT(CHAR-POS:1)
        *> Handle lowercase letters (ASCII 97-122)
        ELSE IF (ASCII-VAL >= 97 AND ASCII-VAL <= 122)
            *> Convert to uppercase for consistent processing
            COMPUTE ASCII-VAL = ASCII-VAL - 32
            MOVE FUNCTION CHAR(ASCII-VAL) TO CURRENT-CHAR
            PERFORM PROCESS-CHAR
            MOVE CURRENT-CHAR TO OUTPUT-TEXT(CHAR-POS:1)
        *> Keep non-alphabetic characters unchanged
        ELSE
            MOVE CURRENT-CHAR TO OUTPUT-TEXT(CHAR-POS:1)
        END-IF
    END-PERFORM.
    EXIT.

*> --- Decoding Function ---
*> Decrypts text by using negative shift value
DECRYPT-TEXT.
    MULTIPLY SHIFT-AMOUNT BY -1 GIVING SHIFT-AMOUNT
    PERFORM ENCRYPT-TEXT
    MULTIPLY SHIFT-AMOUNT BY -1 GIVING SHIFT-AMOUNT.
    EXIT.

*> --- Solving Function ---
*> Attempts all possible shifts (1-26) to solve unknown cipher
SOLVE-CIPHER.
    PERFORM VARYING SOLVE-COUNT FROM 1 BY 1
        UNTIL SOLVE-COUNT > MAX-SHIFT
        MOVE SOLVE-COUNT TO SHIFT-AMOUNT
        MOVE SOLVE-COUNT TO SHIFT-NUM
        MOVE SPACES TO OUTPUT-TEXT
        PERFORM ENCRYPT-TEXT
        MOVE OUTPUT-TEXT TO CIPHER-TEXT
        DISPLAY DISPLAY-FORMAT
    END-PERFORM.
    EXIT.

*> Helper function to process individual characters
*> Applies the shift and handles alphabet wraparound
PROCESS-CHAR.
    *> Convert A-Z to 0-25 range
    COMPUTE SHIFTED-VAL = ASCII-VAL - 65
    *> Apply shift
    ADD SHIFT-AMOUNT TO SHIFTED-VAL
    *> Handle negative shifts
    ADD 26 TO SHIFTED-VAL
    *> Wrap around alphabet using modulo
    DIVIDE SHIFTED-VAL BY 26 GIVING SHIFTED-VAL REMAINDER SHIFTED-VAL
    *> Convert back to ASCII range
    ADD 65 TO SHIFTED-VAL
    MOVE FUNCTION CHAR(SHIFTED-VAL) TO CURRENT-CHAR.
    EXIT.

MAIN-PROCEDURE.
    *> Test encryption
    MOVE "OPERATION DAYBREAK" TO INPUT-TEXT
    MOVE 2 TO SHIFT-AMOUNT
    PERFORM ENCRYPT-TEXT
    DISPLAY "Encrypted: " OUTPUT-TEXT
    
    *> Test decryption
    MOVE OUTPUT-TEXT TO INPUT-TEXT
    PERFORM DECRYPT-TEXT
    DISPLAY "Decrypted: " OUTPUT-TEXT
    
    *> Test cipher solving
    MOVE "HAL" TO INPUT-TEXT
    MOVE SPACES TO OUTPUT-TEXT
    MOVE 26 TO MAX-SHIFT
    PERFORM SOLVE-CIPHER.
    STOP RUN.