(* Copyright (C) 2012-2013, 2017-2018, 2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure Property :>
  PROPERTY
    where type type_t = GObjectType.t
    where type value_v = GObjectValueRecord.C.v
    where type 'a object_class = 'a GObjectObjectClass.class =
  struct
    val getProperty_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_object_get_property" :
              GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )

    val setProperty_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_object_set_property" :
              GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )

    type type_t = GObjectType.t
    type value_v = GObjectValueRecord.C.v
    type 'a object_class = 'a GObjectObjectClass.class

    fun getProperty self (propertyName, value) =
      (
        GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectValueRecord.FFI.withPtr false
         ---> I
      )
        getProperty_
        (
          self
           & propertyName
           & value
        )

    fun setProperty self (propertyName, value) =
      (
        GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectValueRecord.FFI.withPtr false
         ---> I
      )
        setProperty_
        (
          self
           & propertyName
           & value
        )

    type ('object_class, 'get, 'set, 'init) t =
      {
        name  : string,
        gtype : unit -> type_t,  (* function due to value restriction *)
        get   : GObjectValueRecord.C.v -> 'get,
        set   : GObjectValueRecord.C.v -> 'set,
        init  : GObjectValueRecord.C.v -> 'init
      }

    fun conv _ = Fn.id

    fun get {name, gtype, get, ...} object =
      let
        val value = GObjectValue.new ()
        val () = GObjectValue.init value (gtype ())
        val () = getProperty object (name, value)
      in
        (GObjectValueRecord.FFI.withPtr false ---> I) get value ()
      end

    fun set {name, gtype, set, ...} x object =
      let
        val value = GObjectValue.new ()
        val () = GObjectValue.init value (gtype ())
        val () = (GObjectValueRecord.FFI.withPtr false ---> I) set value x
        val () = setProperty object (name, value)
      in
        ()        
      end

    type 'object_class init_t =
      {
        name : string,
        init : GObjectValueRecord.C.v -> unit
      }

    fun init {name, gtype, init, ...} x =
      {
        name = name,
        init = fn v => (ValueAccessor.C.init v (gtype ()); init v x)
      }

    fun initName {name, ...} = name
    fun initValue {init, ...} v = init v
  end
