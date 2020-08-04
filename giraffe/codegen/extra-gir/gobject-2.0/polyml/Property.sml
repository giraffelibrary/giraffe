(* Copyright (C) 2012-2013, 2017-2018 Phil Clayton <phil.clayton@veonix.com>
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
    local
      open PolyMLFFI
    in
      val getProperty_ =
        call (getSymbol "g_object_get_property")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> cVoid
          )

      val setProperty_ =
        call (getSymbol "g_object_set_property")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> cVoid
          )
    end

    type value_t = GObjectValueRecord.t
    type ('a, 'b) accessor = ('a, 'b) ValueAccessor.t
    type 'a object_class = 'a GObjectObjectClass.class

    fun getProperty self propertyName value =
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

    fun setProperty self propertyName value =
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
        val value = GObjectValue.init (ValueAccessor.gtype t)
      in
        getProperty object name value;
        ValueAccessor.get t value
      end

    fun set name t x object =
      let
        val value = GObjectValue.init (ValueAccessor.gtype t)
      in
        ValueAccessor.set t value x;
        setProperty object name value
      end
  end

fun propConv asX {get, set, new} =
  {
    get = get o asX,
    set = fn a => set a o asX,
    new = Property.conv asX o new
  }
