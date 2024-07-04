.model small
.stack 0100h
.data
row3 dw ?
col dw ?
row1 dw ? ;backup row
col1 dw ? ;backup col
str1 db "BRICK BREAKER GAME$"
str2 db "PLAY GAME$"
str3 db "Instructions$"
str4 db "Exit Game$"
str5 db "Resume$"
str6 db "High Score$"
str7 db "DO YOU HAVE WHAT IT TAKES?$"
ins1 db "Welcome to Instructions Page: $"
ins2 db "1-Player moves the paddle & hits ball.$"
ins3 db "2-Eliminate all Bricks with the ball.$"
ins4 db "3-If ball hits the bottom,player loses!$"
ins5 db "4-To win,all the Bricks must be removed$"
ins6 db "5-The game has many sequential levels.$"
ins7 db "6-There will be a time limit of 4 mins$"
ins8 db "7-To win,complete all levels in 3 lives$"
ins9 db "PRESS ESC TO GO BACK TO MAIN MENU$"
str_x db ?
str_y db ?
string1 db "Please Enter Your Name: $"
n1 db 20 dup ("$")
string2 db "WELCOME$"
counter1 db 1
loseStr db "YOU LOSE$"
HighScrStr db "Your Score was: $"
LuckStr db "Better Luck Next Time!$"
WinStr db "Congratulations - YOU WON!$"
WinStr2 db "YOU ARE A PRO :)$"
HcAdded db "New HighScore Added!$"
lvl1str db "Level:1$"
lvl2str db "Level:2$"
lvl3str db "Level:3$"
buffer db 5000 dup ("$")   
FNAME db "MYFILE.TXT", 0
handler_file dw ?
sp1 db " - $"
sp2 db ",$"
score2 db 3 dup ("$")  

;saim code inserted below
;LEVELSCOPE
score dw 0
counter db 0

;makebackground------------//
r dw 10
row db ?
column db ?
;makebackground------------//

;HEARTLIVES----------------//
hcol dw 255
liv db 4
;HEARTLIVES----------------//

;SCORE STRING--------------//
scoreStr db "SCORE:$"
emptyStr db "  $"
;SCORE STRING--------------//

;BRICKS--------------------//
v dw ?

bc1 dw 20
br1 dw 20

;fcc1 dw 20
;fcr1 dw 120

;fc1 dw 23
;fr1 dw 123

bc2 dw 70
br2 dw 20

bc3 dw 120
br3 dw 20

;----------
fcc3 dw 120
fcr3 dw 140
fc3 dw 122
fr3 dw 142
;----------

bc4 dw 170
br4 dw 20

bc5 dw 220 ;//
br5 dw 20
;////////////
bc6 dw 20
br6 dw 40

bc7 dw 55
br7 dw 40

bc8 dw 105
br8 dw 40

bc9 dw 155
br9 dw 40

bc10 dw 205
br10 dw 40



;/////////////

bc11 dw 20
br11 dw 60

bc12 dw 70
br12 dw 60

bc13 dw 120
br13 dw 60

bc14 dw 170
br14 dw 60

bc15 dw 220 ;//
br15 dw 60
;////////////
bc16 dw 20
br16 dw 80

bc17 dw 55
br17 dw 80

bc18 dw 105
br18 dw 80

bc19 dw 155
br19 dw 80

bc20 dw 205
br20 dw 80

;NEW BRICKS
bc21x dw 20
br21x dw 130

bc22 dw 110
br22 dw 98

bc23 dw 205
br23 dw 130

noc21 dw 24
nor21 dw 134

noc22 dw 114
nor22 dw 102

noc23 dw 209
nor23 dw 134

;NEW BRICKS
;BRICKS--------------------//

;DISAPEARBRICKS------------//
bc111 dw 20
br111 dw 20

bc21 dw 70
br21 dw 20

bc31 dw 120
br31 dw 20

bc41 dw 170
br41 dw 20

bc51 dw 220 ;//
br51 dw 20
;////////////
bc61 dw 20
br61 dw 40

bc71 dw 55
br71 dw 40

bc81 dw 105
br81 dw 40

bc91 dw 155
br91 dw 40

bc101 dw 205
br101 dw 40

;/////////////

bc1111 dw 20
br1111 dw 60

bc121 dw 70
br121 dw 60

bc131 dw 120
br131 dw 60

bc141 dw 170
br141 dw 60

bc151 dw 220 ;//
br151 dw 60
;////////////
bc161 dw 20
br161 dw 80

bc171 dw 55
br171 dw 80

bc181 dw 105
br181 dw 80

bc191 dw 155
br191 dw 80

bc201 dw 205
br201 dw 80

;NEW BRICKS
bc210 dw 20
br210 dw 130

bc220 dw 110
br220 dw 98

bc230 dw 205
br230 dw 130

;DISAPEARBRICKS------------//


;--------------//

;paddle--------//
pcol dw 120
prow dw 195
pcole dw ?
;--------------//

;ball-----------//
bcol dw 125
brow dw 194
delaytime dw 1
;--------------//

;jumpcol-------//
jcol dw ?
jrow dw ?
;--------------//

;LEVEL VARIABLES------------//
level db 1
killme db 0
bcolor db 7
wcolor db 4
pcolor db 4
bbcolor db 12
;mspeed db 50000
;LEVEL VARIABLES------------//

;DOUBLE HIT ---------------//
rip20 db 1
rip19 db 1
rip18 db 1
rip17 db 1
rip16 db 1
rip15 db 1
rip14 db 1
rip13 db 1
rip12 db 1
rip11 db 1
rip10 db 1
rip9 db 1
rip8 db 1
rip7 db 1
rip6 db 1
rip5 db 1
rip4 db 1
rip3 db 1
rip2 db 1
rip1 db 1

rip21 db 1
rip22 db 1
rip23 db 1

;random hit
dumdum db 1
;random hit


;DOUBLE HIT ---------------//

.code
mov ax, @data
mov ds, ax
mov ax, 0



Main Proc
call Name_Input
mov ah, 0
mov al, 13h    ;200x320(RxC)
int 10h

call front_page

mov dh, 10    ;row for up down
mov dl, 20   ;column for left right
mov ah, 2    ;to set final cursor position
int 10h

mov ah, 4ch
int 21h
ret
Main Endp

front_page PROC
mov bl,0100b ;for red color
mov row3,50
mov col,110
call Rectangle ;1st rec for play game
mov bl,1110b ;for yellow color
mov row3,80
mov col,110
call Rectangle ;2nd rec for resume
mov row3,110
mov col,110
call Rectangle ;3rd rec for instructions
mov row3,140
mov col,110
call Rectangle ;4th rec for highscore
mov row3,170
mov col,110
call Rectangle ;5th rec for exit game

mov str_x,100
mov str_y,20
call Str_Output
call PLAY_Output
call Resume_Output
call Rules_Output
call HighScores_Output
call Exit_Output
call Name_Output

call Select_Option ;for user choice
ret
front_page Endp

Rectangle PROC

MOV CX, col   ;(column)
MOV DX, row3    ;(row)
mov row1,dx	;store backup of row in row1
mov col1,cx; store backup of col in col1
add col1,100 ;rectangle breadth set to 100
add row1,20 ;rectangle length set to 20
l1:
cmp cx, col1  ;80 moves right
je exit
MOV AL, bl  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp l1
exit:;upper up


MOV CX, col    ;(column)
MOV DX, row3    ;(row)
l11:         ;20 moves up
cmp dx, row1
je exit1
MOV AL, BL  ;yellow color
MOV AH, 0CH 
INT 10H
inc dx
jmp l11
exit1:;left


MOV CX, col1   ;(column)
MOV DX, row3   ;(row)
l111:
cmp dx, row1   ;20 moves up
je exit111
MOV AL, bl  ;yellow color
MOV AH, 0CH 
INT 10H
inc dx
jmp l111
exit111:;right



MOV CX, col   ;(column)
MOV DX, row1  ;(row)
l01:
cmp cx, col1		;moves 80 right
je exit0
MOV AL, bl  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp l01
exit0:;upper lower
ret
Rectangle Endp

Str_Output PROC
mov dh, 183    ;row for up down
mov dl, 195   ;column for left right
mov ah, 2
int 10h

mov    dx, offset str1
mov    ah,09h
int    21h
ret
Str_Output Endp

PLAY_Output PROC
mov dh, 186    ;row for up down
mov dl, 199   ;column for left rightJmuh
mov ah, 2
int 10h

mov    dx, offset str2
mov    ah,09h
int    21h
ret
PLAY_Output Endp

Resume_Output PROC
mov dh, 190    ;row for up down
mov dl, 201   ;column for left right
mov ah, 2
int 10h

mov    dx, offset str5
mov    ah,09h
int    21h
ret
Resume_Output Endp

Rules_Output PROC
mov dh, 193    ;row for up down
mov dl, 198   ;column for left right
mov ah, 2
int 10h

mov    dx, offset str3
mov    ah,09h
int    21h
ret
Rules_Output Endp

HighScores_Output PROC
mov dh, 197    ;row for up down
mov dl, 199   ;column for left right
mov ah, 2
int 10h

mov    dx, offset str6
mov    ah,09h
int    21h
ret
HighScores_Output Endp

Exit_Output PROC
mov dh, 201    ;row for up down
mov dl, 199   ;column for left right
mov ah, 2
int 10h

mov    dx, offset str4
mov    ah,09h
int    21h
ret
Exit_Output Endp

Name_Input PROC
mov ah, 0
mov al, 13h ;25x80    
int 10h


mov bl,0100b ;for red color
mov row3,28
mov col,110
call Draw_Lines

call Str_Output

;setting cursor position
mov dh, 191    ;row for up down
mov dl, 186    ;column for left right
mov ah, 2
int 10h

mov    dx, offset string1
mov    ah,09h
int    21h


;COPIED FROM HERE

mov bl,1110b ;for YELLOW color
mov row3,92
mov col,200
call Draw_Lines

;setting cursor position
mov dh, 198    ;row for up down
mov dl, 151    ;column for left right
mov ah, 2
int 10h

mov    dx, offset str7
mov    ah,09h
int    21h

mov bl,1010b ;for red color
mov row3,148
mov col,110
call Draw_Lines


;setting cursor position
mov dh, 191    ;row
mov dl, 169    ;column
mov ah, 2
int 10h

mov si,offset n1
loop1:
mov ah,1
int 16h
jnz whichKey
jz loop1

whichKey:
mov ah,0  ;for input
int 16h
cmp al,13
je exit2
mov [si],al
inc si
mov dl, al
Mov ah, 2
int 21h
jmp loop1

exit2:
ret
Name_Input Endp

Name_Output PROC
mov dh, 180    ;row for up down
mov dl, 166   ;column for left right
mov ah, 2
int 10h

mov    dx, offset string2
mov    ah,09h
int    21h

mov dh, 180    ;row for up down
mov dl, 174   ;column for left right
mov ah, 2
int 10h

mov    dx, offset n1
mov    ah,09h
int    21h
ret
Name_Output Endp

Select_Option PROC

loop2:
mov ah,1
int 16h
jnz whichKey1
jz loop2

whichKey1:
mov ah,0  ;for input
int 16h
cmp al,13
je exit5 ;if enter pressed
cmp ah,50h ;down key pressed
je down
cmp ah,48h ;up key pressed
je up1
jmp loop2


down:
cmp counter1,5 ;take input again if on last option
je loop2
cmp counter1,1
je J1
cmp counter1,2
je J2
cmp counter1,3
je J3
cmp counter1,4
je j5

up1:
jmp up

J1: ;means going from 1st rectangle to second
inc counter1
mov bl,1110b ;for yellow color
mov row3,50
mov col,110
call Rectangle ;1st rec for play game

mov bl,0100b ;for red color
mov row3,80
mov col,110
call Rectangle ;2nd rec for resume
jmp loop2

j5:
jmp J4

exit5:
jmp exit4

J2: ;means going from 2nd rectangle to 3rd
inc counter1
mov bl,1110b ;for yellow color
mov row3,80
mov col,110
call Rectangle ;2nd rec for resume

mov bl,0100b ;for red color
mov row3,110
mov col,110
call Rectangle ;3rd rec for instructions
jmp loop2
loop5:
jmp loop2

J3: ;means going from 3rd rectangle to 4th
inc counter1
mov bl,1110b ;for yellow color
mov row3,110
mov col,110
call Rectangle ;3rd rec for instructions

mov bl,0100b ;for red color
mov row3,140
mov col,110
call Rectangle ;4th rec for highscore
jmp loop2

