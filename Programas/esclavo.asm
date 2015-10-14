
_LimpiarLeds:

;esclavo.mbas,42 :: 		sub procedure LimpiarLeds
;esclavo.mbas,43 :: 		porta.4=1
	BSF        PORTA+0, 4
;esclavo.mbas,44 :: 		porta.5=1
	BSF        PORTA+0, 5
;esclavo.mbas,45 :: 		portc.0=1
	BSF        PORTC+0, 0
;esclavo.mbas,46 :: 		portc.1=1
	BSF        PORTC+0, 1
;esclavo.mbas,47 :: 		end sub
	RETURN
; end of _LimpiarLeds

_Leer_Caracter:

;esclavo.mbas,48 :: 		sub procedure Leer_Caracter
;esclavo.mbas,49 :: 		TimeOut4=0
	CLRF       _TimeOut4+0
;esclavo.mbas,50 :: 		TimeOut3=0
	CLRF       _TimeOut3+0
;esclavo.mbas,51 :: 		do
L__Leer_Caracter2:
;esclavo.mbas,52 :: 		do
L__Leer_Caracter7:
;esclavo.mbas,53 :: 		do
L__Leer_Caracter12:
;esclavo.mbas,54 :: 		delay_us(300)
	MOVLW      99
	MOVWF      R13+0
L__Leer_Caracter17:
	DECFSZ     R13+0, 1
	GOTO       L__Leer_Caracter17
	NOP
	NOP
;esclavo.mbas,55 :: 		caracter=portb
	MOVF       PORTB+0, 0
	MOVWF      _Caracter+0
;esclavo.mbas,56 :: 		inc(timeout4)
	INCF       _TimeOut4+0, 1
;esclavo.mbas,57 :: 		if TimeOut4 > 200 then
	MOVF       _TimeOut4+0, 0
	SUBLW      200
	BTFSC      STATUS+0, 0
	GOTO       L__Leer_Caracter19
;esclavo.mbas,58 :: 		TimeOut4=0
	CLRF       _TimeOut4+0
;esclavo.mbas,59 :: 		inc(timeout3)
	INCF       _TimeOut3+0, 1
;esclavo.mbas,60 :: 		if TimeOut3 > 5 then
	MOVF       _TimeOut3+0, 0
	SUBLW      5
	BTFSC      STATUS+0, 0
	GOTO       L__Leer_Caracter22
;esclavo.mbas,61 :: 		Caracter=32
	MOVLW      32
	MOVWF      _Caracter+0
;esclavo.mbas,62 :: 		exit
	GOTO       L_end__Leer_Caracter
L__Leer_Caracter22:
;esclavo.mbas,63 :: 		end if
L__Leer_Caracter19:
;esclavo.mbas,65 :: 		if Caracter=0 then
	MOVF       _Caracter+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_Caracter25
;esclavo.mbas,66 :: 		Ant_Caracter=0
	CLRF       _Ant_Caracter+0
L__Leer_Caracter25:
;esclavo.mbas,68 :: 		loop until Caracter <> 0
	MOVF       _Caracter+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_Caracter15
	GOTO       L__Leer_Caracter12
L__Leer_Caracter15:
;esclavo.mbas,69 :: 		if Caracter=255 then
	MOVF       _Caracter+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_Caracter28
;esclavo.mbas,70 :: 		Ant_Caracter=0
	CLRF       _Ant_Caracter+0
L__Leer_Caracter28:
;esclavo.mbas,72 :: 		loop until Caracter <> 255
	MOVF       _Caracter+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_Caracter10
	GOTO       L__Leer_Caracter7
L__Leer_Caracter10:
;esclavo.mbas,73 :: 		loop until Caracter <> ant_caracter
	MOVF       _Caracter+0, 0
	XORWF      _Ant_Caracter+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_Caracter5
	GOTO       L__Leer_Caracter2
L__Leer_Caracter5:
;esclavo.mbas,74 :: 		Ant_Caracter=caracter
	MOVF       _Caracter+0, 0
	MOVWF      _Ant_Caracter+0
;esclavo.mbas,76 :: 		end sub
L_end__Leer_Caracter:
	RETURN
; end of _Leer_Caracter

_Inicio_LCD:

;esclavo.mbas,77 :: 		sub procedure Inicio_LCD
;esclavo.mbas,78 :: 		timeout4=0
	CLRF       _TimeOut4+0
;esclavo.mbas,79 :: 		TimeOut3=0
	CLRF       _TimeOut3+0
;esclavo.mbas,81 :: 		do
L__Inicio_LCD31:
;esclavo.mbas,82 :: 		Ant_Caracter=caracter
	MOVF       _Caracter+0, 0
	MOVWF      _Ant_Caracter+0
;esclavo.mbas,83 :: 		delay_us(300)
	MOVLW      99
	MOVWF      R13+0
L__Inicio_LCD36:
	DECFSZ     R13+0, 1
	GOTO       L__Inicio_LCD36
	NOP
	NOP
