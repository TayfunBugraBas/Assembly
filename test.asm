.data

    str1: .asciiz "My Name is Suliman." # Store initial string
    str2: .space 128            # Allocate memory space for the new string

.text

main:
    la $t0, str1            # Load address of first character
    la $t1, str2            # Load the address of second string

loop:                      # do {
    lbu  $t2, 0($t0)        # Load the first byte of $t0 (str1) into $t2

    sb   $t2, 0($t1)        # Save the value in $t2 at the same byte in $t1 (str2)

    addi $t0, $t0, 1        # Increment both pointers by 1 byte
    addi $t1, $t1, 1
    bne  $t2, $zero, loop  # }while(c != 0)

#    j done        # execution falls through to the next instruction by itself
#done:
    li $v0, 4
    la $a0, str2
    syscall                 # Print the copied string to the console

    li $v0, 10              # Program end syscall
    syscall