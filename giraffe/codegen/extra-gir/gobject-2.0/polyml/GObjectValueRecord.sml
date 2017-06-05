(* Copyright (C) 2012, 2016 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure GObjectValueRecord :> G_OBJECT_VALUE_RECORD =
  struct
    structure Pointer = CPointerInternal
    type notnull = Pointer.notnull
    type 'a p = 'a Pointer.p

    val cPtr = Pointer.PolyML.cVal : notnull p PolyMLFFI.conversion

    local
      open PolyMLFFI
    in
      val new_ =
        call (getSymbol libgiraffegobject "giraffe_g_value_new") (cVoid --> cPtr)

      val free_ =
        call (getSymbol libgiraffegobject "giraffe_g_value_free") (cPtr --> cVoid)

      val copy_ =
        call (getSymbol libgobject "g_value_copy") (cPtr &&> cPtr --> cVoid)

      val clear_ =
        call (getSymbol libgobject "g_value_unset") (cPtr --> cVoid)

      val size_ =
        call
          (getSymbol libgiraffegobject "giraffe_g_value_size")
          (cVoid --> GUInt.PolyML.cVal)
    end

    structure Record =
      BoxedValueRecord(
        structure Pointer = Pointer
        type notnull = notnull
        type 'a p = 'a p
        val new_ = new_
        val copy_ = copy_
        val take_ = ignore
        val clear_ = clear_
        val free_ = free_
        val size_ = size_
      )
    open Record
  end
