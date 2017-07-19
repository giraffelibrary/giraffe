structure GtkButton :>
  GTK_BUTTON
    where type 'a class = 'a GtkButtonClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type position_type_t = GtkPositionType.t
    where type relief_style_t = GtkReliefStyle.t =
  struct
    val getType_ = _import "gtk_button_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_button_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val newFromStock_ = _import "mlton_gtk_button_new_from_stock" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val newWithLabel_ = _import "mlton_gtk_button_new_with_label" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val newWithMnemonic_ = _import "mlton_gtk_button_new_with_mnemonic" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val clicked_ = _import "gtk_button_clicked" : GtkButtonClass.FFI.notnull GtkButtonClass.FFI.p -> unit;
    val getAlignment_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_button_get_alignment" :
              GtkButtonClass.FFI.notnull GtkButtonClass.FFI.p
               * GFloat.FFI.ref_
               * GFloat.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getEventWindow_ = _import "gtk_button_get_event_window" : GtkButtonClass.FFI.notnull GtkButtonClass.FFI.p -> GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p;
    val getFocusOnClick_ = _import "gtk_button_get_focus_on_click" : GtkButtonClass.FFI.notnull GtkButtonClass.FFI.p -> GBool.FFI.val_;
    val getImage_ = _import "gtk_button_get_image" : GtkButtonClass.FFI.notnull GtkButtonClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getImagePosition_ = _import "gtk_button_get_image_position" : GtkButtonClass.FFI.notnull GtkButtonClass.FFI.p -> GtkPositionType.FFI.val_;
    val getLabel_ = _import "gtk_button_get_label" : GtkButtonClass.FFI.notnull GtkButtonClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getRelief_ = _import "gtk_button_get_relief" : GtkButtonClass.FFI.notnull GtkButtonClass.FFI.p -> GtkReliefStyle.FFI.val_;
    val getUseStock_ = _import "gtk_button_get_use_stock" : GtkButtonClass.FFI.notnull GtkButtonClass.FFI.p -> GBool.FFI.val_;
    val getUseUnderline_ = _import "gtk_button_get_use_underline" : GtkButtonClass.FFI.notnull GtkButtonClass.FFI.p -> GBool.FFI.val_;
    val setAlignment_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_button_set_alignment" :
              GtkButtonClass.FFI.notnull GtkButtonClass.FFI.p
               * GFloat.FFI.val_
               * GFloat.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFocusOnClick_ = fn x1 & x2 => (_import "gtk_button_set_focus_on_click" : GtkButtonClass.FFI.notnull GtkButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setImage_ = fn x1 & x2 => (_import "gtk_button_set_image" : GtkButtonClass.FFI.notnull GtkButtonClass.FFI.p * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setImagePosition_ = fn x1 & x2 => (_import "gtk_button_set_image_position" : GtkButtonClass.FFI.notnull GtkButtonClass.FFI.p * GtkPositionType.FFI.val_ -> unit;) (x1, x2)
    val setLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_button_set_label" :
              GtkButtonClass.FFI.notnull GtkButtonClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setRelief_ = fn x1 & x2 => (_import "gtk_button_set_relief" : GtkButtonClass.FFI.notnull GtkButtonClass.FFI.p * GtkReliefStyle.FFI.val_ -> unit;) (x1, x2)
    val setUseStock_ = fn x1 & x2 => (_import "gtk_button_set_use_stock" : GtkButtonClass.FFI.notnull GtkButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setUseUnderline_ = fn x1 & x2 => (_import "gtk_button_set_use_underline" : GtkButtonClass.FFI.notnull GtkButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkButtonClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type position_type_t = GtkPositionType.t
    type relief_style_t = GtkReliefStyle.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkButtonClass.FFI.fromPtr false) new_ ()
    fun newFromStock stockId = (Utf8.FFI.withPtr ---> GtkButtonClass.FFI.fromPtr false) newFromStock_ stockId
    fun newWithLabel label = (Utf8.FFI.withPtr ---> GtkButtonClass.FFI.fromPtr false) newWithLabel_ label
    fun newWithMnemonic label = (Utf8.FFI.withPtr ---> GtkButtonClass.FFI.fromPtr false) newWithMnemonic_ label
    fun clicked self = (GtkButtonClass.FFI.withPtr ---> I) clicked_ self
    fun getAlignment self =
      let
        val xalign
         & yalign
         & () =
          (
            GtkButtonClass.FFI.withPtr
             &&&> GFloat.FFI.withRefVal
             &&&> GFloat.FFI.withRefVal
             ---> GFloat.FFI.fromVal
                   && GFloat.FFI.fromVal
                   && I
          )
            getAlignment_
            (
              self
               & GFloat.null
               & GFloat.null
            )
      in
        (xalign, yalign)
      end
    fun getEventWindow self = (GtkButtonClass.FFI.withPtr ---> GdkWindowClass.FFI.fromPtr false) getEventWindow_ self
    fun getFocusOnClick self = (GtkButtonClass.FFI.withPtr ---> GBool.FFI.fromVal) getFocusOnClick_ self
    fun getImage self = (GtkButtonClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getImage_ self
    fun getImagePosition self = (GtkButtonClass.FFI.withPtr ---> GtkPositionType.FFI.fromVal) getImagePosition_ self
    fun getLabel self = (GtkButtonClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getLabel_ self
    fun getRelief self = (GtkButtonClass.FFI.withPtr ---> GtkReliefStyle.FFI.fromVal) getRelief_ self
    fun getUseStock self = (GtkButtonClass.FFI.withPtr ---> GBool.FFI.fromVal) getUseStock_ self
    fun getUseUnderline self = (GtkButtonClass.FFI.withPtr ---> GBool.FFI.fromVal) getUseUnderline_ self
    fun setAlignment self (xalign, yalign) =
      (
        GtkButtonClass.FFI.withPtr
         &&&> GFloat.FFI.withVal
         &&&> GFloat.FFI.withVal
         ---> I
      )
        setAlignment_
        (
          self
           & xalign
           & yalign
        )
    fun setFocusOnClick self focusOnClick = (GtkButtonClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setFocusOnClick_ (self & focusOnClick)
    fun setImage self image = (GtkButtonClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) setImage_ (self & image)
    fun setImagePosition self position = (GtkButtonClass.FFI.withPtr &&&> GtkPositionType.FFI.withVal ---> I) setImagePosition_ (self & position)
    fun setLabel self label = (GtkButtonClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setLabel_ (self & label)
    fun setRelief self newstyle = (GtkButtonClass.FFI.withPtr &&&> GtkReliefStyle.FFI.withVal ---> I) setRelief_ (self & newstyle)
    fun setUseStock self useStock = (GtkButtonClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUseStock_ (self & useStock)
    fun setUseUnderline self useUnderline = (GtkButtonClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUseUnderline_ (self & useUnderline)
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (void ---> ret_void) f
      fun clickedSig f = signal "clicked" (void ---> ret_void) f
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
