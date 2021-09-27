program ChannelSelector;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

uses
  Forms,
{$if defined(FPC)}
  lcl, Interfaces,
{$endif}
{$ifdef LINUX}
  Urtmidi in 'RtMidi.pas',
{$else}
  Midi in 'Midi.pas',
{$endif}
  UfrmSelector in 'UfrmSelector.pas' {Channel_Selection},
  UEventArray in 'UEventArray.pas',
  UMyMemoryStream in 'UMyMemoryStream.pas',
  UMyMidiStream in 'UMyMidiStream.pas',
  UMidiDataStream in 'UMidiDataStream.pas';

{$R *.res}

begin
  Application.Initialize;
{$if not defined(FPC)}
  Application.MainFormOnTaskbar := True;
{$endif}
  Application.CreateForm(TChannel_Selection, Channel_Selection);
  Application.Run;
end.
