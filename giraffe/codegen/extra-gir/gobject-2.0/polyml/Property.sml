(* Copyright (C) 2012-2013 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure Property :>
  PROPERTY
    where type ('a, 'b) accessor = ('a, 'b) GObjectValue.accessor
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
             --> PolyMLFFI.cVoid
          )

      val setProperty_ =
        call (getSymbol "g_object_set_property")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
    end

    type ('a, 'b) accessor = ('a, 'b) GObjectValue.accessor
    type 'a object_class = 'a GObjectObjectClass.class

    fun getProperty self propertyName value =
      (
        GObjectObjectClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectValueRecord.FFI.withPtr
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
        GObjectObjectClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectValueRecord.FFI.withPtr
         ---> I
      )
        setProperty_
        (
          self
           & propertyName
           & value
        )

    type ('object_class, 'a) readonly = {get : 'object_class -> 'a}
    type ('object_class, 'a) writeonly = {set : 'a -> 'object_class -> unit}
    type ('object_class, 'a, 'b) readwrite =
      {
        get : 'object_class -> 'a,
        set : 'b -> 'object_class -> unit
      }

    fun get name t object =
      let
        val value = GObjectValue.init (GObjectValue.baseType t)
      in
        getProperty object name value;
        GObjectValue.get t value
      end

    fun set name t x object =
      let
        val value = GObjectValue.init (GObjectValue.baseType t)
      in
        GObjectValue.set t value x;
        setProperty object name value
      end
  end
