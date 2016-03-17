structure GioEmblemedIcon :>
  GIO_EMBLEMED_ICON
    where type 'a class = 'a GioEmblemedIconClass.class
    where type 'a emblem_class = 'a GioEmblemClass.class
    where type 'a icon_class = 'a GioIconClass.class =
  struct
    val getType_ = _import "g_emblemed_icon_get_type" : unit -> GObjectType.C.val_;
    val new_ = fn x1 & x2 => (_import "g_emblemed_icon_new" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val addEmblem_ = fn x1 & x2 => (_import "g_emblemed_icon_add_emblem" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val clearEmblems_ = _import "g_emblemed_icon_clear_emblems" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val getIcon_ = _import "g_emblemed_icon_get_icon" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
