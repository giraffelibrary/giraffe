structure AtkImplementorIface :>
  ATK_IMPLEMENTOR_IFACE
    where type 'a class_t = 'a AtkImplementorIfaceClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_implementor_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
    end
    type 'a class_t = 'a AtkImplementorIfaceClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
