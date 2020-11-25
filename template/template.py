#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Short description of what this script does.

A longer description with usage instructions.
"""

import csv
import sys
from collections import namedtuple, OrderedDict
from typing import Sequence, TextIO, Union, Dict, List

def read_csv(istream: TextIO, delimiter=",", with_header=True) -> \
        Union[Sequence[Tuple[str, ...]], Tuple[List[str], Sequence[Dict[str, str]]]]:
    """
    Reads a CSV file into a stream of tuples.

    If a header is provided, the stream will return a a sequence of
    ordered dictionaries that allows the fields of the tuple to be
    accessed by name.

    Args:
        istream: An input stream to parse as a CSV
        delimiter: The CSV delimiter to use
        with_header: If true, we will interpret the first row of
                     `istream` to define the column names for the rest
                     of the file.

    Returns:
        If `with_header` is True, this function returns a tuple of the
        header row and a sequence of the remaining rows wrapped as
        `OrderedDict` objects.
        If `with_header` is False, this function returns a sequence of
        the remaining rows as tuples
    """
    reader = csv.reader(istream, delimiter=delimiter)
    if with_header:
        header = next(reader)
        assert len(header) > 0, "Invalid header"
        return header, (OrderedDict((k, v) for k, v in zip(header, row)) for row in reader)
    else:
        return reader

def do_command(args):
    """
    Short description of what this command does.
    """
    header, reader = read_csv(args.input, delimiter=args.delimiter)
    writer = csv.writer(args.output, delimiter=args.delimiter)

    writer.writerow(header)

    # Write header.
    for row in reader:
        writer.writerow(row.values())

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description=__doc__,
                                     formatter_class=argparse.RawTextHelpFormatter)
    parser.add_argument('-i', '--input', type=argparse.FileType('r'), default=sys.stdin, help="")
    parser.add_argument('-d', '--delimiter', type=str, default=",", help="CSV delimiter to use")
    parser.add_argument('-o', '--output', type=argparse.FileType('w'), default=sys.stdout, help="")
    parser.set_defaults(func=do_command)

    #subparsers = parser.add_subparsers()
    #command_parser = subparsers.add_parser('command', help=do_command.__doc__)
    #command_parser.set_defaults(func=do_command)

    ARGS = parser.parse_args()
    if ARGS.func is None:
        parser.print_help()
        sys.exit(1)
    else:
        ARGS.func(ARGS)