;esclavo.mbas,84 :: 		Caracter=portb
	MOVF       PORTB+0, 0
	MOVWF      _Caracter+0
;esclavo.mbas,85 :: 		inc(timeout4)
	INCF       _TimeOut4+0, 1
;esclavo.mbas,86 :: 		if TimeOut4 > 200 then
	MOVF       _TimeOut4+0, 0
	SUBLW      200
	BTFSC      STATUS+0, 0
	GOTO       L__Inicio_LCD38
;esclavo.mbas,87 :: 		TimeOut4=0
	CLRF       _TimeOut4+0
;esclavo.mbas,88 :: 		inc(timeout3)
	INCF       _TimeOut3+0, 1
;esclavo.mbas,89 :: 		if TimeOut3 > 30 then
	MOVF       _TimeOut3+0, 0
	SUBLW      30
	BTFSC      STATUS+0, 0
	GOTO       L__Inicio_LCD41
;esclavo.mbas,90 :: 		exit
	GOTO       L_end__Inicio_LCD
L__Inicio_LCD41:
;esclavo.mbas,91 :: 		end if
L__Inicio_LCD38:
;esclavo.mbas,93 :: 		loop until (Caracter=lcdstart1) and (Ant_Caracter = LcdStart2)
	MOVF       _Caracter+0, 0
	XORWF      _LcdStart1+0, 0
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	MOVF       _Ant_Caracter+0, 0
	XORWF      _LcdStart2+0, 0
	MOVLW      255
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSS      STATUS+0, 2
	GOTO       L__Inicio_LCD34
	GOTO       L__Inicio_LCD31
L__Inicio_LCD34:
;esclavo.mbas,94 :: 		InicioLCD=true
	MOVLW      255
	MOVWF      _InicioLCD+0
;esclavo.mbas,95 :: 		Ant_Caracter=128
	MOVLW      128
	MOVWF      _Ant_Caracter+0
;esclavo.mbas,96 :: 		end sub
L_end__Inicio_LCD:
	RETURN
; end of _Inicio_LCD

_Leer_LCD:

;esclavo.mbas,97 :: 		sub procedure Leer_LCD
;esclavo.mbas,99 :: 		InicioLCD=false
	CLRF       _InicioLCD+0
;esclavo.mbas,100 :: 		Inicio_LCD
	CALL       _Inicio_LCD+0
;esclavo.mbas,102 :: 		if InicioLCD then
	MOVF       _InicioLCD+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__Leer_LCD45
;esclavo.mbas,103 :: 		porta.4=0 'encender led azul
	BCF        PORTA+0, 4
;esclavo.mbas,104 :: 		contador=7
	MOVLW      7
	MOVWF      _Contador+0
;esclavo.mbas,105 :: 		do
L__Leer_LCD47:
;esclavo.mbas,106 :: 		Leer_Caracter
	CALL       _Leer_Caracter+0
;esclavo.mbas,108 :: 		case 65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90
	MOVF       _Caracter+0, 0
	XORLW      65
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD55
	GOTO       L__Leer_LCD53
L__Leer_LCD55:
	MOVF       _Caracter+0, 0
	XORLW      66
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD56
	GOTO       L__Leer_LCD53
L__Leer_LCD56:
	MOVF       _Caracter+0, 0
	XORLW      67
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD57
	GOTO       L__Leer_LCD53
L__Leer_LCD57:
	MOVF       _Caracter+0, 0
	XORLW      68
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD58
	GOTO       L__Leer_LCD53
L__Leer_LCD58:
	MOVF       _Caracter+0, 0
	XORLW      69
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD59
	GOTO       L__Leer_LCD53
L__Leer_LCD59:
	MOVF       _Caracter+0, 0
	XORLW      70
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD60
	GOTO       L__Leer_LCD53
L__Leer_LCD60:
	MOVF       _Caracter+0, 0
	XORLW      71
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD61
	GOTO       L__Leer_LCD53
L__Leer_LCD61:
	MOVF       _Caracter+0, 0
	XORLW      72
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD62
	GOTO       L__Leer_LCD53
L__Leer_LCD62:
	MOVF       _Caracter+0, 0
	XORLW      73
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD63
	GOTO       L__Leer_LCD53
L__Leer_LCD63:
	MOVF       _Caracter+0, 0
	XORLW      74
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD64
	GOTO       L__Leer_LCD53
L__Leer_LCD64:
	MOVF       _Caracter+0, 0
	XORLW      75
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD65
	GOTO       L__Leer_LCD53
L__Leer_LCD65:
	MOVF       _Caracter+0, 0
	XORLW      76
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD66
	GOTO       L__Leer_LCD53
L__Leer_LCD66:
	MOVF       _Caracter+0, 0
	XORLW      77
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD67
	GOTO       L__Leer_LCD53
L__Leer_LCD67:
	MOVF       _Caracter+0, 0
	XORLW      78
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD68
	GOTO       L__Leer_LCD53
