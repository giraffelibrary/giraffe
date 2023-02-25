(* Copyright (C) 2017-2018, 2021, 2023 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature G_OBJECT_VALUE_RECORD =
  sig
    include G_OBJECT_VALUE_RECORD
    val t : t ValueAccessor.t
    val tOpt : t option ValueAccessor.t
  end
