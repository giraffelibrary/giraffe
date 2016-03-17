structure GioEmblemedIcon :>
  GIO_EMBLEMED_ICON
    where type 'a class = 'a GioEmblemedIconClass.class
    where type 'a emblem_class = 'a GioEmblemClass.class
    where type 'a icon_class = 'a GioIconClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_emblemed_icon_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_emblemed_icon_new") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> GObjectObjectClass.PolyML.cPtr)
      val addEmblem_ = call (load_sym libgio "g_emblemed_icon_add_emblem") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val clearEmblems_ = call (load_sym libgio "g_emblemed_icon_clear_emblems") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getIcon_ = call (load_sym libgio "g_emblemed_icon_get_icon") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
    end
    type 'a class = 'a GioEmblemedIconClass.class
    type 'a emblem_class = 'a GioEmblemClass.class
    type 'a icon_class = 'a GioIconClass.class
    type t = base class
    fun asIcon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new icon emblem = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> GioIconClass.C.fromPtr true) new_ (icon & emblem)
    fun addEmblem self emblem = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) addEmblem_ (self & emblem)
    fun clearEmblems self = (GObjectObjectClass.C.withPtr ---> I) clearEmblems_ self
    fun getIcon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr false) getIcon_ self
    local
      open Property
    in
      val giconProp =
        {
          get = fn x => get "gicon" GioIconClass.tOpt x,
          set = fn x => set "gicon" GioIconClass.tOpt x
        }
    end
  end
