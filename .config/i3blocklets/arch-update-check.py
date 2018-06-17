#!/usr/bin/env python3
#
# Copyright (C) 2017 Marcel Patzwahl
# Licensed under the terms of the GNU GPL v3 only.
#
# i3blocks blocklet script to see the available updates of pacman and the AUR
import subprocess
from subprocess import check_output
import argparse
import re


def create_argparse():
    parser = argparse.ArgumentParser(description='Check for pacman updates')
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
        '-a',
        '--aur',
        action='store_true',
        help='Include AUR packages. Attn: Pikaur must be installed'
    )
    parser.add_argument(
        '-q',
        '--quiet',
        action = 'store_true',
        help = 'Do not produce output when system is up to date'
    )
    parser.add_argument(
        '-w',
        '--watch',
        nargs='*',
        default=[],
        help='Explicitly watch for specified packages. '
        'Listed elements are treated as regular expressions for matching.'
    )
    return parser.parse_args()


def get_updates():
    output = ''
    try:
        output = check_output(['pacman', '-Qu']).decode('utf-8')
    except subprocess.CalledProcessError as exc:
        if not (exc.returncode == 1 and not exc.output):
            raise exc
    if not output:
        return []

    updates = [line.split(' ')[0]
               for line in output.split('\n')
               if line]

    return updates


def get_aur_updates():
    output = ''
    try:
        output = check_output(['/usr/bin/python3', '/usr/bin/pikaur', '-Quaq']).decode('utf-8')
    except subprocess.CalledProcessError as exc:
        if not (exc.returncode == 1 and not exc.output):
            raise exc
    output = output.strip() # pikaur appends newline to output
    if not output:
        return []

    aur_updates = [line.split(' ')[0]
                   for line in output.split('\n')]

    return aur_updates


def matching_updates(updates, watch_list):
    matches = set()
    for u in updates:
        for w in watch_list:
            if re.match(w, u):
                matches.add(u)

    return matches


color_template = "<span color='{}'>{}</span>"
template = "<span>{}{}{}</span>"
seperator = " | "
args = create_argparse()

repo_updates = get_updates()
aur_updates = get_aur_updates()
repo_matches = matching_updates(repo_updates, args.watch)
aur_matches = matching_updates(aur_updates, args.watch)

if len(repo_updates) > 0:
    repo_color = args.updates_available_color
    repo_info = '{} pending'.format(len(repo_updates))
    if repo_matches:
        repo_info += '[{}]'.format(', '.join(repo_matches))
else:
    repo_color = args.base_color
    repo_info = '0'

if len(aur_updates) > 0:
    aur_color = args.updates_available_color
    aur_info = '{} pending'.format(len(aur_updates))
    if aur_matches:
        aur_info += '[{}]'.format(', '.join(aur_matches))
else:
    aur_color = args.base_color
    aur_info = '0'

if (len(repo_updates) > 0 or len(aur_updates) > 0) or not args.quiet:
    print(
        template.format(
            color_template.format(repo_color, repo_info),
            seperator,
            color_template.format(aur_color, aur_info)
        )
    )

#  updates = get_updates()
#  if args.aur:
    #  updates += get_aur_updates()

#  update_count = len(updates)
#  if update_count > 0:
    #  info = str(update_count) + ' updates available'
    #  matches = matching_updates(updates, args.watch)
    #  if matches:
        #  info += ' [{0}]'.format(', '.join(matches))
    #  print(message.format(args.updates_available_color, info))
#  elif not args.quiet:
    #  print(message.format(args.base_color, 'Up to date!'))