L__Leer_LCD68:
	MOVF       _Caracter+0, 0
	XORLW      79
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD69
	GOTO       L__Leer_LCD53
L__Leer_LCD69:
	MOVF       _Caracter+0, 0
	XORLW      80
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD70
	GOTO       L__Leer_LCD53
L__Leer_LCD70:
	MOVF       _Caracter+0, 0
	XORLW      81
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD71
	GOTO       L__Leer_LCD53
L__Leer_LCD71:
	MOVF       _Caracter+0, 0
	XORLW      82
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD72
	GOTO       L__Leer_LCD53
L__Leer_LCD72:
	MOVF       _Caracter+0, 0
	XORLW      83
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD73
	GOTO       L__Leer_LCD53
L__Leer_LCD73:
	MOVF       _Caracter+0, 0
	XORLW      84
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD74
	GOTO       L__Leer_LCD53
L__Leer_LCD74:
	MOVF       _Caracter+0, 0
	XORLW      85
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD75
	GOTO       L__Leer_LCD53
L__Leer_LCD75:
	MOVF       _Caracter+0, 0
	XORLW      86
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD76
	GOTO       L__Leer_LCD53
L__Leer_LCD76:
	MOVF       _Caracter+0, 0
	XORLW      87
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD77
	GOTO       L__Leer_LCD53
L__Leer_LCD77:
	MOVF       _Caracter+0, 0
	XORLW      88
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD78
	GOTO       L__Leer_LCD53
L__Leer_LCD78:
	MOVF       _Caracter+0, 0
	XORLW      89
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD79
	GOTO       L__Leer_LCD53
L__Leer_LCD79:
	MOVF       _Caracter+0, 0
	XORLW      90
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD80
L__Leer_LCD53:
;esclavo.mbas,109 :: 		contador=contador+1
	INCF       _Contador+0, 1
;esclavo.mbas,110 :: 		Mensaje[contador]=caracter
	MOVF       _Contador+0, 0
	ADDLW      _Mensaje+0
	MOVWF      FSR
	MOVF       _Caracter+0, 0
	MOVWF      INDF+0
	GOTO       L__Leer_LCD52
L__Leer_LCD80:
;esclavo.mbas,111 :: 		case 97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122
	MOVF       _Caracter+0, 0
	XORLW      97
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD83
	GOTO       L__Leer_LCD81
L__Leer_LCD83:
	MOVF       _Caracter+0, 0
	XORLW      98
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD84
	GOTO       L__Leer_LCD81
L__Leer_LCD84:
	MOVF       _Caracter+0, 0
	XORLW      99
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD85
	GOTO       L__Leer_LCD81
L__Leer_LCD85:
	MOVF       _Caracter+0, 0
	XORLW      100
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD86
	GOTO       L__Leer_LCD81
L__Leer_LCD86:
	MOVF       _Caracter+0, 0
	XORLW      101
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD87
	GOTO       L__Leer_LCD81
L__Leer_LCD87:
	MOVF       _Caracter+0, 0
	XORLW      102
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD88
	GOTO       L__Leer_LCD81
L__Leer_LCD88:
	MOVF       _Caracter+0, 0
	XORLW      103
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD89
	GOTO       L__Leer_LCD81
L__Leer_LCD89:
	MOVF       _Caracter+0, 0
	XORLW      104
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD90
	GOTO       L__Leer_LCD81
L__Leer_LCD90:
	MOVF       _Caracter+0, 0
	XORLW      105
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD91
	GOTO       L__Leer_LCD81
L__Leer_LCD91:
	MOVF       _Caracter+0, 0
	XORLW      106
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD92
	GOTO       L__Leer_LCD81
L__Leer_LCD92:
	MOVF       _Caracter+0, 0
	XORLW      107
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD93
	GOTO       L__Leer_LCD81
L__Leer_LCD93:
	MOVF       _Caracter+0, 0
	XORLW      108
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD94
	GOTO       L__Leer_LCD81
L__Leer_LCD94:
	MOVF       _Caracter+0, 0
	XORLW      109
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD95
	GOTO       L__Leer_LCD81
L__Leer_LCD95:
	MOVF       _Caracter+0, 0
	XORLW      110
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD96
	GOTO       L__Leer_LCD81
L__Leer_LCD96:
	MOVF       _Caracter+0, 0
	XORLW      111
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD97
	GOTO       L__Leer_LCD81
L__Leer_LCD97:
	MOVF       _Caracter+0, 0
	XORLW      112
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD98
	GOTO       L__Leer_LCD81
L__Leer_LCD98:
	MOVF       _Caracter+0, 0
	XORLW      113
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD99
	GOTO       L__Leer_LCD81
L__Leer_LCD99:
	MOVF       _Caracter+0, 0
	XORLW      114
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD100
	GOTO       L__Leer_LCD81
L__Leer_LCD100:
	MOVF       _Caracter+0, 0
	XORLW      115
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD101
	GOTO       L__Leer_LCD81
