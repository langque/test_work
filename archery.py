import math

N = raw_input()
R_i = raw_input()
R_i = map(lambda x: int(x), R_i.split(' '))
print R_i
cnt = 0 
M = raw_input()
while True:
	l=raw_input()
	if l == '':
		break
	l = map(lambda x: int(x),l.split(' '))
	p1 = math.sqrt(l[0]**2 + l[1]**2)
	p2 = math.sqrt(l[2]**2 + l[3]**2)
	print p1, p2
	