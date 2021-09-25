program ChannelSelector;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

uses
  Forms,
{$if defined(FPC)}
  lcl, Interfaces,
{$endif}
  UfrmSelector in 'UfrmSelector.pas' {Channel_Selection},
  Midi in 'Midi.pas',
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
