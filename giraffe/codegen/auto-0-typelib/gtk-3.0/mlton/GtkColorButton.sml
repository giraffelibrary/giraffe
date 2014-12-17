structure GtkColorButton :>
  GTK_COLOR_BUTTON
    where type 'a class_t = 'a GtkColorButtonClass.t
    where type 'a activatableclass_t = 'a GtkActivatableClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t =
  struct
    val getType_ = _import "gtk_color_button_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_color_button_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithColor_ = _import "gtk_color_button_new_with_color" : GdkColorRecord.C.notnull GdkColorRecord.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithRgba_ = _import "gtk_color_button_new_with_rgba" : GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getAlpha_ = _import "gtk_color_button_get_alpha" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt16.C.val_;
    val getColor_ = fn x1 & x2 => (_import "gtk_color_button_get_color" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkColorRecord.C.notnull GdkColorRecord.C.p -> unit;) (x1, x2)
    val getRgba_ = fn x1 & x2 => (_import "gtk_color_button_get_rgba" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p -> unit;) (x1, x2)
    val getTitle_ = _import "gtk_color_button_get_title" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getUseAlpha_ = _import "gtk_color_button_get_use_alpha" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val setAlpha_ = fn x1 & x2 => (_import "gtk_color_button_set_alpha" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt16.C.val_ -> unit;) (x1, x2)
    val setColor_ = fn x1 & x2 => (_import "gtk_color_button_set_color" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkColorRecord.C.notnull GdkColorRecord.C.p -> unit;) (x1, x2)
    val setRgba_ = fn x1 & x2 => (_import "gtk_color_button_set_rgba" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p -> unit;) (x1, x2)
    val setTitle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_color_button_set_title" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setUseAlpha_ = fn x1 & x2 => (_import "gtk_color_button_set_use_alpha" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GtkColorButtonClass.t
    type 'a activatableclass_t = 'a GtkActivatableClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkColorButtonClass.C.fromPtr false) new_ ()
    fun newWithColor color = (GdkColorRecord.C.withPtr ---> GtkColorButtonClass.C.fromPtr false) newWithColor_ color
    fun newWithRgba rgba = (GdkRgbaRecord.C.withPtr ---> GtkColorButtonClass.C.fromPtr false) newWithRgba_ rgba
    fun getAlpha self = (GObjectObjectClass.C.withPtr ---> FFI.UInt16.C.fromVal) getAlpha_ self
    fun getColor self =
      let
        val color & () = (GObjectObjectClass.C.withPtr &&&> GdkColorRecord.C.withNewPtr ---> GdkColorRecord.C.fromPtr true && I) getColor_ (self & ())
      in
        color
      end
    fun getRgba self =
      let
        val rgba & () = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withNewPtr ---> GdkRgbaRecord.C.fromPtr true && I) getRgba_ (self & ())
      in
        rgba
      end
    fun getTitle self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getTitle_ self
    fun getUseAlpha self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseAlpha_ self
    fun setAlpha self alpha = (GObjectObjectClass.C.withPtr &&&> FFI.UInt16.C.withVal ---> I) setAlpha_ (self & alpha)
    fun setColor self color = (GObjectObjectClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setColor_ (self & color)
    fun setRgba self rgba = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> I) setRgba_ (self & rgba)
    fun setTitle self title = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setTitle_ (self & title)
    fun setUseAlpha self useAlpha = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseAlpha_ (self & useAlpha)
    local
      open ClosureMarshal Signal
    in
      fun colorSetSig f = signal "color-set" (void ---> ret_void) f
    end
    local
      open Property
    in
      val alphaProp =
        {
          get = fn x => get "alpha" uint x,
          set = fn x => set "alpha" uint x
        }
      val colorProp =
        {
          get = fn x => get "color" GdkColorRecord.tOpt x,
          set = fn x => set "color" GdkColorRecord.tOpt x
        }
      val rgbaProp =
        {
          get = fn x => get "rgba" GdkRgbaRecord.tOpt x,
          set = fn x => set "rgba" GdkRgbaRecord.tOpt x
        }
      val titleProp =
        {
          get = fn x => get "title" stringOpt x,
          set = fn x => set "title" stringOpt x
        }
      val useAlphaProp =
        {
          get = fn x => get "use-alpha" boolean x,
          set = fn x => set "use-alpha" boolean x
        }
    end
  end