J4: ;means going from 4th rectangle to 5th
inc counter1
mov bl,1110b ;for yellow color
mov row3,140
mov col,110
call Rectangle ;4th rec for highscore

mov bl,0100b ;for red color
mov row3,170
mov col,110
call Rectangle ;5th rec for exit game
jmp loop2

up:
cmp counter1,1 ;take input again if on first option
je loop5
cmp counter1,2 ;2->1
je u1
cmp counter1,3 ;3->2
je u2
cmp counter1,4 ;4->3
je u3
cmp counter1,5 ;5->5
je u4

u1: ;means going from 2nd rectangle to first
dec counter1
mov bl,1110b ;for yellow color
mov row3,80
mov col,110
call Rectangle ;2nd rec for resume

mov bl,0100b ;for red color
mov row3,50
mov col,110
call Rectangle ;1st rec for play game
jmp loop2

exit4:
jmp exit3

u2: ;means going from 3rd rectangle to 2nd
dec counter1
mov bl,1110b ;for yellow color
mov row3,110
mov col,110
call Rectangle ;3rd rec for instructions

mov bl,0100b ;for red color
mov row3,80
mov col,110
call Rectangle ;2nd rec for resume
jmp loop2

u3: ;means going from 4th rectangle to 3rd
dec counter1
mov bl,1110b ;for yellow color
mov row3,140
mov col,110
call Rectangle ;4th rec for highscore

mov bl,0100b ;for red color
mov row3,110
mov col,110
call Rectangle ;3rd rec for instructions
jmp loop2

u4: ;means going from 5th rectangle to 4th
dec counter1
mov bl,1110b ;for yellow color
mov row3,170
mov col,110
call Rectangle ;5th rec for exit game

mov bl,0100b ;for red color
mov row3,140
mov col,110
call Rectangle ;4th rec for highscore
jmp loop2

exit3:
cmp counter1,1
je G1 ;TO play game
cmp counter1,2
je R1 ;to resume
cmp counter1,3
je I1 ;to go on instructions
cmp counter1,4
je H1 ;to go on highscore page
cmp counter1,5
je E1 ; to exit

G1:
call play_game

R1:

H1:


E1:
mov dh, 10    ;row for up down
mov dl, 20   ;column for left right
mov ah, 2    ;to set final cursor position
int 10h

mov ah, 4ch
int 21h

I1:
call Instructions

ret
Select_Option Endp

Instructions PROC
mov ah, 0
mov al, 13h    ;200x320(RxC)
int 10h

mov dh, 180   ;row for up down
mov dl, 110  ;column for left right
mov ah, 2
int 10h

mov    dx, offset ins1
mov    ah,09h
int    21h

mov dh, 183   ;row for up down
mov dl, 105  ;column for left right
mov ah, 2
int 10h

mov    dx, offset ins2
mov    ah,09h
int    21h

mov dh, 185   ;row for up down
mov dl, 105  ;column for left right
mov ah, 2
int 10h

mov    dx, offset ins3
mov    ah,09h
int    21h

mov dh, 187   ;row for up down
mov dl, 105  ;column for left right
mov ah, 2
int 10h

mov    dx, offset ins4
mov    ah,09h
int    21h

mov dh, 189  ;row for up down
mov dl, 105  ;column for left right
mov ah, 2
int 10h

mov    dx, offset ins5
mov    ah,09h
int    21h

mov dh, 191  ;row for up down
mov dl, 105  ;column for left right
mov ah, 2
int 10h

mov    dx, offset ins6
mov    ah,09h
int    21h

mov dh, 193  ;row for up down
mov dl, 105  ;column for left right
mov ah, 2
int 10h

mov    dx, offset ins7
mov    ah,09h
int    21h

mov dh, 195  ;row for up down
mov dl, 105  ;column for left right
mov ah, 2
int 10h

mov    dx, offset ins8
mov    ah,09h
int    21h

mov dh, 199  ;row for up down
mov dl, 108  ;column for left right
mov ah, 2
int 10h

mov    dx, offset ins9
mov    ah,09h
int    21h

mov bl,0100b ;for red color
mov row3,3
mov col,110
call Draw_Lines

loop3:
mov ah,1
int 16h
jnz whichKey3
jz loop3

whichKey3:
mov ah,0  ;for input
int 16h
cmp al,27
je exit9 ;if esc pressed
jmp loop3

exit9:
mov ah, 0
mov al, 13h    ;200x320(RxC)
int 10h
call front_page

mov dh, 10    ;row for up down
mov dl, 20   ;column for left right
mov ah, 2    ;to set final cursor position
int 10h
ret
Instructions Endp



Draw_Lines PROC

MOV CX, col   ;(column)
MOV DX, row3    ;(row)
mov row1,dx	;store backup of row in row1
mov col1,cx; store backup of col in col1
add col1,100 ;rectangle breadth set to 100
add row1,20 ;rectangle length set to 20
l05:
cmp cx, col1  ;80 moves right
je exit7
MOV AL, bl  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp l05
exit7:;upper up

MOV CX, col   ;(column)
MOV DX, row1  ;(row)
l04:
cmp cx, col1		;moves 80 right
je exit8
MOV AL, bl  ;yellow color
MOV AH, 0CH 
INT 10H
inc cx
jmp l04
exit8:;upper lower
ret
Draw_Lines Endp

;saim PROCS ARE BELOW
;-------------------------------------------------------------------------------------
;SAIM SAIM SAIM SAIM SAIM
;-------------------------------------------------------------------------------------

;-----------------------------------------------------
;DISAPEAR HEART FUNCTION
;-----------------------------------------------------
;///////heart1////////
dheart1 proc
mov ah,0ch
mov al,bcolor
mov cx,hcol
mov dx,5
int 10h

inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx
inc cx

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx
inc cx
inc cx

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
inc cx
inc cx
inc cx

call You_Lose
dheart1 endp
;///////heart////////

;///////heart2////////
dheart2 proc
mov ah,0ch
mov al,bcolor
mov cx,hcol
mov dx,20
int 10h

inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx
inc cx

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx
inc cx
inc cx

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
inc cx
inc cx
inc cx

dheart2 endp
;///////heart////////

;///////heart3////////
dheart3 proc
mov ah,0ch
mov al,bcolor
mov cx,hcol
mov dx,35
int 10h

inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx
inc cx

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx
inc cx
inc cx

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
inc cx
inc cx
inc cx

inc cx
dheart3 endp
;///////heart3////////
;DISAPEAR HEART FUNCTION
;-----------------------------------------------------


;-----------------------------------------------------
;PADDLE FUNCTION
;-----------------------------------------------------
Paddle proc

mov ah,0ch
mov al,pcolor
mov cx,pcol
mov dx,prow
int 10h

inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
.if level!=3
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
.if level!=2
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
.endif
.endif

mov cx,pcol
inc dx
int 10h

inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
.if level!=3
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
.if level!=2
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
.endif
.endif


ret
paddle endp
;PADDLE FUNCTION
;-----------------------------------------------------

;-----------------------------------------------------
;disapear paddle FUNCTION
;-----------------------------------------------------
disPaddle proc

mov ah,0ch
mov al,bcolor
mov cx,pcol
mov dx,prow
int 10h

inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
.if level!=3
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
.if level!=2
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
.endif
.endif

mov cx,pcol
inc dx
int 10h

inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
.if level!=3
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
.if level != 2 
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
.endif
.endif

ret
dispaddle endp
;disapear paddle FUNCTION
;-----------------------------------------------------


;-----------------------------------------------------
;MAKE BACKGROUND
;-----------------------------------------------------
makebackground proc

;//set background color
MOV AH, 06h
MOV AL, 0
MOV CX, 0
MOV DH, 80
MOV DL, 80
MOV BH, bcolor ;grey
INT 10h
;////////////////////

;cursor position
mov dh, 0     ;row (0-24)
mov dl, 0     ;column (0-79)
mov ah, 2
int 10h

;reset
mov cx,0
mov ax,0



;///////heart1////////
heart1 proc
mov ah,0ch
mov al,pcolor
mov cx,hcol
mov dx,5
int 10h

inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx
inc cx

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx
inc cx
inc cx

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
inc cx
inc cx
inc cx

heart1 endp
;///////heart////////

;///////heart2////////
heart2 proc
mov ah,0ch
mov al,pcolor
mov cx,hcol
mov dx,20
int 10h

inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx
inc cx

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx
inc cx
inc cx

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
inc cx
inc cx
inc cx

heart2 endp
;///////heart////////

;///////heart3////////
heart3 proc
mov ah,0ch
mov al,pcolor
mov cx,hcol
mov dx,35
int 10h

inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx
inc cx

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
inc cx
inc cx
inc cx

;next line
mov cx,hcol
inc dx

inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
inc cx
int 10h
inc cx
inc cx
inc cx
inc cx

inc cx
heart3 endp
;///////heart3////////

mov row, 10
mov column, 10
mov cx,190
verticallineA:
mov bx,cx
mov cl,column	;30 in (column num)   ;intcrement column to make horizontal line
mov dl,row	    ;30 in (row)
mov al,wcolor;
mov ah, 0ch
int 10h

inc row
mov cx,bx
loop verticallineA


;reset
mov cx,0
mov ax,0

mov row, 10
mov column, 255
mov cx,190
verticallineb:
mov bx,cx
mov cl,column	;30 in (column num)   ;intcrement column to make horizontal line
mov dl,row	    ;30 in (row)
mov al,wcolor;
mov ah, 0ch
int 10h

inc row
mov cx,bx
loop verticallineb


;reset
mov cx,0
mov ax,0

mov row, 10
mov column, 10
mov cx,245
horizontala:
mov bx,cx
mov cl,column	;30 in (column num)   ;intcrement column to make horizontal line
mov dl,row	    ;30 in (row)
mov al,wcolor;
mov ah, 0ch
int 10h

inc column
mov cx,bx
loop horizontala

;cursor position
mov dh, 0     ;row (0-24)
mov dl, 0     ;column (0-79)
mov ah, 2
int 10h

.if level != 3
;//box1//
mov cx,10
box1:
mov bx,cx
mov cx,40
b1:
mov v,cx
mov ah,0ch
mov al,bbcolor
mov cx,bc1 ;//////
mov dx,br1 ;//////
int 10h

inc bc1    ;////
mov cx,v
loop b1    ;////
mov cx,bx
mov bc1,20 ;/////////
inc br1
loop box1  ;/////
;///box1///

;//box2//
mov cx,10
box2:
mov bx,cx
mov cx,40
b2:
mov v,cx
mov ah,0ch
mov al,bbcolor
mov cx,bc2 ;//////
mov dx,br2 ;//////
int 10h

inc bc2    ;////
mov cx,v
loop b2    ;////
mov cx,bx
mov bc2,70 ;/////////
inc br2
loop box2  ;/////
;///box2///
.endif

;//box3//
mov cx,10
box3:
mov bx,cx
mov cx,40
b3:
mov v,cx
mov ah,0ch
mov al,bbcolor
mov cx,bc3 ;//////
mov dx,br3 ;//////
int 10h

inc bc3    ;////
mov cx,v
loop b3    ;////
mov cx,bx
mov bc3,120 ;/////////
inc br3
loop box3  ;/////
;///box3///

.if level!=2 && level!=3
;//box4//
mov cx,10
box4:
mov bx,cx
mov cx,40
b4:
mov v,cx
mov ah,0ch
mov al,bbcolor
mov cx,bc4 ;//////
mov dx,br4 ;//////
int 10h

inc bc4    ;////
mov cx,v
loop b4    ;////
mov cx,bx
mov bc4,170 ;/////////
inc br4
loop box4  ;/////
;///box4///

;//box5//
mov cx,10
box5:
mov bx,cx
mov cx,25
b5:
mov v,cx
mov ah,0ch
mov al,bbcolor
mov cx,bc5 ;//////
mov dx,br5 ;//////
int 10h

inc bc5    ;////
mov cx,v
loop b5    ;////
mov cx,bx
mov bc5,220 ;/////////
inc br5
loop box5  ;/////
;///box5///

;//box6//
mov cx,10
box6:
mov bx,cx
mov cx,25
b6:
mov v,cx
mov ah,0ch
mov al,bbcolor
mov cx,bc6 ;//////
mov dx,br6 ;//////
int 10h

inc bc6    ;////
mov cx,v
loop b6    ;////
mov cx,bx
mov bc6,20 ;/////////
inc br6
loop box6  ;/////
;///box6///

;//box7//
mov cx,10
box7:
mov bx,cx
mov cx,40
b7:
mov v,cx
mov ah,0ch
mov al,bbcolor
mov cx,bc7 ;//////
mov dx,br7 ;//////
int 10h

