unit Urtmidi;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
{$ifdef LINUX}
  dynlibs,
{$endif}
  SysUtils;

type
  RtMidiWrapper = record
    ptr_: pointer;
    data: pointer;
    ok: boolean;
    msg: PChar;
  end;
  PRtMidiWrapper = ^RtMidiWrapper;

  RtMidiPtr = PRtMidiWrapper;
  RtMidiInPtr = PRtMidiWrapper;
  RtMidiOutPtr = PRtMidiWrapper;


  RtMidiApi =
    (
      RT_MIDI_API_UNSPECIFIED,    //*!< Search for a working compiled API. */
      RT_MIDI_API_MACOSX_CORE,    //*!< Macintosh OS-X Core Midi API. */
      RT_MIDI_API_LINUX_ALSA,     //*!< The Advanced Linux Sound Architecture API. */
      RT_MIDI_API_UNIX_JACK,      //*!< The Jack Low-Latency MIDI Server API. */
      RT_MIDI_API_WINDOWS_MM,     //*!< The Microsoft Multimedia MIDI API. */
      RT_MIDI_API_WINDOWS_KS,     //*!< The Microsoft Kernel Streaming MIDI API. */
      RT_MIDI_API_RTMIDI_DUMMY    //*!< A compilable but non-functional API. */
    );

  RtMidiErrorType =
    (
      RT_ERROR_WARNING, RT_ERROR_DEBUG_WARNING, RT_ERROR_UNSPECIFIED, RT_ERROR_NO_DEVICES_FOUND,
      RT_ERROR_INVALID_DEVICE, RT_ERROR_MEMORY_ERROR, RT_ERROR_INVALID_PARAMETER, RT_ERROR_INVALID_USE,
      RT_ERROR_DRIVER_ERROR, RT_ERROR_SYSTEM_ERROR, RT_ERROR_THREAD_ERROR
    );

  RtMidiCCallback = procedure(TimeStamp: double; const message: PChar; userData: pointer); cdecl; // __declspec(dllexport);

  //! Returns the size (with sizeof) of a RtMidiApi instance.
  rtmidi_sizeof_rtmidi_api = function: integer; cdecl;


{*! Determine the available compiled MIDI APIs.
 * If the given `apis` parameter is null, returns the number of available APIs.
 * Otherwise, fill the given apis array with the RtMidi::Api values.
 *
 * \param apis  An array or a null value.
*}
  rtmidi_get_compiled_api = function({enum RtMidiApi **} apis: pointer): integer; cdecl; // return length for NULL argument.

