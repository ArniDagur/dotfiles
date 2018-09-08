#!/usr/bin/env python3
# Copyright (c) Árni Dagur <arnidg@protonmali.ch> MIT license
from subprocess import check_output
from argparse import ArgumentParser
import re


def create_argparse():
    parser = ArgumentParser(description='Check for pacman updates')
    parser.add_argument(
        '-b',
        '--base_color',
        default='#00FF00',
        help='base color of the output(default=green)'
    )
    parser.add_argument(
        '-u',
        '--updates_available_color',
        default='yellow',
        help='color of the output, when updates are available(default=yellow)'
    )
    parser.add_argument(
        '--seperator',
        default=' / ',
        help='seperator between repo and aur listings'
    )
    parser.add_argument(
        '-a',
        '--aur',
        action='store_true',
        help='Include AUR packages. For this to work, yay must be installed.'
    )
    parser.add_argument(
        '-q',
        '--quiet',
        action = 'store_true',
        help = 'Do not produce output when system is up to date'
    )
    return parser.parse_args()


def num_repo_updates():
    output = check_output(['pacman', '-Quq']).decode('utf-8')
    packages = output.strip().split('\n')
    return len(packages)

def num_aur_updates():
    output = check_output(['yay', '-Quaq']).decode('utf-8')
    packages = output.strip().split('\n')
    return len(packages)

color_template = "<span color='{}'>{}</span>"
template = "<span>{}{}{}</span>"

args = create_argparse()

repo_updates = num_repo_updates()
aur_updates = num_aur_updates()

if repo_updates > 0:
    repo_color = args.updates_available_color
    repo_info = '{} pending'.format(repo_updates)
else:
    repo_color = args.base_color
    repo_info = '0'
if aur_updates > 0:
    aur_color = args.updates_available_color
    aur_info = '{} pending'.format(aur_updates)
else:
    aur_color = args.base_color
    aur_info = '0'

if (repo_updates > 0 or aur_updates > 0) or not args.quiet:
    print(
        template.format(
            color_template.format(repo_color, repo_info),
            args.seperator,
            color_template.format(aur_color, aur_info)
        )
    )
