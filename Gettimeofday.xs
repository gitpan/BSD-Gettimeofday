/* -*-C-*-
# File:		Gettimeofday.xs
# Author:	Daniel Hagerty, hag@linnaean.org
# Date:		Tue Aug 15 17:44:41 2000
# Description:	interface to bsd'esque {get,set}timeofday functions.
#
# $Id: Gettimeofday.xs,v 1.1 2000/08/15 22:54:20 hag Exp $
#
# Copyright (c) 1999 Daniel Hagerty. All rights reserved. This program
# is free software; you can redistribute it and/or modify it under the
# same terms as Perl itself.
*/

#ifdef __cplusplus
extern "C" {
#endif
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#ifdef __cplusplus
}
#endif

#include <sys/types.h>
#include <sys/time.h>

static char *rcs_id = "$Id: Gettimeofday.xs,v 1.1 2000/08/15 22:54:20 hag Exp $";

MODULE = BSD::Gettimeofday		PACKAGE = BSD::Gettimeofday	PREFIX=bsd_

PROTOTYPES: enable

void
bsd_gettimeofday()
PREINIT:
	struct timeval tv;
	struct timezone tz;	/* Deprecated */
	int err;
PPCODE:
	err = gettimeofday(&tv, &tz);
	if(err < 0) {
	    XSRETURN_EMPTY;
        }
	EXTEND(sp, 2);
	PUSHs(sv_2mortal(newSViv(tv.tv_sec)));
	PUSHs(sv_2mortal(newSViv(tv.tv_usec)));

int
bsd_settimeofday(tv_sec, tv_usec)
     int tv_sec;
     int tv_usec;
PREINIT:
	struct timeval tv;
	struct timezone tz;	/* Deprecated */
	int err;
PPCODE:
	tv.tv_sec = tv_sec;
	tv.tv_usec = tv_usec;
	bzero(&tz, sizeof(tz));

	err = settimeofday(&tv, &tz);
	if(err < 0) {
	    XSRETURN_EMPTY;
        }
	RETVAL = 1;
