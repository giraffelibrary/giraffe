(* Copyright (C) 2017-2018, 2021 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GObjectType : G_OBJECT_TYPE =
  struct
    open GObject.Type
    local
      open PolyMLFFI
    in
      val getValue_ = call (externalFunctionSymbol "g_value_get_gtype") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (externalFunctionSymbol "g_value_set_gtype") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = gtype,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
  end
