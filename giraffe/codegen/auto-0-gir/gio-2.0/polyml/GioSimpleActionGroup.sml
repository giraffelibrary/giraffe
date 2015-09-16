structure GioSimpleActionGroup :>
  GIO_SIMPLE_ACTION_GROUP
    where type 'a class_t = 'a GioSimpleActionGroupClass.t
    where type 'a action_group_class_t = 'a GioActionGroupClass.t
    where type 'a action_class_t = 'a GioActionClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_simple_action_group_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_simple_action_group_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val insert_ = call (load_sym libgio "g_simple_action_group_insert") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val lookup_ = call (load_sym libgio "g_simple_action_group_lookup") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val remove_ = call (load_sym libgio "g_simple_action_group_remove") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GioSimpleActionGroupClass.t
    type 'a action_group_class_t = 'a GioActionGroupClass.t
    type 'a action_class_t = 'a GioActionClass.t
    type t = base class_t
    fun asActionGroup self = (GObjectObjectClass.C.withPtr ---> GioActionGroupClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioSimpleActionGroupClass.C.fromPtr true) new_ ()
    fun insert self action = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) insert_ (self & action)
    fun lookup self actionName = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> GioActionClass.C.fromPtr false) lookup_ (self & actionName)
    fun remove self actionName = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) remove_ (self & actionName)
  end
