Program Caesar
    IMPLICIT NONE
    REAL:: shift
    CHARACTER(len=100):: code, edoc, result
    
    shift = 2
    code = "YOU GO TELL THAT VAPID EXISTENTIALIST QUACK FREDDY NIETZSCHE THAT HE CAN JUST BITE ME, TWICE."
    edoc = "AQW IQ VGNN VJCV XCRKF GZKUVGPVKCNKUV SWCEM HTGFFA PKGVBUEJG VJCV JG ECP LWUV DKVG OG, VYKEG."

    print*, NEW_LINE('A')//"=== CAESAR CIPHER ==="

    ! ENCODE 
    print*, NEW_LINE('A')//"--- Encoding ---"
    print*, "Input:  ", TRIM(code)
    result = encode(code, shift, .TRUE.)
    print*, "Output: ", TRIM(result)

    ! DECODE
    print*, NEW_LINE('A')//"--- Decoding ---"
    print*, "Input:  ", TRIM(edoc)
    result = decode(edoc, shift)
    print*, "Output: ", TRIM(result)
    
    ! SOLVE
    print*, NEW_LINE('A')//"--- Solving ---"
    print*, "Input: HAL"
    CALL solve("HAL")

CONTAINS
    FUNCTION encode(str, shift, silent) RESULT(result)
        IMPLICIT NONE
        CHARACTER(len=*):: str
        REAL:: shift
        LOGICAL, OPTIONAL:: silent
        CHARACTER(len=100):: result
        INTEGER:: i, charASCII
        LOGICAL:: printOutput

        ! Set default for silent print parameter
        printOutput = .TRUE.
        IF (PRESENT(silent)) THEN
            printOutput = .NOT. silent
        END IF

        result = str

        ! Loop through string from position 1 (gross) to string length without trailing spaces
        DO i = 1, LEN_TRIM(str)
            ! Convert char at each index to ASCII
            charASCII = ICHAR(str(i:i))

            ! Change lowercase to uppercase (for easier handling)
            IF (charASCII >= 97 .AND. charASCII <= 122) THEN
                charASCII = charASCII - 32  ! Convert to uppercase
            END IF
            
            ! Shifting ASCII
            IF (charASCII >= 65 .AND. charASCII <= 90) THEN
                charASCII = charASCII + INT(shift)
                
                ! Wraps around if charASCII goes beyond A-Z
                DO WHILE (charASCII > 90)
                    charASCII = charASCII - 26
                END DO
                DO WHILE (charASCII < 65)
                    charASCII = charASCII + 26
                END DO
            END IF
            ! Replace encoded char in string
            result(i:i) = CHAR(charASCII)
        END DO

        ! Optional print of final output for SOLVE
        IF (printOutput) THEN
            print *, TRIM(result)
        END IF
    END FUNCTION encode
    
    
    FUNCTION decode(str, shift) RESULT(result)
        IMPLICIT NONE
        CHARACTER(len=*):: str
        REAL:: shift
        CHARACTER(len=100):: result

        result = encode(str, -shift, .TRUE.)
    End FUNCTION decode
    
    
    SUBROUTINE solve(str)
        IMPLICIT NONE
        CHARACTER(len=*):: str
        CHARACTER(len=100):: temp
        REAL:: shift
        INTEGER:: i

        DO i = 1, 26
            temp = str
            shift = REAL(i)
            temp = encode(temp, shift, .TRUE.)  ! Silent mode on
            write(*,'(A,I2,A,A)') "Shift ", i, ":  ", TRIM(temp)
        END DO

    END SUBROUTINE solve
End Program Caesar