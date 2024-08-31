        section .text
        global cmmmc

;; int cmmmc(int a, int b)

        ;; calculate least common multiple fow 2 numbers, a and b
cmmmc:
        ;; Se obtin elementele de pe stiva
        ;; 'Ecx' retine adresa de retur
        pop ecx
        ;; 'Eax' retine valoarea lui 'a'
        pop eax
        ;; 'Ebx' retine valoarea lui 'b'
        pop ebx
        push ebx
        ;; 'Edi' retine valoarea lui 'b'
        pop edi
        push edi
        push eax
        ;; 'Esi' retine valoarea lui 'a'
        pop esi
        push esi
        push ecx
        ;; Un mic algoritm care calculeaza cel mai mare divizor comun
        ;; while(b!=0)
        ;; y=a%b
        ;; a=b
        ;; b=y
find_gcd:
        ;; 'Edx' retine valorea 0 intrucat se foloseste 'div'
        push 0
        pop edx
        div ebx
        push ebx
        pop eax
        push edx
        pop ebx
        ;; Cat timp restul nu este 0
        test ebx, ebx
        jnz find_gcd
        ;; Se foloseste relatia:
        ;; cmmmc(a, b)=(a*b)/cmmdc(a, b)
        push eax
        ;; 'Ecx' retine cmmdc(a,b)
        pop ecx
        push esi
        pop eax
        ;; 'Eax' pastreaza valoarea a*b
        mul edi
        ;; 'Eax' retine rezultatul final
        div ecx
        ret
