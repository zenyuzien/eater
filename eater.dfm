object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 656
  ClientWidth = 959
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object board: TShape
    Left = 128
    Top = 56
    Width = 369
    Height = 369
    Brush.Color = clGradientActiveCaption
  end
  object guy: TShape
    Left = 298
    Top = 228
    Width = 25
    Height = 25
  end
  object warn: TLabel
    Left = 549
    Top = 347
    Width = 113
    Height = 17
    Caption = 'Start the game first !!'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tempus Sans ITC'
    Font.Style = []
    ParentFont = False
  end
  object food: TShape
    Left = 899
    Top = 600
    Width = 17
    Height = 17
    Brush.Color = clRed
  end
  object Label1: TLabel
    Left = 128
    Top = 30
    Width = 43
    Height = 20
    Caption = 'score:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tempus Sans ITC'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object score: TLabel
    Left = 177
    Top = 30
    Width = 12
    Height = 20
    Caption = '0'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tempus Sans ITC'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object warn2: TLabel
    Left = 549
    Top = 151
    Width = 117
    Height = 17
    Caption = 'resume to continue !!'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tempus Sans ITC'
    Font.Style = []
    ParentFont = False
  end
  object tag: TLabel
    Left = 136
    Top = 440
    Width = 336
    Height = 24
    Caption = 'Welcome to Eater. Click Start to play'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tempus Sans ITC'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object supply: TShape
    Left = 899
    Top = 592
    Width = 32
    Height = 32
    Brush.Color = clPurple
    Visible = False
  end
  object Shape1: TShape
    Left = 88
    Top = 512
    Width = 17
    Height = 17
    Brush.Color = clRed
  end
  object Label2: TLabel
    Left = 138
    Top = 512
    Width = 105
    Height = 17
    Caption = 'red fruit, 1 point'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tempus Sans ITC'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 426
    Top = 555
    Width = 131
    Height = 17
    Caption = 'Purple fruit, 3 points'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tempus Sans ITC'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape2: TShape
    Left = 375
    Top = 555
    Width = 32
    Height = 32
    Brush.Color = clPurple
  end
  object Shape3: TShape
    Left = 88
    Top = 535
    Width = 25
    Height = 25
    Brush.Color = clYellow
  end
  object Label4: TLabel
    Left = 136
    Top = 535
    Width = 196
    Height = 17
    Caption = 'curse, slightly slows you down '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tempus Sans ITC'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Shape4: TShape
    Left = 88
    Top = 566
    Width = 25
    Height = 25
    Brush.Color = clTeal
  end
  object Label5: TLabel
    Left = 136
    Top = 566
    Width = 209
    Height = 17
    Caption = 'nitro, slight boost your speed up'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tempus Sans ITC'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object curse: TShape
    Left = 906
    Top = 592
    Width = 25
    Height = 25
    Brush.Color = clYellow
  end
  object nitro: TShape
    Left = 906
    Top = 592
    Width = 25
    Height = 25
    Brush.Color = 16744703
  end
  object bullet: TShape
    Left = 851
    Top = 8
    Width = 9
    Height = 9
  end
  object brick: TShape
    Left = 901
    Top = 574
    Width = 50
    Height = 50
    Brush.Color = -1
  end
  object Shape5: TShape
    Left = 360
    Top = 496
    Width = 50
    Height = 50
    Brush.Color = -1
  end
  object Label6: TLabel
    Left = 426
    Top = 512
    Width = 260
    Height = 17
    Caption = 'brick ! shoot it for a point! don'#39't collide'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tempus Sans ITC'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object life1: TShape
    Left = 432
    Top = 30
    Width = 25
    Height = 20
    Brush.Color = 12615935
    Shape = stCircle
  end
  object life2: TShape
    Left = 408
    Top = 30
    Width = 25
    Height = 20
    Brush.Color = 12615935
    Shape = stCircle
  end
  object life3: TShape
    Left = 382
    Top = 30
    Width = 25
    Height = 20
    Brush.Color = 12615935
    Shape = stCircle
  end
  object Label7: TLabel
    Left = 333
    Top = 30
    Width = 37
    Height = 20
    Caption = 'lives:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tempus Sans ITC'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object down: TButton
    Left = 581
    Top = 284
    Width = 52
    Height = 57
    Caption = 'down'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tempus Sans ITC'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = downClick
  end
  object left: TButton
    Left = 533
    Top = 229
    Width = 52
    Height = 57
    Caption = 'left'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tempus Sans ITC'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = leftClick
  end
  object right: TButton
    Left = 629
    Top = 229
    Width = 52
    Height = 57
    Caption = 'right'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tempus Sans ITC'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = rightClick
  end
  object up: TButton
    Left = 581
    Top = 174
    Width = 52
    Height = 57
    Caption = 'up'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tempus Sans ITC'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = upClick
  end
  object pause: TButton
    Left = 709
    Top = 206
    Width = 148
    Height = 49
    Caption = 'pause'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tempus Sans ITC'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = pauseclick
  end
  object start: TButton
    Left = 709
    Top = 151
    Width = 148
    Height = 49
    Caption = 'start'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tempus Sans ITC'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = startClick
  end
  object highscore: TButton
    Left = 709
    Top = 261
    Width = 148
    Height = 53
    Caption = 'highscores'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tempus Sans ITC'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = highscoreClick
  end
  object close: TButton
    Left = 709
    Top = 320
    Width = 148
    Height = 47
    Caption = 'close'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tempus Sans ITC'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = closeClick
  end
  object shoot: TButton
    Left = 581
    Top = 228
    Width = 52
    Height = 57
    BiDiMode = bdLeftToRight
    Caption = 'shoot'
    ParentBiDiMode = False
    TabOrder = 8
    OnClick = shootClick
  end
  object Timer1: TTimer
    Interval = 200
    OnTimer = Timer1Timer
    Left = 872
    Top = 561
  end
  object supplier: TTimer
    Interval = 10000
    OnTimer = supplierTimer
    Left = 872
    Top = 585
  end
  object shooter: TTimer
    Interval = 100
    OnTimer = shooterTimer
    Left = 872
    Top = 608
  end
end
