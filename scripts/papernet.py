#!/usr/bin/env python3
"""
download papers
"""

import sys, os, re
from hashlib import sha1
import subprocess
import platform


def get_viewer():
    if platform.system() == "Darwin":
        return "open"
    elif platform.system() == "Linux":
        return "gnome-open"
    else:
        return None

class FileDownloadCache:
    def __init__( self, dir ):
        self.dir = os.path.expanduser( dir ) 
        if not os.path.exists( dir ):
            os.system( "mkdir -p %s"%(dir) )

    def get_pdf( self, url, output ):
        """Get the pdf at the URL"""
        print( "wget -q --user-agent FireFox %s -O %s" %( url, output ), file=sys.stderr )
        os.system( "wget -q --user-agent FireFox %s -O %s" %( url, output ) )

    def get( self, url, force = False ):
        hsh = sha1( url.encode('ascii') ).hexdigest()
        # If this doesn't exist, ahh
        path = os.path.join( self.dir, hsh + ".pdf" )
        print( path, os.path.exists( path ), file=sys.stderr ) 
        if force or not os.path.exists( path ):
            self.get_pdf(url, path)

        return path

if __name__ == "__main__":
    import argparse
    p = argparse.ArgumentParser()
    p.add_argument("url", help="url")
    p.add_argument("--open", action="store_true", default=False, help="Open?")
    args = p.parse_args()
    if args:
        cache = FileDownloadCache("~/.cache/depot/")
        url = cache.get( args.url )
        if(args.open and get_viewer() is not None):
            subprocess.Popen([get_viewer(), url,])
        else:
            print( url )