//! Report an error.
  rtmidi_error = procedure(type_: RtMidiErrorType; const errorString: PChar); cdecl;
{/*! Open a MIDI port.
 *
 * \param port      Must be greater than 0
 * \param portName  Name for the application port.
 *}
  rtmidi_open_port = procedure(device: RtMidiPtr; portNumber: integer; portName: PChar);
 {
/*! Creates a virtual MIDI port to which other software applications can
 * connect.
 *
 * \param portName  Name for the application port.
 *}
  rtmidi_open_virtual_port = procedure(device: RtMidiPtr; const portName: PChar); cdecl;

  rtmidi_close_port = procedure (device: RtMidiPtr); cdecl;

//*! Return the number of available MIDI ports.
  rtmidi_get_port_count = function (device: RtMidiPtr): integer; cdecl;

//! Return a string identifier for the specified MIDI input port number.
  rtmidi_get_port_name = function (device: RtMidiPtr; portNumber: integer): PChar; cdecl;

{
//! Create a default RtMidiInPtr value, with no initialization.
RTMIDIAPI RtMidiInPtr rtmidi_in_create_default ();

/*! Create a  RtMidiInPtr value, with given api, clientName and queueSizeLimit.
 *
 *  \param api            An optional API id can be specified.
 *  \param clientName     An optional client name can be specified. This
 *                        will be used to group the ports that are created
 *                        by the application.
 *  \param queueSizeLimit An optional size of the MIDI input queue can be
 *                        specified.
 *}
  rtmidi_in_create = function(api: RtMidiApi; const clientName: PChar; queueSizeLimit: integer): RtMidiInPtr; cdecl;

  rtmidi_in_free = procedure (device: RtMidiInPtr); cdecl;

//! Returns the MIDI API specifier for the given instance of RtMidiIn.
  rtmidi_in_get_current_api = function(device: RtMidiPtr): RtMidiApi; cdecL;

//! Set a callback function to be invoked for incoming MIDI messages.
  rtmidi_in_set_callback = procedure(device: RtMidiInPtr; callback: RtMidiCCallback; userData: pointer); cdecl;

//! Cancel use of the current callback function (if one exists).
//RTMIDIAPI void rtmidi_in_cancel_callback (RtMidiInPtr device);

{//! Specify whether certain MIDI message types should be queued or ignored during input.
RTMIDIAPI void rtmidi_in_ignore_types (RtMidiInPtr device, bool midiSysex, bool midiTime, bool midiSense);

/*! Fill the user-provided array with the data bytes for the next available
 * MIDI message in the input queue and return the event delta-time in seconds.
 *
 * \param message   Must point to a char* that is already allocated.
 *                  SYSEX messages maximum size being 1024, a statically
 *                  allocated array could
 *                  be sufficient.
 * \param size      Is used to return the size of the message obtained.
 */
RTMIDIAPI double rtmidi_in_get_message (RtMidiInPtr device, unsigned char **message, size_t * size);

/* RtMidiOut API */

//! Create a default RtMidiInPtr value, with no initialization.
RTMIDIAPI RtMidiOutPtr rtmidi_out_create_default ();

/*! Create a RtMidiOutPtr value, with given and clientName.
 *
 *  \param api            An optional API id can be specified.
 *  \param clientName     An optional client name can be specified. This
 *                        will be used to group the ports that are created
 *                        by the application.
 */}
  rtmidi_out_create = function(api: RtMidiApi; const clientName: PChar): RtMidiOutPtr; cdecl;

//! Deallocate the given pointer.
  rtmidi_out_free = procedure(device: RtMidiOutPtr); cdecl;

//! Returns the MIDI API specifier for the given instance of RtMidiOut.
//RTMIDIAPI enum RtMidiApi rtmidi_out_get_current_api (RtMidiPtr device);

//! Immediately send a single message out an open MIDI output port.
 rtmidi_out_send_message = function(device: RtMidiOutPtr; const message: PChar; length: integer): RtMidiOutPtr; cdecl;

 TMidiOutput = class
   DeviceNames: array of string;
   procedure CloseAll;
   procedure GenerateList;
   procedure Open(device: integer);
   procedure Close(Index: integer);
   procedure Send(Index: integer; command, d1, d2: byte);
   procedure Reset;
 end;

var
  MicrosoftIndex: integer = 0;
  MidiOutput: TMidiOutput;
  MidiInstr: byte = $15; // Akkordeon


implementation

var
  hndLib: TLibHandle = 0;
  prtmidi_in_create: rtmidi_in_create = nil;
  prtmidi_in_free: rtmidi_in_free = nil;
  prtmidi_in_set_callback: rtmidi_in_set_callback = nil;

  prtmidi_out_create: rtmidi_out_create = nil;
  prtmidi_out_free: rtmidi_out_free = nil;
  prtmidi_out_send_message: rtmidi_out_send_message = nil;

  prtmidi_open_port: rtmidi_open_port = nil;
  prtmidi_close_port: rtmidi_close_port = nil;
  prtmidi_open_virtual_port: rtmidi_open_virtual_port = nil;
  prtmidi_get_port_count: rtmidi_get_port_count = nil;
  prtmidi_get_port_name: rtmidi_get_port_name = nil;

  MidiOut: RtMidiOutPtr = nil;
  MidiIn:  RtMidiInPtr = nil;

