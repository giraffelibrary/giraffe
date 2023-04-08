(* Copyright (C) 2013, 2016-2021, 2023 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GObjectObjectClass :>
  G_OBJECT_OBJECT_CLASS
    where type type_t = GObjectType.t =
  struct
    structure Pointer = CPointer(GMemory)
    type opt = Pointer.opt
    type non_opt = Pointer.non_opt
    type 'a p = 'a Pointer.p
    type ('a, 'b) r = ('a, 'b) Pointer.r

    local
      val (_, setDebugClosure) =
        _symbol "giraffe_debug_closure" external :
          (unit -> bool) * (bool -> unit);
      val (_, setDebugRefCount) =
        _symbol "giraffe_debug_ref_count" external :
          (unit -> bool) * (bool -> unit);

      fun initDebugFlags () =
        if GiraffeDebug.isEnabled
        then
          let
            val () = setDebugClosure (GiraffeDebug.getClosure ());
            val () = setDebugRefCount (GiraffeDebug.getRefCount ())
          in
            ()
          end
        else ()
    in
      val () = initDebugFlags ()
    end

    val take_ =
      let
        val isFloating_ = _import "g_object_is_floating" : non_opt p -> GBool.FFI.val_;
        val diag_ =
          if GiraffeDebug.isEnabled
          then (_import "giraffe_debug_object_take" : non_opt p -> unit;)
          else ignore
      in
        fn ptr => (
          if GBool.FFI.fromVal (isFloating_ ptr)
          then GiraffeLog.critical "taking ownership of floating reference"
          else ();
          diag_ ptr
        )
      end

    val dup_ =
      if GiraffeDebug.isEnabled
      then _import "giraffe_debug_g_object_ref_sink" : non_opt p -> non_opt p;
      else _import "g_object_ref_sink" : non_opt p -> non_opt p;

    val free_ =
      if GiraffeDebug.isEnabled
      then _import "giraffe_debug_g_object_unref" : non_opt p -> unit;
      else _import "g_object_unref" : non_opt p -> unit;

    val instanceType_ =
      _import "giraffe_g_object_type" : non_opt p -> GObjectType.FFI.val_;

    fun checkInstance_ subclass instance =
      let
        val instanceType = GObjectType.FFI.fromVal (instanceType_ instance)
        val derivedType = ValueAccessor.gtype subclass
      in
        if GObjectType.isA (instanceType, derivedType)
        then ()
        else
          GiraffeLog.critical (
            String.concat [
              "Invalid downcast to type ", GObjectType.name derivedType,
              " on object of type ",       GObjectType.name instanceType
            ]
          )
      end

    structure Class =
      Class(
        structure Pointer = Pointer
        type opt = opt
        type non_opt = non_opt
        type 'a p = 'a p
        type 'a value_accessor_t = 'a ValueAccessor.t
        val take_ = take_
        val dup_ = dup_
        val free_ = free_
        val checkInstance_ = checkInstance_
      )
    open Class

    val getType_ =
      _import "g_object_get_type" : unit -> GObjectType.FFI.val_;

    val getValue_ =
      _import "g_value_get_object" :
        GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.non_opt FFI.p;

    val getOptValue_ =
      _import "g_value_get_object" :
        GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.opt FFI.p;

    val setValue_ =
      fn x1 & x2 =>
        (_import "g_value_set_object" :
           GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.non_opt FFI.p -> unit;)
        (x1, x2)

    val setOptValue_ =
      fn x1 & x2 =>
        (_import "g_value_set_object" :
           GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.opt FFI.p -> unit;)
        (x1, x2)

    type type_t = GObjectType.t

    val t =
      ValueAccessor.C.createAccessor {
        getType  = (I ---> GObjectType.FFI.fromVal) getType_,
        getValue = (I ---> FFI.fromPtr false) getValue_,
        setValue = (I &&&> FFI.withPtr false ---> I) setValue_
      }

    val tOpt =
      ValueAccessor.C.createAccessor {
        getType  = (I ---> GObjectType.FFI.fromVal) getType_,
        getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
        setValue = (I &&&> FFI.withOptPtr false ---> I) setOptValue_
      }

    local
      val call = FFI.withPtr false ---> GObjectType.FFI.fromVal
    in
      fun instanceType object = call instanceType_ (toBase object)
    end
  end
