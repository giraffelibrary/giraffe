(* Copyright (C) 2013, 2016-2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature G_OBJECT_TYPE =
  sig
    include C_SCALAR_EQ_NULL

    val isValueType : t -> bool
    val isA : t * t -> bool
    val name : t -> string
    val fromName : string -> t option

    val invalid         : unit -> t
    val none            : unit -> t
    val interface       : unit -> t
    val char            : unit -> t
    val uchar           : unit -> t
    val boolean         : unit -> t
    val int             : unit -> t
    val uint            : unit -> t
    val long            : unit -> t
    val ulong           : unit -> t
    val int64           : unit -> t
    val uint64          : unit -> t
    val enum            : unit -> t
    val flags           : unit -> t
    val float           : unit -> t
    val double          : unit -> t
    val string          : unit -> t
    val pointer         : unit -> t
    val boxed           : unit -> t
    val param           : unit -> t
    val object          : unit -> t
    val gtype           : unit -> t
    val variant         : unit -> t
    val paramChar       : unit -> t
    val paramUChar      : unit -> t
    val paramBoolean    : unit -> t
    val paramInt        : unit -> t
    val paramUInt       : unit -> t
    val paramLong       : unit -> t
    val paramULong      : unit -> t
    val paramInt64      : unit -> t
    val paramUInt64     : unit -> t
    val paramUnichar    : unit -> t
    val paramEnum       : unit -> t
    val paramFlags      : unit -> t
    val paramFloat      : unit -> t
    val paramDouble     : unit -> t
    val paramString     : unit -> t
    val paramParam      : unit -> t
    val paramBoxed      : unit -> t
    val paramPointer    : unit -> t
    val paramValueArray : unit -> t
    val paramObject     : unit -> t
    val paramOverride   : unit -> t
    val paramGType      : unit -> t
    val paramVariant    : unit -> t
  end
