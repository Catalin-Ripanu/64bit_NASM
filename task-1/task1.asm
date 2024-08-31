        section .text
        global sort

; struct node {
; int val;
; struct node* next;
; };

; ; struct node* sort(int n, struct node* node);
; The function will link the nodes in the array
; in ascending order and will return the address
; of the new found head of the list
; @params:
; n -> the number of nodes in the array
; node -> a pointer to the beginning in the array
; @returns:
; the address of the head of the sorted list

sort:
    enter 0, 0
        ;; Se obtin argumentele functiei
        push ebx
        push esi
        push edi
        mov ecx, [ebp+8]
        mov esi, [ebp+12]
	    ;; Cazul in care vectorul are doar un element
        cmp ecx, 1
        je special_case
	    ;; Se parcurg elementele vectorului
        xor ebx, ebx
	    ;; Se cauta numerele de la 1 la n
	    ;; Primul element cautat este 1
        mov edi, 1
iterate_vector:
        mov edx, [esi+8*ebx]
		;; Daca numarul a fost gasit
        cmp edx, edi
        je found_value
		;; Daca nu a fost gasit,cautarea continua
        inc ebx
        jmp iterate_vector
found_value:
		;; Se retine adresa elementului (aceasta adresa salvata va fi folosita mai tarziu)
        lea eax, [esi+8*ebx]
		;; Cazul in care elementul gasit este 1 (caz initial)
        cmp edx, 1
        jg take_value
continue_calc:
		;; 'Edi' pastreaza urmatorul numar ce trebuie gasit
        inc edi
        xor ebx, ebx
		;; Daca au fost cautate toate numerele
        cmp edi, ecx
		;; Algoritmul se termina
        jg finish
		;; Salveaza pe stiva adresa elementului anterior
        push eax
        jmp iterate_vector
take_value:
		;; Se elimina de pe stiva adresa elementului anterior
        pop ebx
		;; Cazul initial (campul 'next' al lui 1 va reprezenta adresa lui 2 la urmatoarea iteratie)
        cmp dword [ebx], 1
        je save_node
continue_action:
		;; Se stocheaza in campul 'next' adresa elementului urmator
        mov [ebx+4], eax
        jmp continue_calc
save_node:
		;; Se salveaza adresa ce reprezinta capul listei ('eax' va pastra acest cap)
        push ebx
        jmp continue_action
finish:
		;; Se pune in eax capul listei inlantuite
        pop eax
        jmp exit
special_case:
		;; Se trateaza situatia in care vectorul are un element
        mov eax, esi
exit:
        pop edi
        pop esi
        pop ebx
        leave
        ret
