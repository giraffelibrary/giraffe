structure GtkDialog :>
  GTK_DIALOG
    where type 'a class = 'a GtkDialogClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a box_class = 'a GtkBoxClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    structure GIntCVectorNType =
      CValueCVectorNType(
        structure CElemType = GIntType
        structure ElemSequence = CValueVectorSequence(GIntType)
      )
    structure GIntCVectorN = CVectorN(GIntCVectorNType)
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
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val addButton_ =
        call (getSymbol "gtk_dialog_add_button")
          (
            GtkDialogClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> GtkWidgetClass.PolyML.cPtr
          )
      val getActionArea_ = call (getSymbol "gtk_dialog_get_action_area") (GtkDialogClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getContentArea_ = call (getSymbol "gtk_dialog_get_content_area") (GtkDialogClass.PolyML.cPtr --> GtkBoxClass.PolyML.cPtr)
      val getHeaderBar_ = call (getSymbol "gtk_dialog_get_header_bar") (GtkDialogClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getResponseForWidget_ = call (getSymbol "gtk_dialog_get_response_for_widget") (GtkDialogClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getWidgetForResponse_ = call (getSymbol "gtk_dialog_get_widget_for_response") (GtkDialogClass.PolyML.cPtr &&> GInt.PolyML.cVal --> GtkWidgetClass.PolyML.cOptPtr)
      val response_ = call (getSymbol "gtk_dialog_response") (GtkDialogClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val run_ = call (getSymbol "gtk_dialog_run") (GtkDialogClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val setAlternativeButtonOrderFromArray_ =
        call (getSymbol "gtk_dialog_set_alternative_button_order_from_array")
          (
            GtkDialogClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GIntCVectorN.PolyML.cInPtr
             --> cVoid
          )
      val setDefaultResponse_ = call (getSymbol "gtk_dialog_set_default_response") (GtkDialogClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setResponseSensitive_ =
        call (getSymbol "gtk_dialog_set_response_sensitive")
          (
            GtkDialogClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> cVoid
          )
    end
    type 'a class = 'a GtkDialogClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a box_class = 'a GtkBoxClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkDialogClass.FFI.fromPtr false) new_ ()
    fun addActionWidget self (child, responseId) =
      (
        GtkDialogClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GInt.FFI.withVal
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
        GtkDialogClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> GtkWidgetClass.FFI.fromPtr false
      )
        addButton_
        (
          self
           & buttonText
           & responseId
        )
    fun getActionArea self = (GtkDialogClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getActionArea_ self
    fun getContentArea self = (GtkDialogClass.FFI.withPtr ---> GtkBoxClass.FFI.fromPtr false) getContentArea_ self
    fun getHeaderBar self = (GtkDialogClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getHeaderBar_ self
    fun getResponseForWidget self widget = (GtkDialogClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> GInt.FFI.fromVal) getResponseForWidget_ (self & widget)
    fun getWidgetForResponse self responseId = (GtkDialogClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GtkWidgetClass.FFI.fromOptPtr false) getWidgetForResponse_ (self & responseId)
    fun response self responseId = (GtkDialogClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) response_ (self & responseId)
    fun run self = (GtkDialogClass.FFI.withPtr ---> GInt.FFI.fromVal) run_ self
    fun setAlternativeButtonOrderFromArray self newOrder =
      let
        val nParams = LargeInt.fromInt (GIntCVectorN.length newOrder)
        val () =
          (
            GtkDialogClass.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> GIntCVectorN.FFI.withPtr
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
    fun setDefaultResponse self responseId = (GtkDialogClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setDefaultResponse_ (self & responseId)
    fun setResponseSensitive self (responseId, setting) =
      (
        GtkDialogClass.FFI.withPtr
         &&&> GInt.FFI.withVal
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
      open Property
    in
      val useHeaderBarProp =
        {
          get = fn x => get "use-header-bar" int x,
          set = fn x => set "use-header-bar" int x
        }
    end
  end