L__Leer_LCD101:
	MOVF       _Caracter+0, 0
	XORLW      116
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD102
	GOTO       L__Leer_LCD81
L__Leer_LCD102:
	MOVF       _Caracter+0, 0
	XORLW      117
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD103
	GOTO       L__Leer_LCD81
L__Leer_LCD103:
	MOVF       _Caracter+0, 0
	XORLW      118
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD104
	GOTO       L__Leer_LCD81
L__Leer_LCD104:
	MOVF       _Caracter+0, 0
	XORLW      119
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD105
	GOTO       L__Leer_LCD81
L__Leer_LCD105:
	MOVF       _Caracter+0, 0
	XORLW      120
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD106
	GOTO       L__Leer_LCD81
L__Leer_LCD106:
	MOVF       _Caracter+0, 0
	XORLW      121
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD107
	GOTO       L__Leer_LCD81
L__Leer_LCD107:
	MOVF       _Caracter+0, 0
	XORLW      122
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD108
L__Leer_LCD81:
;esclavo.mbas,112 :: 		contador=contador+1
	INCF       _Contador+0, 1
;esclavo.mbas,113 :: 		Mensaje[contador]=caracter
	MOVF       _Contador+0, 0
	ADDLW      _Mensaje+0
	MOVWF      FSR
	MOVF       _Caracter+0, 0
	MOVWF      INDF+0
	GOTO       L__Leer_LCD52
L__Leer_LCD108:
;esclavo.mbas,114 :: 		case 48,49,50,51,52,53,54,55,56,57,58
	MOVF       _Caracter+0, 0
	XORLW      48
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD111
	GOTO       L__Leer_LCD109
L__Leer_LCD111:
	MOVF       _Caracter+0, 0
	XORLW      49
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD112
	GOTO       L__Leer_LCD109
L__Leer_LCD112:
	MOVF       _Caracter+0, 0
	XORLW      50
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD113
	GOTO       L__Leer_LCD109
L__Leer_LCD113:
	MOVF       _Caracter+0, 0
	XORLW      51
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD114
	GOTO       L__Leer_LCD109
L__Leer_LCD114:
	MOVF       _Caracter+0, 0
	XORLW      52
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD115
	GOTO       L__Leer_LCD109
L__Leer_LCD115:
	MOVF       _Caracter+0, 0
	XORLW      53
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD116
	GOTO       L__Leer_LCD109
L__Leer_LCD116:
	MOVF       _Caracter+0, 0
	XORLW      54
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD117
	GOTO       L__Leer_LCD109
L__Leer_LCD117:
	MOVF       _Caracter+0, 0
	XORLW      55
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD118
	GOTO       L__Leer_LCD109
L__Leer_LCD118:
	MOVF       _Caracter+0, 0
	XORLW      56
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD119
	GOTO       L__Leer_LCD109
L__Leer_LCD119:
	MOVF       _Caracter+0, 0
	XORLW      57
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD120
	GOTO       L__Leer_LCD109
L__Leer_LCD120:
	MOVF       _Caracter+0, 0
	XORLW      58
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD121
L__Leer_LCD109:
;esclavo.mbas,115 :: 		contador=contador+1
	INCF       _Contador+0, 1
;esclavo.mbas,116 :: 		Mensaje[contador]=caracter
	MOVF       _Contador+0, 0
	ADDLW      _Mensaje+0
	MOVWF      FSR
	MOVF       _Caracter+0, 0
	MOVWF      INDF+0
	GOTO       L__Leer_LCD52
L__Leer_LCD121:
;esclavo.mbas,117 :: 		case 32,35,40,41,42,45,46,61,95
	MOVF       _Caracter+0, 0
	XORLW      32
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD124
	GOTO       L__Leer_LCD122
L__Leer_LCD124:
	MOVF       _Caracter+0, 0
	XORLW      35
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD125
	GOTO       L__Leer_LCD122
L__Leer_LCD125:
	MOVF       _Caracter+0, 0
	XORLW      40
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD126
	GOTO       L__Leer_LCD122
L__Leer_LCD126:
	MOVF       _Caracter+0, 0
	XORLW      41
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD127
	GOTO       L__Leer_LCD122
L__Leer_LCD127:
	MOVF       _Caracter+0, 0
	XORLW      42
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD128
	GOTO       L__Leer_LCD122
L__Leer_LCD128:
	MOVF       _Caracter+0, 0
	XORLW      45
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD129
	GOTO       L__Leer_LCD122
L__Leer_LCD129:
	MOVF       _Caracter+0, 0
	XORLW      46
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD130
	GOTO       L__Leer_LCD122
L__Leer_LCD130:
	MOVF       _Caracter+0, 0
	XORLW      61
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD131
	GOTO       L__Leer_LCD122
L__Leer_LCD131:
	MOVF       _Caracter+0, 0
	XORLW      95
	BTFSS      STATUS+0, 2
	GOTO       L__Leer_LCD132
