structure AtkImplementorIface :>
  ATK_IMPLEMENTOR_IFACE
    where type 'a class_t = 'a AtkImplementorIfaceClass.t =
  struct
    val getType_ = _import "atk_implementor_get_type" : unit -> GObjectType.C.val_;
    type 'a class_t = 'a AtkImplementorIfaceClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
