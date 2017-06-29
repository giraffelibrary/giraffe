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

    val take_ =
      if GiraffeDebug.isEnabled
      then _import "giraffe_debug_closure_take" : notnull p -> unit;
      else ignore

    val ref_ = _import "g_closure_ref" : notnull p -> notnull p;

    val sink_ = _import "g_closure_sink" : notnull p -> unit;

    val dup_ =
      if GiraffeDebug.isEnabled
      then _import "giraffe_debug_closure_ref_sink" : notnull p -> notnull p;
      else fn ptr => ref_ ptr before sink_ ptr  (* must do ref before sink *)

    val free_ =
      if GiraffeDebug.isEnabled
      then _import "giraffe_debug_g_closure_unref" : notnull p -> unit;
      else _import "g_closure_unref" : notnull p -> unit;

    type ('a, 'b) value_accessor = ('a, 'b) GObjectValue.accessor

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
    val getType_ = _import "g_closure_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_boxed" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.notnull FFI.p;
    val getOptValue_ = _import "g_value_get_boxed" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> unit FFI.p;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_boxed" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.notnull FFI.p -> unit;) (x1, x2)
    val setOptValue_ = fn x1 & x2 => (_import "g_value_set_boxed" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * unit FFI.p -> unit;) (x1, x2)
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
