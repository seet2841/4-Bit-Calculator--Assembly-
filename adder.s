	.text
	.equ	LEDs,		0xFF200000
	.equ	SWITCHES,	0xFF200040
	.global _start
_start:
	movia	r2, LEDs		# Address of LEDs         
	movia	r3, SWITCHES	# Address of switches


LOOP:
 
	ldwio	r4, (r3)		# Read the state of switches ( for left 5 switches)

    ldwio   r10, (r3)       # Read the state of switches (for right 5 switches)

    srai     r5, r4, 5       # Isolate the left 5 switches and stores into r5
   
    slli    r7, r10, 27      # Isolates the right 5 switches

    srai     r9, r7, 27      # Makes r7 readable and stores into r9
 
    add     r8, r5, r9       # adds r9 ( values of right 5 switches) and r5 ( values of left 5 switches) and stores into r8

	stwio	r8, (r2)		# Display value of r8 on LEDs
	br		LOOP

	.end
