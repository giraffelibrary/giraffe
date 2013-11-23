structure Property :>
  PROPERTY
    where type ('a, 'b) accessor = ('a, 'b) GObjectValue.accessor
    where type 'a objectclass_t = 'a GObjectObjectClass.t =
  struct
    val getProperty_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_object_get_property" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GObjectValueRecord.C.notnull GObjectValueRecord.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * GObjectValueRecord.C.notnull GObjectValueRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )

    type ('a, 'b) accessor = ('a, 'b) GObjectValue.accessor
    type 'a objectclass_t = 'a GObjectObjectClass.t

    fun getProperty self propertyName value =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GObjectValueRecord.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GObjectValueRecord.C.withPtr
         ---> I
      )
        setProperty_
        (
          self
           & propertyName
           & value
        )

    type ('objectclass, 'a) readonly = {get : 'objectclass -> 'a}
    type ('objectclass, 'a) writeonly = {set : 'a -> 'objectclass -> unit}
    type ('objectclass, 'a, 'b) readwrite =
      {
        get : 'objectclass -> 'a,
        set : 'b -> 'objectclass -> unit
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
