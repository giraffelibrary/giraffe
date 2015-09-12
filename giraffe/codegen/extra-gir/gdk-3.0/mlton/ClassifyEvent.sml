(* Copyright (C) 2012 Phil Clayton <phil.clayton@veonix.com>
 *
 * This file is part of the Giraffe Library runtime.  For your rights to use
 * this file, see the file 'LICENCE.RUNTIME' distributed with Giraffe Library
 * or visit <http://www.giraffelibrary.org/licence-runtime.html>.
 *)

structure ClassifyEvent :>
  CLASSIFY_EVENT
    where type 'a event_t = 'a GdkEvent.t
    where type eventanyrecord_t = GdkEventAnyRecord.t
    where type eventkeyrecord_t = GdkEventKeyRecord.t
    where type eventbuttonrecord_t = GdkEventButtonRecord.t
    where type eventscrollrecord_t = GdkEventScrollRecord.t
    where type eventmotionrecord_t = GdkEventMotionRecord.t
    where type eventexposerecord_t = GdkEventExposeRecord.t
    where type eventvisibilityrecord_t = GdkEventVisibilityRecord.t
    where type eventcrossingrecord_t = GdkEventCrossingRecord.t
    where type eventfocusrecord_t = GdkEventFocusRecord.t
    where type eventconfigurerecord_t = GdkEventConfigureRecord.t
    where type eventpropertyrecord_t = GdkEventPropertyRecord.t
    where type eventselectionrecord_t = GdkEventSelectionRecord.t
    where type eventdndrecord_t = GdkEventDNDRecord.t
    where type eventproximityrecord_t = GdkEventProximityRecord.t
    where type eventwindowstaterecord_t = GdkEventWindowStateRecord.t
    where type eventsettingrecord_t = GdkEventSettingRecord.t
    where type eventownerchangerecord_t = GdkEventOwnerChangeRecord.t
    where type eventgrabbrokenrecord_t = GdkEventGrabBrokenRecord.t
    where type eventanyrecord_event = GdkEventAnyRecord.event
    where type eventkeyrecord_event = GdkEventKeyRecord.event
    where type eventbuttonrecord_event = GdkEventButtonRecord.event
    where type eventscrollrecord_event = GdkEventScrollRecord.event
    where type eventmotionrecord_event = GdkEventMotionRecord.event
    where type eventexposerecord_event = GdkEventExposeRecord.event
    where type eventvisibilityrecord_event = GdkEventVisibilityRecord.event
    where type eventcrossingrecord_event = GdkEventCrossingRecord.event
    where type eventfocusrecord_event = GdkEventFocusRecord.event
    where type eventconfigurerecord_event = GdkEventConfigureRecord.event
    where type eventpropertyrecord_event = GdkEventPropertyRecord.event
    where type eventselectionrecord_event = GdkEventSelectionRecord.event
    where type eventdndrecord_event = GdkEventDNDRecord.event
    where type eventproximityrecord_event = GdkEventProximityRecord.event
    where type eventwindowstaterecord_event = GdkEventWindowStateRecord.event
    where type eventsettingrecord_event = GdkEventSettingRecord.event
    where type eventownerchangerecord_event = GdkEventOwnerChangeRecord.event
    where type eventgrabbrokenrecord_event = GdkEventGrabBrokenRecord.event =
  struct
    type 'a event_t = 'a GdkEvent.t
    type eventanyrecord_t = GdkEventAnyRecord.t
    type eventkeyrecord_t = GdkEventKeyRecord.t
    type eventbuttonrecord_t = GdkEventButtonRecord.t
    type eventscrollrecord_t = GdkEventScrollRecord.t
    type eventmotionrecord_t = GdkEventMotionRecord.t
    type eventexposerecord_t = GdkEventExposeRecord.t
    type eventvisibilityrecord_t = GdkEventVisibilityRecord.t
    type eventcrossingrecord_t = GdkEventCrossingRecord.t
    type eventfocusrecord_t = GdkEventFocusRecord.t
    type eventconfigurerecord_t = GdkEventConfigureRecord.t
    type eventpropertyrecord_t = GdkEventPropertyRecord.t
    type eventselectionrecord_t = GdkEventSelectionRecord.t
    type eventdndrecord_t = GdkEventDNDRecord.t
    type eventproximityrecord_t = GdkEventProximityRecord.t
    type eventwindowstaterecord_t = GdkEventWindowStateRecord.t
    type eventsettingrecord_t = GdkEventSettingRecord.t
    type eventownerchangerecord_t = GdkEventOwnerChangeRecord.t
    type eventgrabbrokenrecord_t = GdkEventGrabBrokenRecord.t
    type eventanyrecord_event = GdkEventAnyRecord.event
    type eventkeyrecord_event = GdkEventKeyRecord.event
    type eventbuttonrecord_event = GdkEventButtonRecord.event
    type eventscrollrecord_event = GdkEventScrollRecord.event
    type eventmotionrecord_event = GdkEventMotionRecord.event
    type eventexposerecord_event = GdkEventExposeRecord.event
    type eventvisibilityrecord_event = GdkEventVisibilityRecord.event
    type eventcrossingrecord_event = GdkEventCrossingRecord.event
    type eventfocusrecord_event = GdkEventFocusRecord.event
    type eventconfigurerecord_event = GdkEventConfigureRecord.event
    type eventpropertyrecord_event = GdkEventPropertyRecord.event
    type eventselectionrecord_event = GdkEventSelectionRecord.event
    type eventdndrecord_event = GdkEventDNDRecord.event
    type eventproximityrecord_event = GdkEventProximityRecord.event
    type eventwindowstaterecord_event = GdkEventWindowStateRecord.event
    type eventsettingrecord_event = GdkEventSettingRecord.event
    type eventownerchangerecord_event = GdkEventOwnerChangeRecord.event
    type eventgrabbrokenrecord_event = GdkEventGrabBrokenRecord.event


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


    val eventType_ = _import "giraffe_gdk_get_event_type" : GdkEvent.C.notnull GdkEvent.C.p -> GdkEventType.C.val_;


    fun eventType self =
      (GdkEvent.C.withPtr ---> GdkEventType.C.fromVal) eventType_ self


    local
      fun mkT (con, fromPtr, ty) event = con (GdkEvent.C.withPtr (fromPtr false) event, ty)
    in
      fun classify e =
        case eventType e of
          GdkEventType.NOTHING           => NONE
        | GdkEventType.DELETE            => SOME (mkT (ANY, GdkEventAnyRecord.C.fromPtr, GdkEventAnyRecord.DELETE) e)
        | GdkEventType.DESTROY           => SOME (mkT (ANY, GdkEventAnyRecord.C.fromPtr, GdkEventAnyRecord.DESTROY) e)
        | GdkEventType.EXPOSE            => SOME (mkT (EXPOSE, GdkEventExposeRecord.C.fromPtr, GdkEventExposeRecord.EXPOSE) e)
        | GdkEventType.MOTIONNOTIFY      => SOME (mkT (MOTION, GdkEventMotionRecord.C.fromPtr, GdkEventMotionRecord.MOTIONNOTIFY) e)
        | GdkEventType.BUTTONPRESS       => SOME (mkT (BUTTON, GdkEventButtonRecord.C.fromPtr, GdkEventButtonRecord.BUTTONPRESS) e)
        | GdkEventType.DOUBLEBUTTONPRESS => SOME (mkT (BUTTON, GdkEventButtonRecord.C.fromPtr, GdkEventButtonRecord.DOUBLEBUTTONPRESS) e)
        | GdkEventType.TRIPLEBUTTONPRESS => SOME (mkT (BUTTON, GdkEventButtonRecord.C.fromPtr, GdkEventButtonRecord.TRIPLEBUTTONPRESS) e)
        | GdkEventType.BUTTONRELEASE     => SOME (mkT (BUTTON, GdkEventButtonRecord.C.fromPtr, GdkEventButtonRecord.BUTTONRELEASE) e)
        | GdkEventType.KEYPRESS          => SOME (mkT (KEY, GdkEventKeyRecord.C.fromPtr, GdkEventKeyRecord.KEYPRESS) e)
        | GdkEventType.KEYRELEASE        => SOME (mkT (KEY, GdkEventKeyRecord.C.fromPtr, GdkEventKeyRecord.KEYRELEASE) e)
        | GdkEventType.ENTERNOTIFY       => SOME (mkT (CROSSING, GdkEventCrossingRecord.C.fromPtr, GdkEventCrossingRecord.ENTERNOTIFY) e)
        | GdkEventType.LEAVENOTIFY       => SOME (mkT (CROSSING, GdkEventCrossingRecord.C.fromPtr, GdkEventCrossingRecord.LEAVENOTIFY) e)
        | GdkEventType.FOCUSCHANGE       => SOME (mkT (FOCUS, GdkEventFocusRecord.C.fromPtr, GdkEventFocusRecord.FOCUSCHANGE) e)
        | GdkEventType.CONFIGURE         => SOME (mkT (CONFIGURE, GdkEventConfigureRecord.C.fromPtr, GdkEventConfigureRecord.CONFIGURE) e)
        | GdkEventType.MAP               => SOME (mkT (ANY, GdkEventAnyRecord.C.fromPtr, GdkEventAnyRecord.MAP) e)
        | GdkEventType.UNMAP             => SOME (mkT (ANY, GdkEventAnyRecord.C.fromPtr, GdkEventAnyRecord.UNMAP) e)
        | GdkEventType.PROPERTYNOTIFY    => SOME (mkT (PROPERTY, GdkEventPropertyRecord.C.fromPtr, GdkEventPropertyRecord.PROPERTYNOTIFY) e)
        | GdkEventType.SELECTIONCLEAR    => SOME (mkT (SELECTION, GdkEventSelectionRecord.C.fromPtr, GdkEventSelectionRecord.SELECTIONCLEAR) e)
        | GdkEventType.SELECTIONREQUEST  => SOME (mkT (SELECTION, GdkEventSelectionRecord.C.fromPtr, GdkEventSelectionRecord.SELECTIONNOTIFY) e)
        | GdkEventType.SELECTIONNOTIFY   => SOME (mkT (SELECTION, GdkEventSelectionRecord.C.fromPtr, GdkEventSelectionRecord.SELECTIONREQUEST) e)
        | GdkEventType.PROXIMITYIN       => SOME (mkT (PROXIMITY, GdkEventProximityRecord.C.fromPtr, GdkEventProximityRecord.PROXIMITYIN) e)
        | GdkEventType.PROXIMITYOUT      => SOME (mkT (PROXIMITY, GdkEventProximityRecord.C.fromPtr, GdkEventProximityRecord.PROXIMITYOUT) e)
        | GdkEventType.DRAGENTER         => SOME (mkT (DND, GdkEventDNDRecord.C.fromPtr, GdkEventDNDRecord.DRAGENTER) e)
        | GdkEventType.DRAGLEAVE         => SOME (mkT (DND, GdkEventDNDRecord.C.fromPtr, GdkEventDNDRecord.DRAGLEAVE) e)
        | GdkEventType.DRAGMOTION        => SOME (mkT (DND, GdkEventDNDRecord.C.fromPtr, GdkEventDNDRecord.DRAGMOTION) e)
        | GdkEventType.DRAGSTATUS        => SOME (mkT (DND, GdkEventDNDRecord.C.fromPtr, GdkEventDNDRecord.DRAGSTATUS) e)
        | GdkEventType.DROPSTART         => SOME (mkT (DND, GdkEventDNDRecord.C.fromPtr, GdkEventDNDRecord.DROPSTART) e)
        | GdkEventType.DROPFINISHED      => SOME (mkT (DND, GdkEventDNDRecord.C.fromPtr, GdkEventDNDRecord.DROPFINISHED) e)
        | GdkEventType.CLIENTEVENT       => SOME (mkT (ANY, GdkEventAnyRecord.C.fromPtr, GdkEventAnyRecord.CLIENTEVENT) e)
        | GdkEventType.VISIBILITYNOTIFY  => SOME (mkT (VISIBILITY, GdkEventVisibilityRecord.C.fromPtr, GdkEventVisibilityRecord.VISIBILITYNOTIFY) e)
        | GdkEventType.SCROLL            => SOME (mkT (SCROLL, GdkEventScrollRecord.C.fromPtr, GdkEventScrollRecord.SCROLL) e)
        | GdkEventType.WINDOWSTATE       => SOME (mkT (WINDOWSTATE, GdkEventWindowStateRecord.C.fromPtr, GdkEventWindowStateRecord.WINDOWSTATE) e)
        | GdkEventType.SETTING           => SOME (mkT (SETTING, GdkEventSettingRecord.C.fromPtr, GdkEventSettingRecord.SETTING) e)
        | GdkEventType.OWNERCHANGE       => SOME (mkT (OWNERCHANGE, GdkEventOwnerChangeRecord.C.fromPtr, GdkEventOwnerChangeRecord.OWNERCHANGE) e)
        | GdkEventType.GRABBROKEN        => SOME (mkT (GRABBROKEN, GdkEventGrabBrokenRecord.C.fromPtr, GdkEventGrabBrokenRecord.GRABBROKEN) e)
        | GdkEventType.DAMAGE            => SOME (mkT (EXPOSE, GdkEventExposeRecord.C.fromPtr, GdkEventExposeRecord.DAMAGE) e)
        | GdkEventType.EVENTLAST         => NONE
    end
  end