inc bc7    ;////
mov cx,v
loop b7    ;////
mov cx,bx
mov bc7,55 ;/////////
inc br7
loop box7  ;/////
;///box7///
.endif

;//box8//
mov cx,10
box8:
mov bx,cx
mov cx,40
b8:
mov v,cx
mov ah,0ch
mov al,bbcolor
mov cx,bc8 ;//////
mov dx,br8 ;//////
int 10h

inc bc8    ;////
mov cx,v
loop b8    ;////
mov cx,bx
mov bc8,105 ;/////////
inc br8
loop box8  ;/////
;///box8///


;//box9//
mov cx,10
box9:
mov bx,cx
mov cx,40
b9:
mov v,cx
mov ah,0ch
mov al,bbcolor
mov cx,bc9 ;//////
mov dx,br9 ;//////
int 10h

inc bc9    ;////
mov cx,v
loop b9    ;////
mov cx,bx
mov bc9,155 ;/////////
inc br9
loop box9  ;/////
;///box9///

.if level != 3
;//box10//
mov cx,10
box10:
mov bx,cx
mov cx,40
b10:
mov v,cx
mov ah,0ch
mov al,bbcolor
mov cx,bc10 ;//////
mov dx,br10 ;//////
int 10h

inc bc10    ;////
mov cx,v
loop b10    ;////
mov cx,bx
mov bc10,205 ;/////////
inc br10
loop box10  ;/////
;///box10///

;///////////////////////////
;///////////////////////////
;///////////////////////////

;//box11//
mov cx,10
box11:
mov bx,cx
mov cx,40
b11:
mov v,cx
mov ah,0ch
mov al,bbcolor
mov cx,bc11 ;//////
mov dx,br11 ;//////
int 10h

inc bc11    ;////
mov cx,v
loop b11    ;////
mov cx,bx
mov bc11,20 ;/////////
inc br11
loop box11  ;/////
;///box11///
.endif

;//box12//
mov cx,10
box12:
mov bx,cx
mov cx,40
b12:
mov v,cx
mov ah,0ch
mov al,bbcolor
mov cx,bc12 ;//////
mov dx,br12 ;//////
int 10h

inc bc12    ;////
mov cx,v
loop b12    ;////
mov cx,bx
mov bc12,70 ;/////////
inc br12
loop box12  ;/////
;///box12///

;//box13//
mov cx,10
box13:
mov bx,cx
mov cx,40
b13:
mov v,cx
mov ah,0ch
mov al,bbcolor
mov cx,bc13 ;//////
mov dx,br13 ;//////
int 10h

inc bc13    ;////
mov cx,v
loop b13    ;////
mov cx,bx
mov bc13,120 ;/////////
inc br13
loop box13  ;/////
;///box13///

;//box14//
mov cx,10
box14:
mov bx,cx
mov cx,40
b14:
mov v,cx
mov ah,0ch
mov al,bbcolor
mov cx,bc14 ;//////
mov dx,br14 ;//////
int 10h

inc bc14    ;////
mov cx,v
loop b14    ;////
mov cx,bx
mov bc14,170 ;/////////
inc br14
loop box14  ;/////
;///box14///

.if level!=3
;//box15//
mov cx,10
box15:
mov bx,cx
mov cx,25
b15:
mov v,cx
mov ah,0ch
mov al,bbcolor
mov cx,bc15 ;//////
mov dx,br15 ;//////
int 10h

inc bc15    ;////
mov cx,v
loop b15    ;////
mov cx,bx
mov bc15,220 ;/////////
inc br15
loop box15  ;/////
;///box15//
.endif

;//box16//
mov cx,10
box16:
mov bx,cx
mov cx,25
b16:
mov v,cx
mov ah,0ch
mov al,bbcolor
mov cx,bc16 ;//////
mov dx,br16 ;//////
int 10h

inc bc16    ;////
mov cx,v
loop b16    ;////
mov cx,bx
mov bc16,20 ;/////////
inc br16
loop box16  ;/////
;///box16///

;//box17//
mov cx,10
box17:
mov bx,cx
mov cx,40
b17:
mov v,cx
mov ah,0ch
mov al,bbcolor
mov cx,bc17 ;//////
mov dx,br17 ;//////
int 10h

inc bc17    ;////
mov cx,v
loop b17    ;////
mov cx,bx
mov bc17,55 ;/////////
inc br17
loop box17  ;/////
;///box17///

;//box18//
mov cx,10
box18:
mov bx,cx
mov cx,40
b18:
mov v,cx
mov ah,0ch
mov al,bbcolor
mov cx,bc18 ;//////
mov dx,br18 ;//////
int 10h

inc bc18    ;////
mov cx,v
loop b18    ;////
mov cx,bx
mov bc18,105 ;/////////
inc br18
loop box18  ;/////
;///box18///

;//box19//
mov cx,10
box19:
mov bx,cx
mov cx,40
b19:
mov v,cx
mov ah,0ch
mov al,bbcolor
mov cx,bc19 ;//////
mov dx,br19 ;//////
int 10h

inc bc19    ;////
mov cx,v
loop b19    ;////
mov cx,bx
mov bc19,155 ;/////////
inc br19
loop box19  ;/////
;///box19///

;//box20//
mov cx,10
box20:
mov bx,cx
mov cx,40
b20:
mov v,cx
mov ah,0ch
mov al,bbcolor
mov cx,bc20 ;//////
mov dx,br20 ;//////
int 10h

inc bc20    ;////
mov cx,v
loop b20    ;////
mov cx,bx
mov bc20,205 ;/////////
inc br20
loop box20  ;/////
;///box20///

mov r,10
mov cx,30
frog:
mov bx,cx

mov ah,0ch
mov al,bbcolor
mov cx,11 ;//////
mov dx,r ;//////
int 10h

inc r
mov cx,bx
loop frog

.if level != 1
;---------------------------------------
;EXTRA BRICKS
;---------------------------------------
;//box21//
mov cx,8
boxx18:
mov bx,cx
mov cx,40
b18x:
mov v,cx
mov ah,0ch
mov al,bbcolor
mov cx,bc21x ;//////
mov dx,br21x ;//////
int 10h

inc bc21x    ;////
mov cx,v
loop b18x    ;////
mov cx,bx
mov bc21x,20 ;/////////
inc br21x
loop boxx18  ;/////
;///box21///

;//box22//
mov cx,8
box19x:
mov bx,cx
mov cx,40
b19x:
mov v,cx
mov ah,0ch
mov al,bbcolor
mov cx,bc22 ;//////
mov dx,br22 ;//////
int 10h

inc bc22    ;////
mov cx,v
loop b19x    ;////
mov cx,bx
mov bc22,110 ;/////////
inc br22
loop box19x  ;/////
;///box22///

;//box23//
mov cx,8
box20x:
mov bx,cx
mov cx,40
b20x:
mov v,cx
mov ah,0ch
mov al,bbcolor
mov cx,bc23 ;//////
mov dx,br23 ;//////
int 10h

inc bc23    ;////
mov cx,v
loop b20x    ;////
mov cx,bx
mov bc23,205 ;/////////
inc br23
loop box20x  ;/////
;///box23///
;EXTRA BRICKS
;---------------------------------------
.endif

.if level == 3
;//box21//
mov cx,2
boxx18a:
mov bx,cx
mov cx,32
b18xa:
mov v,cx
mov ah,0ch
mov al,0
mov cx,noc21 ;//////
mov dx,nor21 ;//////
int 10h

inc noc21    ;////
mov cx,v
loop b18xa    ;////
mov cx,bx
mov noc21,24 ;/////////
inc nor21
loop boxx18a  ;/////
;///box21///



;//box23//
mov cx,2
box20xa:
mov bx,cx
mov cx,32
b20xa:
mov v,cx
mov ah,0ch
mov al,0
mov cx,noc23 ;//////
mov dx,nor23 ;//////
int 10h

inc noc23    ;////
mov cx,v
loop b20xa    ;////
mov cx,bx
mov noc23,209 ;/////////
inc nor23
loop box20xa  ;/////
;///box23///
.endif





ret
makebackground endp
;MAKE BACKGROUND
;-----------------------------------------------------



;-----------------------------------------------------
;Draw BALL FUNCTION
;-----------------------------------------------------
drawball proc


mov ah,0ch
mov al,14
mov cx,bcol
mov dx,brow
int 10h

inc cx
int 10h

;next line
mov cx,bcol
inc dx

dec cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,bcol
inc dx

dec cx
dec cx
int 10h

inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,bcol
inc dx

dec cx
dec cx
int 10h

inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,bcol
inc dx

dec cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,bcol
inc dx

int 10h
inc cx
int 10h



ret
drawball endp
;Draw BALL FUNCTION
;-----------------------------------------------------


;-----------------------------------------------------
;DISAPEARING BALL FUNCTION
;-----------------------------------------------------
disapearingball proc


mov ah,0ch
mov al,bcolor
mov cx,bcol
mov dx,brow
int 10h

inc cx
int 10h

;next line
mov cx,bcol
inc dx

dec cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,bcol
inc dx

dec cx
dec cx
int 10h

inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,bcol
inc dx

dec cx
dec cx
int 10h

inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,bcol
inc dx

dec cx
int 10h
inc cx
int 10h
inc cx
int 10h
inc cx
int 10h

;next line
mov cx,bcol
inc dx

int 10h
inc cx
int 10h



ret
disapearingball endp
;DISAPEARING BALL FUNCTION
;-----------------------------------------------------

;-----------------------------------------------------
;MOVINGBALL FUNCTION
;-----------------------------------------------------
movingball proc
.if level==1
call display_level1
.endif

.if level==2
call display_level2
.endif

.if level==3
call display_level3
.endif
a:

.if level==1
cmp delaytime,0
   je delay_exit_1
   mov si,0
   loopdel1:
         mov cx,50000
         loop $
         inc si
         mov dx,delaytime
         cmp si,dx
         jle loopdel1
   delay_exit_1:
.endif

.if level==2
cmp delaytime,0
   je delay_exit_1b
   mov si,0
   loopdel1b:
         mov cx,30000
         loop $
         inc si
         mov dx,delaytime
         cmp si,dx
         jle loopdel1b
   delay_exit_1b:
.endif

.if level==3
cmp delaytime,0
   je delay_exit_1c
   mov si,0
   loopdel1c:
         mov cx,15000
         loop $
         inc si
         mov dx,delaytime
         cmp si,dx
         jle loopdel1c
   delay_exit_1c:
.endif

;///disapearingball///
call disapearingball
;///disapearingball///
inc bcol
dec brow

cmp brow,198
je a

cmp bcol,251
je b


.if brow<=13 
jmp d
.endif



;///////paddle jump///////
.if level==1
mov bx,pcol
mov pcole,bx
add pcole,57
mov cx,bcol

.if brow>=189 && cx>=pcol && cx<=pcole
jmp a
.endif
.endif

.if level==2
mov bx,pcol
mov pcole,bx
add pcole,42
mov cx,bcol

.if brow>=189 && ax>=pcol && cx<=pcole
jmp a
.endif
.endif

.if level==3
mov bx,pcol
mov pcole,bx
add pcole,25
mov cx,bcol

.if brow>=189 && cx>=pcol && cx<=pcole
jmp a
.endif
.endif
;///////paddle jump///////

mov bx,0
;/////jumpcolaaa/////
mov ax,brow
mov jrow,ax
dec jrow
dec jrow

mov ax,bcol
mov jcol,ax
inc jcol
inc jcol
inc jcol
inc jcol

mov ah,0dh
mov cx,jcol
mov dx,jrow
int 10h

mov bl,level

.if level==1 && killme==20
inc level
call play_game
.endif

.if level==2 && killme==19
inc level
call play_game
.endif

.if level==3 && killme==12
inc level
call You_Win
.endif

.if al==bbcolor

;////////////DISAPEAR////////////
;////////////DISAPEAR////////////
;////////////DISAPEAR////////////
.if level ==2
.if jrow>128 && jrow<140 && jcol>16 && jcol<63;
mov bl,level
.if rip21 == bl
;inc score
;inc killme
call disb21
.endif
inc rip21
.endif

.if jrow>95 && jrow<109 && jcol>107 && jcol<154;
mov bl,level
.if rip22 == bl
;inc score
;inc killme
call disb22
.endif
inc rip22
.endif

.if jrow>128 && jrow<140 && jcol>201 && jcol<247;
mov bl,level
.if rip23 == bl
;inc score
;inc killme
call disb23
.endif
inc rip23
.endif
.endif

