# File:		Makefile.PL
# Author:	Daniel Hagerty, hag@linnaean.org
# Date:		Mon Jul  5 18:21:08 1999
# Description:	Makefile for BSD::Gettimeofday
#
# Copyright (c) 1999 Daniel Hagerty. All rights reserved. This program
# is free software; you can redistribute it and/or modify it under the
# same terms as Perl itself.
#
# $Id: Makefile.PL,v 1.1 2000/08/15 22:54:20 hag Exp $

use ExtUtils::MakeMaker;

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'	=> 'BSD::Gettimeofday',
    'VERSION_FROM' => 'Gettimeofday.pm', # finds $VERSION
    'LIBS'	=> [''],   # e.g., '-lm'
    'DEFINE'	=> '',     # e.g., '-DHAVE_SOMETHING'
    'INC'	=> '',     # e.g., '-I/usr/include/other'

    'dist'    => {
		    COMPRESS => 'gzip -9f',
		    SUFFIX   => '.gz',
		    DIST_DEFAULT => 'all tardist',
		 },
);
