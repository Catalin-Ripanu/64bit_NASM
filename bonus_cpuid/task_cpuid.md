# Bonus Task - Special Instructions - CPUID

Biju enters one of the rooms behind Steve. He finds an envelope on which it says "discover".

CPUID is a special instruction of processors that use the x86 architecture, or derivatives, which allows finding out information about the processor on which this instruction is executed. The cpuid instruction does not receive parameters, but is executed based on the content of the eax register and, in certain situations, the ecx register. The information given as a response is stored in the eax, ebx, ecx, edx registers. The meaning of the results is documented in the [Intel](https://web.archive.org/web/20120625025623/http://www.intel.com/Assets/PDF/appnote/241618.pdf) specification.

You are asked to find out, using cpuid, the following information about your processor:
 - Manufacturer ID (3p)
 - if the [VMX](https://en.wikipedia.org/wiki/X86_virtualization#Intel_virtualization_(VT-x)) instruction set is supported (1p)
 - if the [RDRAND](https://en.wikipedia.org/wiki/RDRAND) instruction is supported (1p)
 - if the [AVX](https://en.wikipedia.org/wiki/Advanced_Vector_Extensions) instruction set is supported (1p)
 - level 2 cache line size (1p)
 - level 2 cache size, **for a single core** (1p)

The implementation will be done in the bonus_cpuid.asm file.

The last 2 points of the task will be awarded for implementation description and coding-style.