.if jrow>76 && jrow<91 && jcol>201 && jcol<246;
mov bl,level
.if rip20 == bl
;inc score
;inc killme
inc dumdum
call disb20
.endif
inc rip20
.endif

.if jrow>76 && jrow<91 && jcol>151 && jcol<196;
mov bl,level
.if rip19 == bl
;inc score
;inc killme
inc dumdum
call disb19
.endif
inc rip19
.endif

.if jrow>76 && jrow<91 && jcol>101 && jcol<146
mov bl,level
.if rip18 == bl
;inc score
;inc killme
call disb18
.endif
inc rip18
.endif

.if jrow>76 && jrow<91 && jcol>51 && jcol<96
.if rip17 == bl
;inc score
;inc killme
inc dumdum
call disb17
.endif
inc rip17
.endif

.if jrow>76 && jrow<91 && jcol>16 && jcol<46
mov bl,level
.if rip16 == bl
;inc score
;inc killme
call disb16
.endif
inc rip16
.endif
;//

.if jrow>56 && jrow<71 && jcol>216 && jcol<246
mov bl,level
.if rip15 == bl
;inc score
;inc killme
call disb15
.endif
inc rip15
.endif

.if jrow>56 && jrow<71 && jcol>166 && jcol<211
mov bl,level
.if rip14 == bl
;inc score
;inc killme
call disb14
.endif
inc rip14
.endif

.if jrow>56 && jrow<71 && jcol>116 && jcol<161
mov bl,level
.if rip13 == bl
;inc score
;inc killme
call disb13

.if dumdum == 1
call disb1
call disb3
call disb10
call disb6
call disb8
.endif

.if dumdum == 2
call disb2
call disb4
call disb7
call disb9
call disb15
.endif

.if dumdum == 3
call disb3
call disb9
call disb7
call disb14
call disb12
.endif

.if dumdum == 4
call disb11
call disb15
call disb8
call disb9
call disb5
.endif



.endif
inc rip13
.endif

.if jrow>56 && jrow<71 && jcol>66 && jcol<111
mov bl,level
.if rip12 == bl
;inc score
;inc killme
call disb12
.endif
inc rip12
.endif

.if jrow>56 && jrow<71 && jcol>16 && jcol<61
mov bl,level
.if rip11 == bl
;inc score
;inc killme
call disb11
.endif
inc rip11
.endif
;///

.if jrow>36 && jrow<51 && jcol>201 && jcol<246;
mov bl,level
.if rip10 == bl
;inc score
;inc killme
call disb10
.endif
inc rip10
.endif

.if jrow>36 && jrow<51 && jcol>151 && jcol<196;
mov bl,level
.if rip9 == bl
;inc score
;inc killme
call disb9
.endif
inc rip9
.endif

.if jrow>36 && jrow<51 && jcol>101 && jcol<146
mov bl,level
.if rip8 == bl
;inc score
;inc killme
call disb8
.endif
inc rip8
.endif

.if jrow>36 && jrow<51 && jcol>51 && jcol<96
mov bl,level
.if rip7 == bl
;inc score
;inc killme
call disb7
.endif
inc rip7
.endif

.if jrow>36 && jrow<51 && jcol>16 && jcol<46
mov bl,level
.if rip6 == bl
;inc score
;inc killme
call disb6
.endif
inc rip6
.endif
;//

.if jrow>16 && jrow<31 && jcol>216 && jcol<246
mov bl,level
.if rip5 == bl
;inc score
;inc killme
call disb5
.endif
inc rip5
.endif

.if jrow>16 && jrow<31 && jcol>166 && jcol<211
mov bl,level
.if rip4 == bl
;inc score
;inc killme
call disb4
.endif
inc rip4
.endif

.if jrow>16 && jrow<31 && jcol>116 && jcol<161
mov bl,level
.if rip3 == bl
;inc score
;inc killme
call disb3
.endif
inc rip3
.endif

.if jrow>16 && jrow<31 && jcol>66 && jcol<111
mov bl,level
.if rip2 == bl
;inc score
;inc killme
call disb2
.endif
inc rip2
.endif

.if jrow>16 && jrow<31 && jcol>16 && jcol<61
mov bl,level
.if rip1 == bl
;inc score
;inc killme
call disb1
.endif
inc rip1
.endif

;////////////DISAPEAR////////////

;////////////DISAPEAR////////////
jmp d
.endif

;/////jumpcol/////



;///drawball///
call drawball
;///drawball///



Again:
mov ah,1
int 16h
JZ a

mov ah,0
int 16h

CMP ah,04bh
JE left

CMP ah,4dh
JE right

CMP al,57
JE exit5

left:
;///disapearingball///
call dispaddle
;///disapearingball///
dec pcol
dec pcol
dec pcol
dec pcol
dec pcol
dec pcol
;///drawball///
call paddle
;///drawball///
JMP a

right:
;///disapearingball///
call dispaddle
;///disapearingball///
inc pcol
inc pcol
inc pcol
inc pcol
inc pcol
inc pcol
;///drawball///
call paddle
;///drawball///
JMP a


exit5:


pause5:
mov ah,1
int 16h
JZ pause5

mov ah,0
int 16h

CMP al,57
JE shit5

jmp exit5

shit5:

jmp a

b:
.if level==1
cmp delaytime,0
   je delay_exit_123
   mov si,0
   loopdel2:
         mov cx,50000
         loop $
         inc si
         mov dx,delaytime
         cmp si,dx
         jle loopdel2
   delay_exit_123:
.endif

.if level==2
cmp delaytime,0
   je delay_exit_123b
   mov si,0
   loopdel1bb:
         mov cx,30000
         loop $
         inc si
         mov dx,delaytime
         cmp si,dx
         jle loopdel1bb
   delay_exit_123b:
.endif

.if level==3
cmp delaytime,0
   je delay_exit_123c
   mov si,0
   loopdel1cc:
         mov cx,15000
         loop $
         inc si
         mov dx,delaytime
         cmp si,dx
         jle loopdel1cc
   delay_exit_123c:
.endif
;///disapearingball///
call disapearingball
;///disapearingball///

dec bcol
dec brow

.if bcol==14
jmp a
.endif

.if brow<=13 
jmp c1
.endif

;///////paddle jump///////
;///////paddle jump///////
.if level==1
mov bx,pcol
mov pcole,bx
add pcole,57
mov cx,bcol

.if brow>=189 && cx>=pcol && cx<=pcole
jmp a
.endif
.endif

.if level==2
mov bx,pcol
mov pcole,bx
add pcole,42
mov cx,bcol

.if brow>=189 && ax>=pcol && cx<=pcole
jmp a
.endif
.endif

.if level==3
mov bx,pcol
mov pcole,bx
add pcole,25
mov cx,bcol

.if brow>=189 && cx>=pcol && cx<=pcole
jmp a
.endif
.endif
;///////paddle jump///////

mov bx,0

;/////jumpcolbbb/////
mov ax,brow
mov jrow,ax
dec jrow
dec jrow
dec jrow

mov ax,bcol
mov jcol,ax
dec jcol
dec jcol
dec jcol


mov ah,0dh
mov cx,jcol
mov dx,jrow
int 10h

mov bl,level

.if level==1 && killme==20
inc level
call play_game
.endif

.if level==2 && killme==19
inc level
call play_game
.endif

.if level==3 && killme==12
inc level
call You_Win
.endif

;////////////DISAPEAR////////////
.if al==bbcolor

;////////////DISAPEAR////////////
;////////////DISAPEAR////////////
.if level ==2
.if jrow>128 && jrow<140 && jcol>16 && jcol<63;
mov bl,level
.if rip21 == bl
;inc score
;inc killme
call disb21
.endif
inc rip21
.endif

.if jrow>95 && jrow<109 && jcol>107 && jcol<154;
mov bl,level
.if rip22 == bl
;inc score
;inc killme
call disb22
.endif
inc rip22
.endif

.if jrow>128 && jrow<140 && jcol>201 && jcol<247;
mov bl,level
.if rip23 == bl
;inc score
;inc killme
call disb23
.endif
inc rip23
.endif
.endif

.if jrow>76 && jrow<91 && jcol>201 && jcol<246;
mov bl,level
.if rip20 == bl
;inc score
;inc killme
inc dumdum
call disb20
.endif
inc rip20
.endif

.if jrow>76 && jrow<91 && jcol>151 && jcol<196;
mov bl,level
.if rip19 == bl
;inc score
;inc killme
inc dumdum
call disb19
.endif
inc rip19
.endif

.if jrow>76 && jrow<91 && jcol>101 && jcol<146
mov bl,level
.if rip18 == bl
;inc score
;inc killme
call disb18
.endif
inc rip18
.endif

.if jrow>76 && jrow<91 && jcol>51 && jcol<96
.if rip17 == bl
;inc score
;inc killme
inc dumdum
call disb17
.endif
inc rip17
.endif

.if jrow>76 && jrow<91 && jcol>16 && jcol<46
mov bl,level
.if rip16 == bl
;inc score
;inc killme
call disb16
.endif
inc rip16
.endif
;//

.if jrow>56 && jrow<71 && jcol>216 && jcol<246
mov bl,level
.if rip15 == bl
;inc score
;inc killme
call disb15
.endif
inc rip15
.endif

.if jrow>56 && jrow<71 && jcol>166 && jcol<211
mov bl,level
.if rip14 == bl
;inc score
;inc killme
call disb14
.endif
inc rip14
.endif

.if jrow>56 && jrow<71 && jcol>116 && jcol<161
mov bl,level
.if rip13 == bl
;inc score
;inc killme
call disb13

.if dumdum == 1
call disb1
call disb3
call disb10
call disb6
call disb8
.endif

.if dumdum == 2
call disb2
call disb4
call disb7
call disb9
call disb15
.endif

.if dumdum == 3
call disb3
call disb9
call disb7
call disb14
call disb12
.endif

.if dumdum == 4
call disb11
call disb15
call disb8
call disb9
call disb5
.endif



.endif
inc rip13
.endif

.if jrow>56 && jrow<71 && jcol>66 && jcol<111
mov bl,level
.if rip12 == bl
;inc score
;inc killme
call disb12
.endif
inc rip12
.endif

.if jrow>56 && jrow<71 && jcol>16 && jcol<61
mov bl,level
.if rip11 == bl
;inc score
;inc killme
call disb11
.endif
inc rip11
.endif
;///

.if jrow>36 && jrow<51 && jcol>201 && jcol<246;
mov bl,level
.if rip10 == bl
;inc score
;inc killme
call disb10
.endif
inc rip10
.endif

.if jrow>36 && jrow<51 && jcol>151 && jcol<196;
mov bl,level
.if rip9 == bl
;inc score
;inc killme
call disb9
.endif
inc rip9
.endif

.if jrow>36 && jrow<51 && jcol>101 && jcol<146
mov bl,level
.if rip8 == bl
;inc score
;inc killme
call disb8
.endif
inc rip8
.endif

.if jrow>36 && jrow<51 && jcol>51 && jcol<96
mov bl,level
.if rip7 == bl
;inc score
;inc killme
call disb7
.endif
inc rip7
.endif

.if jrow>36 && jrow<51 && jcol>16 && jcol<46
mov bl,level
.if rip6 == bl
;inc score
;inc killme
call disb6
.endif
inc rip6
.endif
;//

.if jrow>16 && jrow<31 && jcol>216 && jcol<246
mov bl,level
.if rip5 == bl
;inc score
;inc killme
call disb5
.endif
inc rip5
.endif

.if jrow>16 && jrow<31 && jcol>166 && jcol<211
mov bl,level
.if rip4 == bl
;inc score
;inc killme
call disb4
.endif
inc rip4
.endif

.if jrow>16 && jrow<31 && jcol>116 && jcol<161
mov bl,level
.if rip3 == bl
;inc score
;inc killme
call disb3
.endif
inc rip3
.endif

.if jrow>16 && jrow<31 && jcol>66 && jcol<111
mov bl,level
.if rip2 == bl
;inc score
;inc killme
call disb2
.endif
inc rip2
.endif

.if jrow>16 && jrow<31 && jcol>16 && jcol<61
mov bl,level
.if rip1 == bl
;inc score
;inc killme
call disb1
.endif
inc rip1
.endif

;////////////DISAPEAR////////////

;////////////DISAPEAR////////////
jmp c1
.endif

;/////jumpcol/////

;///drawball///
call drawball
;///drawball///


Again1:
mov ah,1
int 16h
JZ b

mov ah,0
int 16h

