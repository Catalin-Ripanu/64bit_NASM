        section .text
        global expression
        global term
        global factor
        extern strtol

; `factor(char *p, int *i)`
;       Evaluates "(expression)" or "number" expressions 
; @params:
;	p -> the string to be parsed
;	i -> current position in the string
; @returns:
;	the result of the parsed expression

        ;; Functia care evalueaza expresii de forma: (expresie)/numar
factor:

        push ebp
        mov ebp, esp
        push ebx
        push esi
        push edi
        ;; Se obtin argumentele
        mov edi,[ebp+8]
        mov esi,[ebp+12]
        mov edx,edi
        add edx,[esi]
        ;; Se verifica daca expresia este de forma '(expresie)'
        movzx edx,byte [edx]
        ;; Daca expresia contine '('
        cmp dl,'('
        jne no_paranth
        ;; Se incrementeaza pozitia curenta 'i'
        ;; Semnificatia celor 3 instructiuni de mai jos este: (*i)++ (in C)
        mov eax,[esi]
        lea eax,[eax+1]
        mov [esi],eax
        ;; Se apeleaza functia 'expression' (recursivitate mutuala)
        ;; Se doreste evaluarea expresiei fara '(' (de aceea se incrementeaza acel 'i')
        push esi
        push edi
        call expression
        add esp,8
        ;; Se pune pe stiva rezultatul obtinut
        push eax
        ;; Se incrementeaza pozitia curenta 'i'
        mov eax,[esi]
        lea eax,[eax+1]
        mov [esi],eax
        ;; Se recupereaza valoarea
        pop eax
        jmp exit
        ;; Cazul in care expresia este de forma: 'numar'
no_paranth:
        ;; 'Edx' retine valoarea p+*i
        mov edx,[esi]
        add edx,edi
        ;; In 'eax' se pastreaza adresa unui 'char*' local
        lea eax,[ebp-4]
        ;; Se foloseste 'strtol' pentru a putea extrage numere ce au mai mult de o cifra
        push 10
        push eax
        push edx
        call strtol
        add esp,12
        ;; Se salveaza rezultatul functiei
        push eax
        ;; Aceste instructiuni schimba pozitia curenta 'i' in mod corespunzator
        ;; (*i)+=[ebp-4]-(p+*i) (in C)
        ;; '*i' va retine caracterul ce se afla dupa numarul de mai multe cifre intalnit
        ;; Exemplu: "456)" -> *i este ')'
        mov ecx,[esi]
        mov edx,[ebp-4]
        mov ebx,edi
        add ebx,[esi]
        ;; 'Edx' retine rezultatul operatiei: [ebp-4]-(p+*i)
        sub edx,ebx
        ;; 'Eax' se ocupa cu incrementarea variabilei 'i'
        lea eax,[ecx+edx]
        ;; Se modifica pozitia
        mov [esi],eax
        pop eax
exit:
        ;; Se recupereaza valorile de pe stiva
        pop edi
        pop esi
        pop ebx
        leave
        ret

        ;; Functia care evalueaza expresii de forma: factor * factor sau factor / factor
term:
        push ebp
        mov ebp,esp
        push esi
        push edi
        push ebx
        ;; Se obtin argumentele
        mov edi,[ebp+8]
        mov esi,[ebp+12]
        ;; Se apeleaza functia 'factor' (recursivitate mutuala)
        push esi
        push edi
        call factor
        add esp,8
        ;; Se retine rezultatul pe stiva
        push eax
        ;; O bucla care se ocupa de prelucrarea expresiei
evaluate_term:
        ;; Se obtine un caracter de pe pozitia 'i'
        mov eax,edi
        add eax,[esi]
        movzx edx,byte [eax]
        ;; Daca simbolul reprezinta semnul impartirii
        cmp dl,'/'
        je do_calc
        ;; Daca simbolul reprezinta semnul inmultirii
        cmp dl,'*'
        je do_calc
        ;; Cazul in care simbolul nu este '*' sau '/'
        pop eax
        jmp exit_term
do_calc:
        ;; Se incrementeaza pozitia curenta 'i'
        mov eax,[esi]
        lea eax,[eax+1]
        mov [esi],eax
        ;; Se salveaza valoarea din 'edx'
        push edx
        push esi
        push edi
        ;; Se apeleaza functia 'factor' (recursivitate mutuala)
        call factor
        add esp,8
        ;; Se recupereaza valoarea salvata
        pop edx
        ;; Se efectueaza impartirea daca simbolul intalnit este '/'
        mov ebx,eax
        cmp dl,'/'
        jne do_multipl
        pop eax
        ;; Impartire cu semn
        cdq
        idiv ebx
        push eax
        jmp evaluate_term
do_multipl:
        pop eax
        ;; Se efectueaza inmultirea daca simbolul intalnit este '*'
        ;; Inmultire cu semn
        imul eax,ebx
        push eax
        jmp evaluate_term
exit_term:
        ;; Se recupereaza valorile de pe stiva
        pop ebx
        pop edi
        pop esi
        leave
        ret

; `expression(char *p, int *i)`
;       Evaluates "term" + "term" or "term" - "term" expressions 
; @params:
;	p -> the string to be parsed
;	i -> current position in the string
; @returns:
;	the result of the parsed expression

        ;; Functia care evalueaza expresii de forma: term + term sau term - term

expression:
        push ebp
        mov ebp, esp
        push edi
        push esi
        push ebx
        ;; Se obtin argumentele
        mov edi,[ebp+8]
        mov esi,[ebp+12]
        ;; Se apeleaza functia 'term' (recursivitate mutuala)
        push esi
        push edi
        call term
        add esp,8
        ;; Se retine rezultatul pe stiva
        push eax
        ;; O bucla care se ocupa de prelucrarea expresiei
evaluate_expr:
        ;; Se obtine un caracter de pe pozitia 'i'
        mov eax,edi
        add eax,[esi]
        movzx edx,byte [eax]
        ;; Daca simbolul reprezinta semnul scaderii
        cmp dl, '-'
        je continue_calc
        ;; Daca simbolul reprezinta semnul adunarii
        cmp dl, '+'
        je continue_calc
        ;; Cazul in care simbolul nu este '+' sau '-'
        pop eax
        jmp exit_expr
continue_calc:
        ;; Se incrementeaza pozitia curenta 'i'
        mov eax,[esi]
        lea eax,[eax+1]
        mov [esi],eax
        ;; Se salveaza valoarea din 'edx'
        push edx
        push esi
        push edi
        ;; Se apeleaza functia 'term' (recursivitate mutuala)
        call term
        add esp,8
        ;; Se recupereaza valoarea salvata
        pop edx
        ;; Se efectueaza scaderea daca simbolul intalnit este '-'
        mov ebx,eax
        cmp dl, '-'
        jne do_add
        mov eax,ebx
        pop ecx
        ;; Operatia de scadere
        sub ecx, eax
        push ecx
        jmp evaluate_expr
do_add:
        mov eax,ebx
        ;; Se obtine valoarea salvata
        pop ecx
        ;; Se efectueaza adunarea daca simbolul intalnit este '+'
        ;; Operatia de adunare
        add ecx,eax
        push ecx
        jmp evaluate_expr
exit_expr:
        ;; Se recupereaza valorile de pe stiva
        pop ebx
        pop esi
        pop edi
        leave
        ret