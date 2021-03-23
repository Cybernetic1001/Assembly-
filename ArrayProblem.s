.data

theArray: .word 11, 12, -10, 13,  9, 12, 14, 15, -20, 0
phrase:  .asciiz "The maximum is "
phrase1: .asciiz "\n The summation is "
.text
main:
        li  $a2, 10                  
        
         la $t0, theArray            
          # syscall
		li      $v0, 4                                
        la      $a0, phrase                             
        syscall                                        
        
   
        li       $t1, 0                                
        li   $a1, 0                
        j FindMax                         
Exit:
        # Print maxVal
        li $v0, 1                    # load appropriate system call code into register $v0;
        move $a0, $a1                   # move integer to be printed into $a0:  $a0 = $t6
        syscall
        
       
        li      $v0, 4                                  
        la      $a0, phrase1                    
        syscall                                         
        
        # Call Sum
        li   $t1, 0                 # t1 restore back to 0
        li   $a1, 0                 # a1 = 0 = sumVal
        j Summation

Exit2:
        # Print sumVal
        li $v0, 1                   # load system call code into register $v0;
        move $a0, $a1               # move integer to be printed into $a0:  $a0 = $a1
        syscall
        
        # Exit program
        li   $v0, 10                
        syscall                             
        
FindMax:
        beq  $t1, $a2, Exit             # Exit loop if t1 = arrayLen
        la       $t0, theArray          # put address of array into $t0
        sll      $t2, $t1, 2            # t2 = t1 * 4
        add  $t0, $t0, $t2              # t0 address of array[t2]
        lw   $t3, 0($t0)                # t3 = array[t2]
        
        li   $t4, 1                     # t4 = 1
        slt  $t5, $a1, $t3              # t5 = 1 if a1 < t3
        addi $t1, $t1, 1                # Increment t1 by 1: i += 1
        
        beq  $t4, $t5, SetValue         # jump if t4 = t5
        j FindMax
        
SetValue:
        move $a1, $t3                   
        j FindMax                          
        
Summation:
        beq  $t1, $a2, Exit2        
        la   $t0, theArray          
        sll  $t2, $t1, 2           
        add  $t0, $t0, $t2          
        lw   $t3, 0($t0)            
        
        add  $a1, $t3, $a1                  
        addi $t1, $t1, 1            
        j Summation                                    
		
		# D) The address used by simulator is given as: User data segment [10000000]..[10040000]