L__Leer_LCD122:
;esclavo.mbas,118 :: 		contador=contador+1
	INCF       _Contador+0, 1
;esclavo.mbas,119 :: 		Mensaje[contador]=caracter
	MOVF       _Contador+0, 0
	ADDLW      _Mensaje+0
	MOVWF      FSR
	MOVF       _Caracter+0, 0
	MOVWF      INDF+0
	GOTO       L__Leer_LCD52
L__Leer_LCD132:
L__Leer_LCD52:
;esclavo.mbas,122 :: 		loop until contador > 91
	MOVF       _Contador+0, 0
	SUBLW      91
	BTFSS      STATUS+0, 0
	GOTO       L__Leer_LCD50
	GOTO       L__Leer_LCD47
L__Leer_LCD50:
L__Leer_LCD45:
;esclavo.mbas,124 :: 		porta.4=1 'apagar led azul
	BSF        PORTA+0, 4
;esclavo.mbas,125 :: 		end sub
	RETURN
; end of _Leer_LCD

_CalcularCRC:

;esclavo.mbas,126 :: 		sub procedure CalcularCRC()
;esclavo.mbas,127 :: 		crc=65535
	MOVLW      255
	MOVWF      _CRC+0
	MOVLW      255
	MOVWF      _CRC+1
;esclavo.mbas,128 :: 		for iter=0 to Longitud - 1
	CLRF       _Iter+0
L__CalcularCRC134:
	DECF       _Longitud+0, 0
	MOVWF      R2+0
	MOVF       _Iter+0, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__CalcularCRC138
;esclavo.mbas,129 :: 		crc=crc xor mensaje[iter]
	MOVF       _Iter+0, 0
	ADDLW      _Mensaje+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORWF      _CRC+0, 1
	MOVLW      0
	XORWF      _CRC+1, 1
;esclavo.mbas,130 :: 		for bites= 1 to 8
	MOVLW      1
	MOVWF      _bites+0
L__CalcularCRC140:
;esclavo.mbas,131 :: 		if crc mod 2 then
	BTFSS      _CRC+0, 0
	GOTO       L__CalcularCRC145
;esclavo.mbas,132 :: 		crc=(crc / 2) xor 40961
	RRF        _CRC+1, 1
	RRF        _CRC+0, 1
	BCF        _CRC+1, 7
	MOVLW      1
	XORWF      _CRC+0, 1
	MOVLW      160
	XORWF      _CRC+1, 1
	GOTO       L__CalcularCRC146
;esclavo.mbas,133 :: 		else
L__CalcularCRC145:
;esclavo.mbas,134 :: 		crc=crc / 2
	RRF        _CRC+1, 1
	RRF        _CRC+0, 1
	BCF        _CRC+1, 7
;esclavo.mbas,135 :: 		end if
L__CalcularCRC146:
;esclavo.mbas,136 :: 		next bites
	MOVF       _bites+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L__CalcularCRC143
	INCF       _bites+0, 1
	GOTO       L__CalcularCRC140
L__CalcularCRC143:
;esclavo.mbas,137 :: 		next iter
	MOVF       _Iter+0, 0
	XORWF      R2+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__CalcularCRC138
	INCF       _Iter+0, 1
	GOTO       L__CalcularCRC134
L__CalcularCRC138:
;esclavo.mbas,138 :: 		CRC_h=hi(crc)
	MOVF       _CRC+1, 0
	MOVWF      _CRC_H+0
;esclavo.mbas,139 :: 		CRC_l=lo(crc)
	MOVF       _CRC+0, 0
	MOVWF      _CRC_L+0
;esclavo.mbas,140 :: 		end sub
	RETURN
; end of _CalcularCRC

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;esclavo.mbas,142 :: 		sub procedure interrupt()
;esclavo.mbas,143 :: 		GIE_bit = 0
	BCF        GIE_bit+0, 7
;esclavo.mbas,144 :: 		if uart1_data_ready=1 then
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt149
;esclavo.mbas,145 :: 		Recivido=uart1_read
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _Recivido+0
;esclavo.mbas,146 :: 		llamada[0]=llamada[1]
	MOVF       _Llamada+1, 0
	MOVWF      _Llamada+0
;esclavo.mbas,147 :: 		llamada[1]=llamada[2]
	MOVF       _Llamada+2, 0
	MOVWF      _Llamada+1
;esclavo.mbas,148 :: 		llamada[2]=llamada[3]
	MOVF       _Llamada+3, 0
	MOVWF      _Llamada+2
;esclavo.mbas,149 :: 		llamada[3]=recivido
	MOVF       R0+0, 0
	MOVWF      _Llamada+3
;esclavo.mbas,150 :: 		if Llamada[1]=esclavo then
	MOVF       _Llamada+1, 0
	XORWF      _Esclavo+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt152
;esclavo.mbas,151 :: 		mensaje[0]=llamada[0]
	MOVF       _Llamada+0, 0
	MOVWF      _Mensaje+0
