(* Copyright (C) 2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CVectorN(CArrayType : C_ARRAY_TYPE where type 'a from_p = int -> 'a) :
  sig
    include C_ARRAY
    val t : (t FFI.from_p, unit) GObjectValue.accessor
    val tOpt : (t option FFI.from_p, unit) GObjectValue.accessor
  end =
  struct
    structure Array = CVectorN(CArrayType)
    open Array

(**
 * MLton does not allow _import to depend on a type that resolves only to 
 * a type in a functor argument.
 * 
    val getValue_ =
      _import "g_value_get_object" :
        GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.notnull FFI.out_p;

    val getOptValue_ =
      _import "g_value_get_object" :
        GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> unit FFI.out_p;

    val t =
      GObjectValue.C.createAccessor {
        getType  = GObjectType.pointer,
        getValue = (I ---> FFI.fromPtr 0) getValue_,
        setValue = fn _ => GiraffeLog.critical "cannot set GValue from C array"
      }

    val tOpt =
      GObjectValue.C.createAccessor {
        getType  = GObjectType.pointer,
        getValue = (I ---> FFI.fromOptPtr 0) getOptValue_,
        setValue = fn _ => GiraffeLog.critical "cannot set GValue from C array"
      }
 *
 **)

    val t =
      GObjectValue.C.createAccessor {
        getType  = GObjectType.pointer,
        getValue = fn _ => raise Fail "cannot get C array from GValue with MLton",
        setValue = fn _ => GiraffeLog.critical "cannot set GValue from C array"
      }

    val tOpt =
      GObjectValue.C.createAccessor {
        getType  = GObjectType.pointer,
        getValue = fn _ => raise Fail "cannot get C array from GValue with MLton",
        setValue = fn _ => GiraffeLog.critical "cannot set GValue from C array"
      }
  end