structure GtkSourceCompletionItemClass :>
  GTK_SOURCE_COMPLETION_ITEM_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a completion_item = unit
    type 'a class = 'a completion_item class
  end
