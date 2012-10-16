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
