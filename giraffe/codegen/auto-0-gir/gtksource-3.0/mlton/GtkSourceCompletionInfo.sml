structure GtkSourceCompletionInfo :>
  GTK_SOURCE_COMPLETION_INFO
    where type 'a class = 'a GtkSourceCompletionInfoClass.class =
  struct
    val getType_ = _import "gtk_source_completion_info_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_source_completion_info_new" : unit -> GtkSourceCompletionInfoClass.C.notnull GtkSourceCompletionInfoClass.C.p;
    val getWidget_ = _import "gtk_source_completion_info_get_widget" : GtkSourceCompletionInfoClass.C.notnull GtkSourceCompletionInfoClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val moveToIter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_completion_info_move_to_iter" :
              GtkSourceCompletionInfoClass.C.notnull GtkSourceCompletionInfoClass.C.p
               * GtkTextViewClass.C.notnull GtkTextViewClass.C.p
               * unit GtkTextIterRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setWidget_ = fn x1 & x2 => (_import "gtk_source_completion_info_set_widget" : GtkSourceCompletionInfoClass.C.notnull GtkSourceCompletionInfoClass.C.p * unit GtkWidgetClass.C.p -> unit;) (x1, x2)
    type 'a class = 'a GtkSourceCompletionInfoClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkSourceCompletionInfoClass.C.fromPtr false) new_ ()
    fun getWidget self = (GtkSourceCompletionInfoClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getWidget_ self
    fun moveToIter self view iter =
      (
        GtkSourceCompletionInfoClass.C.withPtr
         &&&> GtkTextViewClass.C.withPtr
         &&&> GtkTextIterRecord.C.withOptPtr
         ---> I
      )
        moveToIter_
        (
          self
           & view
           & iter
        )
    fun setWidget self widget = (GtkSourceCompletionInfoClass.C.withPtr &&&> GtkWidgetClass.C.withOptPtr ---> I) setWidget_ (self & widget)
    local
      open ClosureMarshal Signal
    in
      fun beforeShowSig f = signal "before-show" (void ---> ret_void) f
    end
  end
