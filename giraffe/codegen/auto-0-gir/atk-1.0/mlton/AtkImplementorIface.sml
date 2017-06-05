structure AtkImplementorIface :>
  ATK_IMPLEMENTOR_IFACE
    where type 'a class = 'a AtkImplementorIfaceClass.class =
  struct
    val getType_ = _import "atk_implementor_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a AtkImplementorIfaceClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
