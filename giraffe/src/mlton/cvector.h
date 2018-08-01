#ifdef C_FFI_DIAG
#include <stdio.h>   /* printf */
#endif


/** interface functions for CVector/CVectorN FFI **/

/* get_c_vector_ptr */

__inline__ void *
get_c_vector_ptr (void *sml_arr, void *c_arr) {
  void *arr;
  unsigned long int n = ((unsigned long int *) sml_arr)[-2];

#ifdef C_FFI_DIAG
  printf ("[C-MLton] %s using ", __func__);
#endif
  if (c_arr)
    {
      if (1 < n)
        {
#ifdef C_FFI_DIAG
          printf ("c_arr");
#endif
          arr = c_arr;
        }
      else  /* (n == 1) */
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
      printf ("sml_arr");
#endif
      arr = sml_arr;
    }

#ifdef C_FFI_DIAG
  printf ("\n");
  fflush (stdout);
#endif
  return arr;
}

#define SML_CVECTOR_VAL(ctype, x) ctype *sml_arr_##x, ctype *c_arr_##x

#define GET_SML_CVECTOR_VAL(ctype, x) (ctype *)(get_c_vector_ptr ((void *)sml_arr_##x, (void *)c_arr_##x))


/* get_c_vector_ptr_ptr */

__inline__ void **
get_c_vector_ptr_ptr (void *sml_arr, void **c_arr_ptr) {
  void **arr_ptr;
  unsigned long int n = ((unsigned long int *) sml_arr)[-2];

#ifdef C_FFI_DIAG
  printf ("[C-MLton] %s using ", __func__);
#endif
  if (*c_arr_ptr)
    {
      if (1 < n)
        {
          if (2 < n)
            {
#ifdef C_FFI_DIAG
              printf ("c_arr_ptr");
#endif
              arr_ptr = c_arr_ptr;
            }
          else
            {
#ifdef C_FFI_DIAG
              printf ("c_arr_ptr, *c_arr_ptr assigned NULL");
#endif
              *c_arr_ptr = NULL;
              arr_ptr = c_arr_ptr;
            }
        }
      else  /* (n == 1) */
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
      printf ("c_arr_ptr, *c_arr_ptr assigned sml_arr");
#endif
      *c_arr_ptr = sml_arr;
      arr_ptr = c_arr_ptr;
    }

#ifdef C_FFI_DIAG
  printf ("\n");
  fflush (stdout);
#endif
  return arr_ptr;
}

#define SML_CVECTOR_REF(ctype, x) ctype *sml_arr_##x, ctype **c_arr_ptr_##x

#define GET_SML_CVECTOR_REF(ctype, x) (ctype **)(get_c_vector_ptr_ptr ((void *)sml_arr_##x, (void **)c_arr_ptr_##x))
