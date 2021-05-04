# -*- coding: utf-8 -*-

import time
from pyfirmata import Arduino, util
import matplotlib.pyplot as plt
board = Arduino('COM22')
it = util.Iterator(board)
it.start()
board.analog[0].enable_reporting()
servo=board.get_pin('d:9:s')
pin11 = board.get_pin('d:2:i')
board.digital[2].enable_reporting()
pin13 = board.get_pin('d:13:o')
pin13.write(1)


def push():
    servo.write(30)
    time.sleep(0.1)
    servo.write(1)
    time.sleep(0.1)

xp, xpp, xppp=1,1,1
y=0
X,Y=[],[]
ln1,=plt.plot(range(len(X)),X)
ln2,=plt.plot(range(len(Y)),Y)
plt.axis([0, 100, 0, 1.1])
while 1:
    x=pin11.read()
    y=board.analog[0].read()
    #print x, 
    if all([x,xp,xpp,xppp]):
        push()
    xppp=xpp
    xpp=xp
    xp=x
    X+=[x]
    if len(X)>100: X.pop(0)
    ln1.set_data(range(len(X)), X)
    Y+=[y]
    if len(Y)>100: Y.pop(0)
    ln2.set_data(range(len(Y)), Y)
    plt.pause(0.0001)  
    #if len(X)%20==0:
    #    plt.pause(0.0001)
board.exit()