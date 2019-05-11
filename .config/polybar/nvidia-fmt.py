#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim: fenc=utf-8:et:ts=4:sts=4:sw=4:fdm=marker
# This program is free software, licensed under terms of the MIT license.
import sys
import csv

def normalize_memory(memory):
    if memory > 1000:
        return memory / 1000, "GB"
    else:
        # Technically MiB, but who cares?
        return memory, "MB"

def main():
    for line in csv.reader(sys.stdin):
        line = [int(field) for field in line]
        util, mem_used, mem_total = line

        mem_used, mem_used_unit = normalize_memory(mem_used)
        mem_total, mem_total_unit = normalize_memory(mem_total)

        print("{}% {:.1f} {}/{:.1f} {}".format(
                util,
                mem_used,
                mem_used_unit,
                mem_total,
                mem_total_unit
            ),
            # Without flushing, Polybar won't display anything.
            flush=True
        )


if __name__ == "__main__":
    main()