CMP ah,04bh
JE left1

CMP ah,4dh
JE right1

CMP al,57
JE exit1

left1:
;///disapearingball///
call dispaddle
;///disapearingball///
dec pcol
dec pcol
dec pcol
dec pcol
dec pcol
;///drawball///
call paddle
;///drawball///
JMP b

right1:
;///disapearingball///
call dispaddle
;///disapearingball///
inc pcol
inc pcol
inc pcol
inc pcol
inc pcol
;///drawball///
call paddle
;///drawball///
JMP b


exit1:

pause3:
mov ah,1
int 16h
JZ pause3

mov ah,0
int 16h

CMP al,57
JE shit3

jmp exit1

shit3:

jmp b

c1:

 .if level==1
cmp delaytime,0
   je delay_exit_124
   mov si,0
   loopdel5:
         mov cx,50000
         loop $
         inc si
         mov dx,delaytime
         cmp si,dx
         jle loopdel5
   delay_exit_124:
.endif
 .if level==2
cmp delaytime,0
   je delay_exit_124b
   mov si,0
   loopdel1bbb:
         mov cx,30000
         loop $
         inc si
         mov dx,delaytime
         cmp si,dx
         jle loopdel1bbb
   delay_exit_124b:
.endif

.if level==3
cmp delaytime,0
   je delay_exit_124c
   mov si,0
   loopdel1ccc:
         mov cx,15000
         loop $
         inc si
         mov dx,delaytime
         cmp si,dx
         jle loopdel1ccc
   delay_exit_124c:
.endif

;///disapearingball///
call disapearingball
;///disapearingball///

dec bcol
inc brow

mov ax,brow
mov jrow,ax
inc jrow
inc jrow
inc jrow
inc jrow
inc jrow


mov ax,bcol
mov jcol,ax
dec jcol
dec jcol

inc jrow
.if jrow==196
dec liv
.if liv == 3
call dheart3
.endif
.if liv == 2
call dheart2
.endif
.if liv == 1
call dheart1
.endif
mov bcol,125
mov brow,170
jmp a
.endif




dec jcol
dec jcol
cmp jcol,14
je d

cmp bcol,251
je b

;///////paddle jump///////
;///////paddle jump///////
.if level==1
mov bx,pcol
mov pcole,bx
add pcole,57
mov cx,bcol

.if brow>=189 && cx>=pcol && cx<=pcole
jmp b
.endif
.endif

.if level==2
mov bx,pcol
mov pcole,bx
add pcole,42
mov cx,bcol

.if brow>=189 && ax>=pcol && cx<=pcole
jmp b
.endif
.endif

.if level==3
mov bx,pcol
mov pcole,bx
add pcole,25
mov cx,bcol

.if brow>=189 && cx>=pcol && cx<=pcole
jmp b
.endif
.endif
;///////paddle jump///////


mov bx,0

;/////jumpcolcccc/////
mov ax,brow
mov jrow,ax
inc jrow
inc jrow
inc jrow
inc jrow
inc jrow
inc jrow

mov ax,bcol
mov jcol,ax
dec jcol
dec jcol



mov ah,0dh
mov cx,jcol
mov dx,jrow
int 10h

mov bl,level

.if level==1 && killme==20
inc level
call play_game
.endif

.if level==2 && killme==19
inc level
call play_game
.endif

.if level==3 && killme==12
inc level
call You_Win
.endif

.if al==bbcolor

;////////////DISAPEAR////////////
;////////////DISAPEAR////////////
;////////////DISAPEAR////////////
;////////////DISAPEAR////////////
.if level ==2
.if jrow>128 && jrow<140 && jcol>16 && jcol<63;
mov bl,level
.if rip21 == bl
;inc score
;inc killme
call disb21
.endif
inc rip21
.endif

.if jrow>95 && jrow<109 && jcol>107 && jcol<154;
mov bl,level
.if rip22 == bl
;inc score
;inc killme
call disb22
.endif
inc rip22
.endif

.if jrow>128 && jrow<140 && jcol>201 && jcol<247;
mov bl,level
.if rip23 == bl
;inc score
;inc killme
call disb23
.endif
inc rip23
.endif
.endif

.if jrow>76 && jrow<91 && jcol>201 && jcol<246;
mov bl,level
.if rip20 == bl
;inc score
;inc killme
inc dumdum
call disb20
.endif
inc rip20
.endif

.if jrow>76 && jrow<91 && jcol>151 && jcol<196;
mov bl,level
.if rip19 == bl
;inc score
;inc killme
inc dumdum
call disb19
.endif
inc rip19
.endif

.if jrow>76 && jrow<91 && jcol>101 && jcol<146
mov bl,level
.if rip18 == bl
;inc score
;inc killme
call disb18
.endif
inc rip18
.endif

.if jrow>76 && jrow<91 && jcol>51 && jcol<96
.if rip17 == bl
;inc score
;inc killme
inc dumdum
call disb17
.endif
inc rip17
.endif

.if jrow>76 && jrow<91 && jcol>16 && jcol<46
mov bl,level
.if rip16 == bl
;inc score
;inc killme
call disb16
.endif
inc rip16
.endif
;//

.if jrow>56 && jrow<71 && jcol>216 && jcol<246
mov bl,level
.if rip15 == bl
;inc score
;inc killme
call disb15
.endif
inc rip15
.endif

.if jrow>56 && jrow<71 && jcol>166 && jcol<211
mov bl,level
.if rip14 == bl
;inc score
;inc killme
call disb14
.endif
inc rip14
.endif

.if jrow>56 && jrow<71 && jcol>116 && jcol<161
mov bl,level
.if rip13 == bl
;inc score
;inc killme
call disb13

.if dumdum == 1
call disb1
call disb3
call disb10
call disb6
call disb8
.endif

.if dumdum == 2
call disb2
call disb4
call disb7
call disb9
call disb15
.endif

.if dumdum == 3
call disb3
call disb9
call disb7
call disb14
call disb12
.endif

.if dumdum == 4
call disb11
call disb15
call disb8
call disb9
call disb5
.endif



.endif
inc rip13
.endif

.if jrow>56 && jrow<71 && jcol>66 && jcol<111
mov bl,level
.if rip12 == bl
;inc score
;inc killme
call disb12
.endif
inc rip12
.endif

.if jrow>56 && jrow<71 && jcol>16 && jcol<61
mov bl,level
.if rip11 == bl
;inc score
;inc killme
call disb11
.endif
inc rip11
.endif
;///

.if jrow>36 && jrow<51 && jcol>201 && jcol<246;
mov bl,level
.if rip10 == bl
;inc score
;inc killme
call disb10
.endif
inc rip10
.endif

.if jrow>36 && jrow<51 && jcol>151 && jcol<196;
mov bl,level
.if rip9 == bl
;inc score
;inc killme
call disb9
.endif
inc rip9
.endif

.if jrow>36 && jrow<51 && jcol>101 && jcol<146
mov bl,level
.if rip8 == bl
;inc score
;inc killme
call disb8
.endif
inc rip8
.endif

.if jrow>36 && jrow<51 && jcol>51 && jcol<96
mov bl,level
.if rip7 == bl
;inc score
;inc killme
call disb7
.endif
inc rip7
.endif

.if jrow>36 && jrow<51 && jcol>16 && jcol<46
mov bl,level
.if rip6 == bl
;inc score
;inc killme
call disb6
.endif
inc rip6
.endif
;//

.if jrow>16 && jrow<31 && jcol>216 && jcol<246
mov bl,level
.if rip5 == bl
;inc score
;inc killme
call disb5
.endif
inc rip5
.endif

.if jrow>16 && jrow<31 && jcol>166 && jcol<211
mov bl,level
.if rip4 == bl
;inc score
;inc killme
call disb4
.endif
inc rip4
.endif

.if jrow>16 && jrow<31 && jcol>116 && jcol<161
mov bl,level
.if rip3 == bl
;inc score
;inc killme
call disb3
.endif
inc rip3
.endif

.if jrow>16 && jrow<31 && jcol>66 && jcol<111
mov bl,level
.if rip2 == bl
;inc score
;inc killme
call disb2
.endif
inc rip2
.endif

.if jrow>16 && jrow<31 && jcol>16 && jcol<61
mov bl,level
.if rip1 == bl
;inc score
;inc killme
call disb1
.endif
inc rip1
.endif

;////////////DISAPEAR////////////
jmp b
.endif

;/////jumpcol/////

;///drawball///
call drawball
;///drawball///



Again2:
mov ah,1
int 16h
JZ c1

mov ah,0
int 16h

CMP ah,04bh
JE left2

CMP ah,4dh
JE right2

CMP al,57
JE exit2

left2:
;///disapearingball///
call dispaddle
;///disapearingball///
dec pcol
dec pcol
dec pcol
dec pcol
dec pcol
;///drawball///
call paddle
;///drawball///
JMP c1

right2:
;///disapearingball///
call dispaddle
;///disapearingball///
inc pcol
inc pcol
inc pcol
inc pcol
inc pcol
;///drawball///
call paddle
;///drawball///
JMP c1


exit2:
pause2:
mov ah,1
int 16h
JZ pause2

mov ah,0
int 16h

CMP al,57
JE shit2

jmp exit2

shit2:



jmp c1

d:
 .if level==1
cmp delaytime,0
   je delay_exit_12
   mov si,0
   loopdel:
         mov cx,50000
         loop $
         inc si
         mov dx,delaytime
         cmp si,dx
         jle loopdel
   delay_exit_12:
.endif
 .if level==2
cmp delaytime,0
   je delay_exit_12b
   mov si,0
   loopdel1bbbb:
         mov cx,30000
         loop $
         inc si
         mov dx,delaytime
         cmp si,dx
         jle loopdel1bbbb
   delay_exit_12b:
.endif

.if level==3
cmp delaytime,0
   je delay_exit_12c
   mov si,0
   loopdel1cccc:
         mov cx,15000
         loop $
         inc si
         mov dx,delaytime
         cmp si,dx
         jle loopdel1cccc
   delay_exit_12c:
.endif

;///disapearingball///
call disapearingball
;///disapearingball///

inc bcol
inc brow

mov ax,brow
mov jrow,ax
inc jrow
inc jrow
inc jrow
inc jrow
inc jrow
inc jrow

mov ax,bcol
mov jcol,ax
inc jcol
inc jcol
inc jcol

.if jrow==196
dec liv
.if liv == 3
call dheart3
.endif
.if liv == 2
call dheart2
.endif
.if liv == 1
call dheart1
.endif
mov bcol,125
mov brow,170
jmp a
.endif

.if jrow==197
dec liv
.if liv == 3
call dheart3
.endif
.if liv == 2
call dheart2
.endif
.if liv == 1
call dheart1
.endif
mov bcol,125
mov brow,170
jmp a
.endif



cmp jcol,250
je c1

;///////paddle jump///////
;///////paddle jump///////
.if level==1
mov bx,pcol
mov pcole,bx
add pcole,57
mov cx,bcol

.if brow>=189 && cx>=pcol && cx<=pcole
jmp a
.endif
.endif

.if level==2
mov bx,pcol
mov pcole,bx
add pcole,42
mov cx,bcol

.if brow>=189 && ax>=pcol && cx<=pcole
jmp a
.endif
.endif

.if level==3
mov bx,pcol
mov pcole,bx
add pcole,25
mov cx,bcol

.if brow>=189 && cx>=pcol && cx<=pcole
jmp a
.endif
.endif
;///////paddle jump///////

mov bx,0


;/////jumpcolddd/////
mov ax,brow
mov jrow,ax
inc jrow
inc jrow
inc jrow
inc jrow
inc jrow
inc jrow

mov ax,bcol
mov jcol,ax
inc jcol
inc jcol
inc jcol

mov ah,0dh
mov cx,jcol
mov dx,jrow
int 10h

mov bl,level

.if level==1 && killme==20
inc level
call play_game
.endif

.if level==2 && killme==19
inc level
call play_game
.endif

.if level==3 && killme==12
inc level
call You_Win
.endif

.if al==bbcolor
;////////////DISAPEAR////////////
;////////////DISAPEAR////////////
.if level ==2
.if jrow>128 && jrow<140 && jcol>16 && jcol<63;
mov bl,level
.if rip21 == bl
;inc score
;inc killme
call disb21
.endif
inc rip21
.endif

.if jrow>95 && jrow<109 && jcol>107 && jcol<154;
mov bl,level
.if rip22 == bl
;inc score
;inc killme
call disb22
.endif
inc rip22
.endif

