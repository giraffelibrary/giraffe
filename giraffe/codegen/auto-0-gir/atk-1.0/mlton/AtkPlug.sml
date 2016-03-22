structure AtkPlug :>
  ATK_PLUG
    where type 'a class = 'a AtkPlugClass.class
    where type 'a component_class = 'a AtkComponentClass.class =
  struct
    val getType_ = _import "atk_plug_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "atk_plug_new" : unit -> AtkObjectClass.C.notnull AtkObjectClass.C.p;
    val getId_ = _import "atk_plug_get_id" : AtkPlugClass.C.notnull AtkPlugClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    type 'a class = 'a AtkPlugClass.class
    type 'a component_class = 'a AtkComponentClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.C.withPtr ---> AtkComponentClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> AtkPlugClass.C.fromPtr true) new_ ()
    fun getId self = (AtkPlugClass.C.withPtr ---> Utf8.C.fromPtr true) getId_ self
  end
