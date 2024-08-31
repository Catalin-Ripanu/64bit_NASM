        global get_words
        global compare_func
        global sort

        ;; Delimitatorii de cuvinte
        section .data
delim:
        db " , .", 10, 0

        section .text
        extern strtok
        extern qsort
        extern strcmp
        extern strlen

        ;; Functia care compara 2 elemente
        ;; Reprezinta primul argument al functiei qsort
cmprstr:

        push ebp
        mov ebp, esp
        push ebx
        push edi
        push esi
        ;; Se obtin argumentele
        mov esi, [ebp+8]
        mov esi, [esi]
        mov edi, [ebp+12]
        mov edi, [edi]
        ;; Se calculeaza lungimea argumentului 1
        push esi
        call strlen
        add esp, 4
        mov ebx, eax
        ;; Se calculeaza lungimea argumentului 2
        push edi
        call strlen
        add esp, 4
        cmp ebx, eax
        jl test_lower
        je test_eq
        ;; Daca lungimea argumentului 1 este mai mare decat lungimea argumentului 2
        ;; Functia returneaza 1
        mov eax, 1
        jmp exit
test_lower:
        ;; Daca lungimea argumentului 2 este mai mare decat lungimea argumentului 1
        ;; Functia returneaza -1
        mov eax, -1
        jmp exit
test_eq:
        ;; Daca lungimile sunt egale
        push edi
        push esi
        ;; 'Eax' retine valoarea returnata de 'strcmp'
        call strcmp
        add esp, 8
exit:
        pop esi
        pop edi
        pop ebx
        leave
        ret

; ; sort(char **words, int number_of_words, int size)
; functia va trebui sa apeleze qsort pentru soratrea cuvintelor
; dupa lungime si apoi lexicografix

        ;; Functia care sorteaza cuvintele lexicografic/dupa lungime
sort:
        enter 0, 0
        push ebx
        push edi
        ;; Se obtin argumentele
        mov ebx, [ebp+8]
        mov edi, [ebp+12]
        mov ecx, [ebp+16]
        ;; Se apeleaza functia 'qsort'
        push cmprstr
        push ecx
        push edi
        push ebx
        call qsort
        add esp, 16
        pop edi
        pop ebx
        leave
        ret

; ; get_words(char *s, char **words, int number_of_words)
; separa stringul s in cuvinte si salveaza cuvintele in words
; number_of_words reprezinta numarul de cuvinte

        ;; Functia care obtine cuvintele din sirul dat ca parametru

get_words:
        enter 0, 0
        push ebx
        push edi
        push esi
        ;; Se obtin argumentele
        mov ecx, [ebp+8]
        mov ebx, [ebp+12]
        mov edi, [ebp+16]
        ;; Se apeleaza functia 'strtok' pentru a obtine cuvintele
        push delim
        push ecx
        call strtok
        add esp, 8
        ;; Se obtine primul cuvant
        mov [ebx], eax
        dec edi
        mov esi, 1
get_strings:
        push delim
        push 0
        call strtok
        add esp, 8
        ;; In 'ebx' se vor stoca toate cuvintele din sirul dat ca parametru
        mov [ebx+4*esi], eax
        inc esi
        ;; Se verifica daca mai sunt cuvinte de obtinut
        cmp esi, edi
        jle get_strings
        pop esi
        pop edi
        pop ebx
        leave
        ret
