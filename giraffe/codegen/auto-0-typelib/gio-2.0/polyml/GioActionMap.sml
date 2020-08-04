structure GioActionMap :>
  GIO_ACTION_MAP
    where type 'a class = 'a GioActionMapClass.class
    where type 'a action_class = 'a GioActionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_action_map_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val addAction_ = call (getSymbol "g_action_map_add_action") (GioActionMapClass.PolyML.cPtr &&> GioActionClass.PolyML.cPtr --> cVoid)
      val lookupAction_ = call (getSymbol "g_action_map_lookup_action") (GioActionMapClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioActionClass.PolyML.cPtr)
      val removeAction_ = call (getSymbol "g_action_map_remove_action") (GioActionMapClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type 'a class = 'a GioActionMapClass.class
    type 'a action_class = 'a GioActionClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun addAction self action = (GioActionMapClass.FFI.withPtr false &&&> GioActionClass.FFI.withPtr false ---> I) addAction_ (self & action)
    fun lookupAction self actionName = (GioActionMapClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GioActionClass.FFI.fromPtr false) lookupAction_ (self & actionName)
    fun removeAction self actionName = (GioActionMapClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) removeAction_ (self & actionName)
  end
