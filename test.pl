# File:		test.pl
# Author:	Daniel Hagerty, hag@linnaean.org
# Date:		Mon Jul  5 18:16:25 1999
# Description:	Module test script for BSD::Gettimeofday
#
# Copyright (c) 1999 Daniel Hagerty. All rights reserved. This program
# is free software; you can redistribute it and/or modify it under the
# same terms as Perl itself.
#
# $Id: test.pl,v 1.1 2000/08/15 22:54:21 hag Exp $

# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

use strict;

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

my $loaded;

BEGIN { $| = 1; print "1..3\n"; }
END {print "not ok 1\n" unless $loaded;}
use BSD::Gettimeofday;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

# Test our ability to call gettimeofday.  Unless the machine is ludicrously loaded, gettimeofday and time should agree within 1 second.

my ($tv_sec, $tv_usec) = gettimeofday();
my $time = time;

if(($time != $tv_sec) && ($--time != $tv_sec)) {
    print "not ok 2\n";
} else {
    print "ok 2\n";
}

# Testing settimeofday would be very obnoxious.  Only do it if the
# user goes well out of their way.

if(exists($ENV{TEST_SETTIME}) & $> == 0) {
    settimeofday($tv_sec - 20, 0);
    my $now = time;
    if($now < $tv_sec) {
	print "ok 3\n";
    } else {
	print "not ok 3\n";
    }
} else {
    print "# Ignoring test3;  set TEST_SETTIME and run as root\n";
}
