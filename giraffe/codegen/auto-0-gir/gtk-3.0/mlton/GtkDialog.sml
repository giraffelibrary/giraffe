structure GtkDialog :>
  GTK_DIALOG
    where type 'a class = 'a GtkDialogClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a box_class = 'a GtkBoxClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    structure GIntCVectorNType =
      CValueCVectorNType(
        structure CElemType = GInt.C.ValueType
        structure ElemSequence = CValueVectorSequence(GInt.C.ValueType)
      )
    structure GIntCVectorN = CVectorN(GIntCVectorNType)
    val getType_ = _import "gtk_dialog_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_dialog_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val addActionWidget_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_dialog_add_action_widget" :
              GtkDialogClass.FFI.notnull GtkDialogClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val addButton_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_dialog_add_button" :
              GtkDialogClass.FFI.notnull GtkDialogClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getActionArea_ = _import "gtk_dialog_get_action_area" : GtkDialogClass.FFI.notnull GtkDialogClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getContentArea_ = _import "gtk_dialog_get_content_area" : GtkDialogClass.FFI.notnull GtkDialogClass.FFI.p -> GtkBoxClass.FFI.notnull GtkBoxClass.FFI.p;
    val getHeaderBar_ = _import "gtk_dialog_get_header_bar" : GtkDialogClass.FFI.notnull GtkDialogClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getResponseForWidget_ = fn x1 & x2 => (_import "gtk_dialog_get_response_for_widget" : GtkDialogClass.FFI.notnull GtkDialogClass.FFI.p * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p -> GInt.FFI.val_;) (x1, x2)
    val getWidgetForResponse_ = fn x1 & x2 => (_import "gtk_dialog_get_widget_for_response" : GtkDialogClass.FFI.notnull GtkDialogClass.FFI.p * GInt.FFI.val_ -> unit GtkWidgetClass.FFI.p;) (x1, x2)
    val response_ = fn x1 & x2 => (_import "gtk_dialog_response" : GtkDialogClass.FFI.notnull GtkDialogClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val run_ = _import "gtk_dialog_run" : GtkDialogClass.FFI.notnull GtkDialogClass.FFI.p -> GInt.FFI.val_;
    val setAlternativeButtonOrderFromArray_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_dialog_set_alternative_button_order_from_array" :
              GtkDialogClass.FFI.notnull GtkDialogClass.FFI.p
               * GInt.FFI.val_
               * GIntCVectorN.MLton.p1
               * GIntCVectorN.FFI.notnull GIntCVectorN.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setDefaultResponse_ = fn x1 & x2 => (_import "gtk_dialog_set_default_response" : GtkDialogClass.FFI.notnull GtkDialogClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setResponseSensitive_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_dialog_set_response_sensitive" :
              GtkDialogClass.FFI.notnull GtkDialogClass.FFI.p
               * GInt.FFI.val_
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
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
          new = fn x => new "use-header-bar" int x
        }
    end
  end