;esclavo.mbas,152 :: 		Mensaje[1]=llamada[1]
	MOVF       _Llamada+1, 0
	MOVWF      _Mensaje+1
;esclavo.mbas,153 :: 		Longitud=2
	MOVLW      2
	MOVWF      _Longitud+0
;esclavo.mbas,154 :: 		CalcularCRC
	CALL       _CalcularCRC+0
;esclavo.mbas,155 :: 		CRC_ok=false
	CLRF       _CRC_ok+0
;esclavo.mbas,156 :: 		if Llamada[3]=crc_h then
	MOVF       _Llamada+3, 0
	XORWF      _CRC_H+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt155
;esclavo.mbas,157 :: 		if Llamada[2]=crc_l then
	MOVF       _Llamada+2, 0
	XORWF      _CRC_L+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt158
;esclavo.mbas,158 :: 		if Llamada[0]=15 then
	MOVF       _Llamada+0, 0
	XORLW      15
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt161
;esclavo.mbas,159 :: 		portc.0=0                ' encender led rojo
	BCF        PORTC+0, 0
;esclavo.mbas,160 :: 		portc.1=1                ' apagar led verde
	BSF        PORTC+0, 1
L__interrupt161:
;esclavo.mbas,163 :: 		if Llamada[0]=6 then
	MOVF       _Llamada+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt164
;esclavo.mbas,164 :: 		portc.0=1                ' apagar el led rojo
	BSF        PORTC+0, 0
;esclavo.mbas,165 :: 		portc.1=0                ' encender led verde
	BCF        PORTC+0, 1
;esclavo.mbas,167 :: 		clrwdt
	CLRWDT
L__interrupt164:
;esclavo.mbas,169 :: 		if Llamada[0]=5 then
	MOVF       _Llamada+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt167
;esclavo.mbas,170 :: 		clrwdt
	CLRWDT
;esclavo.mbas,171 :: 		CRC_ok=true
	MOVLW      255
	MOVWF      _CRC_ok+0
;esclavo.mbas,172 :: 		porta.5=0                ' encender led ambar
	BCF        PORTA+0, 5
;esclavo.mbas,173 :: 		portc.0=1                ' apagar el led rojo
	BSF        PORTC+0, 0
;esclavo.mbas,174 :: 		portc.1=1                ' apagar led verde
	BSF        PORTC+0, 1
;esclavo.mbas,175 :: 		Suma=0
	CLRF       _Suma+0
	CLRF       _Suma+1
;esclavo.mbas,176 :: 		for Iter=1 to lect_prom
	MOVLW      1
	MOVWF      _Iter+0
L__interrupt169:
	MOVF       _Iter+0, 0
	SUBWF      _Lect_prom+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__interrupt173
;esclavo.mbas,177 :: 		adc_init
	CALL       _ADC_Init+0
;esclavo.mbas,178 :: 		Temp = adc_read(0)
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _Temp+0
	MOVF       R0+1, 0
	MOVWF      _Temp+1
;esclavo.mbas,179 :: 		Suma=suma+temp
	MOVF       R0+0, 0
	ADDWF      _Suma+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _Suma+1, 1
;esclavo.mbas,180 :: 		next Iter
	MOVF       _Iter+0, 0
	XORWF      _Lect_prom+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__interrupt173
	INCF       _Iter+0, 1
	GOTO       L__interrupt169
L__interrupt173:
;esclavo.mbas,181 :: 		Temp=suma/lect_prom
	MOVF       _Lect_prom+0, 0
	MOVWF      R4+0
	CLRF       R4+1
	MOVF       _Suma+0, 0
	MOVWF      R0+0
	MOVF       _Suma+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      _Temp+0
	MOVF       R0+1, 0
	MOVWF      _Temp+1
;esclavo.mbas,182 :: 		Temp1_H=hi(temp)
	MOVF       _Temp+1, 0
	MOVWF      _Temp1_H+0
;esclavo.mbas,183 :: 		Temp1_L=lo(temp)
	MOVF       _Temp+0, 0
	MOVWF      _Temp1_L+0
;esclavo.mbas,184 :: 		Suma=0
	CLRF       _Suma+0
	CLRF       _Suma+1
;esclavo.mbas,185 :: 		for Iter=1 to Lect_prom
	MOVLW      1
	MOVWF      _Iter+0
L__interrupt174:
	MOVF       _Iter+0, 0
	SUBWF      _Lect_prom+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__interrupt178
;esclavo.mbas,186 :: 		adc_init
	CALL       _ADC_Init+0
;esclavo.mbas,187 :: 		Temp=adc_read(1)
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _Temp+0
	MOVF       R0+1, 0
	MOVWF      _Temp+1
;esclavo.mbas,188 :: 		Suma=suma+temp
	MOVF       R0+0, 0
	ADDWF      _Suma+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _Suma+1, 1
