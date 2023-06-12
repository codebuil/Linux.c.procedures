bits 32
org 101000h
mov eax,21cd4cffh
mov al,1
call back
mov eax,0
mov ebx,0
mov ecx,319
mov edx,199
mov esi,15
fors:
	call rects
	add eax,10
	add ebx,10
	sub ecx,10
	sub edx,10
	cmp eax,100
	jb fors
ret
ret
ret
fill32:
	push eax
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ds
	push es
cmp ecx,0
jz fill322
fill321:
	ds
	mov [edi],al
	inc edi
	dec ecx
	jnz fill321
fill322:
pop es
pop ds
pop edi
pop esi
pop edx
pop ecx
pop ebx
pop eax

ret
hline:
	push eax
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ds
	push es
	cmp ax,0
	jg hline1
	mov ax,0
hline1:
	cmp bx,0
	jg hline2
	mov bx,0
hline2:
	cmp cx,0
	jg hline3
	mov cx,0
hline3:
	cmp ax,320
	jb hline4
	mov ax,319
hline4:
	cmp bx,200
	jb hline5
	mov bx,199
hline5:
	cmp cx,320
	jb hline6
	mov cx,319
hline6:
	cmp ax,cx
	jb hline7
	push ax	
	mov ax,cx
	pop cx
hline7:
	sub cx,ax
	push dx
	push cx
	push ax
	mov eax,0
	mov ax,bx
	mov ebx,320
	mov ecx,0
	mov edx,0
	clc
	mul ebx
	mov ebx,0a0000h
	clc
	add eax,ebx
	mov ebx,0	
	pop bx
	clc
	add eax,ebx
	mov edi,eax
	mov ax,0
	mov ds,ax
	pop cx
	pop ax
	inc cx
hline8:
	ds
	mov [edi],al
	inc edi
	dec cx
	jnz hline8

pop es
pop ds
pop edi
pop esi
pop edx
pop ecx
pop ebx
pop eax
ret
ret
ret
vline:
	push eax
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ds
	push es
	cmp ax,0
	jg vline1
	mov ax,0
vline1:
	cmp bx,0
	jg vline2
	mov bx,0
vline2:
	cmp cx,0
	jg vline3
	mov cx,0
vline3:
	cmp ax,320
	jb vline4
	mov ax,319
vline4:
	cmp bx,200
	jb vline5
	mov bx,199
vline5:
	cmp cx,200
	jb vline6
	mov cx,199
vline6:
	cmp bx,cx
	jb vline7
	push bx	
	mov bx,cx
	pop bx
vline7:
	sub cx,bx
	push dx
	push cx
	push ax
	mov eax,0
	mov ax,bx
	mov ebx,320
	mov ecx,0
	mov edx,0
	clc
	mul ebx
	mov ebx,0a0000h
	clc
	add eax,ebx
	mov ebx,0
	pop bx
	add eax,ebx
	mov edi,eax
	mov ax,0
	mov ds,ax
	pop cx
	pop ax
	inc cx
vline8:
	ds
	mov [edi],al
	add edi,320
	dec cx
	jnz vline8

pop es
pop ds
pop edi
pop esi
pop edx
pop ecx
pop ebx
pop eax
ret
ret
ret
back:
	push eax
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ds
	push es

mov edi,0a0000h
mov ecx,60000
call fill32
pop es
pop ds
pop edi
pop esi
pop edx
pop ecx
pop ebx
pop eax
ret
rects:
	push eax
	push ebx
	push ecx
	push edx
	push esi
	push edi
	push ebp	
	push ds
	push es
	mov edi,xxx
	ds
	mov [edi],eax
	mov edi,yyy
	ds
	mov [edi],ebx
	mov edi,xxx1
	ds
	mov [edi],ecx
	mov edi,yyy1
	ds
	mov [edi],edx
	mov edi,colors
	ds
	mov [edi],esi
	mov edx,esi
	call hline
	mov edi,yyy1
	ds
	mov ecx,[edi]
	call vline
	mov edi,yyy1
	ds
	mov ebx,[edi]
	mov edi,xxx1
	ds
	mov ecx,[edi]
	call hline

	mov edi,yyy
	ds
	mov ebx,[edi]
	mov edi,xxx1
	ds
	mov eax,[edi]
	mov edi,yyy1
	ds
	mov ecx,[edi]
	call vline

pop es
pop ds
pop ebp
pop edi
pop esi
pop edx
pop ecx
pop ebx
pop eax
ret

xxx dd 0
yyy dd 0
xxx1 dd 0
yyy1 dd 0
colors dd 0






