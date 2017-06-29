(* Copyright (C) 2013, 2015-2017 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GObjectClosureRecord :>
  G_OBJECT_CLOSURE_RECORD
    where type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p
    val cPtr = Pointer.PolyML.cVal
    local
      open PolyMLFFI
    in
      val take_ =
        if GiraffeDebug.isEnabled
        then
          call
            (getSymbol "giraffe_debug_closure_take")
            (cPtr --> cVoid)
        else
          ignore

      val ref_ =
        call
          (getSymbol "g_closure_ref")
          (cPtr --> cPtr)

      val sink_ =
        call
          (getSymbol "g_closure_sink")
          (cPtr --> cVoid)

      val dup_ =
        if GiraffeDebug.isEnabled
        then 
          call
            (getSymbol "giraffe_debug_closure_ref_sink")
            (cPtr --> cPtr)
        else
          fn ptr => ref_ ptr before sink_ ptr  (* must do ref before sink *)

      val free_ =
        if GiraffeDebug.isEnabled
        then
          call
            (getSymbol "giraffe_debug_g_closure_unref")
            (cPtr --> cVoid)
        else
          call
            (getSymbol "g_closure_unref")
            (cPtr --> cVoid)
    end
    structure Record =
      BoxedRecord(
        structure Pointer = Pointer
        type notnull = notnull
        type 'a p = 'a p
        val dup_ = dup_
        val take_ = take_
        val free_ = free_
      )
    open Record
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_closure_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_boxed") (GObjectValueRecord.PolyML.cPtr --> PolyML.cPtr)
      val getOptValue_ = call (getSymbol "g_value_get_boxed") (GObjectValueRecord.PolyML.cPtr --> PolyML.cOptPtr)
      val setValue_ = call (getSymbol "g_value_set_boxed") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cPtr --> PolyMLFFI.cVoid)
      val setOptValue_ = call (getSymbol "g_value_set_boxed") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cOptPtr --> PolyMLFFI.cVoid)
    end
    type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromPtr false) getValue_,
          setValue = (I &&&> FFI.withPtr ---> I) setValue_
        }
    val tOpt =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr ---> I) setOptValue_
        }
  end
