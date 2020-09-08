structure GtkDialog :>
  GTK_DIALOG
    where type 'a class = 'a GtkDialogClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a box_class = 'a GtkBoxClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_dialog_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_dialog_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val addActionWidget_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_dialog_add_action_widget" :
              GtkDialogClass.FFI.non_opt GtkDialogClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt32.FFI.val_
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
              GtkDialogClass.FFI.non_opt GtkDialogClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt32.FFI.val_
               -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getActionArea_ = _import "gtk_dialog_get_action_area" : GtkDialogClass.FFI.non_opt GtkDialogClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getContentArea_ = _import "gtk_dialog_get_content_area" : GtkDialogClass.FFI.non_opt GtkDialogClass.FFI.p -> GtkBoxClass.FFI.non_opt GtkBoxClass.FFI.p;
    val getHeaderBar_ = _import "gtk_dialog_get_header_bar" : GtkDialogClass.FFI.non_opt GtkDialogClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getResponseForWidget_ = fn x1 & x2 => (_import "gtk_dialog_get_response_for_widget" : GtkDialogClass.FFI.non_opt GtkDialogClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GInt32.FFI.val_;) (x1, x2)
    val getWidgetForResponse_ = fn x1 & x2 => (_import "gtk_dialog_get_widget_for_response" : GtkDialogClass.FFI.non_opt GtkDialogClass.FFI.p * GInt32.FFI.val_ -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;) (x1, x2)
    val response_ = fn x1 & x2 => (_import "gtk_dialog_response" : GtkDialogClass.FFI.non_opt GtkDialogClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val run_ = _import "gtk_dialog_run" : GtkDialogClass.FFI.non_opt GtkDialogClass.FFI.p -> GInt32.FFI.val_;
    val setAlternativeButtonOrderFromArray_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_dialog_set_alternative_button_order_from_array" :
              GtkDialogClass.FFI.non_opt GtkDialogClass.FFI.p
               * GInt32.FFI.val_
               * GInt32CArrayN.MLton.p1
               * GInt32CArrayN.FFI.non_opt GInt32CArrayN.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setDefaultResponse_ = fn x1 & x2 => (_import "gtk_dialog_set_default_response" : GtkDialogClass.FFI.non_opt GtkDialogClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setResponseSensitive_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_dialog_set_response_sensitive" :
              GtkDialogClass.FFI.non_opt GtkDialogClass.FFI.p
               * GInt32.FFI.val_
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
    fun getActionArea self = (GtkDialogClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getActionArea_ self
    fun getContentArea self = (GtkDialogClass.FFI.withPtr false ---> GtkBoxClass.FFI.fromPtr false) getContentArea_ self
    fun getHeaderBar self = (GtkDialogClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getHeaderBar_ self
    fun getResponseForWidget self widget = (GtkDialogClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getResponseForWidget_ (self & widget)
    fun getWidgetForResponse self responseId = (GtkDialogClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GtkWidgetClass.FFI.fromOptPtr false) getWidgetForResponse_ (self & responseId)
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
