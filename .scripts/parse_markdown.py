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

def parse_line(line, ispres, aligncount, currthm, omit):
    line = line.split('>?', 1)[0]

    if omit is None and ('!!<' in line or '!!>' in line):
        return None, aligncount, currthm, None
    if '!!>' in line:
        return None, aligncount, currthm, False
    if '!!<' in line:
        return None, aligncount, currthm, True
    if omit:
        return None, aligncount, currthm, True



    if '!!!' in line:
        before = line.split('!!!')[0]
        line = line.split('!!!')[1]
        if currthm is not None:
            return before + '\\end{' + currthm.value + '}', aligncount, None, omit

        currthm = Thms[line[0:3].upper()]
        begin_statment = '\\begin{' + currthm.value + '}'

        if len(line) > 3 and line[3] == '[':
            begin_statment += line[3:]

        return before + begin_statment, aligncount, currthm, omit


    if ispres and line.startswith('---'):
        line = line.replace('---', '\\ *New Slide*\\ ')

    if '$$$' in line:
        if aligncount % 2 == 0:
            line = line.replace('$$$', '\\begin{align*}')
        else:
            line = line.replace('$$$', '\\end{align*}')
        aligncount += 1

    return line, aligncount, currthm, omit
