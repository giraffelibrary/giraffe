(* Copyright (C) 2013, 2016-2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature G_OBJECT_TYPE =
  sig
    structure C :
      sig
        structure ValueType : C_VALUE_EQ_TYPE
      end

    include C_SCALAR
      where type t = C.ValueType.t
      where type FFI.val_ = C.ValueType.v

    val isValueType : t -> bool
    val name : t -> string
    val fromName : string -> t option

    val boolean : unit -> t
    val int     : unit -> t
    val uint    : unit -> t
    val long    : unit -> t
    val ulong   : unit -> t
    val int64   : unit -> t
    val uint64  : unit -> t
    val float   : unit -> t
    val double  : unit -> t
    val char    : unit -> t
    val string  : unit -> t
    val pointer : unit -> t
    val variant : unit -> t
  end
