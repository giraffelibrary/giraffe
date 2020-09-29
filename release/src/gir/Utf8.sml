(* Copyright (C) 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

local
  structure GCharArrayType =
    CValueCArrayType(
      structure CElemType = GCharType
      structure ElemSequence = MonoVectorSequence(CharVector)
    )
  structure GCharArray = CArray(GCharArrayType)
in
  structure Utf8 :> UTF8 = VectorCArray(GCharArray)
end
