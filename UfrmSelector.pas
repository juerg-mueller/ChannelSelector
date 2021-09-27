//
// Copyright (C) 2021 Jürg Müller, CH-5524
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation version 3 of the License.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program. If not, see http://www.gnu.org/licenses/ .
//
unit UfrmSelector;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

interface

uses
{$ifndef FPC}
  Windows,
{$else}
  LCLType,
{$endif}
  Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, UEventArray, UMyMidiStream,
  ComCtrls, ExtCtrls;

type

  { TChannel_Selection }

  TChannel_Selection = class(TForm)
    btnLoadMidi: TButton;
    FileOpenDialog1: TOpenDialog;
    btnSaveMidi: TButton;
    btnPlay: TButton;
    GroupBox2: TGroupBox;
    lb0: TLabel;
    lb1: TLabel;
    lb2: TLabel;
    lb3: TLabel;
    lb4: TLabel;
    lb5: TLabel;
    lb6: TLabel;
    lb7: TLabel;
    lb8: TLabel;
    lb9: TLabel;
    lb10: TLabel;
    lb11: TLabel;
    lb12: TLabel;
    lb13: TLabel;
    lb14: TLabel;
    lb15: TLabel;
    GroupBox1: TGroupBox;
    cb0: TCheckBox;
    cb5: TCheckBox;
    cb1: TCheckBox;
    cb2: TCheckBox;
    cb3: TCheckBox;
    cb4: TCheckBox;
    cb6: TCheckBox;
    cb7: TCheckBox;
    cbC: TCheckBox;
    cbB: TCheckBox;
    cbA: TCheckBox;
    cb9: TCheckBox;
    cb8: TCheckBox;
    cbF: TCheckBox;
    cbE: TCheckBox;
    cbD: TCheckBox;
    GroupBox3: TGroupBox;
    cbb0: TCheckBox;
    cbb5: TCheckBox;
    cbb1: TCheckBox;
    cbb2: TCheckBox;
    cbb3: TCheckBox;
    cbb4: TCheckBox;
    cbb6: TCheckBox;
    cbb7: TCheckBox;
    cbb12: TCheckBox;
    cbb11: TCheckBox;
    cbb10: TCheckBox;
    cbb9: TCheckBox;
    cbb8: TCheckBox;
    cbb15: TCheckBox;
    cbb14: TCheckBox;
    cbb13: TCheckBox;
    cbxMidiOut: TComboBox;
    Label17: TLabel;
    SaveDialog1: TSaveDialog;
    Label1: TLabel;
    lbPlayLength: TLabel;
    cbx0: TComboBox;
    cbx1: TComboBox;
    cbx2: TComboBox;
    cbx3: TComboBox;
    cbx4: TComboBox;
    cbx5: TComboBox;
    cbx6: TComboBox;
    cbx7: TComboBox;
    cbx8: TComboBox;
    cbx10: TComboBox;
    cbx11: TComboBox;
    cbx12: TComboBox;
    cbx13: TComboBox;
    cbx14: TComboBox;
    cbx15: TComboBox;
    edDrum: TEdit;
    procedure btnLoadMidiClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbClick(Sender: TObject);
    procedure cbbClick(Sender: TObject);
    procedure btnSaveMidiClick(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbxMidiOutChange(Sender: TObject);
{$ifdef FPC}
    procedure FormDropFiles(Sender: TObject; const FileNames: array of String);
{$else}
    procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
{$endif}
    procedure cbxChange(Sender: TObject);
  private
    InstrList: TStringList;
    function GetCbx(idx: integer): TComboBox;
    function GetCb(idx: integer): TCheckBox;
    function GetCbb(idx: integer): TCheckBox;
    function GetCbIdx(cbx: TCheckBox): integer;
    function GetCbbIdx(cbx: TCheckBox): integer;
    function GetCbxIdx(cbx: TObject): integer;
    procedure EnableButtons(En: boolean);
  public
    Playing: boolean;
    Pos: string;
    MidiRead: boolean;
    MidiFileName: string;
    OpenPath, SavePath: string;
    ChannelArr: TChannelEventArray;
    Partitur: TEventArray;
    procedure SetPlayEvent(const Event: TMidiEvent);
    procedure ClearLabels;
    procedure MakeTrack(var MidiEventArr: TMidiEventArray; Bass: boolean);
    procedure LoadMidiFile(const FileName: string);
  end;

var
  Channel_Selection: TChannel_Selection;

const
  cInstruments : array [0..127] of string =
    ('Acoustic Grand Piano (Flügel)',
     'Bright Acoustic Piano (Klavier)',
     'Electric Grand Piano',
     'Honky-tonk',
     'Electric Piano 1 (Rhodes)',
     'Electric Piano 2 (Chorus)',
     'Harpsichord (Cembalo)',
     'Clavi (Clavinet)',
     'Celesta',
     'Chimes (Glockenspiel)',
     'Music Box (Spieluhr)',
     'Vibraphone',
     'Marimba',
     'Xylophone',
     'Tubular Bells (Röhrenglocken)',
     'Dulcimer (Hackbrett)',
     'Drawbar Organ (Hammond)',
     'Percussive Organ',
     'Rock Organ',
     'Church Organ (Kirchenorgel)',
     'Reed Organ (Drehorgel)',
     'Accordion',
     'Harmonica',
     'Tango Accordion (Bandeon)',
     'Acoustic Guitar (Nylon)',
     'Acoustic Guitar (Steel - Stahl)',
     'Electric Guitar (Jazz)',
     'Electric Guitar (clean - sauber)',
     'Electric Guitar (muted - gedämpft)',
     'Overdriven Guitar (übersteuert)',
     'Distortion Guitar (verzerrt)',
     'Guitar harmonics (Harmonien)',
     'Acoustic Bass',
     'Electric Bass (finger)',
     'Electric Bass (pick - gezupft)',
     'Fretless Bass (bundloser Bass)',
     'Slap Bass 1',
     'Slap Bass 2',
     'Synth Bass 1',
     'Synth Bass 2',
     'Violin (Violine - Geige)',
     'Viola (Viola - Bratsche)',
     'Cello (Violoncello - Cello)',
     'Contrabass (Violone - Kontrabass)',
     'Tremolo Strings',
     'Pizzicato Strings',
     'Orchestral Harp (Harfe)',
     'Timpani (Pauke)',
     'String Ensemble 1',
     'String Ensemble 2',
     'SynthString 1',
     'SynthString 2',
     'Choir Aahs',
     'Voice Oohs',
     'Synth Voice',
     'Orchestra Hit',
     'Trumpet (Trompete)',
     'Trombone (Posaune)',
     'Tuba',
     'Muted Trumpet (gedämpfe Trompete)',
     'French Horn (französisches Horn)',
     'Brass Section (Bläsersatz)',
     'SynthBrass 1',
     'SynthBrass 2',
     'Soprano Sax',
     'Alto Sax',
     'Tenor Sax',
     'Baritone Sax',
     'Oboe',
     'English Horn',
     'Bassoon (Fagott)',
     'Clarinet',
     'Piccolo',
     'Flute (Flöte)',
     'Recorder (Blockflöte)',
     'Pan Flute',
     'Blown Bottle',
     'Shakuhachi',
     'Whistle (Pfeifen)',
     'Ocarina',
     'Square (Rechteck)',
     'Sawtooth (Sägezahn)',
     'Calliop',
     'Chiff',
     'Charang',
     'Voice',
     'Fifths',
     'Bass + Lead',
     'New Age',
     'Warm',
     'Polysynth',
     'Choir',
     'Bowed (Streicher)',
     'Metallic',
     'Halo',
     'Sweep',
     'Rain (Regen)',
     'Soundtrack',
     'Crystal',
     'Atmosphere',
     'Brightness',
     'Goblins',
     'Echoes',
     'Sci-Fi (Science Fiction)',
     'Sitar Ethnik',
     'Banjo',
     'Shamisen',
     'Koto',
     'Kalimba',
     'Bag Pipe (Dudelsack)',
     'Fiddle',
     'Shanai',
     'Tinkle Bell (Glocke)',
     'Agogo',
     'Steel Drums',
     'Woodblock',
     'Taiko Drum',
     'Melodic Tom',
     'Synth Drum',
     'Reverse Cymbal (Becken rückwärts)',
     'Guitar Fret. Noise (Gitarrensaitenquitschen)',
     'Breath Noise (Atem)',
     'Seashore (Meeresbrandung)',
     'Bird Tweet (Vogelgezwitscher)',
     'Telephone Ring',
     'Helicopter',
     'Applause',
     'Gun Shot (Gewehrschuss)'
   );

implementation

{$ifdef FPC}
{$R *.lfm}
{$else}
{$R *.dfm}
{$endif}

uses
{$IFnDEF FPC}
  ShellApi,
{$ELSE}
{$ENDIF}
{$ifdef LINUX}
  Urtmidi,
{$else}
  Midi,
{$endif}
UMidiDataStream;

{$ifdef FPC}
procedure TChannel_Selection.FormDropFiles(Sender: TObject; const FileNames: array of String);
var
  FileName: string;
begin
  if Playing then
    exit;

  if Length(FileNames) > 0 then
    LoadMidiFile(FileNames[0]);
end;
{$else}
procedure TChannel_Selection.WMDropFiles(var Msg: TWMDropFiles);
var
  DropH: HDROP;               // drop handle
  DroppedFileCount: Integer;  // number of files dropped
  FileNameLength: Integer;    // length of a dropped file name
  FileName: string;           // a dropped file name
begin
  inherited;

  if Playing then
    exit;

  DropH := Msg.Drop;
  try
    DroppedFileCount := DragQueryFile(DropH, $FFFFFFFF, nil, 0);
    if (DroppedFileCount > 0) then
    begin
      FileNameLength := DragQueryFile(DropH, 0, nil, 0);
      SetLength(FileName, FileNameLength);
      DragQueryFile(DropH, 0, PChar(FileName), FileNameLength + 1);
      LoadMidiFile(FileName);
    end;
  finally
    DragFinish(DropH);
  end;
  Msg.Result := 0;
end;
{$endif}

function TChannel_Selection.GetCbx(idx: integer): TComboBox;
begin
  case idx of
    0: result := cbx0;
    1: result := cbx1;
    2: result := cbx2;
    3: result := cbx3;
    4: result := cbx4;
    5: result := cbx5;
    6: result := cbx6;
    7: result := cbx7;
    8: result := cbx8;
    9: result := nil;
    10: result := cbx10;
    11: result := cbx11;
    12: result := cbx12;
    13: result := cbx13;
    14: result := cbx14;
    15: result := cbx15;
    else result := nil;
  end;
end;

function TChannel_Selection.GetCbxIdx(cbx: TObject): integer;
begin
  result := 15;
  while (result >= 0) and (cbx <> GetCbx(result)) do
    dec(result);
end;

function TChannel_Selection.GetCb(idx: integer): TCheckBox;
begin
  case idx of
    0: result := cb0;
    1: result := cb1;
    2: result := cb2;
    3: result := cb3;
    4: result := cb4;
    5: result := cb5;
    6: result := cb6;
    7: result := cb7;
    8: result := cb8;
    9: result := cb9;
    10: result := cbA;
    11: result := cbB;
    12: result := cbC;
    13: result := cbD;
    14: result := cbE;
    15: result := cbF;
    else result := nil;
  end;
end;

function TChannel_Selection.GetCbb(idx: integer): TCheckBox;
begin
  case idx of
    0: result := cbb0;
    1: result := cbb1;
    2: result := cbb2;
    3: result := cbb3;
    4: result := cbb4;
    5: result := cbb5;
    6: result := cbb6;
    7: result := cbb7;
    8: result := cbb8;
    9: result := cbb9;
    10: result := cbb10;
    11: result := cbb11;
    12: result := cbb12;
    13: result := cbb13;
    14: result := cbb14;
    15: result := cbb15;
    else result := nil;
  end;
end;

function TChannel_Selection.GetCbIdx(cbx: TCheckBox): integer;
begin
  result := 15;
  while (result >= 0) and (cbx <> GetCb(result)) do
    dec(result);
end;

function TChannel_Selection.GetCbbIdx(cbx: TCheckBox): integer;
begin
  result := 15;
  while (result >= 0) and (cbx <> GetCbb(result)) do
    dec(result);
end;

procedure TChannel_Selection.cbbClick(Sender: TObject);
var
  i: integer;
  box: TCheckBox;
begin
  if Sender is TCheckBox then
  begin
    box := (Sender as TCheckBox);
    i := GetCbbIdx(box);
    if box.Checked and (i >= 0) then
    begin
      if not TEventArray.HasSound(ChannelArr[i]) then
        box.Checked := false
      else
        GetCb(i).Checked := false;
    end;
  end;
end;

procedure TChannel_Selection.cbClick(Sender: TObject);
var
  i: integer;
  box: TCheckBox;
begin
  if Sender is TCheckBox then
  begin
    box := (Sender as TCheckBox);
    i := GetCbIdx(box);
    if box.Checked and (i >= 0) then
    begin
      if not TEventArray.HasSound(ChannelArr[i]) then
        box.Checked := false
      else
        GetCbb(i).Checked := false;
    end;
  end;
end;

procedure TChannel_Selection.cbxChange(Sender: TObject);
var
  i, idx: integer;
  instr: integer;
  Found: boolean;
begin
  idx := GetCbxIdx(Sender);
  instr := (Sender as TComboBox).ItemIndex;
  if (idx >= 0) and (instr >= 0) then
  begin
    Found := false;
    for i := 1 to Length(ChannelArr[idx])-1 do
      if ChannelArr[idx][i].Event = 12 then
      begin
        ChannelArr[idx][i].d1 := byte(instr);
        Found := true;
      end;
    if not Found then
    begin
      // Programmwechsel einfügen
      SetLength(ChannelArr[idx], Length(ChannelArr[idx]) + 1);
      for i := Length(ChannelArr[idx])-1 downto 2 do
        ChannelArr[idx][i] := ChannelArr[idx][i-1];
      with ChannelArr[idx][1] do
      begin
        Clear;
        Command := $C0 + idx;
        d1 := byte(instr);
      end;
    end;
  end;

end;

procedure TChannel_Selection.cbxMidiOutChange(Sender: TObject);
begin
  if cbxMidiOut.ItemIndex >= 0 then
  begin
    MicrosoftIndex := cbxMidiOut.ItemIndex;
  end;
end;

procedure TChannel_Selection.ClearLabels;
var
  i: integer;
begin
  for i := 0 to 15 do
  begin
    if i <> 9 then
    begin
      GetCbx(i).ItemIndex := -1;
      GetCbx(i).Enabled := false;
      GetCbx(i).Text := '';
    end;
    GetCb(i).Checked := false;
    GetCb(i).Enabled := false;
    GetCbb(i).Checked := false;
    GetCbb(i).Enabled := false;
  end;
end;

procedure TChannel_Selection.btnLoadMidiClick(Sender: TObject);
begin
  if Playing then
  begin
    Playing := false;
    exit;
  end;

  FileOpenDialog1.FileName := '';
  FileOpenDialog1.InitialDir := OpenPath;

  if not FileOpenDialog1.Execute then
    exit;

  MidiFileName := FileOpenDialog1.FileName;
  if not FileExists(MidiFileName) then
    raise Exception.Create('File does not exist!');

  OpenPath := ExtractFilePath(MidiFileName);
  if SaveDialog1.FileName = '' then
    SavePath := OpenPath;
  SaveDialog1.FileName := SavePath + ExtractFilename(MidiFileName);

  LoadMidiFile(MidiFileName);
end;

procedure TChannel_Selection.LoadMidiFile(const FileName: string);
var
  Ok: boolean;
  i, idx: integer;
  ext, s: string;
  Events: TMidiEventArray;
begin
  MidiRead := false;
  Caption := 'Channel Selector';

  Ok := Partitur.LoadMidiFromFile(FileName);
  if not Ok then
    raise Exception.Create('File not read!');

  MidiFileName := FileName;

  SetLength(Events, 0);
  for i := 0 to Length(Partitur.TrackArr)-1 do
    TEventArray.MergeTracks(Events, Partitur.TrackArr[i]);

  TEventArray.SplitEventArray(ChannelArr, Events, Length(Events));
  SetLength(Events, 0);

  ClearLabels;
  for i := 0 to 15 do
    if TEventArray.HasSound(ChannelArr[i]) then
    begin
      idx := TEventArray.InstrumentIdx(ChannelArr[i]);
      if i <> 9 then
        GetCbx(i).Enabled := true;
      GetCb(i).Enabled := true;
      GetCbb(i).Enabled := true;
      if i = 9 then
      begin
        GetCbb(i).Checked := true;
      end else
      if (idx >= 0) and (idx <= High(cInstruments)) then
      begin
        GetCbx(i).ItemIndex := idx;
        if byte(idx + 1) in [33..40, 44, 59, 67, 68] then
          GetCbb(i).Checked := true
        else
          GetCb(i).Checked := true;
      end else begin
        GetCb(i).Checked := true;
      end;
    end;
  ext := LowerCase(ExtractFileExt(MidiFileName));
  s := ExtractFilename(MidiFileName);
  SetLength(s, Length(s)-Length(ext));
  if Partitur.DetailHeader.CDur <> 0 then
    s := s + ' (' + Partitur.DetailHeader.GetDur + ')';
  Caption := s;
  MidiRead := true;
end;

procedure TChannel_Selection.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Playing := false;
end;

procedure TChannel_Selection.FormCreate(Sender: TObject);
var
  i: integer;
begin
  InstrList := TStringList.Create;
  for i := 0 to 127 do
    InstrList.Add(IntToStr(i+1) + ' ' + cInstruments[i]);
  for i := 0 to 15 do
    if i <> 9 then
      GetCbx(i).Items := InstrList;

  MidiRead := false;
  Partitur := TEventArray.Create;
  ClearLabels;
  MidiOutput.GenerateList;
  Playing := false;
  cbxMidiOut.Items.Clear;
{$ifdef LINUX}
  for i := 0 to Length(MidiOutput.DeviceNames)-1 do
    cbxMidiOut.Items.Append(MidiOutput.DeviceNames[i]);
{$else}
  cbxMidiOut.Items.Assign(MidiOutput.DeviceNames);
{$endif}
  cbxMidiOut.ItemIndex := MicrosoftIndex;
{$ifndef FPC}
  DragAcceptFiles(Self.Handle, true);
{$endif}
end;

procedure TChannel_Selection.FormDestroy(Sender: TObject);
begin
  MidiOutput.CloseAll;
  Partitur.Free;
  InstrList.Free;
end;

procedure TChannel_Selection.MakeTrack(var MidiEventArr: TMidiEventArray; Bass: boolean);
var
  i: integer;
  choose: boolean;
begin
  for i := 0 to 15 do
  begin
    if Bass then
      Choose := GetCbb(i).Checked
    else
      Choose := GetCb(i).Checked;
    if Choose then
    begin
      if Length(MidiEventArr) = 0 then
      begin
        MidiEventArr := ChannelArr[i];
      end else
        TEventArray.MergeTracks(MidiEventArr, ChannelArr[i]);
    end;
  end;
end;

procedure TChannel_Selection.EnableButtons(En: boolean);
begin
  btnSaveMidi.Enabled := En;
  cbxMidiOut.Enabled := En;
end;

procedure TChannel_Selection.SetPlayEvent(const Event: TMidiEvent);
var
  col: TColor;
begin
  if Event.Event in [8, 9] then
  begin
    if Event.Event = 9 then
      Col := clYellow
    else
      Col := clWhite;
    if Event.Channel = 9 then
      edDrum.Color := Col
    else
      GetCbx(Event.Channel).Color := Col;
  end;
end;

procedure TChannel_Selection.btnPlayClick(Sender: TObject);
var
  Player: TMidiEventPlayer;
begin
  if (btnPlay.Caption = 'Play') and MidiRead then
  begin
    Playing := true;
    btnPlay.Caption := 'Stop';
    EnableButtons(false);
    MidiOutput.Open(MicrosoftIndex);
  {$ifdef LINUX}
    Player := TMidiEventPlayer.Create;
  {$else}
    Player := TMidiEventPlayer.Create(true);
  {$endif}
    try
      SetLength(Player.MidiEventArr, 0);
      MakeTrack(Player.MidiEventArr, false);
      MakeTrack(Player.MidiEventArr, true);
      Player.DetailHeader := Partitur.DetailHeader;
      Player.Pos := @Pos;
      Player.Playing := @Playing;
      Player.SetPlayEvent := SetPlayEvent;
    {$ifdef LINUX}
      Player.Execute;
    {$else}
      Player.Resume;
      while not Player.Terminated_ do
      begin
        Channel_Selection.lbPlayLength.Caption := Pos;
        Application.ProcessMessages;
        Sleep(10);
      end;
    {$endif}
    finally
      Playing := false;
      btnPlay.Caption := 'Play';
      EnableButtons(true);
      MidiOutput.Close(MicrosoftIndex);
      Player.Free;
    end;
  end else
    Playing := false;
end;

procedure TChannel_Selection.btnSaveMidiClick(Sender: TObject);
var
  MidiSaveStream: TMidiSaveStream;
  MidiEventArr: TMidiEventArray;
  iEvent: integer;
  Event: TMidiEvent;
  i: integer;
  s: string;
begin
  if not MidiRead or
     not SaveDialog1.Execute then
    exit;

  s := SaveDialog1.FileName;
  if FileExists(s) then
    if Application.MessageBox(PChar('File "' + s + '" existiert. Überschreiben?'), 'Warnung', MB_YESNO) <> IDYES then
      exit;

  MidiSaveStream := TMidiSaveStream.Create;
  MidiSaveStream.SetHead(Partitur.DetailHeader.DeltaTimeTicks);

  MidiSaveStream.AppendTrackHead;
  MidiSaveStream.AppendMetaEvent(2, 'juerg5524.ch');
  MidiSaveStream.AppendHeaderMetaEvents(Partitur.DetailHeader);
  MidiSaveStream.AppendTrackEnd(false);

  Event.Clear;
  for i := 0 to 1 do
  begin
    SetLength(MidiEventArr, 0);
    MakeTrack(MidiEventArr, i = 1);
    if TEventArray.HasSound(MidiEventArr) then
    begin
      MidiSaveStream.AppendTrackHead(MidiEventArr[0].var_len);
      if i = 0 then
        MidiSaveStream.AppendMetaEvent(3, 'Treble')
      else
        MidiSaveStream.AppendMetaEvent(3, 'Bass');

      for iEvent := 1 to Length(MidiEventArr)-1 do
      begin
        MidiSaveStream.AppendEvent(MidiEventArr[iEvent]);
      end;
      MidiSaveStream.AppendTrackEnd(false);
    end;
  end;
  MidiSaveStream.SetSize(MidiSaveStream.Position);

  MidiSaveStream.SaveToFile(s);
{$if defined(CONSOLE)}
  writeln('midi saved to: ', s);
{$endif}
end;

end.

