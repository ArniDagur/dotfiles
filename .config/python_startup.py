try:
    import numpy as np
except ImportError:
    pass
try:
    import scipy
except ImportError:
    pass

import datetime
import itertools
import os

def read_file(path):
    with open(path, 'rb') as f:
        buf = f.read()

    try:
        return buf.decode('utf-8')
    except Exception as e:
        print(e)
