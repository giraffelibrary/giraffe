structure GtkSourceCompletionItem :>
  GTK_SOURCE_COMPLETION_ITEM
    where type 'a class = 'a GtkSourceCompletionItemClass.class
    where type 'a completion_proposal_class = 'a GtkSourceCompletionProposalClass.class =
  struct
    val getType_ = _import "gtk_source_completion_item_get_type" : unit -> GObjectType.C.val_;
    val new_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & (x6, x7) =>
          (
            _import "mlton_gtk_source_completion_item_new" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * unit GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val newFromStock_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & (x7, x8) =>
          (
            _import "mlton_gtk_source_completion_item_new_from_stock" :
              Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val newWithMarkup_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & (x6, x7) =>
          (
            _import "mlton_gtk_source_completion_item_new_with_markup" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * unit GObjectObjectClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    type 'a class = 'a GtkSourceCompletionItemClass.class
    type 'a completion_proposal_class = 'a GtkSourceCompletionProposalClass.class
    type t = base class
    fun asCompletionProposal self = (GObjectObjectClass.C.withPtr ---> GtkSourceCompletionProposalClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new label text icon info =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> Utf8.C.withOptPtr
         ---> GtkSourceCompletionItemClass.C.fromPtr true
      )
        new_
        (
          label
           & text
           & icon
           & info
        )
    fun newFromStock label text stock info =
      (
        Utf8.C.withOptPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withOptPtr
         ---> GtkSourceCompletionItemClass.C.fromPtr true
      )
        newFromStock_
        (
          label
           & text
           & stock
           & info
        )
    fun newWithMarkup markup text icon info =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> Utf8.C.withOptPtr
         ---> GtkSourceCompletionItemClass.C.fromPtr true
      )
        newWithMarkup_
        (
          markup
           & text
           & icon
           & info
        )
    local
      open Property
    in
      val iconProp =
        {
          get = fn x => get "icon" GdkPixbufPixbufClass.tOpt x,
          set = fn x => set "icon" GdkPixbufPixbufClass.tOpt x
        }
      val infoProp =
        {
          get = fn x => get "info" stringOpt x,
          set = fn x => set "info" stringOpt x
        }
      val labelProp =
        {
          get = fn x => get "label" stringOpt x,
          set = fn x => set "label" stringOpt x
        }
      val markupProp =
        {
          get = fn x => get "markup" stringOpt x,
          set = fn x => set "markup" stringOpt x
        }
      val textProp =
        {
          get = fn x => get "text" stringOpt x,
          set = fn x => set "text" stringOpt x
        }
    end
  end
