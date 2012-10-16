#ifdef C_FFI_DIAG
#include <stdio.h>   /* printf */
#endif

#include <string.h>  /* memcpy */
#include <glib.h>


/** interface functions for GCCharPtrPtr FFI **/

/* get_g_string_vector_ptr */

__inline__ gchar **
get_g_string_vector_ptr (gchar **sml_vec, gchar **sml_arr, gchar **c_arr) {
  gchar **arr;
  gulong n;

  n = ((gulong *) sml_arr)[-2] - 1;  /* don't count null terminator */

#ifdef C_FFI_DIAG
  printf ("[C-MLton] %s using ", __func__);
#endif
  if (c_arr)
    {
      if (0 < n)
        {
#ifdef C_FFI_DIAG
          printf ("c_arr");
#endif
          arr = c_arr;
        }
      else  /* (n == 0) */
        {
#ifdef C_FFI_DIAG
          printf ("NULL");
#endif
          arr = NULL;
        }
    }  
  else
    {
#ifdef C_FFI_DIAG
      printf ("sml_arr, copied from sml_vec");
#endif
      arr = memcpy (sml_arr, sml_vec, n * sizeof (void *));
    }

#ifdef C_FFI_DIAG
  printf ("\n");
  fflush (stdout);
#endif
  return arr;
}

#define SML_GCHARPTRPTR_VAL(x) gchar **sml_vec_##x, gchar **sml_arr_##x, gchar **c_arr_##x

#define GET_SML_GCHARPTRPTR_VAL(x) get_g_string_vector_ptr (sml_vec_##x, sml_arr_##x, c_arr_##x)


/* get_g_string_vector_ptr_ptr */

__inline__ gchar ***
get_g_string_vector_ptr_ptr (gchar **sml_vec, gchar **sml_arr, gchar ***c_arr_ptr) {
  gchar ***arr_ptr;
  gulong n;

  n = ((gulong *) sml_arr)[-2] - 1;  /* don't count null terminator */

#ifdef C_FFI_DIAG
  printf ("[C-MLton] %s using ", __func__);
#endif
  if (*c_arr_ptr)
    {
      if (0 < n)
        {
          if (n != 1)
            {
#ifdef C_FFI_DIAG
              printf ("c_arr_ptr");
#endif
              arr_ptr = c_arr_ptr;
            }
          else  /* n == 1 */
            {
#ifdef C_FFI_DIAG
              printf ("c_arr_ptr, *c_arr_ptr assigned NULL");
#endif
              *c_arr_ptr = NULL;
              arr_ptr = c_arr_ptr;
            }
        }
      else  /* (n == 0) */
        {
#ifdef C_FFI_DIAG
          printf ("NULL");
#endif
          arr_ptr = NULL;
        }
    }  
  else
    {
#ifdef C_FFI_DIAG
      printf ("c_arr_ptr, *c_arr_ptr assigned sml_arr, copied from sml_vec");
#endif
      *c_arr_ptr = memcpy (sml_arr, sml_vec, n * sizeof (void *));
      arr_ptr = c_arr_ptr;
    }

#ifdef C_FFI_DIAG
  printf ("\n");
  fflush (stdout);
#endif
  return arr_ptr;
}

#define SML_GCHARPTRPTR_REF(x) gchar **sml_vec_##x, gchar **sml_arr_##x, gchar ***c_arr_##x##_ptr

#define GET_SML_GCHARPTRPTR_REF(x) get_g_string_vector_ptr_ptr (sml_vec_##x, sml_arr_##x, c_arr_##x##_ptr)
