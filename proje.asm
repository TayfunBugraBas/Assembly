# 2004040033 Tayfun Bugra Bas

.text
.globl main

main:
la $t0, arr1           #load adress
la $t1, buffer 
jal procedure
la $t0, arr2        
jal procedure
 # prosedür çağrısı


j bitti

procedure:

lb  $t2, 0($t0)   #byte olarak al
beq $t2, '*', bitti   

sb   $t2, 0($t1)   #byte olarak kaydet


addi $t0, $t0, 1   #üzerine 1 ekle
addi $t1, $t1, 1

bne  $t2, $zero, procedure

jr $ra


bitti:

li $v0, 4
la $a0, buffer #load adress of buffer
syscall  
li $v0, 10    
syscall


.data
arr1: .asciiz "this string function cuts the string where * symbol seen" 
arr2: .asciiz "tay*fun"

buffer: .space 256
