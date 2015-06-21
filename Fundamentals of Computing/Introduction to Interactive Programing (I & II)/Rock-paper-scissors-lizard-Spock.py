#http://www.codeskulptor.org/#user40_hwIXA4Srhn3pE2Y_7.py

***Rock-paper-scissors-lizard-Spock***

import random

def name_to_number(name):
    if (name == 'rock'):
        return 0
    elif (name == 'Spock'):
        return 1
    elif (name == 'paper'):
        return 2
    elif (name == 'lizard'):
        return 3
    elif (name == 'scissors'):
        return 4
    else:
        return -1
    
def number_to_name(n):
    if (n == 0):
        return 'rock'
    elif (n == 1):
        return 'Spock'
    elif (n == 2):
        return 'paper'
    elif (n == 3):
        return 'lizard'
    elif (n == 4):
        return 'scissors'

def rpsls(player_choice):
    player_number = name_to_number(player_choice)
    
    if (player_number == -1):
        print '"'+player_choice+'" is not an option in the game \n'
        return
    
    comp_number = random.randrange(0,5)
    comp_choice = number_to_name(comp_number)
    
    n = (comp_number - player_number) % 5
    
    print 'Player chooses ' + player_choice 
    print 'Computer chooses ' + comp_choice
    
    if (n > 2): print 'Player wins!\n'
    elif (n == 0): print 'Player and computer tie!\n'
    else: print 'Computer wins!\n'
        
rpsls('rock')
rpsls('Spock')
rpsls('paper')
rpsls('lizard')
rpsls('scissors')
rpsls('test')
rpsls('scissors')