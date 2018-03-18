structure GioPropertyAction :>
  GIO_PROPERTY_ACTION
    where type 'a class = 'a GioPropertyActionClass.class
    where type 'a action_class = 'a GioActionClass.class =
  struct
    val getType_ = _import "g_property_action_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2)
         & x3
         & (x4, x5) =>
          (
            _import "mlton_g_property_action_new" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GioPropertyActionClass.FFI.notnull GioPropertyActionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    type 'a class = 'a GioPropertyActionClass.class
    type 'a action_class = 'a GioActionClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.FFI.withPtr ---> GioActionClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        name,
        object,
        propertyName
      ) =
      (
        Utf8.FFI.withPtr
         &&&> GObjectObjectClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
