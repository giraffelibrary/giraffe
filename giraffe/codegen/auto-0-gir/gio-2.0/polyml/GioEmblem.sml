structure GioEmblem :>
  GIO_EMBLEM
    where type 'a class_t = 'a GioEmblemClass.t
    where type 'a iconclass_t = 'a GioIconClass.t
    where type emblemorigin_t = GioEmblemOrigin.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_emblem_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_emblem_new") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val newWithOrigin_ = call (load_sym libgio "g_emblem_new_with_origin") (GObjectObjectClass.PolyML.PTR &&> GioEmblemOrigin.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val getIcon_ = call (load_sym libgio "g_emblem_get_icon") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getOrigin_ = call (load_sym libgio "g_emblem_get_origin") (GObjectObjectClass.PolyML.PTR --> GioEmblemOrigin.PolyML.VAL)
    end
    type 'a class_t = 'a GioEmblemClass.t
    type 'a iconclass_t = 'a GioIconClass.t
    type emblemorigin_t = GioEmblemOrigin.t
    fun asIcon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new icon = (GObjectObjectClass.C.withPtr ---> GioEmblemClass.C.fromPtr true) new_ icon
    fun newWithOrigin icon origin = (GObjectObjectClass.C.withPtr &&&> GioEmblemOrigin.C.withVal ---> GioEmblemClass.C.fromPtr true) newWithOrigin_ (icon & origin)
    fun getIcon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr false) getIcon_ self
    fun getOrigin self = (GObjectObjectClass.C.withPtr ---> GioEmblemOrigin.C.fromVal) getOrigin_ self
    local
      open Property
    in
      val iconProp =
        {
          get = fn x => get "icon" GObjectObjectClass.tOpt x,
          set = fn x => set "icon" GObjectObjectClass.tOpt x
        }
      val originProp =
        {
          get = fn x => get "origin" GioEmblemOrigin.t x,
          set = fn x => set "origin" GioEmblemOrigin.t x
        }
    end
  end
