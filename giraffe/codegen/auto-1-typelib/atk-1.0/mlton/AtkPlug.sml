structure AtkPlug :>
  ATK_PLUG
    where type 'a class_t = 'a AtkPlugClass.t
    where type 'a componentclass_t = 'a AtkComponentClass.t =
  struct
    val getType_ = _import "atk_plug_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "atk_plug_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getId_ = _import "atk_plug_get_id" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    type 'a class_t = 'a AtkPlugClass.t
    type 'a componentclass_t = 'a AtkComponentClass.t
    fun asComponent self = (GObjectObjectClass.C.withPtr ---> AtkComponentClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> AtkPlugClass.C.fromPtr true) new_ ()
    fun getId self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr true) getId_ self
  end
