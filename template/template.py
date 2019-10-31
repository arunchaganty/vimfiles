#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""

"""

import csv
import sys
from collections import namedtuple, OrderedDict

def read_csv(istream, delimiter=",", with_header=True):
    reader = csv.reader(istream, delimiter=delimiter)
    if with_header:
        header = next(reader)
        assert len(header) > 0, "Invalid header"
        return header, (OrderedDict((k, v) for k, v in zip(header, row)) for row in reader)
    else:
        return reader

def do_command(args):
    header, reader = read_csv(args.input, delimiter=args.delimiter)
    writer = csv.writer(args.output, delimiter=args.delimiter)

    writer.writerow(header)

    # Write header.
    for row in reader:
        writer.writerow(row.values())

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description='')
    parser.add_argument('-i', '--input', type=argparse.FileType('r'), default=sys.stdin, help="")
    parser.add_argument('-d', '--delimiter', type=str, default=",", help="CSV delimiter to use")
    parser.add_argument('-o', '--output', type=argparse.FileType('w'), default=sys.stdout, help="")
    parser.set_defaults(func=do_command)

    #subparsers = parser.add_subparsers()
    #command_parser = subparsers.add_parser('command', help='' )
    #command_parser.set_defaults(func=do_command)

    ARGS = parser.parse_args()
    if ARGS.func is None:
        parser.print_help()
        sys.exit(1)
    else:
        ARGS.func(ARGS)
