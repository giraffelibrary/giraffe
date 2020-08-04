structure AtkPlug :>
  ATK_PLUG
    where type 'a class = 'a AtkPlugClass.class
    where type 'a component_class = 'a AtkComponentClass.class =
  struct
    val getType_ = _import "atk_plug_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "atk_plug_new" : unit -> AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p;
    val getId_ = _import "atk_plug_get_id" : AtkPlugClass.FFI.non_opt AtkPlugClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    type 'a class = 'a AtkPlugClass.class
    type 'a component_class = 'a AtkComponentClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.FFI.withPtr false ---> AtkComponentClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> AtkPlugClass.FFI.fromPtr true) new_ ()
    fun getId self = (AtkPlugClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getId_ self
  end
