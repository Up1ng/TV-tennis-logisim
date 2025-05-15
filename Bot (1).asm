###########################################
# where is data?
# 0xE1 - coordinates of cdm8's bat on y
# 0xE2, 0xE3 - ball's velocity by x and y
# 0xE4, 0xE5 - ball's coordinates by x and y
###########################################

asect 0xe1
bat_coords_y: 		ds 1
ball_velocity_x: 	dc 1
ball_velocity_y: 	ds 1
ball_coord_x: 		ds 1
ball_coord_y: 		ds 1

###########################################
# bot itself
#formula for counting
#d = y + (63 - x) * vy 
###########################################

asect 0x00
	#Направление, координата по x и по y, скорость = конст, 
	ldi r0, 0xe3
	ld r0, r3 #vY
	inc r0	
	ld r0, r1 #X
	inc r0
	ld r0, r2 #Y
	
	ldi r0, 62
	neg r1
	add r0, r1 # 62 - X
	
	if
		tst r3
	is nz		
		neg r1 # (62 - X) * vY
	fi
	
	add r2, r1 # Y + (62 - X) * vY
	if 
		tst r1
	is mi
		neg r1
	fi
	ldi r3, 32
	if 
		cmp r1, r3
	is gt
		sub r1, r3
		move r3, r1
	fi
	
	#ldi r2, -2	
	#add r2, r1
	#neg r1
	#ldi r2, 32
	#add r2, r1
	
	
halt
end