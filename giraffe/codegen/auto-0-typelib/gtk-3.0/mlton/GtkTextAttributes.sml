structure GtkTextAttributes :>
  GTK_TEXT_ATTRIBUTES
    where type t = GtkTextAttributesRecord.t =
  struct
    val getType_ = _import "gtk_text_attributes_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_text_attributes_new" : unit -> GtkTextAttributesRecord.C.notnull GtkTextAttributesRecord.C.p;
    val copy_ = _import "gtk_text_attributes_copy" : GtkTextAttributesRecord.C.notnull GtkTextAttributesRecord.C.p -> GtkTextAttributesRecord.C.notnull GtkTextAttributesRecord.C.p;
    val copyValues_ = fn x1 & x2 => (_import "gtk_text_attributes_copy_values" : GtkTextAttributesRecord.C.notnull GtkTextAttributesRecord.C.p * GtkTextAttributesRecord.C.notnull GtkTextAttributesRecord.C.p -> unit;) (x1, x2)
    type t = GtkTextAttributesRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkTextAttributesRecord.C.fromPtr true) new_ ()
    fun copy self = (GtkTextAttributesRecord.C.withPtr ---> GtkTextAttributesRecord.C.fromPtr true) copy_ self
    fun copyValues self dest = (GtkTextAttributesRecord.C.withPtr &&&> GtkTextAttributesRecord.C.withPtr ---> I) copyValues_ (self & dest)
  end
