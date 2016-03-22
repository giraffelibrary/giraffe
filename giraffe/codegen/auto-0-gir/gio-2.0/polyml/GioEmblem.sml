structure GioEmblem :>
  GIO_EMBLEM
    where type 'a class = 'a GioEmblemClass.class
    where type 'a icon_class = 'a GioIconClass.class
    where type emblem_origin_t = GioEmblemOrigin.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_emblem_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_emblem_new") (GioIconClass.PolyML.cPtr --> GioEmblemClass.PolyML.cPtr)
      val newWithOrigin_ = call (load_sym libgio "g_emblem_new_with_origin") (GioIconClass.PolyML.cPtr &&> GioEmblemOrigin.PolyML.cVal --> GioEmblemClass.PolyML.cPtr)
      val getIcon_ = call (load_sym libgio "g_emblem_get_icon") (GioEmblemClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val getOrigin_ = call (load_sym libgio "g_emblem_get_origin") (GioEmblemClass.PolyML.cPtr --> GioEmblemOrigin.PolyML.cVal)
    end
    type 'a class = 'a GioEmblemClass.class
    type 'a icon_class = 'a GioIconClass.class
    type emblem_origin_t = GioEmblemOrigin.t
    type t = base class
    fun asIcon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new icon = (GioIconClass.C.withPtr ---> GioEmblemClass.C.fromPtr true) new_ icon
    fun newWithOrigin icon origin = (GioIconClass.C.withPtr &&&> GioEmblemOrigin.C.withVal ---> GioEmblemClass.C.fromPtr true) newWithOrigin_ (icon & origin)
    fun getIcon self = (GioEmblemClass.C.withPtr ---> GioIconClass.C.fromPtr false) getIcon_ self
    fun getOrigin self = (GioEmblemClass.C.withPtr ---> GioEmblemOrigin.C.fromVal) getOrigin_ self
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
