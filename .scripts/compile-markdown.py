#!/usr/bin/env python3
import sys
import frontmatter
import os
import subprocess
import parse_markdown as pmd

aligncount = 0
#filename = '/tmp/' + os.path.splitext(os.path.basename(sys.argv[1]))[0] + '.tmp.md'
artifactfilename = sys.argv[2] + '/' + os.path.splitext(os.path.basename(sys.argv[1]))[0] + '.pdf'
filename = sys.argv[2] + '/' + os.path.splitext(os.path.basename(sys.argv[1]))[0] + '.tmp.rmd'

with open(sys.argv[1], 'r') as file, open(filename, 'w') as outputf:
    file = frontmatter.load(file)

    outputf.write('---' + frontmatter.dumps(file).split('---')[1] + '---\n\n')

    file.content = file.content.split('\n')

    currthm = None

    for line in file.content:
        line, aligncount, currthm = pmd.parse_line(line, file['output'] != 'beamer_presentation', aligncount, currthm) 
        outputf.write(line + '\n')



# subprocess.call(['R', "--quiet", "-e bookdown::render_book('" + filename + "',output_file='" + artifactfilename + "')"])
# subprocess.call(['R', "--quiet", "-e bookdown::render_book('" + filename + "')"])
#subprocess.call(['R', "--quiet", "-e rmarkdown::render('" + filename + "',output_file='" + artifactfilename + "')"])
subprocess.call(['R', "--quiet", "-e rmarkdown::render('" + filename + "',output_file='" + artifactfilename + "')"])
