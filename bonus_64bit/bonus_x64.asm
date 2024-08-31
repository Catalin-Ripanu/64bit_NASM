        section .text
        global intertwine

; ; void intertwine(int *v1, int n1, int *v2, int n2, int *v);

; Take the 2 arrays, v1 and v2 with varying lengths, n1 and n2,
; and intertwine them
; The resulting array is stored in v

intertwine:
        enter 0, 0
        ;; Se obtin argumentele functiei
        ;; Vectorul v1
        mov [rbp-32], rdi
        ;; Numarul n1
        mov [rbp-40], rsi
        ;; Vectorul v2
        mov [rbp-48], rdx
        ;; Numarul n2
        mov [rbp-56], rcx
        ;; Vectorul v
        mov [rbp-64], r8
        ;; Variabile locale ce itereaza printr-un vector (i,j,k)
        ;; '[rbp-8]' reprezinta 'i'
        ;; '[rbp-16]' reprezinta 'j'
        ;; '[rbp-24]' reprezinta 'k'
        mov dword [rbp-8], 0
        mov dword [rbp-16], 0
        mov dword [rbp-24], 0
        ;; Se verifica aceste conditii: i<n1 si j<n2
        jmp do_calc
create_vector:
        ;; Se obtine valoarea lui 'i'
        mov eax, [rbp-8]
        lea rdx, [rax*4]
        ;; Se pune in 'rax' vectorul v1
        mov rax, [rbp-32]
        ;; 'Rax' retine adresa v1+i 
        add rax,rdx
        ;; Se obtine valoarea lui 'k'
        mov edx, [rbp-24]
        movsx rdx, edx
        lea rcx, [edx*4]
        ;; Se pune in 'rdx' vectorul v
        mov rdx, [rbp-64]
        ;; 'Rdx' retine adresa v+k
        add rdx, rcx
        ;; Cele 2 instructiuni au aceasta semnificatie: v[k]=v1[i]
        mov eax, [rax]
        mov [rdx], eax
        ;; Se incrementeaza variabilele 'i' si 'k'
        inc dword [rbp-24]
        inc dword [rbp-8]
        ;; Se obtine valoarea lui 'j'
        mov eax, [rbp-16]
        lea rdx, [rax*4]
        ;; Se pune in 'rax' vectorul v2
        mov rax, [rbp-48]
        ;; 'Rax' retine adresa v2+j 
        add rax, rdx
        ;; Se obtine valoarea lui 'k'
        mov edx, [rbp-24]
        movsx rdx, edx
        lea rcx, [edx*4]
        ;; Se pune in 'rdx' vectorul v
        mov rdx, [rbp-64]
        ;; 'Rdx' retine adresa v+k
        add rdx, rcx
        ;; Cele 2 instructiuni au aceasta semnificatie: v[k]=v2[j]
        mov eax, [rax]
        mov [rdx], eax
        ;; Se incrementeaza variabilele 'j' si 'k'
        inc dword [rbp-24]
        inc dword [rbp-16]
do_calc:
        ;; Daca i este mai mic decat n1
        mov eax, [rbp-8]
        cmp eax, [rbp-40]
        ;; Se verifica daca au mai ramas elemente in vectorul v2
        jge test_condition2
        ;; Daca j este mai mic decat n2
        mov eax, [rbp-16]
        cmp eax, [rbp-56]
        ;; Se verifica daca au mai ramas elemente in vectorul v1
        jge elements_v1
        ;; Se adauga elementele in vector
        jmp create_vector
elements_v1:
        ;; Se obtine valoarea lui 'i'
        mov eax, [rbp-8]
        lea rdx, [rax*4]
        ;; Se pune in 'rax' vectorul v1
        mov rax, [rbp-32]
        ;; 'Rax' retine adresa v1+i 
        add rax,rdx
        ;; Se obtine valoarea lui 'k'
        mov edx, [rbp-24]
      ;  movsx rdx, edx
        lea rcx, [rdx*4]
        ;; Se pune in 'rdx' vectorul v
        mov rdx, [rbp-64]
        ;; 'Rdx' retine adresa v+k
        add rdx, rcx
        ;; Cele 2 instructiuni au aceasta semnificatie: v[k]=v1[i]
        mov eax, [rax]
        mov [rdx], eax
        ;; Se incrementeaza variabilele 'i' si 'k'
        inc dword [rbp-24]
        inc dword [rbp-8]
        ;; Se verifica daca au mai ramas elemente
        mov eax, [rbp-8]
        cmp eax, [rbp-40]
        jl elements_v1
        jmp exit
elements_v2:
        ;; Se obtine valoarea lui 'j'
        mov eax, [rbp-16]
        lea rdx, [rax*4]
        ;; Se pune in 'rax' vectorul v2
        mov rax, [rbp-48]
        ;; 'Rax' retine adresa v2+j 
        add rax, rdx
        ;; Se obtine valoarea lui 'k'
        mov edx, [rbp-24]
        movsx rdx, edx
        lea rcx, [edx*4]
        ;; Se pune in 'rdx' vectorul v
        mov rdx, [rbp-64]
        ;; 'Rdx' retine adresa v+k
        add rdx, rcx
        ;; Cele 2 instructiuni au aceasta semnificatie: v[k]=v2[j]
        mov eax, [rax]
        mov [rdx], eax
        ;; Se incrementeaza variabilele 'j' si 'k'
        inc dword [rbp-24]
        inc dword [rbp-16]
test_condition2:
        ;; Se verifica daca au mai ramas elemente
        mov eax, [rbp-16]
        cmp eax, [rbp-56]
        jl elements_v2
exit:
        leave
        ret