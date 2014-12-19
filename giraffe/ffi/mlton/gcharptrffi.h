/* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 */

#ifdef C_FFI_DIAG
#include <stdio.h>   /* printf */
#endif

#include <glib.h>


/** interface functions for GCCharPtr FFI **/

/* get_g_string_ptr */

__inline__ gchar *
get_g_string_ptr (gchar *sml_str, gchar *c_str) {
  gchar *str;

#ifdef C_FFI_DIAG
  printf ("[C-MLton] %s using ", __func__);
#endif
  if (c_str)
    {
      if (sml_str[0])
        {
#ifdef C_FFI_DIAG
          printf ("c_str");
#endif
          str = c_str;
        }
      else
        {
#ifdef C_FFI_DIAG
          printf ("NULL");
#endif
          str = NULL;
        }
    }  
  else
    {
#ifdef C_FFI_DIAG
      printf ("sml_str");
#endif
      str = sml_str;
    }

#ifdef C_FFI_DIAG
  printf ("\n");
  fflush (stdout);
#endif
  return str;
}

#define SML_GCHARPTR_VAL(x) gchar *sml_str_##x, gchar *c_str_##x

#define GET_SML_GCHARPTR_VAL(x) get_g_string_ptr (sml_str_##x, c_str_##x)


/* get_g_string_ptr_ptr */

__inline__ gchar **
get_g_string_ptr_ptr (gchar *sml_str, gchar **c_str_ptr) {
  gchar **str_ptr;

#ifdef C_FFI_DIAG
  printf ("[C-MLton] %s using ", __func__);
#endif
  if (*c_str_ptr)
    {
      if (sml_str[0])
        {
          if (sml_str[1])
            {
#ifdef C_FFI_DIAG
              printf ("c_str_ptr");
#endif
              str_ptr = c_str_ptr;
            }
          else
            {
#ifdef C_FFI_DIAG
              printf ("c_str_ptr, *c_str_ptr assigned NULL");
#endif
              *c_str_ptr = NULL;
              str_ptr = c_str_ptr;
            }
        }
      else
        {
#ifdef C_FFI_DIAG
          printf ("NULL");
#endif
          str_ptr = NULL;
        }
    }  
  else
    {
#ifdef C_FFI_DIAG
      printf ("c_str_ptr, *c_str_ptr assigned sml_str");
#endif
      *c_str_ptr = sml_str;
      str_ptr = c_str_ptr;
    }

#ifdef C_FFI_DIAG
  printf ("\n");
  fflush (stdout);
#endif
  return str_ptr;
}

#define SML_GCHARPTR_REF(x) gchar *sml_str_##x, gchar **c_str_ptr_##x

#define GET_SML_GCHARPTR_REF(x) get_g_string_ptr_ptr (sml_str_##x, c_str_ptr_##x)