.if jrow>128 && jrow<140 && jcol>201 && jcol<247;
mov bl,level
.if rip23 == bl
;inc score
;inc killme
call disb23
.endif
inc rip23
.endif
.endif

.if jrow>76 && jrow<91 && jcol>201 && jcol<246;
mov bl,level
.if rip20 == bl
;inc score
;inc killme
inc dumdum
call disb20
.endif
inc rip20
.endif

.if jrow>76 && jrow<91 && jcol>151 && jcol<196;
mov bl,level
.if rip19 == bl
;inc score
;inc killme
inc dumdum
call disb19
.endif
inc rip19
.endif

.if jrow>76 && jrow<91 && jcol>101 && jcol<146
mov bl,level
.if rip18 == bl
;inc score
;inc killme
call disb18
.endif
inc rip18
.endif

.if jrow>76 && jrow<91 && jcol>51 && jcol<96
.if rip17 == bl
;inc score
;inc killme
inc dumdum
call disb17
.endif
inc rip17
.endif

.if jrow>76 && jrow<91 && jcol>16 && jcol<46
mov bl,level
.if rip16 == bl
;inc score
;inc killme
call disb16
.endif
inc rip16
.endif
;//

.if jrow>56 && jrow<71 && jcol>216 && jcol<246
mov bl,level
.if rip15 == bl
;inc score
;inc killme
call disb15
.endif
inc rip15
.endif

.if jrow>56 && jrow<71 && jcol>166 && jcol<211
mov bl,level
.if rip14 == bl
;inc score
;inc killme
call disb14
.endif
inc rip14
.endif

.if jrow>56 && jrow<71 && jcol>116 && jcol<161
mov bl,level
.if rip13 == bl
;inc score
;inc killme
call disb13

.if dumdum == 1
call disb1
call disb3
call disb10
call disb6
call disb8
.endif

.if dumdum == 2
call disb2
call disb4
call disb7
call disb9
call disb15
.endif

.if dumdum == 3
call disb3
call disb9
call disb7
call disb14
call disb12
.endif

.if dumdum == 4
call disb11
call disb15
call disb8
call disb9
call disb5
.endif



.endif
inc rip13
.endif

.if jrow>56 && jrow<71 && jcol>66 && jcol<111
mov bl,level
.if rip12 == bl
;inc score
;inc killme
call disb12
.endif
inc rip12
.endif

.if jrow>56 && jrow<71 && jcol>16 && jcol<61
mov bl,level
.if rip11 == bl
;inc score
;inc killme
call disb11
.endif
inc rip11
.endif
;///

.if jrow>36 && jrow<51 && jcol>201 && jcol<246;
mov bl,level
.if rip10 == bl
;inc score
;inc killme
call disb10
.endif
inc rip10
.endif

.if jrow>36 && jrow<51 && jcol>151 && jcol<196;
mov bl,level
.if rip9 == bl
;inc score
;inc killme
call disb9
.endif
inc rip9
.endif

.if jrow>36 && jrow<51 && jcol>101 && jcol<146
mov bl,level
.if rip8 == bl
;inc score
;inc killme
call disb8
.endif
inc rip8
.endif

.if jrow>36 && jrow<51 && jcol>51 && jcol<96
mov bl,level
.if rip7 == bl
;inc score
;inc killme
call disb7
.endif
inc rip7
.endif

.if jrow>36 && jrow<51 && jcol>16 && jcol<46
mov bl,level
.if rip6 == bl
;inc score
;inc killme
call disb6
.endif
inc rip6
.endif
;//

.if jrow>16 && jrow<31 && jcol>216 && jcol<246
mov bl,level
.if rip5 == bl
;inc score
;inc killme
call disb5
.endif
inc rip5
.endif

.if jrow>16 && jrow<31 && jcol>166 && jcol<211
mov bl,level
.if rip4 == bl
;inc score
;inc killme
call disb4
.endif
inc rip4
.endif

.if jrow>16 && jrow<31 && jcol>116 && jcol<161
mov bl,level
.if rip3 == bl
;inc score
;inc killme
call disb3
.endif
inc rip3
.endif

.if jrow>16 && jrow<31 && jcol>66 && jcol<111
mov bl,level
.if rip2 == bl
;inc score
;inc killme
call disb2
.endif
inc rip2
.endif

.if jrow>16 && jrow<31 && jcol>16 && jcol<61
mov bl,level
.if rip1 == bl
;inc score
;inc killme
call disb1
.endif
inc rip1
.endif

;////////////DISAPEAR////////////

jmp a
.endif

;.if level==1 && killme==20
;mov bcol,125
;mov brow,192
;call level_2
;.endif

;.if level==2 && killme==19
;mov bcol,125
;mov brow,192
;call level_3
;.endif

;.if level==3 && killme==12
;mov bcol,125
;mov brow,192
;call You_Win
;.endif

;/////jumpcol/////

;///drawball///
call drawball
;///drawball///



Again3:
mov ah,1
int 16h
JZ d

mov ah,0
int 16h

CMP ah,04bh
JE left3

CMP ah,4dh
JE right3

CMP al,57
JE exit3

left3:
;///disapearingball///
call dispaddle
;///disapearingball///
dec pcol
dec pcol
dec pcol
dec pcol
dec pcol
;///drawball///
call paddle
;///drawball///
JMP d

right3:
;///disapearingball///
call dispaddle
;///disapearingball///
inc pcol
inc pcol
inc pcol
inc pcol
inc pcol
;///drawball///
call paddle
;///drawball///
JMP d


exit3:

jmp d

exit:

pause:
mov ah,1
int 16h
JZ pause

mov ah,0
int 16h

CMP al,57
JE shit

jmp exit

shit:

movingball endp
;MOVINGBALL FUNCTION
;-----------------------------------------------------


;-----------------------------------------------------
;DISAPEARING BRICKS
;-----------------------------------------------------
disb1 proc
;//box1//
inc killme
inc score
.if level == 2
inc score
.endif
.if level == 3
inc score
inc score
.endif
call make_sound
call display_score
mov cx,10
box01:
mov bx,cx
mov cx,40
b01:
mov v,cx
mov ah,0ch
mov al,bcolor
mov cx,bc111 ;//////
mov dx,br111 ;//////
int 10h

inc bc111    ;////
mov cx,v
loop b01    ;////
mov cx,bx
mov bc111,20 ;/////////
inc br111
loop box01  ;/////
;///box1///
ret
disb1 endp

disb2 proc
;//box2//
inc killme
inc score
.if level == 2
inc score
.endif
.if level == 3
inc score
inc score
.endif
call make_sound
call display_score
mov cx,10
box02:
mov bx,cx
mov cx,40
b02:
mov v,cx
mov ah,0ch
mov al,bcolor
mov cx,bc21 ;//////
mov dx,br21 ;//////
int 10h

inc bc21    ;////
mov cx,v
loop b02    ;////
mov cx,bx
mov bc21,70 ;/////////
inc br21
loop box02  ;/////
;///box1///

ret
disb2 endp

disb3 proc
;//box3//
inc killme
inc score
.if level == 2
inc score
.endif
.if level == 3
inc score
inc score
.endif
call make_sound
call display_score
mov cx,10
box03:
mov bx,cx
mov cx,40
b03:
mov v,cx
mov ah,0ch
mov al,bcolor
mov cx,bc31 ;//////
mov dx,br31 ;//////
int 10h

inc bc31    ;////
mov cx,v
loop b03    ;////
mov cx,bx
mov bc31,120 ;/////////
inc br31
loop box03  ;/////
;///box1///
ret
disb3 endp

disb4 proc
;//box4//
inc killme
inc score
.if level == 2
inc score
.endif
.if level == 3
inc score
inc score
.endif
call make_sound
call display_score
mov cx,10
box04:
mov bx,cx
mov cx,40
b04:
mov v,cx
mov ah,0ch
mov al,bcolor
mov cx,bc41 ;//////
mov dx,br41 ;//////
int 10h

inc bc41    ;////
mov cx,v
loop b04    ;////
mov cx,bx
mov bc41,170 ;/////////
inc br41
loop box04  ;/////
;///box1///
ret
disb4 endp

disb5 proc
;//box5//
inc killme
inc score
.if level == 2
inc score
.endif
.if level == 3
inc score
inc score
.endif
call make_sound
call display_score
mov cx,10
box05:
mov bx,cx
mov cx,25
b05:
mov v,cx
mov ah,0ch
mov al,bcolor
mov cx,bc51 ;//////
mov dx,br51 ;//////
int 10h

inc bc51    ;////
mov cx,v
loop b05    ;////
mov cx,bx
mov bc51,220 ;/////////
inc br51
loop box05  ;/////
;///box1///
ret
disb5 endp

;///////////////////////////////////

disb6 proc
;//box1//
inc killme
inc score
.if level == 2
inc score
.endif
.if level == 3
inc score
inc score
.endif
call make_sound
call display_score
mov cx,10
box06:
mov bx,cx
mov cx,25
b06:
mov v,cx
mov ah,0ch
mov al,bcolor
mov cx,bc61 ;//////
mov dx,br61 ;//////
int 10h

inc bc61    ;////
mov cx,v
loop b06    ;////
mov cx,bx
mov bc61,20 ;/////////
inc br61
loop box06  ;/////
;///box1///
ret
disb6 endp

disb7 proc
;//box2//
inc killme
inc score
.if level == 2
inc score
.endif
.if level == 3
inc score
inc score
.endif
call make_sound
call display_score
mov cx,10
box07:
mov bx,cx
mov cx,40
b07:
mov v,cx
mov ah,0ch
mov al,bcolor
mov cx,bc71 ;//////
mov dx,br71 ;//////
int 10h

inc bc71    ;////
mov cx,v
loop b07    ;////
mov cx,bx
mov bc71,55 ;/////////
inc br71
loop box07  ;/////
;///box1///
ret
disb7 endp

disb8 proc
;//box3//
inc killme
inc score
.if level == 2
inc score
.endif
.if level == 3
inc score
inc score
.endif
call make_sound
call display_score
mov cx,10
box08:
mov bx,cx
mov cx,40
b08:
mov v,cx
mov ah,0ch
mov al,bcolor
mov cx,bc81 ;//////
mov dx,br81 ;//////
int 10h

inc bc81    ;////
mov cx,v
loop b08   ;////
mov cx,bx
mov bc81,105 ;/////////
inc br81
loop box08  ;/////
;///box1///
ret
disb8 endp

disb9 proc
;//box4//
inc killme
inc score
.if level == 2
inc score
.endif
.if level == 3
inc score
inc score
.endif
call make_sound
call display_score
mov cx,10
box09:
mov bx,cx
mov cx,40
b09:
mov v,cx
mov ah,0ch
mov al,bcolor
mov cx,bc91 ;//////
mov dx,br91 ;//////
int 10h

inc bc91    ;////
mov cx,v
loop b09    ;////
mov cx,bx
mov bc91,155 ;/////////
inc br91
loop box09  ;/////
;///box1///
ret
disb9 endp

disb10 proc
;//box5//
inc killme
inc score
.if level == 2
inc score
.endif
.if level == 3
inc score
inc score
.endif
call make_sound
call display_score
mov cx,10
box010:
mov bx,cx
mov cx,40
b010:
mov v,cx
mov ah,0ch
mov al,bcolor
mov cx,bc101 ;//////
mov dx,br101 ;//////
int 10h

inc bc101    ;////
mov cx,v
loop b010    ;////
mov cx,bx
mov bc101,205 ;/////////
inc br101
loop box010  ;/////
;///box1///
ret
disb10 endp

;/////////////////////////////////////////////

disb11 proc
;//box11//
inc killme
inc score
.if level == 2
inc score
.endif
.if level == 3
inc score
inc score
.endif
call make_sound
call display_score
mov cx,10
box011:
mov bx,cx
mov cx,40
b011:
mov v,cx
mov ah,0ch
mov al,bcolor
mov cx,bc1111 ;//////
mov dx,br1111 ;//////
int 10h

inc bc1111    ;////
mov cx,v
loop b011    ;////
mov cx,bx
mov bc1111,20 ;/////////
inc br1111
loop box011  ;/////
;///box1///
ret
disb11 endp

disb12 proc
;//box2//
inc killme
inc score
.if level == 2
inc score
.endif
.if level == 3
inc score
inc score
.endif
call make_sound
call display_score
mov cx,10
box012:
mov bx,cx
mov cx,40
b012:
mov v,cx
mov ah,0ch
mov al,bcolor
mov cx,bc121 ;//////
mov dx,br121 ;//////
int 10h

