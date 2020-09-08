structure GioPropertyAction :>
  GIO_PROPERTY_ACTION
    where type 'a class = 'a GioPropertyActionClass.class
    where type 'a action_class = 'a GioActionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_property_action_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "g_property_action_new")
          (
            Utf8.PolyML.cInPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> GioPropertyActionClass.PolyML.cPtr
          )
    end
    type 'a class = 'a GioPropertyActionClass.class
    type 'a action_class = 'a GioActionClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.FFI.withPtr false ---> GioActionClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        name,
        object,
        propertyName
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> GObjectObjectClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         ---> GioPropertyActionClass.FFI.fromPtr true
      )
        new_
        (
          name
           & object
           & propertyName
        )
    local
      open ValueAccessor
    in
      val enabledProp =
        {
          name = "enabled",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val invertBooleanProp =
        {
          name = "invert-boolean",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = fn x => C.set boolean x
        }
      val nameProp =
        {
          name = "name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val objectProp =
        {
          name = "object",
          gtype = fn () => C.gtype GObjectObjectClass.tOpt (),
          get = ignore,
          set = ignore,
          init = fn x => C.set GObjectObjectClass.tOpt x
        }
      val parameterTypeProp =
        {
          name = "parameter-type",
          gtype = fn () => C.gtype GLibVariantTypeRecord.tOpt (),
          get = fn x => fn () => C.get GLibVariantTypeRecord.tOpt x,
          set = ignore,
          init = ignore
        }
      val propertyNameProp =
        {
          name = "property-name",
          gtype = fn () => C.gtype stringOpt (),
          get = ignore,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val stateProp =
        {
          name = "state",
          gtype = fn () => C.gtype GLibVariantRecord.tOpt (),
          get = fn x => fn () => C.get GLibVariantRecord.tOpt x,
          set = ignore,
          init = ignore
        }
      val stateTypeProp =
        {
          name = "state-type",
          gtype = fn () => C.gtype GLibVariantTypeRecord.tOpt (),
          get = fn x => fn () => C.get GLibVariantTypeRecord.tOpt x,
          set = ignore,
          init = ignore
        }
    end
  end
