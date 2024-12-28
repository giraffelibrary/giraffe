(* Copyright (C) 2020-2021, 2024 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor ConstCArray(CArrayType : C_ARRAY_TYPE where type 'a from_p = 'a) :>
  C_ARRAY
    where type elem = CArrayType.elem
    where type sequence = CArrayType.t
    where type 'a update = 'a
    where type 'a C.ArrayType.from_p = 'a CArrayType.from_p
    where type 'a C.p = 'a CArrayType.p
    where type C.opt = CArrayType.opt
    where type C.non_opt = CArrayType.non_opt
    where type 'a value_accessor_t = 'a ValueAccessor.t =
  struct
    structure Array = ConstCArray(CArrayType)
    open Array

(**
 * MLton does not allow _import to depend on a type that resolves only to 
 * a type in a functor argument.
 * 
    val getValue_ =
      _import "g_value_get_pointer" :
        GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.non_opt FFI.out_p;

    val getOptValue_ =
      _import "g_value_get_pointer" :
        GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> unit FFI.out_p;

    type 'a value_accessor_t = 'a ValueAccessor.t

    val t =
      ValueAccessor.C.createAccessor {
        getType  = GObjectType.pointer,
        getValue = (I ---> FFI.fromPtr 0) getValue_,
        setValue = fn _ => Giraffe.Log.critical "cannot set GValue from C array"
      }

    val tOpt =
      ValueAccessor.C.createAccessor {
        getType  = GObjectType.pointer,
        getValue = (I ---> FFI.fromOptPtr 0) getOptValue_,
        setValue = fn _ => Giraffe.Log.critical "cannot set GValue from C array"
      }
 *
 **)

    type 'a value_accessor_t = 'a ValueAccessor.t

    val t =
      ValueAccessor.C.createAccessor {
        getType  = GObjectType.pointer,
        getValue = fn _ => raise Fail "cannot get C array from GValue with MLton",
        setValue = fn _ => Giraffe.Log.critical "cannot set GValue from C array"
      }

    val tOpt =
      ValueAccessor.C.createAccessor {
        getType  = GObjectType.pointer,
        getValue = fn _ => raise Fail "cannot get C array from GValue with MLton",
        setValue = fn _ => Giraffe.Log.critical "cannot set GValue from C array"
      }
  end
