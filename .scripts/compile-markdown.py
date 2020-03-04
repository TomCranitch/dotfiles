#!/usr/bin/env python3
import sys
import frontmatter
import os
import subprocess

aligncount = 0
filename = '/tmp/' + os.path.splitext(os.path.basename(sys.argv[1]))[0] + '.tmp.md'
artifactfilename = sys.argv[2] + '/' + os.path.splitext(os.path.basename(sys.argv[1]))[0] + '.pdf'

with open(sys.argv[1], 'r') as file, open(filename, 'w') as outputf:
    file = frontmatter.load(file)

    outputf.write('---' + frontmatter.dumps(file).split('---')[1] + '---\n\n')

    file.content = file.content.split('\n')

    for line in file.content:
        if file['output'] != 'beamer_presentation' and line.startswith('---'):
            line = line.replace('---', '\ *New Slide*\ ')

        if '$$$' in line:
            if aligncount % 2 == 0:
                line = line.replace('$$$', '\\begin{align*}')
            else:
                line = line.replace('$$$', '\\end{align*}')
            aligncount += 1

        outputf.write(line + '\n')



subprocess.call(['R', "--quiet", "-e rmarkdown::render('" + filename + "',output_file='" + artifactfilename + "')"])
