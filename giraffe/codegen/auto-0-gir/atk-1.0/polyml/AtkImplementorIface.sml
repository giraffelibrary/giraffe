structure AtkImplementorIface :>
  ATK_IMPLEMENTOR_IFACE
    where type 'a class = 'a AtkImplementorIfaceClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_implementor_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a AtkImplementorIfaceClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
