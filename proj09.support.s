        .global add
        .text
        
@ADD FUNCTION
add:
        push {r4,r5,r6,lr}
        mov r4, r0 @ Save first argument
        mov r5, r1 @ Save first argument

        adds r6, r4, r5 @ Add the operands, set NZCV
        bvs overflow @ Check for overflow
        
overflow:
         ldr r0, =fmt4
         mov r1, r6
         bl printf @ Display the sum of the operands and error
         mov r0, #0x80000000 @ Return value 1 (not valid)
         
done:
        mov r0, r6
        pop {r4,r5,r6,lr}
        bx lr
        
@SUB FUNCTION
add:
        push {r4,r5,r6,lr}
        mov r4, r0 @ Save first argument
        mov r5, r1 @ Save first argument

        subs r6, r4, r5 @ Add the operands, set NZCV
        bvs overflow @ Check for overflow
        
overflow:
         ldr r0, =fmt4
         mov r1, r6
         bl printf @ Display the sum of the operands and error
         mov r0, #1 @ Return value 1 (not valid)
         
done:
        pop {r4,r5,r6,lr}
        bx lr
        
@NEG FUNCTION
negate:
        push {r4,lr}
        mov r4, r0 @ Save first argument
        
        neg r0, r4 @ Neg and return r0
        
        @CHECK FOR OVERFLOW?
done:
        pop {r4,lr}
        bx lr
        
@ABS FUNCTION
absolute:

        push {r4, lr}
        
        mov r4, r0 @ Save first argument
        
        @TEST IF NEGATIVE
        bl if_neg
        
if_neg:


done:

        pop {r4, lr}


@MUL FUNCTION
mul:

        push {r4,r5,r6,lr}
        mov r4, r0 @ Save first argument
        mov r5, r1 @ Save first argument
       
        mull r6, r4, r5 @ Add the operands, set NZCV
        bvs overflow @ Check for overflow
        
overflow:
         ldr r0, =fmt4
         mov r1, r6
         bl printf @ Display the sum of the operands and error
         mov r0, #1 @ Return value 1 (not valid)
         
done:
        pop {r4,r5,r6,lr}
        bx lr
        
@DIV FUNCTION
divide:

        push {r4,r5,r6,lr}
        mov r4, r0 @ Save first argument
        mov r5, r1 @ Save first argument
        
        sdiv r6, r4, r5 @ Add the operands, set NZCV
        bvs overflow @ Check for overflow
        
overflow:
         ldr r0, =fmt4
         mov r1, r6
         bl printf @ Display the sum of the operands and error
         mov r0, #1 @ Return value 1 (not valid)
         
done:
        pop {r4,r5,r6,lr}
        bx lr

@POW FUNCTION

power:

        push {r4,r5,r6,lr}
        mov r4, r0 @ Save first argument
        mov r5, r1 @ Save first argument
        
loop:

        cmp r5, #0
        @branch to end if equal
        
        @branch to mull with r4 and r5
        
        sub r5, r5, #1
        @return to top of the loop

end:
    
        pop {r4,r5,r6,lr}
        bx lr 

