(* Copyright (C) 2013, 2016-2018, 2020-2021 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature G_OBJECT_OBJECT_CLASS =
  sig
    include CLASS
    type type_t
    type 'a value_accessor_t
    val t : base class value_accessor_t
    val tOpt : base class option value_accessor_t
    val toDerived : 'a class value_accessor_t -> base class -> 'a class
    val instanceType : 'a class -> type_t
  end
