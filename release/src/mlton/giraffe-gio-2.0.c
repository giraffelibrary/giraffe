/* Copyright (C) 2016-2018 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

/*
 * Gio C interface support for MLton
 */

#include <string.h>
#include <gio/gio.h>
#include <gio/gdesktopappinfo.h>
#include <gio/gunixfdlist.h>
#include <gio/gunixsocketaddress.h>
#include <gio/gunixmounts.h>

#include "giraffe.c"
#include "gio-2.0/giraffe.c"
#include "giraffe-gio-2.0-mlton.c"
