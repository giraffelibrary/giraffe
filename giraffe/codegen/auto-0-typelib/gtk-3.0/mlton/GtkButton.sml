structure GtkButton :>
  GTK_BUTTON
    where type 'a class = 'a GtkButtonClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type position_type_t = GtkPositionType.t
    where type relief_style_t = GtkReliefStyle.t =
  struct
    val getType_ = _import "gtk_button_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_button_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newFromStock_ = _import "mlton_gtk_button_new_from_stock" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithLabel_ = _import "mlton_gtk_button_new_with_label" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithMnemonic_ = _import "mlton_gtk_button_new_with_mnemonic" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val clicked_ = _import "gtk_button_clicked" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val getAlignment_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_button_get_alignment" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Float.C.ref_
               * FFI.Float.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getEventWindow_ = _import "gtk_button_get_event_window" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getFocusOnClick_ = _import "gtk_button_get_focus_on_click" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getImage_ = _import "gtk_button_get_image" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getImagePosition_ = _import "gtk_button_get_image_position" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkPositionType.C.val_;
    val getLabel_ = _import "gtk_button_get_label" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getRelief_ = _import "gtk_button_get_relief" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkReliefStyle.C.val_;
    val getUseStock_ = _import "gtk_button_get_use_stock" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getUseUnderline_ = _import "gtk_button_get_use_underline" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val setAlignment_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_button_set_alignment" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Float.C.val_
               * FFI.Float.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFocusOnClick_ = fn x1 & x2 => (_import "gtk_button_set_focus_on_click" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setImage_ = fn x1 & x2 => (_import "gtk_button_set_image" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setImagePosition_ = fn x1 & x2 => (_import "gtk_button_set_image_position" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkPositionType.C.val_ -> unit;) (x1, x2)
    val setLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_button_set_label" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setRelief_ = fn x1 & x2 => (_import "gtk_button_set_relief" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkReliefStyle.C.val_ -> unit;) (x1, x2)
    val setUseStock_ = fn x1 & x2 => (_import "gtk_button_set_use_stock" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setUseUnderline_ = fn x1 & x2 => (_import "gtk_button_set_use_underline" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkButtonClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type position_type_t = GtkPositionType.t
    type relief_style_t = GtkReliefStyle.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkButtonClass.C.fromPtr false) new_ ()
    fun newFromStock stockId = (Utf8.C.withPtr ---> GtkButtonClass.C.fromPtr false) newFromStock_ stockId
    fun newWithLabel label = (Utf8.C.withPtr ---> GtkButtonClass.C.fromPtr false) newWithLabel_ label
    fun newWithMnemonic label = (Utf8.C.withPtr ---> GtkButtonClass.C.fromPtr false) newWithMnemonic_ label
    fun clicked self = (GObjectObjectClass.C.withPtr ---> I) clicked_ self
    fun getAlignment self =
      let
        val xalign
         & yalign
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Float.C.withRefVal
             &&&> FFI.Float.C.withRefVal
             ---> FFI.Float.C.fromVal
                   && FFI.Float.C.fromVal
                   && I
          )
            getAlignment_
            (
              self
               & FFI.Float.null
               & FFI.Float.null
            )
      in
        (xalign, yalign)
      end
    fun getEventWindow self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getEventWindow_ self
    fun getFocusOnClick self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getFocusOnClick_ self
    fun getImage self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getImage_ self
    fun getImagePosition self = (GObjectObjectClass.C.withPtr ---> GtkPositionType.C.fromVal) getImagePosition_ self
    fun getLabel self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getLabel_ self
    fun getRelief self = (GObjectObjectClass.C.withPtr ---> GtkReliefStyle.C.fromVal) getRelief_ self
    fun getUseStock self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseStock_ self
    fun getUseUnderline self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseUnderline_ self
    fun setAlignment self xalign yalign =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Float.C.withVal
         &&&> FFI.Float.C.withVal
         ---> I
      )
        setAlignment_
        (
          self
           & xalign
           & yalign
        )
    fun setFocusOnClick self focusOnClick = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setFocusOnClick_ (self & focusOnClick)
    fun setImage self image = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setImage_ (self & image)
    fun setImagePosition self position = (GObjectObjectClass.C.withPtr &&&> GtkPositionType.C.withVal ---> I) setImagePosition_ (self & position)
    fun setLabel self label = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setLabel_ (self & label)
    fun setRelief self newstyle = (GObjectObjectClass.C.withPtr &&&> GtkReliefStyle.C.withVal ---> I) setRelief_ (self & newstyle)
    fun setUseStock self useStock = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseStock_ (self & useStock)
    fun setUseUnderline self useUnderline = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseUnderline_ (self & useUnderline)
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (void ---> ret_void) f
      fun clickedSig f = signal "clicked" (void ---> ret_void) f
      fun enterSig f = signal "enter" (void ---> ret_void) f
      fun leaveSig f = signal "leave" (void ---> ret_void) f
      fun pressedSig f = signal "pressed" (void ---> ret_void) f
      fun releasedSig f = signal "released" (void ---> ret_void) f
    end
    local
      open Property
    in
      val focusOnClickProp =
        {
          get = fn x => get "focus-on-click" boolean x,
          set = fn x => set "focus-on-click" boolean x
        }
      val imageProp =
        {
          get = fn x => get "image" GtkWidgetClass.tOpt x,
          set = fn x => set "image" GtkWidgetClass.tOpt x
        }
      val imagePositionProp =
        {
          get = fn x => get "image-position" GtkPositionType.t x,
          set = fn x => set "image-position" GtkPositionType.t x
        }
      val labelProp =
        {
          get = fn x => get "label" stringOpt x,
          set = fn x => set "label" stringOpt x
        }
      val reliefProp =
        {
          get = fn x => get "relief" GtkReliefStyle.t x,
          set = fn x => set "relief" GtkReliefStyle.t x
        }
      val useStockProp =
        {
          get = fn x => get "use-stock" boolean x,
          set = fn x => set "use-stock" boolean x
        }
      val useUnderlineProp =
        {
          get = fn x => get "use-underline" boolean x,
          set = fn x => set "use-underline" boolean x
        }
      val xalignProp =
        {
          get = fn x => get "xalign" float x,
          set = fn x => set "xalign" float x
        }
      val yalignProp =
        {
          get = fn x => get "yalign" float x,
          set = fn x => set "yalign" float x
        }
    end
  end
