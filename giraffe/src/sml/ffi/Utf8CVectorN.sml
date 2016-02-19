(* Copyright (C) 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure Utf8CVectorN : UTF8_C_VECTOR_N =
  FFIArray (
    structure CArray = GCharCVectorVectorN
    type t = string list
    val tabulate = List.tabulate
    val toVector = Vector.fromList
  )
