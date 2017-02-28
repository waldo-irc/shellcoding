#!/usr/bin/python
import commands, argparse, os, os.path

parser = argparse.ArgumentParser(description='Fuzz C applications for String Format Overflows and Stack Overflows and create custom skeletons on findings.')
parser.add_argument('progname', metavar='execname', type=str, nargs='+', help='A file to search.')
parser.add_argument("-f", help="Search for a certain plt.", type=str, default=False, action="store", dest="search")
args = parser.parse_args()

if args.search:
    x = commands.getoutput("objdump -d -Mintel %s | grep @plt | grep call | cut -d' ' -f16,17 | grep %s" % (args.progname[0], args.search))
else:
    x = commands.getoutput("objdump -d -Mintel %s | grep @plt | grep call | cut -d' ' -f16,17" % args.progname[0])

if os.path.isfile(args.progname[0]):
    pass
else:
    print "File doesn't exist."
    exit(0)

y = 0
count = []
finalcount = []

for line in x.split('\n'):
    if "@" in line:
        y+=1

print "%s PLT(s) found." % y

y = 0

try:
    for line in x.split('\n'):
        liner = "0" + line.split()[0]
        for i in liner:
            y+=1
            count.append(i)
            if y == 2:
                finalcount.append(''.join(count))
                count = []
                y = 0
        liner = ''.join(finalcount[::-1])
        t = iter(liner)
        print '\\x' + '\\x'.join(a+b for a,b in zip(t, t)) + ' ' + line.split()[1]
        finalcount = []
except IndexError:
    print "PLT you searched for wasn't found."
    exit(0)
