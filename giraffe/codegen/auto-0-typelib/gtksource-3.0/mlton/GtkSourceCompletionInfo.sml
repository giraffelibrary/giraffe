structure GtkSourceCompletionInfo :>
  GTK_SOURCE_COMPLETION_INFO
    where type 'a class = 'a GtkSourceCompletionInfoClass.class =
  struct
    val getType_ = _import "gtk_source_completion_info_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_source_completion_info_new" : unit -> GtkSourceCompletionInfoClass.FFI.notnull GtkSourceCompletionInfoClass.FFI.p;
    val getWidget_ = _import "gtk_source_completion_info_get_widget" : GtkSourceCompletionInfoClass.FFI.notnull GtkSourceCompletionInfoClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val moveToIter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_source_completion_info_move_to_iter" :
              GtkSourceCompletionInfoClass.FFI.notnull GtkSourceCompletionInfoClass.FFI.p
               * GtkTextViewClass.FFI.notnull GtkTextViewClass.FFI.p
               * unit GtkTextIterRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setWidget_ = fn x1 & x2 => (_import "gtk_source_completion_info_set_widget" : GtkSourceCompletionInfoClass.FFI.notnull GtkSourceCompletionInfoClass.FFI.p * unit GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkSourceCompletionInfoClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSourceCompletionInfoClass.FFI.fromPtr false) new_ ()
    fun getWidget self = (GtkSourceCompletionInfoClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getWidget_ self
    fun moveToIter self (view, iter) =
      (
        GtkSourceCompletionInfoClass.FFI.withPtr
         &&&> GtkTextViewClass.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withOptPtr
         ---> I
      )
        moveToIter_
        (
          self
           & view
           & iter
        )
    fun setWidget self widget = (GtkSourceCompletionInfoClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withOptPtr ---> I) setWidget_ (self & widget)
    local
      open ClosureMarshal Signal
    in
      fun beforeShowSig f = signal "before-show" (void ---> ret_void) f
    end
  end
