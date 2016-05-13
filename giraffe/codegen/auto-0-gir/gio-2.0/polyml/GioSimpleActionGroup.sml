structure GioSimpleActionGroup :>
  GIO_SIMPLE_ACTION_GROUP
    where type 'a class = 'a GioSimpleActionGroupClass.class
    where type 'a action_group_class = 'a GioActionGroupClass.class
    where type 'a action_class = 'a GioActionClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_simple_action_group_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_simple_action_group_new") (PolyMLFFI.cVoid --> GioSimpleActionGroupClass.PolyML.cPtr)
      val insert_ = call (load_sym libgio "g_simple_action_group_insert") (GioSimpleActionGroupClass.PolyML.cPtr &&> GioActionClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val lookup_ = call (load_sym libgio "g_simple_action_group_lookup") (GioSimpleActionGroupClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioActionClass.PolyML.cPtr)
      val remove_ = call (load_sym libgio "g_simple_action_group_remove") (GioSimpleActionGroupClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GioSimpleActionGroupClass.class
    type 'a action_group_class = 'a GioActionGroupClass.class
    type 'a action_class = 'a GioActionClass.class
    type t = base class
    fun asActionGroup self = (GObjectObjectClass.C.withPtr ---> GioActionGroupClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioSimpleActionGroupClass.C.fromPtr true) new_ ()
    fun insert self action = (GioSimpleActionGroupClass.C.withPtr &&&> GioActionClass.C.withPtr ---> I) insert_ (self & action)
    fun lookup self actionName = (GioSimpleActionGroupClass.C.withPtr &&&> Utf8.C.withPtr ---> GioActionClass.C.fromPtr false) lookup_ (self & actionName)
    fun remove self actionName = (GioSimpleActionGroupClass.C.withPtr &&&> Utf8.C.withPtr ---> I) remove_ (self & actionName)
  end
