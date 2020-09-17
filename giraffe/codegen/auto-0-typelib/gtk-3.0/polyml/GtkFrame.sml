structure GtkFrame :>
  GTK_FRAME
    where type 'a class = 'a GtkFrameClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type shadow_type_t = GtkShadowType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_frame_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_frame_new") (Utf8.PolyML.cInOptPtr --> GtkWidgetClass.PolyML.cPtr)
      val getLabel_ = call (getSymbol "gtk_frame_get_label") (GtkFrameClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getLabelAlign_ =
        call (getSymbol "gtk_frame_get_label_align")
          (
            GtkFrameClass.PolyML.cPtr
             &&> GFloat.PolyML.cRef
             &&> GFloat.PolyML.cRef
             --> cVoid
          )
      val getLabelWidget_ = call (getSymbol "gtk_frame_get_label_widget") (GtkFrameClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getShadowType_ = call (getSymbol "gtk_frame_get_shadow_type") (GtkFrameClass.PolyML.cPtr --> GtkShadowType.PolyML.cVal)
      val setLabel_ = call (getSymbol "gtk_frame_set_label") (GtkFrameClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setLabelAlign_ =
        call (getSymbol "gtk_frame_set_label_align")
          (
            GtkFrameClass.PolyML.cPtr
             &&> GFloat.PolyML.cVal
             &&> GFloat.PolyML.cVal
             --> cVoid
          )
      val setLabelWidget_ = call (getSymbol "gtk_frame_set_label_widget") (GtkFrameClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> cVoid)
      val setShadowType_ = call (getSymbol "gtk_frame_set_shadow_type") (GtkFrameClass.PolyML.cPtr &&> GtkShadowType.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkFrameClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type shadow_type_t = GtkShadowType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new label = (Utf8.FFI.withOptPtr 0 ---> GtkFrameClass.FFI.fromPtr false) new_ label before Utf8.FFI.touchOptPtr label
    fun getLabel self = (GtkFrameClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getLabel_ self before GtkFrameClass.FFI.touchPtr self
    fun getLabelAlign self =
      let
        val xalign
         & yalign
         & () =
          (
            GtkFrameClass.FFI.withPtr false
             &&&> GFloat.FFI.withRefVal
             &&&> GFloat.FFI.withRefVal
             ---> GFloat.FFI.fromVal
                   && GFloat.FFI.fromVal
                   && I
          )
            getLabelAlign_
            (
              self
               & GFloat.null
               & GFloat.null
            )
      in
        (xalign, yalign)
      end
    fun getLabelWidget self = (GtkFrameClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getLabelWidget_ self before GtkFrameClass.FFI.touchPtr self
    fun getShadowType self = (GtkFrameClass.FFI.withPtr false ---> GtkShadowType.FFI.fromVal) getShadowType_ self
    fun setLabel self label = (GtkFrameClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setLabel_ (self & label)
    fun setLabelAlign self (xalign, yalign) =
      (
        GtkFrameClass.FFI.withPtr false
         &&&> GFloat.FFI.withVal
         &&&> GFloat.FFI.withVal
         ---> I
      )
        setLabelAlign_
        (
          self
           & xalign
           & yalign
        )
    fun setLabelWidget self labelWidget = (GtkFrameClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setLabelWidget_ (self & labelWidget)
    fun setShadowType self type' = (GtkFrameClass.FFI.withPtr false &&&> GtkShadowType.FFI.withVal ---> I) setShadowType_ (self & type')
    local
      open ValueAccessor
    in
      val labelProp =
        {
          name = "label",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val labelWidgetProp =
        {
          name = "label-widget",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = fn x => fn () => C.get GtkWidgetClass.tOpt x,
          set = fn x => C.set GtkWidgetClass.tOpt x,
          init = fn x => C.set GtkWidgetClass.tOpt x
        }
      val labelXalignProp =
        {
          name = "label-xalign",
          gtype = fn () => C.gtype float (),
          get = fn x => fn () => C.get float x,
          set = fn x => C.set float x,
          init = fn x => C.set float x
        }
      val labelYalignProp =
        {
          name = "label-yalign",
          gtype = fn () => C.gtype float (),
          get = fn x => fn () => C.get float x,
          set = fn x => C.set float x,
          init = fn x => C.set float x
        }
      val shadowTypeProp =
        {
          name = "shadow-type",
          gtype = fn () => C.gtype GtkShadowType.t (),
          get = fn x => fn () => C.get GtkShadowType.t x,
          set = fn x => C.set GtkShadowType.t x,
          init = fn x => C.set GtkShadowType.t x
        }
    end
  end
