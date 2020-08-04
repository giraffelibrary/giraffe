structure GioSimpleActionGroup :>
  GIO_SIMPLE_ACTION_GROUP
    where type 'a class = 'a GioSimpleActionGroupClass.class
    where type 'a action_group_class = 'a GioActionGroupClass.class
    where type 'a action_map_class = 'a GioActionMapClass.class
    where type 'a action_class = 'a GioActionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_simple_action_group_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_simple_action_group_new") (cVoid --> GioSimpleActionGroupClass.PolyML.cPtr)
      val insert_ = call (getSymbol "g_simple_action_group_insert") (GioSimpleActionGroupClass.PolyML.cPtr &&> GioActionClass.PolyML.cPtr --> cVoid)
      val lookup_ = call (getSymbol "g_simple_action_group_lookup") (GioSimpleActionGroupClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioActionClass.PolyML.cPtr)
      val remove_ = call (getSymbol "g_simple_action_group_remove") (GioSimpleActionGroupClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type 'a class = 'a GioSimpleActionGroupClass.class
    type 'a action_group_class = 'a GioActionGroupClass.class
    type 'a action_map_class = 'a GioActionMapClass.class
    type 'a action_class = 'a GioActionClass.class
    type t = base class
    fun asActionGroup self = (GObjectObjectClass.FFI.withPtr false ---> GioActionGroupClass.FFI.fromPtr false) I self
    fun asActionMap self = (GObjectObjectClass.FFI.withPtr false ---> GioActionMapClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioSimpleActionGroupClass.FFI.fromPtr true) new_ ()
    fun insert self action = (GioSimpleActionGroupClass.FFI.withPtr false &&&> GioActionClass.FFI.withPtr false ---> I) insert_ (self & action)
    fun lookup self actionName = (GioSimpleActionGroupClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GioActionClass.FFI.fromPtr false) lookup_ (self & actionName)
    fun remove self actionName = (GioSimpleActionGroupClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) remove_ (self & actionName)
  end
