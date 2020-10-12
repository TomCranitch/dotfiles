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
    line = line.split('>?', 1)[0]

    #if line[0:3] == '!!!':
    if '!!!' in line:
        before = line.split('!!!')[0]
        line = line.split('!!!')[1]
        if currthm != None:
            return before + '\\end{' + currthm.value + '}', aligncount, None
        else:
            currthm = Thms[line[0:3].upper()]
            beginStatment = '\\begin{' + currthm.value + '}'

            if len(line) > 3 and line[3] == '[':
                beginStatment += line[3:]

            return before + beginStatment, aligncount, currthm


    if ispres and line.startswith('---'):
        line = line.replace('---', '\ *New Slide*\ ')

    if '$$$' in line:
        if aligncount % 2 == 0:
            line = line.replace('$$$', '\\begin{align*}')
        else:
            line = line.replace('$$$', '\\end{align*}')
        aligncount += 1

    return line, aligncount, currthm