;esclavo.mbas,189 :: 		next Iter
	MOVF       _Iter+0, 0
	XORWF      _Lect_prom+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__interrupt178
	INCF       _Iter+0, 1
	GOTO       L__interrupt174
L__interrupt178:
;esclavo.mbas,190 :: 		Temp=suma/lect_prom
	MOVF       _Lect_prom+0, 0
	MOVWF      R4+0
	CLRF       R4+1
	MOVF       _Suma+0, 0
	MOVWF      R0+0
	MOVF       _Suma+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      _Temp+0
	MOVF       R0+1, 0
	MOVWF      _Temp+1
;esclavo.mbas,191 :: 		Temp2_H=hi(temp)
	MOVF       _Temp+1, 0
	MOVWF      _Temp2_H+0
;esclavo.mbas,192 :: 		Temp2_L=lo(temp)
	MOVF       _Temp+0, 0
	MOVWF      _Temp2_L+0
;esclavo.mbas,193 :: 		if portc.2=0 then
	BTFSC      PORTC+0, 2
	GOTO       L__interrupt180
;esclavo.mbas,194 :: 		Entrada1=1
	MOVLW      1
	MOVWF      _Entrada1+0
	GOTO       L__interrupt181
;esclavo.mbas,195 :: 		else
L__interrupt180:
;esclavo.mbas,196 :: 		Entrada1=0
	CLRF       _Entrada1+0
;esclavo.mbas,197 :: 		end if
L__interrupt181:
;esclavo.mbas,198 :: 		if portc.3=0 then
	BTFSC      PORTC+0, 3
	GOTO       L__interrupt183
;esclavo.mbas,199 :: 		Entrada2=1
	MOVLW      1
	MOVWF      _Entrada2+0
	GOTO       L__interrupt184
;esclavo.mbas,200 :: 		else
L__interrupt183:
;esclavo.mbas,201 :: 		Entrada2=0
	CLRF       _Entrada2+0
;esclavo.mbas,202 :: 		end if
L__interrupt184:
;esclavo.mbas,203 :: 		longitud=94
	MOVLW      94
	MOVWF      _Longitud+0
;esclavo.mbas,204 :: 		Mensaje[0]=0
	CLRF       _Mensaje+0
;esclavo.mbas,205 :: 		mensaje[1]=esclavo
	MOVF       _Esclavo+0, 0
	MOVWF      _Mensaje+1
;esclavo.mbas,206 :: 		Mensaje[2]=temp1_h
	MOVF       _Temp1_H+0, 0
	MOVWF      _Mensaje+2
;esclavo.mbas,207 :: 		Mensaje[3]=temp1_l
	MOVF       _Temp1_L+0, 0
	MOVWF      _Mensaje+3
;esclavo.mbas,208 :: 		Mensaje[4]=temp2_h
	MOVF       _Temp2_H+0, 0
	MOVWF      _Mensaje+4
;esclavo.mbas,209 :: 		Mensaje[5]=temp2_l
	MOVF       _Temp2_L+0, 0
	MOVWF      _Mensaje+5
;esclavo.mbas,210 :: 		Mensaje[6]=entrada1
	MOVF       _Entrada1+0, 0
	MOVWF      _Mensaje+6
;esclavo.mbas,211 :: 		Mensaje[7]=entrada2
	MOVF       _Entrada2+0, 0
	MOVWF      _Mensaje+7
;esclavo.mbas,212 :: 		Mensaje[92]=version_h
	MOVF       _Version_H+0, 0
	MOVWF      _Mensaje+92
;esclavo.mbas,213 :: 		Mensaje[93]=version_l
	MOVF       _Version_L+0, 0
	MOVWF      _Mensaje+93
;esclavo.mbas,214 :: 		calcularcrc
	CALL       _CalcularCRC+0
;esclavo.mbas,217 :: 		portc.4=1
	BSF        PORTC+0, 4
;esclavo.mbas,218 :: 		portc.5=1
	BSF        PORTC+0, 5
;esclavo.mbas,219 :: 		for Iter=0 to longitud   -1
	CLRF       _Iter+0
L__interrupt185:
	DECF       _Longitud+0, 0
	MOVWF      FLOC__interrupt+0
	MOVF       _Iter+0, 0
	SUBWF      FLOC__interrupt+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__interrupt189
;esclavo.mbas,220 :: 		uart1_write(mensaje[iter])
	MOVF       _Iter+0, 0
	ADDLW      _Mensaje+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;esclavo.mbas,221 :: 		next iter
	MOVF       _Iter+0, 0
	XORWF      FLOC__interrupt+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__interrupt189
	INCF       _Iter+0, 1
	GOTO       L__interrupt185
L__interrupt189:
;esclavo.mbas,222 :: 		uart1_write(crc_l)
	MOVF       _CRC_L+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;esclavo.mbas,223 :: 		uart1_write(crc_h)
	MOVF       _CRC_H+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;esclavo.mbas,226 :: 		delay_ms(3)
	MOVLW      4
	MOVWF      R12+0
	MOVLW      228
	MOVWF      R13+0
