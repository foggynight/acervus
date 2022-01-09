all:
	csc -o acervus -O4 -d0 src/*.scm || rm src/*.c

debug:
	csc -o acervus -d3 src/*.scm || rm src/*.c

eggs:
	chicken-install -s srfi-69