procedure TMidiOutput.CloseAll;
begin
  Close(0);
end;

procedure TMidiOutput.Open(device: integer);
begin
  prtmidi_open_port(MidiOut, device, '');
end;

procedure TMidiOutput.Close(Index: integer);
begin
  prtmidi_close_port(MidiOut);
end;

procedure TMidiOutput.GenerateList;
var
  i, Count: integer;
  c: PChar;
begin
  Count := prtmidi_get_port_count(MidiOut);
  SetLength(DeviceNames, Count);
  for i := 0 to count-1 do
  begin
    c := prtmidi_get_port_name(MidiOut, i);
    DeviceNames[i] := c;
  end;

end;

procedure TMidiOutput.Send(Index: integer; command, d1, d2: byte);
var
  b: array[0..3] of byte;
begin
  b[0] := command;
  b[1] := d1;
  b[2] := d2;
  b[3] := 0;
  if MidiOut <> nil then
    prtmidi_out_send_message(MidiOut, @b, 3);
end;

procedure TMidiOutput.Reset;
  var
    i, j: integer;
begin
//  if MidiOutput.IsOpen(MicrosoftIndex) then
    for i := 0 to 15 do
    begin
      Sleep(5);
      MidiOutput.Send(MicrosoftIndex, $B0 + i, 120, 0);  // all sound off
    end;
  Sleep(5);
end;

procedure OpenMidiMicrosoft;
begin
  MidiOutput.Open(MicrosoftIndex);
  try
    MidiOutput.Reset;
    MidiOutput.Send(MicrosoftIndex, $c0, MidiInstr, $00);
    MidiOutput.Send(MicrosoftIndex, $c1, MidiInstr, $00);
    MidiOutput.Send(MicrosoftIndex, $c2, MidiInstr, $00);
    MidiOutput.Send(MicrosoftIndex, $c3, MidiInstr, $00);
    MidiOutput.Send(MicrosoftIndex, $c4, MidiInstr, $00);
    MidiOutput.Send(MicrosoftIndex, $c5, MidiInstr, $00);
  finally
  end;
{$if defined(CONSOLE)}
  writeln('Midi Port-', MicrosoftIndex, ' opend');
{$endif}
end;



initialization

  MidiOutput := TMidiOutput.Create;
  hndLib := LoadLibrary(PChar('librtmidi.so'));
  if hndLib <> NilHandle then
  begin
    prtmidi_open_port :=  GetProcedureAddress(hndLib, 'rtmidi_open_port');
    prtmidi_close_port :=  GetProcedureAddress(hndLib, 'rtmidi_close_port');
    prtmidi_open_virtual_port :=  GetProcedureAddress(hndLib, 'rtmidi_open_virtual_port');
    prtmidi_get_port_count :=  GetProcedureAddress(hndLib, 'rtmidi_get_port_count');
    prtmidi_get_port_name :=  GetProcedureAddress(hndLib, 'rtmidi_get_port_name');

    prtmidi_in_create :=  GetProcedureAddress(hndLib, 'rtmidi_in_create');
    prtmidi_in_free :=  GetProcedureAddress(hndLib, 'rtmidi_in_free');
    prtmidi_in_set_callback :=  GetProcedureAddress(hndLib, 'rtmidi_in_set_callback');

    prtmidi_out_create :=  GetProcedureAddress(hndLib, 'rtmidi_out_create');
    prtmidi_out_free :=  GetProcedureAddress(hndLib, 'rtmidi_out_free');
    prtmidi_out_send_message :=  GetProcedureAddress(hndLib, 'rtmidi_out_send_message');

    MidiOut := prtmidi_out_create(RT_MIDI_API_LINUX_ALSA, 'MyMidi');
    MidiIn := prtmidi_in_create(RT_MIDI_API_LINUX_ALSA, 'MyMidi', 100);

  end;

finalization

  FreeLibrary(hndLib);
  MidiOutput.Free;
end.

