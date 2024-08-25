(* Copyright (C) 2024 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature GIRAFFE =
  sig
    include GIRAFFE

    type g_lib_main_context_t
    structure Finalize :
      GIRAFFE_FINALIZE where type g_lib_main_context_t = g_lib_main_context_t
  end
