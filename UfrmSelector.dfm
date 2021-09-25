object Channel_Selection: TChannel_Selection
  Left = 0
  Top = 0
  Caption = 'Channel Selector'
  ClientHeight = 592
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label17: TLabel
    Left = 23
    Top = 490
    Width = 56
    Height = 13
    Caption = 'Synthesizer'
  end
  object Label1: TLabel
    Left = 23
    Top = 532
    Width = 60
    Height = 13
    Caption = 'Play Position'
  end
  object lbPlayLength: TLabel
    Left = 96
    Top = 532
    Width = 3
    Height = 13
  end
  object btnLoadMidi: TButton
    Left = 430
    Top = 485
    Width = 94
    Height = 26
    Caption = 'Load Midi'
    TabOrder = 0
    OnClick = btnLoadMidiClick
  end
  object btnSaveMidi: TButton
    Left = 430
    Top = 527
    Width = 94
    Height = 26
    Caption = 'Save Midi'
    TabOrder = 4
    OnClick = btnSaveMidiClick
  end
  object btnPlay: TButton
    Left = 328
    Top = 485
    Width = 94
    Height = 26
    Caption = 'Play'
    TabOrder = 6
    OnClick = btnPlayClick
  end
  object GroupBox2: TGroupBox
    Left = 23
    Top = 24
    Width = 299
    Height = 431
    Caption = 'Midi Channels'
    TabOrder = 1
    object lb0: TLabel
      Left = 16
      Top = 23
      Width = 6
      Height = 13
      Caption = '1'
    end
    object lb1: TLabel
      Left = 16
      Top = 48
      Width = 6
      Height = 13
      Caption = '2'
    end
    object lb2: TLabel
      Left = 16
      Top = 73
      Width = 6
      Height = 13
      Caption = '3'
    end
    object lb3: TLabel
      Left = 16
      Top = 98
      Width = 6
      Height = 13
      Caption = '4'
    end
    object lb4: TLabel
      Left = 16
      Top = 123
      Width = 6
      Height = 13
      Caption = '5'
    end
    object lb5: TLabel
      Left = 16
      Top = 148
      Width = 6
      Height = 13
      Caption = '6'
    end
    object lb6: TLabel
      Left = 16
      Top = 173
      Width = 6
      Height = 13
      Caption = '7'
    end
    object lb7: TLabel
      Left = 16
      Top = 198
      Width = 6
      Height = 13
      Caption = '8'
    end
    object lb8: TLabel
      Left = 16
      Top = 223
      Width = 6
      Height = 13
      Caption = '9'
    end
    object lb9: TLabel
      Left = 16
      Top = 248
      Width = 12
      Height = 13
      Caption = '10'
    end
    object lb10: TLabel
      Left = 16
      Top = 273
      Width = 12
      Height = 13
      Caption = '11'
    end
    object lb11: TLabel
      Left = 16
      Top = 298
      Width = 12
      Height = 13
      Caption = '12'
    end
    object lb12: TLabel
      Left = 16
      Top = 323
      Width = 12
      Height = 13
      Caption = '13'
    end
    object lb13: TLabel
      Left = 16
      Top = 348
      Width = 12
      Height = 13
      Caption = '14'
    end
    object lb14: TLabel
      Left = 16
      Top = 373
      Width = 12
      Height = 13
      Caption = '15'
    end
    object lb15: TLabel
      Left = 16
      Top = 398
      Width = 12
      Height = 13
      Caption = '16'
    end
    object cbx0: TComboBox
      Left = 32
      Top = 20
      Width = 245
      Height = 21
      TabOrder = 0
      OnChange = cbxChange
    end
    object cbx1: TComboBox
      Left = 32
      Top = 45
      Width = 245
      Height = 21
      TabOrder = 1
      OnChange = cbxChange
    end
    object cbx2: TComboBox
      Left = 32
      Top = 70
      Width = 245
      Height = 21
      TabOrder = 2
      OnChange = cbxChange
    end
    object cbx3: TComboBox
      Left = 32
      Top = 95
      Width = 245
      Height = 21
      TabOrder = 3
      OnChange = cbxChange
    end
    object cbx4: TComboBox
      Left = 32
      Top = 120
      Width = 245
      Height = 21
      TabOrder = 4
      OnChange = cbxChange
    end
    object cbx5: TComboBox
      Left = 32
      Top = 145
      Width = 245
      Height = 21
      TabOrder = 5
      OnChange = cbxChange
    end
    object cbx6: TComboBox
      Left = 32
      Top = 170
      Width = 245
      Height = 21
      TabOrder = 6
      OnChange = cbxChange
    end
    object cbx7: TComboBox
      Left = 32
      Top = 195
      Width = 245
      Height = 21
      TabOrder = 7
      OnChange = cbxChange
    end
    object cbx8: TComboBox
      Left = 32
      Top = 220
      Width = 245
      Height = 21
      TabOrder = 8
      OnChange = cbxChange
    end
    object cbx10: TComboBox
      Left = 32
      Top = 270
      Width = 245
      Height = 21
      TabOrder = 9
      OnChange = cbxChange
    end
    object cbx11: TComboBox
      Left = 32
      Top = 295
      Width = 245
      Height = 21
      TabOrder = 10
      OnChange = cbxChange
    end
    object cbx12: TComboBox
      Left = 32
      Top = 319
      Width = 245
      Height = 21
      TabOrder = 11
      OnChange = cbxChange
    end
    object cbx13: TComboBox
      Left = 32
      Top = 346
      Width = 245
      Height = 21
      TabOrder = 12
      OnChange = cbxChange
    end
    object cbx14: TComboBox
      Left = 32
      Top = 370
      Width = 245
      Height = 21
      TabOrder = 13
      OnChange = cbxChange
    end
    object cbx15: TComboBox
      Left = 32
      Top = 395
      Width = 245
      Height = 21
      TabOrder = 14
      OnChange = cbxChange
    end
    object edDrum: TEdit
      Left = 33
      Top = 245
      Width = 244
      Height = 21
      Enabled = False
      TabOrder = 15
      Text = 'Drum Channel'
    end
  end
  object GroupBox1: TGroupBox
    Left = 328
    Top = 24
    Width = 94
    Height = 431
    Caption = 'Treble Track'
    Color = clBtnFace
    ParentColor = False
    TabOrder = 2
    object cb0: TCheckBox
      Left = 16
      Top = 22
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '1'
      TabOrder = 0
      OnClick = cbClick
    end
    object cb5: TCheckBox
      Left = 16
      Top = 147
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '6'
      TabOrder = 5
      OnClick = cbClick
    end
    object cb1: TCheckBox
      Left = 16
      Top = 47
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '2'
      TabOrder = 1
      OnClick = cbClick
    end
    object cb2: TCheckBox
      Left = 16
      Top = 72
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '3'
      TabOrder = 2
      OnClick = cbClick
    end
    object cb3: TCheckBox
      Left = 16
      Top = 97
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '4'
      TabOrder = 3
      OnClick = cbClick
    end
    object cb4: TCheckBox
      Left = 16
      Top = 122
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '5'
      TabOrder = 4
      OnClick = cbClick
    end
    object cb6: TCheckBox
      Left = 16
      Top = 172
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '7'
      TabOrder = 6
      OnClick = cbClick
    end
    object cb7: TCheckBox
      Left = 16
      Top = 197
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '8'
      TabOrder = 7
      OnClick = cbClick
    end
    object cbC: TCheckBox
      Left = 16
      Top = 322
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '13'
      TabOrder = 12
      OnClick = cbClick
    end
    object cbB: TCheckBox
      Left = 16
      Top = 297
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '12'
      TabOrder = 11
      OnClick = cbClick
    end
    object cbA: TCheckBox
      Left = 16
      Top = 272
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '11'
      TabOrder = 10
      OnClick = cbClick
    end
    object cb9: TCheckBox
      Left = 16
      Top = 247
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '10'
      TabOrder = 9
      OnClick = cbClick
    end
    object cb8: TCheckBox
      Left = 16
      Top = 222
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '9'
      TabOrder = 8
      OnClick = cbClick
    end
    object cbF: TCheckBox
      Left = 16
      Top = 397
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '16'
      TabOrder = 15
      OnClick = cbClick
    end
    object cbE: TCheckBox
      Left = 16
      Top = 372
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '15'
      TabOrder = 14
      OnClick = cbClick
    end
    object cbD: TCheckBox
      Left = 16
      Top = 347
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '14'
      TabOrder = 13
      OnClick = cbClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 430
    Top = 24
    Width = 94
    Height = 431
    Caption = 'Bass Track'
    Color = clBtnFace
    ParentColor = False
    TabOrder = 3
    object cbb0: TCheckBox
      Left = 16
      Top = 22
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '1'
      TabOrder = 0
      OnClick = cbbClick
    end
    object cbb5: TCheckBox
      Left = 16
      Top = 147
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '6'
      TabOrder = 5
      OnClick = cbbClick
    end
    object cbb1: TCheckBox
      Left = 16
      Top = 47
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '2'
      TabOrder = 1
      OnClick = cbbClick
    end
    object cbb2: TCheckBox
      Left = 16
      Top = 72
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '3'
      TabOrder = 2
      OnClick = cbbClick
    end
    object cbb3: TCheckBox
      Left = 16
      Top = 97
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '4'
      TabOrder = 3
      OnClick = cbbClick
    end
    object cbb4: TCheckBox
      Left = 16
      Top = 122
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '5'
      TabOrder = 4
      OnClick = cbbClick
    end
    object cbb6: TCheckBox
      Left = 16
      Top = 172
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '7'
      TabOrder = 6
      OnClick = cbbClick
    end
    object cbb7: TCheckBox
      Left = 16
      Top = 197
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '8'
      TabOrder = 7
      OnClick = cbbClick
    end
    object cbb12: TCheckBox
      Left = 16
      Top = 322
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '13'
      TabOrder = 12
      OnClick = cbbClick
    end
    object cbb11: TCheckBox
      Left = 16
      Top = 297
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '12'
      TabOrder = 11
      OnClick = cbbClick
    end
    object cbb10: TCheckBox
      Left = 16
      Top = 272
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '11'
      TabOrder = 10
      OnClick = cbbClick
    end
    object cbb9: TCheckBox
      Left = 16
      Top = 247
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '10'
      TabOrder = 9
      OnClick = cbbClick
    end
    object cbb8: TCheckBox
      Left = 16
      Top = 222
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '9'
      TabOrder = 8
      OnClick = cbbClick
    end
    object cbb15: TCheckBox
      Left = 16
      Top = 397
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '16'
      TabOrder = 15
      OnClick = cbbClick
    end
    object cbb14: TCheckBox
      Left = 16
      Top = 372
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '15'
      TabOrder = 14
      OnClick = cbbClick
    end
    object cbb13: TCheckBox
      Left = 16
      Top = 347
      Width = 52
      Height = 17
      Alignment = taLeftJustify
      Caption = '14'
      TabOrder = 13
      OnClick = cbbClick
    end
  end
  object cbxMidiOut: TComboBox
    Left = 93
    Top = 487
    Width = 229
    Height = 21
    Style = csDropDownList
    TabOrder = 5
    OnChange = cbxMidiOutChange
  end
  object FileOpenDialog1: TOpenDialog
    Filter = 'Midi Files (*.mid, *.txt)|*.mid;*.midi;*.txt|All Files|*.*'
    Left = 240
    Top = 518
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Midi File|*.mid;*.midi'
    Left = 335
    Top = 523
  end
end
