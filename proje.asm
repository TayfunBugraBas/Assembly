.text
.globl main

main:
la $t0, arr1           #load adress
la $t1, buffer 
la $s0, arr2
la $s1, buffer2           
jal procedure     # prosedür çağrısı


procedure:
lb  $t2, 0($t0)   #byte olarak al
lb  $t3, 0($s0)    # her bir karakter hafızada toplam 1 byte yer kaplamaktadır
sb   $t2, 0($t1)   #byte olarak kaydet
sb   $t3, 0($s1)

addi $t0, $t0, 1   #üzerine 1 ekle
addi $t1, $t1, 1
addi $s0, $s0, 1       
addi $s1, $s1, 1


bne  $t2, $zero, procedure 

j bitti

bitti:

li $v0, 4  #load immediate??? 
la $a0, buffer #load adress of buffer
syscall
la $a0, buffer2
syscall                 
li $v0, 10    
syscall


.data
arr1: .asciiz "hello" 
arr2: .asciiz "tayfun"
checker: .asciiz "*"
buffer: .space 128 
buffer2: .space 128 #hafızada boş bir kısım oluşturuyoruz