L__interrupt190:
	DECFSZ     R13+0, 1
	GOTO       L__interrupt190
	DECFSZ     R12+0, 1
	GOTO       L__interrupt190
	NOP
;esclavo.mbas,227 :: 		portc.4=0
	BCF        PORTC+0, 4
;esclavo.mbas,228 :: 		portc.5=0
	BCF        PORTC+0, 5
;esclavo.mbas,230 :: 		porta.5=1                     ' apagar led ambar
	BSF        PORTA+0, 5
L__interrupt167:
;esclavo.mbas,231 :: 		end if
L__interrupt158:
;esclavo.mbas,232 :: 		end if
L__interrupt155:
;esclavo.mbas,233 :: 		end if
L__interrupt152:
;esclavo.mbas,235 :: 		end if
L__interrupt149:
;esclavo.mbas,237 :: 		GIE_bit = 1                   ' enable all interrupts
	BSF        GIE_bit+0, 7
;esclavo.mbas,238 :: 		end sub
L__interrupt205:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;esclavo.mbas,240 :: 		main:
;esclavo.mbas,242 :: 		option_reg=%11111111
	MOVLW      255
	MOVWF      OPTION_REG+0
;esclavo.mbas,243 :: 		trisa=%00001111
	MOVLW      15
	MOVWF      TRISA+0
;esclavo.mbas,244 :: 		trisb=%11111111
	MOVLW      255
	MOVWF      TRISB+0
;esclavo.mbas,245 :: 		trisc=%10001100
	MOVLW      140
	MOVWF      TRISC+0
;esclavo.mbas,246 :: 		adcon1=%1101
	MOVLW      13
	MOVWF      ADCON1+0
;esclavo.mbas,247 :: 		Version_H=1
	MOVLW      1
	MOVWF      _Version_H+0
;esclavo.mbas,248 :: 		Version_L=26
	MOVLW      26
	MOVWF      _Version_L+0
;esclavo.mbas,249 :: 		Esclavo = eeprom_read(0)
	CLRF       FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _Esclavo+0
;esclavo.mbas,250 :: 		LcdStart1 = eeprom_read(1)
	MOVLW      1
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _LcdStart1+0
;esclavo.mbas,251 :: 		LcdStart2 = eeprom_read(2)
	MOVLW      2
	MOVWF      FARG_EEPROM_Read_address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _LcdStart2+0
;esclavo.mbas,252 :: 		if LcdStart1 = LcdStart2 then
	MOVF       _LcdStart1+0, 0
	XORWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main193
;esclavo.mbas,253 :: 		LcdStart1=255
	MOVLW      255
	MOVWF      _LcdStart1+0
;esclavo.mbas,254 :: 		LcdStart2=128
	MOVLW      128
	MOVWF      _LcdStart2+0
L__main193:
;esclavo.mbas,256 :: 		Lect_prom=8
	MOVLW      8
	MOVWF      _Lect_prom+0
;esclavo.mbas,257 :: 		for Iter=0 to 95
	CLRF       _Iter+0
L__main196:
;esclavo.mbas,258 :: 		Mensaje[iter]=32
	MOVF       _Iter+0, 0
	ADDLW      _Mensaje+0
	MOVWF      FSR
	MOVLW      32
	MOVWF      INDF+0
;esclavo.mbas,259 :: 		next iter
	MOVF       _Iter+0, 0
	XORLW      95
	BTFSC      STATUS+0, 2
	GOTO       L__main199
	INCF       _Iter+0, 1
	GOTO       L__main196
L__main199:
;esclavo.mbas,260 :: 		portc.4=0
	BCF        PORTC+0, 4
;esclavo.mbas,261 :: 		portc.5=0
	BCF        PORTC+0, 5
;esclavo.mbas,262 :: 		limpiarleds
	CALL       _LimpiarLeds+0
;esclavo.mbas,263 :: 		uart1_init(9600)
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;esclavo.mbas,264 :: 		RCIE_bit = 1                  ' enable interrupt on UART1 receive
	BSF        RCIE_bit+0, 5
;esclavo.mbas,265 :: 		TXIE_bit = 0                  ' disable interrupt on UART1 transmit
	BCF        TXIE_bit+0, 4
;esclavo.mbas,266 :: 		PEIE_bit = 1                  ' enable peripheral interrupts
	BSF        PEIE_bit+0, 6
;esclavo.mbas,267 :: 		GIE_bit = 1                   ' enable all interrupts
	BSF        GIE_bit+0, 7
;esclavo.mbas,268 :: 		clrwdt
	CLRWDT
;esclavo.mbas,270 :: 		while true
L__main201:
;esclavo.mbas,271 :: 		clrwdt
	CLRWDT
;esclavo.mbas,272 :: 		leer_lcd
	CALL       _Leer_LCD+0
;esclavo.mbas,273 :: 		wend
	GOTO       L__main201
	GOTO       $+0
; end of _main
