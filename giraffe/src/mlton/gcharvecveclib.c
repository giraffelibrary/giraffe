/* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

#include <string.h>  /* memcpy */
#include <glib.h>


/** internal functions for GCharVecVec FFI **/

gchar **
g_string_vector_sml_dup (gchar **sml_vec, gchar **sml_arr)
{
  gulong n;

  n = ((gulong *) sml_arr)[-2] - 1;  /* don't count null terminator */
  memcpy (sml_arr, sml_vec, n * sizeof (void *));

  return g_strdupv (sml_arr);
}
