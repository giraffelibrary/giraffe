structure AtkImplementorIface :>
  ATK_IMPLEMENTOR_IFACE
    where type 'a class = 'a AtkImplementorIfaceClass.class =
  struct
    val getType_ = _import "atk_implementor_get_type" : unit -> GObjectType.C.val_;
    type 'a class = 'a AtkImplementorIfaceClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
