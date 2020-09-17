structure GtkDialog :>
  GTK_DIALOG
    where type 'a class = 'a GtkDialogClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a box_class = 'a GtkBoxClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_dialog_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_dialog_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val addActionWidget_ =
        call (getSymbol "gtk_dialog_add_action_widget")
          (
            GtkDialogClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val addButton_ =
        call (getSymbol "gtk_dialog_add_button")
          (
            GtkDialogClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             --> GtkWidgetClass.PolyML.cPtr
          )
      val getActionArea_ = call (getSymbol "gtk_dialog_get_action_area") (GtkDialogClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getContentArea_ = call (getSymbol "gtk_dialog_get_content_area") (GtkDialogClass.PolyML.cPtr --> GtkBoxClass.PolyML.cPtr)
      val getHeaderBar_ = call (getSymbol "gtk_dialog_get_header_bar") (GtkDialogClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getResponseForWidget_ = call (getSymbol "gtk_dialog_get_response_for_widget") (GtkDialogClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getWidgetForResponse_ = call (getSymbol "gtk_dialog_get_widget_for_response") (GtkDialogClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> GtkWidgetClass.PolyML.cOptPtr)
      val response_ = call (getSymbol "gtk_dialog_response") (GtkDialogClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val run_ = call (getSymbol "gtk_dialog_run") (GtkDialogClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val setAlternativeButtonOrderFromArray_ =
        call (getSymbol "gtk_dialog_set_alternative_button_order_from_array")
          (
            GtkDialogClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32CArrayN.PolyML.cInPtr
             --> cVoid
          )
      val setDefaultResponse_ = call (getSymbol "gtk_dialog_set_default_response") (GtkDialogClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setResponseSensitive_ =
        call (getSymbol "gtk_dialog_set_response_sensitive")
          (
            GtkDialogClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> cVoid
          )
    end
    type 'a class = 'a GtkDialogClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a box_class = 'a GtkBoxClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkDialogClass.FFI.fromPtr false) new_ ()
    fun addActionWidget self (child, responseId) =
      (
        GtkDialogClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         ---> I
      )
        addActionWidget_
        (
          self
           & child
           & responseId
        )
    fun addButton self (buttonText, responseId) =
      (
        GtkDialogClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt32.FFI.withVal
         ---> GtkWidgetClass.FFI.fromPtr false
      )
        addButton_
        (
          self
           & buttonText
           & responseId
        )
       before GtkDialogClass.FFI.touchPtr self
       before Utf8.FFI.touchPtr buttonText
    fun getActionArea self = (GtkDialogClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getActionArea_ self before GtkDialogClass.FFI.touchPtr self
    fun getContentArea self = (GtkDialogClass.FFI.withPtr false ---> GtkBoxClass.FFI.fromPtr false) getContentArea_ self before GtkDialogClass.FFI.touchPtr self
    fun getHeaderBar self = (GtkDialogClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getHeaderBar_ self before GtkDialogClass.FFI.touchPtr self
    fun getResponseForWidget self widget = (GtkDialogClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getResponseForWidget_ (self & widget)
    fun getWidgetForResponse self responseId = (GtkDialogClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GtkWidgetClass.FFI.fromOptPtr false) getWidgetForResponse_ (self & responseId) before GtkDialogClass.FFI.touchPtr self
    fun response self responseId = (GtkDialogClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) response_ (self & responseId)
    fun run self = (GtkDialogClass.FFI.withPtr false ---> GInt32.FFI.fromVal) run_ self
    fun setAlternativeButtonOrderFromArray self newOrder =
      let
        val nParams = LargeInt.fromInt (GInt32CArrayN.length newOrder)
        val () =
          (
            GtkDialogClass.FFI.withPtr false
             &&&> GInt32.FFI.withVal
             &&&> GInt32CArrayN.FFI.withPtr 0
             ---> I
          )
            setAlternativeButtonOrderFromArray_
            (
              self
               & nParams
               & newOrder
            )
      in
        ()
      end
    fun setDefaultResponse self responseId = (GtkDialogClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setDefaultResponse_ (self & responseId)
    fun setResponseSensitive self (responseId, setting) =
      (
        GtkDialogClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> I
      )
        setResponseSensitive_
        (
          self
           & responseId
           & setting
        )
    local
      open ClosureMarshal Signal
    in
      fun closeSig f = signal "close" (void ---> ret_void) f
      fun responseSig f = signal "response" (get 0w1 int ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val useHeaderBarProp =
        {
          name = "use-header-bar",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = fn x => C.set int x
        }
    end
  end
