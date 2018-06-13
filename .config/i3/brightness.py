from subprocess import check_output, run
from argparse import ArgumentParser

parser = ArgumentParser()
group = parser.add_mutually_exclusive_group(required=True)
group.add_argument(
    '-i', '--inc',
    action='store_true'
)
group.add_argument(
    '-d', '--dec',
    action='store_true'
)
parser.add_argument(
    '-N',
    type=int,
    default=10,
    help='Number of stages'
)
parser.add_argument(
    '-m', '--min',
    type=float,
    default=0,
    help='Mininum brightness percentage'
)
parser.add_argument(
    '-M', '--max',
    type=float,
    default=100,
    help='Maximum brightness percentage'
)
args = parser.parse_args()
N, MIN, MAX = args.N, args.min, args.max

# Get current brightness
B = float(check_output(['xbacklight']).decode('utf-8'))

# Calculate new brightness
CBRT_B = pow(B, 1/3)
STEP = (pow(MAX, 1/3) - pow(MIN, 1/3))/N

if args.inc: # Increase brightness
    NB = pow(CBRT_B + STEP, 3)
else: # Decrease brightness
    NB = pow(CBRT_B - STEP, 3)

# Make sure new brightness is in bounds
if MAX < NB:
    NB = MAX
elif NB < MIN:
    NB = MIN

r = run(['xbacklight', '-set', str(NB)])
