structure GtkDialog :>
  GTK_DIALOG
    where type 'a class = 'a GtkDialogClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_dialog_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_dialog_new" : unit -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val addActionWidget_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_dialog_add_action_widget" :
              GtkDialogClass.C.notnull GtkDialogClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Int.C.val_
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
              GtkDialogClass.C.notnull GtkDialogClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int.C.val_
               -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getActionArea_ = _import "gtk_dialog_get_action_area" : GtkDialogClass.C.notnull GtkDialogClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getContentArea_ = _import "gtk_dialog_get_content_area" : GtkDialogClass.C.notnull GtkDialogClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getResponseForWidget_ = fn x1 & x2 => (_import "gtk_dialog_get_response_for_widget" : GtkDialogClass.C.notnull GtkDialogClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Int.C.val_;) (x1, x2)
    val getWidgetForResponse_ = fn x1 & x2 => (_import "gtk_dialog_get_widget_for_response" : GtkDialogClass.C.notnull GtkDialogClass.C.p * FFI.Int.C.val_ -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;) (x1, x2)
    val response_ = fn x1 & x2 => (_import "gtk_dialog_response" : GtkDialogClass.C.notnull GtkDialogClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val run_ = _import "gtk_dialog_run" : GtkDialogClass.C.notnull GtkDialogClass.C.p -> FFI.Int.C.val_;
    val setDefaultResponse_ = fn x1 & x2 => (_import "gtk_dialog_set_default_response" : GtkDialogClass.C.notnull GtkDialogClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setResponseSensitive_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_dialog_set_response_sensitive" :
              GtkDialogClass.C.notnull GtkDialogClass.C.p
               * FFI.Int.C.val_
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkDialogClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkDialogClass.C.fromPtr false) new_ ()
    fun addActionWidget self child responseId =
      (
        GtkDialogClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> I
      )
        addActionWidget_
        (
          self
           & child
           & responseId
        )
    fun addButton self buttonText responseId =
      (
        GtkDialogClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> GtkWidgetClass.C.fromPtr false
      )
        addButton_
        (
          self
           & buttonText
           & responseId
        )
    fun getActionArea self = (GtkDialogClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getActionArea_ self
    fun getContentArea self = (GtkDialogClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getContentArea_ self
    fun getResponseForWidget self widget = (GtkDialogClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> FFI.Int.C.fromVal) getResponseForWidget_ (self & widget)
    fun getWidgetForResponse self responseId = (GtkDialogClass.C.withPtr &&&> FFI.Int.C.withVal ---> GtkWidgetClass.C.fromPtr false) getWidgetForResponse_ (self & responseId)
    fun response self responseId = (GtkDialogClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) response_ (self & responseId)
    fun run self = (GtkDialogClass.C.withPtr ---> FFI.Int.C.fromVal) run_ self
    fun setDefaultResponse self responseId = (GtkDialogClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setDefaultResponse_ (self & responseId)
    fun setResponseSensitive self responseId setting =
      (
        GtkDialogClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Bool.C.withVal
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
  end
