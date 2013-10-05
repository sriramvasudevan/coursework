/* See COPYRIGHT for copyright information. */

#include <inc/mmu.h>
#include <inc/memlayout.h>
#include <inc/trap.h>



###################################################################
# exceptions/interrupts
###################################################################

/* TRAPHANDLER defines a globally-visible function for handling a trap.
 * It pushes a trap number onto the stack, then jumps to _alltraps.
 * Use TRAPHANDLER for traps where the CPU automatically pushes an error code.
 *
 * You shouldn't call a TRAPHANDLER function from C, but you may
 * need to _declare_ one in C (for instance, to get a function pointer
 * during IDT setup).  You can declare the function with
 *   void NAME();
 * where NAME is the argument passed to TRAPHANDLER.
 */
#define TRAPHANDLER(name, num)					             	\
    .text;                                                      \
	.globl name;		/* define global symbol for 'name' */	\
	.type name, @function;	/* symbol type is function */		\
	.align 2;		/* align function definition */	        	\
	name:			/* function starts here */	             	\
	pushl $(num);						                    	\
	jmp _alltraps;                                              \
    .data;                                                      \
    .long name

/* Use TRAPHANDLER_NOEC for traps where the CPU doesn't push an error code.
 * It pushes a 0 in place of the error code, so the trap frame has the same
 * format in either case.
 */
#define TRAPHANDLER_NOEC(name, num)					\
    .text;                                          \
	.globl name;						         	\
	.type name, @function;			     			\
	.align 2;						            	\
	name:							            	\
	pushl $0;						            	\
	pushl $(num);					           		\
	jmp _alltraps;                                  \
    .data;                                          \
    .long name


# Defining the data used
.data
.globl thandlers
thandlers:


.text

/*
 * Lab 3: Your code here for generating entry points for the different traps.
 */
TRAPHANDLER_NOEC(handler0, 0)
TRAPHANDLER_NOEC(handler1, 1)
TRAPHANDLER_NOEC(handler2, 2)
TRAPHANDLER_NOEC(handler3, 3)
TRAPHANDLER_NOEC(handler4, 4)
TRAPHANDLER_NOEC(handler5, 5)
TRAPHANDLER_NOEC(handler6, 6)
TRAPHANDLER_NOEC(handler7, 7)
TRAPHANDLER(handler8, 8)
TRAPHANDLER_NOEC(handler9, 9)
TRAPHANDLER(handler10, 10)
TRAPHANDLER(handler11, 11)
TRAPHANDLER(handler12, 12)
TRAPHANDLER(handler13, 13)
TRAPHANDLER(handler14, 14)
TRAPHANDLER_NOEC(handler15, 15)
TRAPHANDLER_NOEC(handler16, 16)
TRAPHANDLER(handler17, 17)
TRAPHANDLER_NOEC(handler18, 18)
TRAPHANDLER_NOEC(handler19, 19)


/*
 * Lab 3: Your code here for _alltraps
 */

.globl _altraps
_alltraps:
#Pushing so that reverse order is like struct Trapframe
    pushl %ds
    pushl %es
    pushal

    movw $GD_KD, %ax
    movw %ax, %ds
    movw %ax, %es

    pushl %esp
    call trap 

