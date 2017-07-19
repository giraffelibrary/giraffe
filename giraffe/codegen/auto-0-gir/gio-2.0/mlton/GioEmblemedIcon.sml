structure GioEmblemedIcon :>
  GIO_EMBLEMED_ICON
    where type 'a class = 'a GioEmblemedIconClass.class
    where type 'a emblem_class = 'a GioEmblemClass.class
    where type 'a icon_class = 'a GioIconClass.class =
  struct
    val getType_ = _import "g_emblemed_icon_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "g_emblemed_icon_new" : GioIconClass.FFI.notnull GioIconClass.FFI.p * unit GioEmblemClass.FFI.p -> GioIconClass.FFI.notnull GioIconClass.FFI.p;) (x1, x2)
    val addEmblem_ = fn x1 & x2 => (_import "g_emblemed_icon_add_emblem" : GioEmblemedIconClass.FFI.notnull GioEmblemedIconClass.FFI.p * GioEmblemClass.FFI.notnull GioEmblemClass.FFI.p -> unit;) (x1, x2)
    val clearEmblems_ = _import "g_emblemed_icon_clear_emblems" : GioEmblemedIconClass.FFI.notnull GioEmblemedIconClass.FFI.p -> unit;
    val getIcon_ = _import "g_emblemed_icon_get_icon" : GioEmblemedIconClass.FFI.notnull GioEmblemedIconClass.FFI.p -> GioIconClass.FFI.notnull GioIconClass.FFI.p;
    type 'a class = 'a GioEmblemedIconClass.class
    type 'a emblem_class = 'a GioEmblemClass.class
    type 'a icon_class = 'a GioIconClass.class
    type t = base class
    fun asIcon self = (GObjectObjectClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (icon, emblem) = (GioIconClass.FFI.withPtr &&&> GioEmblemClass.FFI.withOptPtr ---> GioIconClass.FFI.fromPtr true) new_ (icon & emblem)
    fun addEmblem self emblem = (GioEmblemedIconClass.FFI.withPtr &&&> GioEmblemClass.FFI.withPtr ---> I) addEmblem_ (self & emblem)
    fun clearEmblems self = (GioEmblemedIconClass.FFI.withPtr ---> I) clearEmblems_ self
    fun getIcon self = (GioEmblemedIconClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr false) getIcon_ self
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
