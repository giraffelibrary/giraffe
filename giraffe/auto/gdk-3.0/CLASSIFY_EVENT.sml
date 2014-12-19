(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

signature CLASSIFY_EVENT =
  sig
    type 'a event_t

    type eventanyrecord_t
    type eventkeyrecord_t
    type eventbuttonrecord_t
    type eventscrollrecord_t
    type eventmotionrecord_t
    type eventexposerecord_t
    type eventvisibilityrecord_t
    type eventcrossingrecord_t
    type eventfocusrecord_t
    type eventconfigurerecord_t
    type eventpropertyrecord_t
    type eventselectionrecord_t
    type eventdndrecord_t
    type eventproximityrecord_t
    type eventwindowstaterecord_t
    type eventsettingrecord_t
    type eventownerchangerecord_t
    type eventgrabbrokenrecord_t

    type eventanyrecord_event
    type eventkeyrecord_event
    type eventbuttonrecord_event
    type eventscrollrecord_event
    type eventmotionrecord_event
    type eventexposerecord_event
    type eventvisibilityrecord_event
    type eventcrossingrecord_event
    type eventfocusrecord_event
    type eventconfigurerecord_event
    type eventpropertyrecord_event
    type eventselectionrecord_event
    type eventdndrecord_event
    type eventproximityrecord_event
    type eventwindowstaterecord_event
    type eventsettingrecord_event
    type eventownerchangerecord_event
    type eventgrabbrokenrecord_event

    datatype t =
      ANY         of eventanyrecord_t         * eventanyrecord_event
    | KEY         of eventkeyrecord_t         * eventkeyrecord_event
    | BUTTON      of eventbuttonrecord_t      * eventbuttonrecord_event
    | SCROLL      of eventscrollrecord_t      * eventscrollrecord_event
    | MOTION      of eventmotionrecord_t      * eventmotionrecord_event
    | EXPOSE      of eventexposerecord_t      * eventexposerecord_event
    | VISIBILITY  of eventvisibilityrecord_t  * eventvisibilityrecord_event
    | CROSSING    of eventcrossingrecord_t    * eventcrossingrecord_event
    | FOCUS       of eventfocusrecord_t       * eventfocusrecord_event
    | CONFIGURE   of eventconfigurerecord_t   * eventconfigurerecord_event
    | PROPERTY    of eventpropertyrecord_t    * eventpropertyrecord_event
    | SELECTION   of eventselectionrecord_t   * eventselectionrecord_event
    | DND         of eventdndrecord_t         * eventdndrecord_event
    | PROXIMITY   of eventproximityrecord_t   * eventproximityrecord_event
    | WINDOWSTATE of eventwindowstaterecord_t * eventwindowstaterecord_event
    | SETTING     of eventsettingrecord_t     * eventsettingrecord_event
    | OWNERCHANGE of eventownerchangerecord_t * eventownerchangerecord_event
    | GRABBROKEN  of eventgrabbrokenrecord_t  * eventgrabbrokenrecord_event

    val classify : 'a event_t -> t option
  end
