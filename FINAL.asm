.MODEL SMALL
.STACK 64
.DATA
MENU DB 0AH,"     1 : Egy Pound      2 : AED      ","$"
TO_MSG DB 0AH," Choose the second currency number ","$"
VALUE_MSG DB 0AH, " ENTER THE AMOUNT OF DOLLARS, MAX 250 DOLLARS ","$"
RETRTY_MSG DB 0AH," THIS WAS AS INVALID OPERATION, PLEASE TRY AGAIN $"
NL DB 0AH,"$"
VALUE DW ? 
TEMP DW ?
TEN DW 10
POUND DB 156,"$"
DR DB "AED $"
_EGY DB 32 ;
_AED DB 3 ;
TO DB ?
N1 DW 'A'
N2 DW 'A'
N3 DW 'A'

.CODE
MAIN PROC FAR
.STARTUP
  
RETRY:
    LEA DX,MENU
    CALL PRINT
    LEA DX,TO_MSG
    CALL PRINT
    CALL READ
    ;;;;; IF NEITHER 1 NOR 2
    MOV TO,AL
    CMP AL,32H
    JG STOP
    LEA DX,VALUE_MSG
    CALL PRINT
    mov ah,0
    CALL READVAL  ;;AX=123

    LEA DX,NL
    CALL PRINT
    MOV AH,0
    MOV BL,TO
    CMP BL,31H
    MOV AX,VALUE
    JNE AED

    MUL _EGY ;;; RESULT IN AX   

    CALL DISPALY
    LEA DX,POUND
    CALL PRINT
    JMP FINAL
    
    AED:
    CMP BL,32H
    JNE STOP
    MOV AX,VALUE
    MUL _AED ;;; RESULT IN AX   
    CALL DISPALY
    LEA DX,DR
    CALL PRINT
    JMP FINAL
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
STOP: 
    LEA DX,RETRTY_MSG
    CALL PRINT
    JMP RETRY
FINAL:   
.EXIT
MAIN ENDP


;;;;; DISPLAY MSGS


PRINTNUM PROC NEAR
    MOV AH,02H
    ADD DL,30H
    INT 21H
    RET
PRINTNUM ENDP

PRINTAL PROC NEAR
    MOV AH,0EH
    ADD AL,30H
    INT 10H
    RET
PRINTAL ENDP

;;;;;;;;;;;;;;
PRINT PROC NEAR
    MOV AH,9
    INT 21H
    RET
PRINT ENDP
;;;;;;;;;;

READ PROC NEAR
    MOV AH,1
    INT 21H
    RET
READ ENDP

READVAL PROC NEAR
    CALL READ 
    MOV AH,0
    SUB AL,30H
    MOV N1,AX
    
    CALL READ 
    MOV AH,0
    SUB AL,30H
    MOV N2,AX
    
    CALL READ
    MOV AH,0 
    SUB AL,30H
    MOV N3,AX
    
    MOV AH,0
    MOV AX,N1 ;;AX=N1=3
    MUL TEN 
    MUL TEN
    MOV N1,AX
    
    MOV AH,0
    MOV AX,N2
    MUL TEN
    MOV N2,AX
    
    ADD AX,N1
    ADD AX,N3
    MOV VALUE,AX
    RET
    
    
READVAL ENDP

;;;;;;;;;;
DISPALY PROC NEAR
    ;MOV AX,
    MOV CX,0
    B:
    MOV DX,0
    DIV TEN
    PUSH DX
    INC CX
    CMP AX,0
    JNE B
    
    A:
    POP AX
    CALL PRINTAL
    LOOP A
    RET
DISPALY ENDP

END MAIN