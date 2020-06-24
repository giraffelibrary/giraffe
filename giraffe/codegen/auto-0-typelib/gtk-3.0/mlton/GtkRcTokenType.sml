structure GtkRcTokenType :> GTK_RC_TOKEN_TYPE =
  struct
    datatype enum =
      INVALID
    | INCLUDE
    | NORMAL
    | ACTIVE
    | PRELIGHT
    | SELECTED
    | INSENSITIVE
    | FG
    | BG
    | TEXT
    | BASE
    | XTHICKNESS
    | YTHICKNESS
    | FONT
    | FONTSET
    | FONT_NAME
    | BG_PIXMAP
    | PIXMAP_PATH
    | STYLE
    | BINDING
    | BIND
    | WIDGET
    | WIDGET_CLASS
    | CLASS
    | LOWEST
    | GTK
    | APPLICATION
    | THEME
    | RC
    | HIGHEST
    | ENGINE
    | MODULE_PATH
    | IM_MODULE_PATH
    | IM_MODULE_FILE
    | STOCK
    | LTR
    | RTL
    | COLOR
    | UNBIND
    | LAST
    structure Enum =
      Enum(
        type enum = enum
        val null = INVALID
        val toInt =
          fn
            INVALID => 270
          | INCLUDE => 271
          | NORMAL => 272
          | ACTIVE => 273
          | PRELIGHT => 274
          | SELECTED => 275
          | INSENSITIVE => 276
          | FG => 277
          | BG => 278
          | TEXT => 279
          | BASE => 280
          | XTHICKNESS => 281
          | YTHICKNESS => 282
          | FONT => 283
          | FONTSET => 284
          | FONT_NAME => 285
          | BG_PIXMAP => 286
          | PIXMAP_PATH => 287
          | STYLE => 288
          | BINDING => 289
          | BIND => 290
          | WIDGET => 291
          | WIDGET_CLASS => 292
          | CLASS => 293
          | LOWEST => 294
          | GTK => 295
          | APPLICATION => 296
          | THEME => 297
          | RC => 298
          | HIGHEST => 299
          | ENGINE => 300
          | MODULE_PATH => 301
          | IM_MODULE_PATH => 302
          | IM_MODULE_FILE => 303
          | STOCK => 304
          | LTR => 305
          | RTL => 306
          | COLOR => 307
          | UNBIND => 308
          | LAST => 309
        exception Value of GInt32.t
        val fromInt =
          fn
            270 => INVALID
          | 271 => INCLUDE
          | 272 => NORMAL
          | 273 => ACTIVE
          | 274 => PRELIGHT
          | 275 => SELECTED
          | 276 => INSENSITIVE
          | 277 => FG
          | 278 => BG
          | 279 => TEXT
          | 280 => BASE
          | 281 => XTHICKNESS
          | 282 => YTHICKNESS
          | 283 => FONT
          | 284 => FONTSET
          | 285 => FONT_NAME
          | 286 => BG_PIXMAP
          | 287 => PIXMAP_PATH
          | 288 => STYLE
          | 289 => BINDING
          | 290 => BIND
          | 291 => WIDGET
          | 292 => WIDGET_CLASS
          | 293 => CLASS
          | 294 => LOWEST
          | 295 => GTK
          | 296 => APPLICATION
          | 297 => THEME
          | 298 => RC
          | 299 => HIGHEST
          | 300 => ENGINE
          | 301 => MODULE_PATH
          | 302 => IM_MODULE_PATH
          | 303 => IM_MODULE_FILE
          | 304 => STOCK
          | 305 => LTR
          | 306 => RTL
          | 307 => COLOR
          | 308 => UNBIND
          | 309 => LAST
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_rc_token_type_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
