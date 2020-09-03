(* Copyright (C) 2012-2013, 2017-2018, 2020 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure Property :>
  PROPERTY
    where type value_t = GObjectValueRecord.t
    where type ('a, 'b) accessor = ('a, 'b) ValueAccessor.t
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

    type value_t = GObjectValueRecord.t
    type ('a, 'b) accessor = ('a, 'b) ValueAccessor.t
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

    type 'object_class t =
      {name : string, value : unit -> GObject.ValueRecord.t}

    fun new name t x = {name = name, value = fn () => ValueAccessor.new t x}

    fun name {name, ...} = name
    fun value {value, ...} = value ()
    fun conv _ t = t

    fun get name t object =
      let
        val value = GObjectValue.new ()
        val () = GObjectValue.init value (ValueAccessor.gtype t)
        val () = getProperty object (name, value)
      in
        ValueAccessor.get t value
      end

    fun set name t x object =
      let
        val value = GObjectValue.new ()
        val () = GObjectValue.init value (ValueAccessor.gtype t)
        val () = ValueAccessor.set t value x
        val () = setProperty object (name, value)
      in
        ()        
      end
  end

fun propConv asX {get, set, new} =
  {
    get = get o asX,
    set = fn a => set a o asX,
    new = Property.conv asX o new
  }
