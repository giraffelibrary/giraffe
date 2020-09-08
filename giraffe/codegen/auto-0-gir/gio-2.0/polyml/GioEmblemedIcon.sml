structure GioEmblemedIcon :>
  GIO_EMBLEMED_ICON
    where type 'a class = 'a GioEmblemedIconClass.class
    where type 'a emblem_class = 'a GioEmblemClass.class
    where type 'a icon_class = 'a GioIconClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_emblemed_icon_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_emblemed_icon_new") (GioIconClass.PolyML.cPtr &&> GioEmblemClass.PolyML.cOptPtr --> GioEmblemedIconClass.PolyML.cPtr)
      val addEmblem_ = call (getSymbol "g_emblemed_icon_add_emblem") (GioEmblemedIconClass.PolyML.cPtr &&> GioEmblemClass.PolyML.cPtr --> cVoid)
      val clearEmblems_ = call (getSymbol "g_emblemed_icon_clear_emblems") (GioEmblemedIconClass.PolyML.cPtr --> cVoid)
      val getIcon_ = call (getSymbol "g_emblemed_icon_get_icon") (GioEmblemedIconClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
    end
    type 'a class = 'a GioEmblemedIconClass.class
    type 'a emblem_class = 'a GioEmblemClass.class
    type 'a icon_class = 'a GioIconClass.class
    type t = base class
    fun asIcon self = (GObjectObjectClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (icon, emblem) = (GioIconClass.FFI.withPtr false &&&> GioEmblemClass.FFI.withOptPtr false ---> GioEmblemedIconClass.FFI.fromPtr true) new_ (icon & emblem)
    fun addEmblem self emblem = (GioEmblemedIconClass.FFI.withPtr false &&&> GioEmblemClass.FFI.withPtr false ---> I) addEmblem_ (self & emblem)
    fun clearEmblems self = (GioEmblemedIconClass.FFI.withPtr false ---> I) clearEmblems_ self
    fun getIcon self = (GioEmblemedIconClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr false) getIcon_ self
    local
      open ValueAccessor
    in
      val giconProp =
        {
          name = "gicon",
          gtype = fn () => C.gtype GioIconClass.tOpt (),
          get = fn x => fn () => C.get GioIconClass.tOpt x,
          set = ignore,
          init = fn x => C.set GioIconClass.tOpt x
        }
    end
  end
