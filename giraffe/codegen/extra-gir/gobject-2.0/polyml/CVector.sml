(* Copyright (C) 2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

functor CVector(CArrayType : C_ARRAY_TYPE where type 'a from_p = 'a) :
  sig
    include C_ARRAY
    val t : (t FFI.from_p, unit) ValueAccessor.t
    val tOpt : (t option FFI.from_p, unit) ValueAccessor.t
  end =
  struct
    structure Array = CVector(CArrayType)
    open Array

    local
      open PolyMLFFI
    in
      val getValue_ =
        call
          (getSymbol "g_value_get_pointer")
          (GObjectValueRecord.PolyML.cPtr --> PolyML.cOutPtr);

      val getOptValue_ =
        call
          (getSymbol "g_value_get_pointer")
          (GObjectValueRecord.PolyML.cPtr --> PolyML.cOutOptPtr);
    end

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
