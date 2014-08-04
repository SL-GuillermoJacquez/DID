import sys, os

sys.path.append('c:/temp/cloud')
os.chdir(os.path.dirname(__file__))

print sys.path.append

import bottle, index

application = bottle.default_app()