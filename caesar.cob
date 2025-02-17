IDENTIFICATION DIVISION.
    	PROGRAM-ID. IDEONE.
      
    	ENVIRONMENT DIVISION.
       
    	DATA DIVISION.
    	WORKING-STORAGE SECTION.
        	01 INPUT-TEXT           PIC X(50).
        	01 OUTPUT-TEXT          PIC X(50).
        	01 SHIFT-AMOUNT         PIC 99.
        	01 MAX-SHIFT            PIC 99.
           
        	01 COUNTERS.
            	05 TEXT-LENGTH      PIC 99 VALUE 0.
            	05 CHAR-POS         PIC 99 VALUE 1.
            	05 SPACES           PIC 99 VALUE 0.
           
        	01 WORK-AREAS.
            	05 CURRENT-CHAR     PIC X.
            	05 ASCII-VAL        PIC 999.
            	05 SHIFTED-VAL      PIC 999.
           
        	01 DISPLAY-FORMAT.
            	05 FILLER           PIC X(7) VALUE 'Caesar '.
            	05 SHIFT-NUM        PIC Z9.
            	05 FILLER           PIC X(2) VALUE ': '.
            	05 CIPHER-TEXT      PIC X(50).

    	PROCEDURE DIVISION.
           
    	ENCRYPT-TEXT.
        	MOVE 0 TO TEXT-LENGTH
        	INSPECT INPUT-TEXT TALLYING TEXT-LENGTH 
            	FOR CHARACTERS BEFORE INITIAL SPACE.
           
        	PERFORM VARYING CHAR-POS FROM 1 BY 1 
            	UNTIL CHAR-POS > TEXT-LENGTH
            	MOVE INPUT-TEXT(CHAR-POS:1) TO CURRENT-CHAR
            	MOVE FUNCTION ORD(CURRENT-CHAR) TO ASCII-VAL
               
            	IF (ASCII-VAL >= 65 AND ASCII-VAL <= 90)
                	PERFORM PROCESS-CHAR
                	MOVE CURRENT-CHAR TO OUTPUT-TEXT(CHAR-POS:1)
            	ELSE IF (ASCII-VAL >= 97 AND ASCII-VAL <= 122)
                	COMPUTE ASCII-VAL = ASCII-VAL - 32
                	MOVE FUNCTION CHAR(ASCII-VAL) TO CURRENT-CHAR
                	PERFORM PROCESS-CHAR
                	MOVE CURRENT-CHAR TO OUTPUT-TEXT(CHAR-POS:1)
            	ELSE
                	MOVE CURRENT-CHAR TO OUTPUT-TEXT(CHAR-POS:1)
            	END-IF
        	END-PERFORM.
        	EXIT.
           
    	DECRYPT-TEXT.
    		MOVE (MULTIPLY SHIFT_AMOUNT BY -1) TO SHIFT_AMOUNT.
        	PERFORM ENCRYPT-TEXT.
        	EXIT.
           
    	SOLVE-CIPHER.
        	*> Will try all possible shifts
        	EXIT.
           
		PROCESS-CHAR.
        	COMPUTE SHIFTED-VAL = FUNCTION MOD(
            	(ASCII-VAL - 65 + SHIFT-AMOUNT), 26) + 65
        	MOVE FUNCTION CHAR(SHIFTED-VAL) TO CURRENT-CHAR.
        	EXIT.
           
    	MAIN-PROCEDURE.
        	*> Main program logic will go here
        	STOP RUN.