# File:		Gettimeofday.pm
# Author:	Daniel Hagerty, hag@linnaean.org
# Date:		Tue Aug 15 18:19:08 2000
# Description:	Perl interface to BSD derived {g,s}ettimeofday functions
#
# $Id: Gettimeofday.pm,v 1.1 2000/08/15 22:54:20 hag Exp $
#
# Copyright (c) 2000 Daniel Hagerty. All rights reserved. This program
# is free software; you can redistribute it and/or modify it under the
# same terms as Perl itself.

package BSD::Gettimeofday;

use strict;
use Carp;

use Exporter;
use DynaLoader;
use AutoLoader;

use vars qw($VERSION @ISA @EXPORT @EXPORT_OK $AUTOLOAD);

###

# This version number is incremented explicitly by the human.
$VERSION = '0.9';

@ISA = qw(Exporter AutoLoader DynaLoader);
# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT = qw(
	     gettimeofday
	     settimeofday
	     );

###

bootstrap BSD::Gettimeofday $VERSION;

1;
__END__
# Below is the stub of documentation for your module. You better edit it!

=head1 NAME

BSD::Gettimeofday - Perl extension for sub-second time on Unix systems

=head1 SYNOPSIS

  use BSD::Gettimeofday;
  my ($seconds, $useconds) = gettimeofday();
  my $ok = settimeofday($seconds, $useconds);

=head1 DESCRIPTION

This module provides access to the sub-second clock get/set functions
available on most unix platforms.

=head1 OVERVIEW

This module exports two function, gettimeofday and settimeofday.

=item gettimeofday()

Returns two values, the number of seconds since 1970, and the
microsecond portion of the current system time.

=item settimeofday(SECONDS, USECONDS)

Sets the system clock to the supplied time.  Returns undefined on
error (permission denied), or 1 if successful.

=head1 SEE ALSO

perl(1), gettimeofday(2)

=head1 AUTHOR

Daniel Hagerty <hag@linnaean.org>

=head1 COPYRIGHT

Copyright (c) 2000 Daniel Hagerty. All rights reserved. This program
is free software; you can redistribute it and/or modify it under the
same terms as Perl itself.

=head1 BUGS

No access to the gettimeofday(2) timezone structure is supplied.  Most
operating systems have deprecated the interface in favor of localtime.

=cut
