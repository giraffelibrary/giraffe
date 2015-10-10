structure GIRepositoryTypeTag :>
  sig
    include G_I_REPOSITORY_TYPE_TAG
  end =
  struct
    datatype t =
      BOOLEAN
    | CHAR            (* GIR only, not TYPELIB *)
    | UCHAR           (* GIR only, not TYPELIB *)
    | INT             (* GIR only, not TYPELIB *)
    | UINT            (* GIR only, not TYPELIB *)
    | SHORT           (* GIR only, not TYPELIB *)
    | USHORT          (* GIR only, not TYPELIB *)
    | LONG            (* GIR only, not TYPELIB *)
    | ULONG           (* GIR only, not TYPELIB *)
    | INT8
    | UINT8
    | INT16
    | UINT16
    | INT32
    | UINT32
    | INT64
    | UINT64
    | FLOAT
    | DOUBLE
    | SIZE            (* GIR only, not TYPELIB *)
    | SSIZE           (* GIR only, not TYPELIB *)
    | OFFSET          (* GIR only, not TYPELIB *)
    | INTPTR          (* GIR only, not TYPELIB *)
    | UINTPTR         (* GIR only, not TYPELIB *)
    | UTF8
    | FILENAME
    | VOID
    | GTYPE
    | ARRAY
    | INTERFACE
    | GLIST
    | GSLIST
    | GHASH
    | ERROR
    | UNICHAR
    val toString =
      fn
        BOOLEAN      => "gboolean"
      | CHAR         => "gchar"
      | UCHAR        => "guchar"
      | INT          => "gint"
      | UINT         => "guint"
      | SHORT        => "gshort"
      | USHORT       => "gushort"
      | LONG         => "glong"
      | ULONG        => "gulong"
      | INT8         => "gint8"
      | UINT8        => "guint8"
      | INT16        => "gint16"
      | UINT16       => "guint16"
      | INT32        => "gint32"
      | UINT32       => "guint32"
      | INT64        => "gint64"
      | UINT64       => "guint64"
      | FLOAT        => "gfloat"
      | DOUBLE       => "gdouble"
      | SIZE         => "gsize"
      | SSIZE        => "gssize"
      | OFFSET       => "goffset"
      | INTPTR       => "gintptr"
      | UINTPTR      => "guintptr"
      | UTF8         => "utf8"
      | FILENAME     => "filename"
      | VOID         => "void"
      | GTYPE        => "GType"
      | ARRAY        => "array"
      | INTERFACE    => "interface"
      | GLIST        => "glist"
      | GSLIST       => "gslist"
      | GHASH        => "ghash"
      | ERROR        => "error"
      | UNICHAR      => "gunichar"
  end
