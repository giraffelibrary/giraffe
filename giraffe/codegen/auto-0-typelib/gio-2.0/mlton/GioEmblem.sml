structure GioEmblem :>
  GIO_EMBLEM
    where type 'a class = 'a GioEmblemClass.class
    where type 'a icon_class = 'a GioIconClass.class
    where type emblem_origin_t = GioEmblemOrigin.t =
  struct
    val getType_ = _import "g_emblem_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_emblem_new" : GioIconClass.FFI.non_opt GioIconClass.FFI.p -> GioEmblemClass.FFI.non_opt GioEmblemClass.FFI.p;
    val newWithOrigin_ = fn x1 & x2 => (_import "g_emblem_new_with_origin" : GioIconClass.FFI.non_opt GioIconClass.FFI.p * GioEmblemOrigin.FFI.val_ -> GioEmblemClass.FFI.non_opt GioEmblemClass.FFI.p;) (x1, x2)
    val getIcon_ = _import "g_emblem_get_icon" : GioEmblemClass.FFI.non_opt GioEmblemClass.FFI.p -> GioIconClass.FFI.non_opt GioIconClass.FFI.p;
    val getOrigin_ = _import "g_emblem_get_origin" : GioEmblemClass.FFI.non_opt GioEmblemClass.FFI.p -> GioEmblemOrigin.FFI.val_;
    type 'a class = 'a GioEmblemClass.class
    type 'a icon_class = 'a GioIconClass.class
    type emblem_origin_t = GioEmblemOrigin.t
    type t = base class
    fun asIcon self = (GObjectObjectClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new icon = (GioIconClass.FFI.withPtr false ---> GioEmblemClass.FFI.fromPtr true) new_ icon
    fun newWithOrigin (icon, origin) = (GioIconClass.FFI.withPtr false &&&> GioEmblemOrigin.FFI.withVal ---> GioEmblemClass.FFI.fromPtr true) newWithOrigin_ (icon & origin)
    fun getIcon self = (GioEmblemClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr false) getIcon_ self before GioEmblemClass.FFI.touchPtr self
    fun getOrigin self = (GioEmblemClass.FFI.withPtr false ---> GioEmblemOrigin.FFI.fromVal) getOrigin_ self
    local
      open ValueAccessor
    in
      val iconProp =
        {
          name = "icon",
          gtype = fn () => C.gtype GObjectObjectClass.tOpt (),
          get = fn x => fn () => C.get GObjectObjectClass.tOpt x,
          set = ignore,
          init = fn x => C.set GObjectObjectClass.tOpt x
        }
      val originProp =
        {
          name = "origin",
          gtype = fn () => C.gtype GioEmblemOrigin.t (),
          get = fn x => fn () => C.get GioEmblemOrigin.t x,
          set = ignore,
          init = fn x => C.set GioEmblemOrigin.t x
        }
    end
  end