inc bc121    ;////
mov cx,v
loop b012    ;////
mov cx,bx
mov bc121,70 ;/////////
inc br121
loop box012  ;/////
;///box1///
ret
disb12 endp

disb13 proc
;//box13//
inc killme
inc score
.if level == 2
inc score
.endif
.if level == 3
inc score
inc score
.endif
call make_sound
call display_score
mov cx,10
box013:
mov bx,cx
mov cx,40
b013:
mov v,cx
mov ah,0ch
mov al,bcolor
mov cx,bc131 ;//////
mov dx,br131 ;//////
int 10h

inc bc131    ;////
mov cx,v
loop b013    ;////
mov cx,bx
mov bc131,120 ;/////////
inc br131
loop box013  ;/////
;///box1///
ret
disb13 endp

disb14 proc
;//box4//
inc killme
inc score
.if level == 2
inc score
.endif
.if level == 3
inc score
inc score
.endif
call make_sound
call display_score
mov cx,10
box014:
mov bx,cx
mov cx,40
b014:
mov v,cx
mov ah,0ch
mov al,bcolor
mov cx,bc141 ;//////
mov dx,br141 ;//////
int 10h

inc bc141    ;////
mov cx,v
loop b014    ;////
mov cx,bx
mov bc141,170 ;/////////
inc br141
loop box014  ;/////
;///box1///
ret
disb14 endp

disb15 proc
;//box5//
inc killme
inc score
.if level == 2
inc score
.endif
.if level == 3
inc score
inc score
.endif
call make_sound
call display_score
mov cx,10
box015:
mov bx,cx
mov cx,25
b015:
mov v,cx
mov ah,0ch
mov al,bcolor
mov cx,bc151 ;//////
mov dx,br151 ;//////
int 10h

inc bc151    ;////
mov cx,v
loop b015    ;////
mov cx,bx
mov bc151,220 ;/////////
inc br151
loop box015  ;/////
;///box1///
ret
disb15 endp

;//////////////////////////////////////////

disb16 proc
;//box1//
inc killme
inc score
.if level == 2
inc score
.endif
.if level == 3
inc score
inc score
.endif
call make_sound
call display_score
mov cx,10
box016:
mov bx,cx
mov cx,25
b016:
mov v,cx
mov ah,0ch
mov al,bcolor
mov cx,bc161 ;//////
mov dx,br161 ;//////
int 10h

inc bc161    ;////
mov cx,v
loop b016    ;////
mov cx,bx
mov bc161,20 ;/////////
inc br161
loop box016  ;/////
;///box1///
ret
disb16 endp

disb17 proc
;//box2//
inc killme
inc score
.if level == 2
inc score
.endif
.if level == 3
inc score
inc score
.endif
call make_sound
call display_score
mov cx,10
box017:
mov bx,cx
mov cx,40
b017:
mov v,cx
mov ah,0ch
mov al,bcolor
mov cx,bc171 ;//////
mov dx,br171 ;//////
int 10h

inc bc171    ;////
mov cx,v
loop b017    ;////
mov cx,bx
mov bc171,55 ;/////////
inc br171
loop box017  ;/////
;///box1///
ret
disb17 endp

disb18 proc
;//box3//
inc killme
inc score
.if level == 2
inc score
.endif
.if level == 3
inc score
inc score
.endif
call make_sound
call display_score
mov cx,10
box018:
mov bx,cx
mov cx,40
b018:
mov v,cx
mov ah,0ch
mov al,bcolor
mov cx,bc181 ;//////
mov dx,br181 ;//////
int 10h

inc bc181    ;////
mov cx,v
loop b018    ;////
mov cx,bx
mov bc181,105 ;/////////
inc br181
loop box018  ;/////
;///box1///
ret
disb18 endp

disb19 proc
;//box4//
inc killme
inc score
.if level == 2
inc score
.endif
.if level == 3
inc score
inc score
.endif
call make_sound
call display_score
mov cx,10
box019:
mov bx,cx
mov cx,40
b019:
mov v,cx
mov ah,0ch
mov al,bcolor
mov cx,bc191 ;//////
mov dx,br191 ;//////
int 10h

inc bc191    ;////
mov cx,v
loop b019    ;////
mov cx,bx
mov bc191,155 ;/////////
inc br191
loop box019  ;/////
;///box1///
ret
disb19 endp

disb20 proc
;//box5//
inc killme
inc score
.if level == 2
inc score
.endif
.if level == 3
inc score
inc score
.endif
call make_sound
call display_score
mov cx,10
box020:
mov bx,cx
mov cx,40
b020:
mov v,cx
mov ah,0ch
mov al,bcolor
mov cx,bc201 ;//////
mov dx,br201 ;//////
int 10h

inc bc201    ;////
mov cx,v
loop b020    ;////
mov cx,bx
mov bc201,205 ;/////////
inc br201
loop box020  ;/////
;///box1///
ret
disb20 endp

;------------------------------------------
;NEW BRICKS
;------------------------------------------
disb21 proc
mov br21x,130
inc score
inc score
inc killme
call make_sound
call display_score
;//box21//
mov cx,8
boxx18:
mov bx,cx
mov cx,40
b18x:
mov v,cx
mov ah,0ch
mov al,bcolor
mov cx,bc21x ;//////
mov dx,br21x ;//////
int 10h

inc bc21x    ;////
mov cx,v
loop b18x    ;////
mov cx,bx
mov bc21x,20 ;/////////
inc br21x
loop boxx18  ;/////
;///box21///
ret
disb21 endp


;//box22//
disb22 proc
mov br22,98
inc score
inc score
inc killme
call make_sound
call display_score
mov cx,8
box19x:
mov bx,cx
mov cx,40
b19x:
mov v,cx
mov ah,0ch
mov al,bcolor
mov cx,bc22 ;//////
mov dx,br22 ;//////
int 10h

inc bc22    ;////
mov cx,v
loop b19x    ;////
mov cx,bx
mov bc22,110 ;/////////
inc br22
loop box19x  ;/////
ret
disb22 endp

;///box22///

;//box23//
disb23 proc
mov br23,130
inc score
inc score
inc killme
call make_sound
call display_score
mov cx,8
box20x:
mov bx,cx
mov cx,40
b20x:
mov v,cx
mov ah,0ch
mov al,bcolor
mov cx,bc23 ;//////
mov dx,br23 ;//////
int 10h

inc bc23    ;////
mov cx,v
loop b20x    ;////
mov cx,bx
mov bc23,205 ;/////////
inc br23
loop box20x  ;/////
ret
disb23 endp
;NEW BRICKS
;------------------------------------------

;///box23///
;DISAPEARING BRICKS
;-----------------------------------------------------

;-----------------------------------------------------
;DISAPEARING BRICKS
;-----------------------------------------------------
make_sound proc
        push ax
        push bx
        push cx
        push dx
		
        mov     al, 0B6h        ; Prepare the speaker for the
        out     43h, al         ;  note.
        mov     ax, 400        ; Frequency number (in decimal)
                                ;  for middle C.
        out     42h, al         ; Output low byte.
        mov     al, ah          ; Output high byte.
        out     42h, al 
        in      al, 61h         ; Turn on note (get value from
                                ;  port 61h).
        or      al, 00000011b   ; Set bits 1 and 0.
        out     61h, al         ; Send new value.
        mov     bx, 2          ; Pause for duration of note.
p1:
        mov     cx, 65535
p2:
        dec     cx
        jne     p2
        dec     bx
        jne     p1
        in      al, 61h         ; Turn off note (get value from
                                ;  port 61h).
        and     al, 11111100b   ; Reset bits 1 and 0.
        out     61h, al         ; Send new value.

        pop dx
        pop cx
        pop bx
        pop ax

ret
make_sound endp
;DISAPEARING BRICKS
;-----------------------------------------------------


;-----------------------------------------------------
;DISPLAY SCORE
;-----------------------------------------------------
display_score proc
;setting cursor position
mov dh, 60    ;row for up down
mov dl, 16    ;column for left right
mov ah, 2
int 10h

mov    dx, offset scoreStr
mov    ah,09h
int    21h

;setting cursor position
mov dh, 60    ;row for up down
mov dl, 22    ;column for left right
mov ah, 2
int 10h

mov    dx, offset emptyStr 
mov    ah,09h
int    21h

;setting cursor position
mov dh, 60    ;row for up down
mov dl, 22    ;column for left right
mov ah, 2
int 10h

OUTPUT:
    mov dx, 0
	MOV AX, score
	MOV Bx, 10
	L1:
        mov dx, 0
		CMP Ax, 0
		JE DISP
		DIV Bx
		MOV cx, dx
		PUSH CX
		inc counter
		MOV AH, 0
		JMP L1

DISP:
	CMP counter, 0
	JE EXIT11
	POP DX
	ADD DX, 48
	MOV AH, 02H
	INT 21H
	dec counter
	JMP DISP

EXIT11:

ret
display_score endp
;DISPLAY SCORE
;-----------------------------------------------------

;-----------------------------------------------------
;PLAY GAME FUNCTION
;-----------------------------------------------------
play_game proc
mov ah,0	;video mode
mov al,13h  ;320x200
int 10h
;cursor position
mov dh, 0     ;row (0-24)
mov dl, 0     ;column (0-79)
mov ah, 2
int 10h


.if level == 1
mov killme,0
mov bbcolor,12
mov bcolor,7
mov pcolor,4
mov wcolor,4
;///makebackground///
call makebackground
;///makebackground///

;///movingball///
call movingball
;///movingball///
.endif

.if level == 2
mov bcol,125
mov brow,193
mov killme,0
mov bbcolor,2
mov bcolor,0
mov pcolor,2
mov wcolor,2

mov bc1,20
mov br1,20

mov bc2,70
mov br2,20

mov bc3,120
mov br3,20

mov bc4,170
mov br4,20

mov bc5,220
mov br5,20

mov bc6,20
mov br6,40

mov bc7,55
mov br7,40

mov bc8,105
mov br8,40

mov bc9,155
mov br9,40

mov bc10,205
mov br10,40
;////////////////////////
mov bc11,20
mov br11,60

mov bc12,70
mov br12,60

mov bc13,120
mov br13,60

mov bc14,170
mov br14,60

mov bc15,220
mov br15,60

mov bc16,20
mov br16,80

mov bc17,55
mov br17,80

mov bc18,105
mov br18,80

mov bc19,155
mov br19,80

mov bc20,205
mov br20,80

;NEW BRICKS
mov bc21x, 20
mov br21x ,130

mov bc22 ,110
mov br22, 98

mov bc23, 205
mov br23,130

mov noc21,24
mov nor21,134

mov noc22, 114
mov nor22 ,102

mov noc23, 209
mov nor23 ,134
;NEW BRICKS



;DISAPEARBRICKS------------//
mov bc111 , 20
mov br111 ,20

mov bc21,70
mov br21 ,20

mov bc31 ,120
mov br31 , 20

mov bc41 ,170
mov br41 ,20

mov bc51 , 220 ;//
mov br51 ,20
;////////////
mov bc61 , 20
mov br61 ,40

mov bc71 ,55
mov br71 ,40

mov bc81 , 105
mov br81 , 40

mov bc91 ,155
mov br91 ,40

mov bc101 , 205
mov br101 ,40

;/////////////

mov bc1111 , 20
mov br1111 ,60

mov bc121 ,70
mov br121 ,60

mov bc131 ,120
mov br131 , 60

mov bc141 ,170
mov br141 , 60

mov bc151, 220 ;//
mov br151 ,60
;////////////
mov bc161 ,20
mov br161 ,80

mov bc171 ,55
mov br171,80

mov bc181 ,105
mov br181 ,80

mov bc191 ,155
mov br191 ,80

mov bc201 ,205
mov br201 , 80

;NEW BRICKS
mov bc210 ,20
mov br210 ,130

mov bc220, 110
mov br220 ,98

mov bc230 ,205
mov br230 ,130

;DISAPEARBRICKS------------//

;///makebackground///
call makebackground
;///makebackground///

;///movingball///
call movingball
;///movingball///
.endif

.if level == 3
mov bcol,125
mov brow,193
mov killme,0
mov bbcolor,4
mov bcolor,0
mov pcolor,15
mov wcolor,15

mov bc1,20
mov br1,20

mov bc2,70
mov br2,20

mov bc3,120
mov br3,20

mov bc4,170
mov br4,20

mov bc5,220
mov br5,20

mov bc6,20
mov br6,40

mov bc7,55
mov br7,40

mov bc8,105
mov br8,40

mov bc9,155
mov br9,40

mov bc10,205
mov br10,40
;////////////////////////
mov bc11,20
mov br11,60

