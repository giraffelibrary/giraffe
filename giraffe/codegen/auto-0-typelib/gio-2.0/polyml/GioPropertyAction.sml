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
      open Property
    in
      val enabledProp = {get = fn x => get "enabled" boolean x}
      val invertBooleanProp =
        {
          get = fn x => get "invert-boolean" boolean x,
          new = fn x => new "invert-boolean" boolean x
        }
      val nameProp =
        {
          get = fn x => get "name" stringOpt x,
          new = fn x => new "name" stringOpt x
        }
      val objectProp = {new = fn x => new "object" GObjectObjectClass.tOpt x}
      val parameterTypeProp = {get = fn x => get "parameter-type" GLibVariantTypeRecord.tOpt x}
      val propertyNameProp = {new = fn x => new "property-name" stringOpt x}
      val stateProp = {get = fn x => get "state" GLibVariantRecord.tOpt x}
      val stateTypeProp = {get = fn x => get "state-type" GLibVariantTypeRecord.tOpt x}
    end
  end
