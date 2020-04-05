#!/usr/bin/env python3
import sys
import frontmatter
import os
import subprocess
from enum import Enum

class Thms(Enum):
    DEF = "defn"
    REM = "rem"
    THM = "thm"
    LEM = "lem"
    PRO = "proof"
    EXP = "exmp"
    PRP = "prop"
    COR = "coro"

def parse_line(line, ispres, aligncount, currthm):
    if line[0:3] == '!!!':
        if currthm != None:
            return '\\end{' + currthm.value + '}', aligncount, None
        else:
            currthm = Thms[line[3:6].upper()]
            beginStatment = '\\begin{' + currthm.value + '}'

            if len(line) > 6 and line[6] == '[':
                beginStatment += line[6:]

            return beginStatment, aligncount, currthm


    line = line.split('>?', 1)[0]

    if ispres and line.startswith('---'):
        line = line.replace('---', '\ *New Slide*\ ')

    if '$$$' in line:
        if aligncount % 2 == 0:
            line = line.replace('$$$', '\\begin{align*}')
        else:
            line = line.replace('$$$', '\\end{align*}')
        aligncount += 1

    return line, aligncount, currthm
