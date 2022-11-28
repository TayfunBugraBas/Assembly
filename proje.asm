# 2004040033 Tayfun Bugra Bas

.text
.globl main

main:
la $t0, arr1           #load adress
la $t1, buffer 
la $s1, arr3
jal procedure
la $t0, arr4        
jal procedure
la $t0, arr3        
jal procedure
la $t0, arr2        
jal procedure
 # prosedür çağrısı

j bitti

procedure:

beq $t0, $s1, bitti 

lb  $t2, 0($t0)   #byte olarak al

beq $t2,'*',bitti

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
arr1: .asciiz "hello" 
arr2: .asciiz "tayfun"
arr3: .asciiz "*"
arr4: .asciiz "Mr."
buffer: .space 256