mov bc12,70
mov br12,60

mov bc13,120
mov br13,60

mov bc14,170
mov br14,60

mov bc15,220
mov br15,60

mov bc16,20
mov br16,80

mov bc17,55
mov br17,80

mov bc18,105
mov br18,80

mov bc19,155
mov br19,80

mov bc20,205
mov br20,80

;NEW BRICKS
mov bc21x, 20
mov br21x ,130

mov bc22 ,110
mov br22, 98

mov bc23, 205
mov br23,130

mov noc21,24
mov nor21,134

mov noc22, 114
mov nor22 ,102

mov noc23, 209
mov nor23 ,134
;NEW BRICKS



;DISAPEARBRICKS------------//
mov bc111 , 20
mov br111 ,20

mov bc21,70
mov br21 ,20

mov bc31 ,120
mov br31 , 20

mov bc41 ,170
mov br41 ,20

mov bc51 , 220 ;//
mov br51 ,20
;////////////
mov bc61 , 20
mov br61 ,40

mov bc71 ,55
mov br71 ,40

mov bc81 , 105
mov br81 , 40

mov bc91 ,155
mov br91 ,40

mov bc101 , 205
mov br101 ,40

;/////////////

mov bc1111 , 20
mov br1111 ,60

mov bc121 ,70
mov br121 ,60

mov bc131 ,120
mov br131 , 60

mov bc141 ,170
mov br141 , 60

mov bc151, 220 ;//
mov br151 ,60
;////////////
mov bc161 ,20
mov br161 ,80

mov bc171 ,55
mov br171,80

mov bc181 ,105
mov br181 ,80

mov bc191 ,155
mov br191 ,80

mov bc201 ,205
mov br201 , 80

;NEW BRICKS
mov bc210,20
mov br210,130

mov bc220, 110
mov br220, 98

mov bc230 ,205
mov br230 ,130

;DISAPEARBRICKS------------//


;///makebackground///
call makebackground
;///makebackground///

;///movingball///
call movingball
;///movingball///
.endif


mov ah,4ch
int 21h

ret
play_game endp
;PLAY GAME FUNCTION
;-----------------------------------------------------


;-----------------------------------------------------
;YOU LOOSER :(
;-----------------------------------------------------
You_Lose Proc
call AddToFile

mov ah, 0
mov al, 13h    ;200x320(RxC)
int 10h

mov dh, 184   ;row for up down
mov dl, 120  ;column for left right
mov ah, 2
int 10h

mov    dx, offset loseStr
mov    ah,09h
int    21h

mov dh, 189   ;row for up down
mov dl, 112  ;column for left right
mov ah, 2
int 10h

mov    dx, offset HighScrStr
mov    ah,09h
int    21h

;setting cursor position
mov dh, 189    ;row for up down
mov dl, 128    ;column for left right
mov ah, 2
int 10h

OUTPUT1:
    mov dx, 0
	MOV AX, score
	MOV Bx, 10
	L1:
        mov dx, 0
		CMP Ax, 0
		JE DISP1
		DIV Bx
		MOV cx, dx
		PUSH CX
		inc counter
		MOV AH, 0
		JMP L1

DISP1:
	CMP counter, 0
	JE EXIT112
	POP DX
	ADD DX, 48
	MOV AH, 02H
	INT 21H
	dec counter
	JMP DISP1

EXIT112:

mov dh, 194   ;row for up down
mov dl, 113  ;column for left right
mov ah, 2
int 10h

mov    dx, offset LuckStr 
mov    ah,09h
int    21h

mov dh, 199  ;row for up down
mov dl, 108  ;column for left right
mov ah, 2
int 10h

mov    dx, offset ins9
mov    ah,09h
int    21h

mov bl,0100b ;for red color
mov row3,34
mov col,110
call Draw_Lines

mov bl,1110b ;for yellow color
mov row3,75
mov col,115
call Draw_Lines

mov bl,0010b ;for green color
mov row3,115
mov col,155
call Draw_Lines

loop7:
mov ah,1
int 16h
jnz whichKey4
jz loop7

whichKey4:
mov ah,0  ;for input
int 16h
cmp al,27
je exit10 ;if esc pressed
jmp loop7

exit10:
call reset
mov ah, 0
mov al, 13h    ;200x320(RxC)
int 10h
call front_page  ;make all variables zero first

ret
You_Lose endp

;YOU LOOSER :(
;-----------------------------------------------------

display_level1 proc
;setting cursor position
mov dh, 70    ;row for up down
mov dl, 16    ;column for left right
mov ah, 2
int 10h

mov    dx, offset lvl1str
mov    ah,09h
int    21h
ret
display_level1 endp

display_level2 proc
;setting cursor position
mov dh, 70    ;row for up down
mov dl, 16    ;column for left right
mov ah, 2
int 10h

mov    dx, offset lvl2str
mov    ah,09h
int    21h
ret
display_level2 endp

display_level3 proc
;setting cursor position
mov dh, 70    ;row for up down
mov dl, 16    ;column for left right
mov ah, 2
int 10h

mov    dx, offset lvl3str
mov    ah,09h
int    21h
ret
display_level3 endp


;-----------------------------------------------------
;YOU WINNER :)
;-----------------------------------------------------
You_Win PROC
call AddToFile

mov ah, 0
mov al, 13h    ;200x320(RxC)
int 10h

mov dh, 182   ;row for up down
mov dl, 116  ;column for left right
mov ah, 2
int 10h

mov    dx, offset WinStr2
mov    ah,09h
int    21h

mov dh, 188   ;row for up down
mov dl, 110  ;column for left right
mov ah, 2
int 10h

mov    dx, offset WinStr
mov    ah,09h
int    21h

mov dh, 193   ;row for up down
mov dl, 114  ;column for left right
mov ah, 2
int 10h

mov    dx, offset HcAdded
mov    ah,09h
int    21h

mov dh, 199  ;row for up down
mov dl, 108  ;column for left right
mov ah, 2
int 10h

mov    dx, offset ins9
mov    ah,09h
int    21h

mov bl,0100b ;for red color
mov row3,18
mov col,110
call Draw_Lines

mov bl,0010b ;for green color
mov row3,68
mov col,170
call Draw_Lines

mov bl,1110b ;for yellow color
mov row3,108
mov col,82
call Draw_Lines

loop8:
mov ah,1
int 16h
jnz whichKey5
jz loop8

whichKey5:
mov ah,0  ;for input
int 16h
cmp al,27
je exit11 ;if esc pressed
jmp loop8

exit11:
call reset
mov ah, 0
mov al, 13h    ;200x320(RxC)
int 10h
call front_page

ret
You_Win endp
;YOU WINNER :)
;-----------------------------------------------------

level_2 PROC
mov ah,0	;video mode
mov al,13h  ;320x200
int 10h
;cursor position
mov dh, 0     ;row (0-24)
mov dl, 0     ;column (0-79)
mov ah, 2
int 10h

mov level,2

mov killme,0
mov bbcolor,2
mov bcolor,0
mov pcolor,2
mov wcolor,2
;///makebackground///
call makebackground
;///makebackground///

;///movingball///
call movingball
;///movingball///
ret
level_2 endp

level_3 PROC

mov ah,0	;video mode
mov al,13h  ;320x200
int 10h
;cursor position
mov dh, 0     ;row (0-24)
mov dl, 0     ;column (0-79)
mov ah, 2
int 10h

mov level,3

mov killme,0
mov bbcolor,4
mov bcolor,0
mov pcolor,15
mov wcolor,15
;///makebackground///
call makebackground
;///makebackground///

;///movingball///
call movingball
;///movingball///
ret
level_3 endp

reset Proc
;saim code inserted below
;LEVELSCOPE
mov score, 0
mov counter , 0

;makebackground------------//
mov r , 10
;makebackground------------//

;HEARTLIVES----------------//
mov hcol , 255
mov liv , 4
;HEARTLIVES----------------//

mov bc1 , 20
mov br1 , 20

mov bc2 , 70
mov br2 , 20

mov bc3 , 120
mov br3 , 20
;----------
mov fcc3 , 120
mov fcr3 , 140
mov fc3 , 122
mov fr3 , 142
;----------

mov bc4 , 170
mov br4 , 20

mov bc5 , 220 ;//
mov br5 , 20
;////////////
mov bc6 , 20
mov br6 , 40

mov bc7 , 55
mov br7, 40

mov bc8 , 105
mov br8 , 40

mov bc9 , 155
mov br9 , 40

mov bc10 , 205
mov br10 , 40



;/////////////

mov bc11 , 20
mov br11 , 60

mov bc12 , 70
mov br12 , 60

mov bc13 , 120
mov br13 , 60

mov bc14 , 170
mov br14 , 60

mov bc15 , 220 ;//
mov br15 , 60
;////////////
mov bc16 , 20
mov br16 , 80

mov bc17 , 55
mov br17 , 80

mov bc18 , 105
mov br18 , 80

mov bc19 , 155
mov br19 , 80

mov bc20 , 205
mov br20 , 80
;BRICKS--------------------//

;DISAPEARBRICKS------------//
mov bc111 , 20
mov br111 , 20

mov bc21 , 70
mov br21 , 20

mov bc31 , 120
mov br31 , 20

mov bc41 , 170
mov br41 , 20

mov bc51 , 220 ;//
mov br51 , 20
;////////////
mov bc61 , 20
mov br61 , 40

mov bc71 , 55
mov br71 , 40

mov bc81 , 105
mov br81 , 40

mov bc91 , 155
mov br91 , 40

mov bc101 , 205
mov br101 , 40

;/////////////

mov bc1111 , 20
mov br1111 , 60

mov bc121 , 70
mov br121 , 60

mov bc131 , 120
mov br131 , 60

mov bc141 , 170
mov br141 , 60

mov bc151 , 220 ;//
mov br151 , 60
;////////////
mov bc161 , 20
mov br161 , 80

mov bc171 , 55
mov br171 , 80

mov bc181 , 105
mov br181 , 80

mov bc191 , 155
mov br191 , 80

mov bc201 , 205
mov br201 , 80
;DISAPEARBRICKS------------//


;--------------//

;paddle--------//
mov pcol , 120
mov prow , 195
;--------------//

;ball-----------//
mov bcol , 125
mov brow , 194
mov delaytime , 1
;--------------//

;LEVEL VARIABLES------------//
mov level , 1
mov killme , 0
mov bcolor , 7
mov wcolor , 4
mov pcolor , 4
mov bbcolor , 12

;LEVEL VARIABLES------------//

;DOUBLE HIT ---------------//
mov rip20 , 1
mov rip19 , 1
mov rip18 , 1
mov rip17 , 1
mov rip16 , 1
mov rip15 , 1
mov rip14 , 1
mov rip13 , 1
mov rip12 , 1
mov rip11 , 1
mov rip10 , 1
mov rip9 , 1
mov rip8 , 1
mov rip7 , 1
mov rip6 , 1
mov rip5 , 1
mov rip4 , 1
mov rip3 , 1
mov rip2 , 1
mov rip1 , 1

mov rip21 , 1
mov rip22 , 1
mov rip23 , 1

;random hit
mov dumdum , 1

ret
reset endp

ToString proc 
 mov ax,score
 mov si,offset score2
 mov  bx, 10  ; 
  mov  cx, 0   ;
loop15:       
  mov  dx, 0   
  div  bx     
  push dx      
  inc  cx      
  cmp  ax, 0   
  jne  loop15

loop20:  
  pop  dx        
  add  dl, 48  
  mov  [ si ], dl
  inc  si
  loop loop20  

  ret
ToString endp

AddToFile PROC

    mov ah, 3DH
    mov al, 2
    mov dx, offset FNAME
    int 21h
    mov handler_file, ax

    mov ah, 3FH
    mov cx, 25
    mov dx, offset buffer
    mov bx, handler_file
    int 21h

    mov dx, offset buffer
    mov ah, 9h
    int 21h

    mov cx,0
    mov dx, 0
    mov ah,42h
    mov al,2
    int 21h

    mov ah, 40H
    mov bx, handler_file
    mov cx, 6
    mov dx, offset n1
    int 21h

    mov ah, 40H
    mov bx, handler_file
    mov cx, 3
    mov dx, offset sp1
    int 21h

    call ToString

    mov ah, 40H
    mov bx, handler_file
    mov cx, 2
    mov dx, offset score2
    int 21h

    mov ah, 40H
    mov bx, handler_file
    mov cx, 1
    mov dx, offset sp2
    int 21h

    mov ah, 3Eh
    mov bx, handler_file
    int 21h
ret
AddToFile Endp

end