http://www.codeskulptor.org/#user40_JTs8sMsZS4y1LvQ_10.py

import simplegui
import math

# globals vars
time = 0
stopped = True
stops = 0
points = 0

# update time
def time_handler():
    global time
    
    time += 1 * scale

# draw formated time and score
def draw_handler(canvas):
    canvas.draw_text(format(time), (125, 110), 36, "White")
    
    score = str(points)+"/"+str(stops)
    canvas.draw_text(score, (250, 50), 24, "Red")

# start game by starting the timer and allowing scoring
def start_handler():
    global stopped
    
    stopped = False
    timer.start()

# stop timer and check score if already not stopped   
def stop_handler():
    global stopped
    global points
    global stops
    
    timer.stop()
    if not(stopped):
        stopped = True
        stops += 1
        if time % 10 == 0:
            points += 1
        
#reset game and globals
def reset_handler():
    global time
    global stopped
    global points
    global stops
    
    timer.stop()
    time = 0
    stops = 0
    points = 0
    stopped = True

#format the time (ie. 8363 -> 8:36.3)     
def format(time):
    #get secs and the tenths value (exclude minutes)
    sec_tenths = (time % 600)
    
    #find tenths from that (ie. 125 -> 125/10 = 12.5 -> 00.5) 
    tenths = str(sec_tenths % 10)
    
    #find seconds by striping off the tenths (already an int)
    secs = str(sec_tenths/10)
    if (len(secs) < 2):
        secs = "0"+secs
    
    #find the mins as int, math.floor returns double value 
    mins = math.floor(time/600)
    mins = str(int(mins))
    
    return mins + ":" + secs + "." + tenths

# create frame, add buttons, add draw handler
frame = simplegui.create_frame("Stopwatch: The Game", 300, 200)
frame.set_draw_handler(draw_handler)
frame.add_button("Start", start_handler, 200)
frame.add_button("Stop", stop_handler, 200)
frame.add_button("Reset", reset_handler, 200)

# create timer, starts & stops when game starts & stops
timer = simplegui.create_timer(100, time_handler)

# start the frame
frame.start()