/* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
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

#include "mlton/cvector.h"
#include "mlton/cvectorvector.h"


/* GioApplication */

int
mlton_g_application_run (GApplication *application,
                         int argc,
                         SML_CVECTORVECTOR_VAL(char, argv))
{
  return g_application_run (application,
                            argc,
                            GET_SML_CVECTORVECTOR_VAL(char, argv));
}
