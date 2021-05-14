(* Copyright (C) 2019-2021 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CArray(CArrayType : C_ARRAY_TYPE where type 'a from_p = 'a) :>
  C_ARRAY
    where type elem = CArrayType.elem
    where type sequence = CArrayType.t
    where type 'a update = unit
    where type 'a C.ArrayType.from_p = 'a CArrayType.from_p
    where type C.ArrayType.e = CArrayType.e
    where type 'a C.ArrayType.p = 'a CArrayType.p
    where type C.ArrayType.opt = CArrayType.opt
    where type C.ArrayType.non_opt = CArrayType.non_opt
    where type 'a value_accessor_t = 'a ValueAccessor.t =
  struct
    structure Array = CArray(CArrayType)
    open Array

    local
      open PolyMLFFI
    in
      val getValue_ =
        call
          (externalFunctionSymbol "g_value_get_pointer")
          (GObjectValueRecord.PolyML.cPtr --> PolyML.cOutPtr);

      val getOptValue_ =
        call
          (externalFunctionSymbol "g_value_get_pointer")
          (GObjectValueRecord.PolyML.cPtr --> PolyML.cOutOptPtr);
    end

    type 'a value_accessor_t = 'a ValueAccessor.t

    val t =
      ValueAccessor.C.createAccessor {
        getType  = GObjectType.pointer,
        getValue = (I ---> FFI.fromPtr 0) getValue_,
        setValue = fn _ => GiraffeLog.critical "cannot set GValue from C array"
      }

    val tOpt =
      ValueAccessor.C.createAccessor {
        getType  = GObjectType.pointer,
        getValue = (I ---> FFI.fromOptPtr 0) getOptValue_,
        setValue = fn _ => GiraffeLog.critical "cannot set GValue from C array"
      }
  end
