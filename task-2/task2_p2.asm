        section .text
        global par

;; int par(int str_length, char* str)

; check for balanced brackets in an expression

par:
        ;; Se obtin elementele de pe stiva
        pop ecx
        pop eax
        pop ebx
        push ebx
        push eax
        push ecx
        ;; 'Ecx' retine numarul de paranteze '('
        push 0
        pop ecx
        ;; Cu 'edx' se parcurge vectorul
        push 0
        pop edi
iterate_string:
        cmp byte [ebx+edi], '('
        ;; Daca elementul reprezinta o paranteza deschisa
        je open_paranth
        jmp close_paranth
open_paranth:
        ;; Se incrementeaza numarul de paranteze deschise
        inc ecx
        inc edi
        ;; Se verifica daca s-a parcurs tot sirul
        cmp edi, eax
        je decision
        jmp iterate_string
close_paranth:
        ;; Daca elementul curent reprezinta acest caracter ')'
        ;; Se decrementeaza numarul de paranteze deschise
        dec ecx
        inc edi
        ;; Daca sunt mai multe paranteze inchise decat deschise
        test ecx, ecx
        ;; Sirul nu este corect
        jl false
        ;; Se verifica daca s-a parcurs tot sirul
        cmp edi, eax
        je decision
        jmp iterate_string
decision:
        ;; Daca sunt mai multe paranteze deschise decat inchise
        test ecx, ecx
        jg false
        ;; Daca sirul este corect
        ;; 'Eax' retine valoarea 1
        push 1
        pop eax
        jmp exit
false:
        ;; Daca sirul nu este corect
        ;; 'Eax' retine valoarea 0
        push 0
        pop eax
exit:
        ret
