structure GioEmblem :>
  GIO_EMBLEM
    where type 'a class_t = 'a GioEmblemClass.t
    where type 'a icon_class_t = 'a GioIconClass.t
    where type emblem_origin_t = GioEmblemOrigin.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_emblem_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_emblem_new") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val newWithOrigin_ = call (load_sym libgio "g_emblem_new_with_origin") (GObjectObjectClass.PolyML.cPtr &&> GioEmblemOrigin.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
      val getIcon_ = call (load_sym libgio "g_emblem_get_icon") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getOrigin_ = call (load_sym libgio "g_emblem_get_origin") (GObjectObjectClass.PolyML.cPtr --> GioEmblemOrigin.PolyML.cVal)
    end
    type 'a class_t = 'a GioEmblemClass.t
    type 'a icon_class_t = 'a GioIconClass.t
    type emblem_origin_t = GioEmblemOrigin.t
    type t = base class_t
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
