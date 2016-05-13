structure AtkPlug :>
  ATK_PLUG
    where type 'a class = 'a AtkPlugClass.class
    where type 'a component_class = 'a AtkComponentClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_plug_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libatk "atk_plug_new") (PolyMLFFI.cVoid --> AtkObjectClass.PolyML.cPtr)
      val getId_ = call (load_sym libatk "atk_plug_get_id") (AtkPlugClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type 'a class = 'a AtkPlugClass.class
    type 'a component_class = 'a AtkComponentClass.class
    type t = base class
    fun asComponent self = (GObjectObjectClass.C.withPtr ---> AtkComponentClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> AtkPlugClass.C.fromPtr true) new_ ()
    fun getId self = (AtkPlugClass.C.withPtr ---> Utf8.C.fromPtr true) getId_ self
  end
