unit eater;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Math;

type
  TForm1 = class(TForm)
    board: TShape;
    down: TButton;
    left: TButton;
    right: TButton;
    up: TButton;
    pause: TButton;
    start: TButton;
    guy: TShape;
    Timer1: TTimer;
    warn: TLabel;
    food: TShape;
    Label1: TLabel;
    score: TLabel;
    warn2: TLabel;
    tag: TLabel;
    highscore: TButton;
    close: TButton;
    supply: TShape;
    supplier: TTimer;
    Shape1: TShape;
    Label2: TLabel;
    Label3: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Label4: TLabel;
    Shape4: TShape;
    Label5: TLabel;
    curse: TShape;
    nitro: TShape;
    shoot: TButton;
    bullet: TShape;
    shooter: TTimer;
    brick: TShape;
    Shape5: TShape;
    Label6: TLabel;
    life1: TShape;
    life2: TShape;
    life3: TShape;
    Label7: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure upClick(Sender: TObject);
    procedure leftClick(Sender: TObject);
    procedure downClick(Sender: TObject);
    procedure rightClick(Sender: TObject);
    procedure startClick(Sender: TObject);
    procedure pauseclick(Sender: TObject);
    procedure putrandom;
    procedure scorer;
    procedure tagupdate;
    procedure updatescore;
    procedure closeClick(Sender: TObject);
    procedure highscoreClick(Sender: TObject);
    procedure supplytime ;
    procedure shooot;
    procedure supplierTimer(Sender: TObject);
    procedure shootClick(Sender: TObject);
    procedure shooterTimer(Sender: TObject);
    procedure gameover;
    procedure guy_reset;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

  dir,way,speed: byte ;
  ispause, gameon, isshoot, l1,l2: boolean ;
  lleft,points,ttop, s_left,s_top, c_top, c_left, n_top, n_left : integer ;



implementation

{$R *.dfm}

procedure tform1.guy_reset;
begin
   timer1.enabled:=true;
   supplier.enabled:=false;
   shooter.Enabled:=false;
   brick.Left:=0;
   brick.Top:=0;
   brick.Visible:=false;
   putrandom;

end;

procedure tform1.gameover;
begin
    highscore.Enabled:=true;
    timer1.Enabled:=false;
    highscore.Enabled:=true;
    updatescore;
    curse.Visible:=false;
    nitro.Visible:=false;
    points:=0;
    score.Caption:= inttostr(points);
    guy.Left:=298;
    guy.Top:=228;
    food.visible:=false;
    supply.Visible:=false;
    pause.enabled:=false;
    start.enabled:=true;
    gameon:=false;
    tag.Caption:='Welcome to Eater. Click Start to play';
    life1.Visible:=true;
    life2.Visible:=true;
    life3.Visible:=true;
end;

procedure TForm1.closeClick(Sender: TObject);
begin
        timer1.Enabled:=false;
        if (gameon)
         then begin
            if ( (MessageDlg ('Are you sure you want to exit? Score in current game will not be saved', mtConfirmation, [mbYes, mbNo], 0) = idNo) = false )
            then begin Application.Terminate; end;
         end
        else if (( (MessageDlg ('Are you sure you want to exit?', mtConfirmation, [mbYes, mbNo], 0) = idNo) = false ))
         then begin
           Application.Terminate;
         end;
           if(ispause = false) then begin
           timer1.Enabled:=true; end;
end;

procedure TForm1.downClick(Sender: TObject);
begin
if gameon and (ispause=false) then begin
dir:=2; end
else if ispause then begin
warn2.Visible:=true; end
else warn.Visible := true ;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
curse.Visible:=false;
nitro.Visible:=false;
brick.Visible:=false;
bullet.Visible:=false;
supplier.Enabled:=false;
guy.Left:=298;
guy.Top:=228;
warn.Visible := false;
dir:= 5;
gameon := false;
food.Visible := false;
pause.Enabled:= false ;
board.Left := 128;
board.Top:= 56;
board.Height :=369;
board.Width:=369;
warn2.Visible:=false;
//showmessage('welcome to eater game. click start to start the game');
end;

procedure TForm1.highscoreClick(Sender: TObject);
var
myfile:textfile;
p1,p2,p3:string;
s1,s2,s3:byte;
begin
assignfile(myfile,'scores.txt');
reset(myfile);
readln(myfile,p1);
readln(myfile,p2);
readln(myfile,p3);
s1 := strtoint(p1) ;
s2 := strtoint(p2) ;
s3 := strtoint(p3) ;
readln(myfile,p1);
readln(myfile,p2);
readln(myfile,p3);
showmessage('1st highest score: ' + inttostr(s1) + ' by ' + p1 + slinebreak +
 '2nd highest score: ' + inttostr(s2) + ' by ' + p2 + slinebreak +
 '3rd highest score: ' + inttostr(s3) + ' by ' + p3);

end;

procedure TForm1.leftClick(Sender: TObject);
begin
if gameon and (ispause=false) then begin
dir:=3;  end
else if ispause then begin
warn2.Visible:=true; end
 else warn.Visible := true ;
end;

procedure TForm1.pauseclick(Sender: TObject);
begin
  if ispause = false  then  begin
   timer1.Enabled:=false;
   shooter.Enabled:=false;
   supplier.Enabled:=false;
    pause.Caption:='resume' ;
    ispause:=true;
    end else if ispause then begin
             timer1.Enabled:=true;
             supplier.Enabled:=true ;
             shooter.Enabled:=true;
             pause.Caption:='pause' ;
             ispause:=false;
             warn2.Visible:=false;
             end;
end;

procedure TForm1.rightClick(Sender: TObject);
begin
if gameon and (ispause=false) then begin
dir:=1; end
else if ispause then begin
warn2.Visible:=true; end
else warn.Visible := true ;
end;

procedure TForm1.startClick(Sender: TObject);
begin
if(gameon = false) then begin
l1:=true;
l2:=true;
life1.Visible:=true;
life2.Visible:=true;
life3.Visible:=true;
highscore.Enabled:=false;
timer1.Enabled:=true;
highscore.Enabled:=false;
points:= -1 ;
speed:= 4;
tagupdate;
gameon:=true;
start.Enabled := false;
warn.Visible:= false;
dir:=0;
guy.Left:=298;
guy.Top:=228;
score.Caption := '0';
pause.Enabled := true ;
ispause:=false;
food.Visible:=true;
putrandom;
end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
scorer;

if dir=0 then begin
guy.Top:= guy.Top -speed ; end
else if dir = 1 then begin
guy.left:= guy.left +speed ; end
else if dir = 2 then begin
guy.top:= guy.top +speed ; end
else if dir = 3 then begin
guy.left:= guy.left -speed ;
end;

if (( guy.Top > 400 )or( guy.Top < 56 )) or (( guy.left > 472 )or( guy.left < 128 )) then
  begin
     if(l1) then
          begin
           l1:=false;
           life1.Visible:=false;
           guy.Left:=298;
           guy.Top:=228;
           guy_reset;
          end else if(l2)
          then begin
            l2:=false;
            life2.Visible:=false;
            guy.Left:=298;
           guy.Top:=228;
            guy_reset;
          end else
          begin
            life3.Visible:=false;
             gameover;
          end;
  end;
end;

procedure TForm1.upClick(Sender: TObject);
begin
if gameon and (ispause=false) then begin
dir:=0;
end
else if ispause then begin
warn2.Visible:=true; end
else warn.Visible := true ;
end;

procedure TForm1.putrandom;

 begin
 if((points mod 2 )= 0) then begin
 speed := speed + 1; end;
 if(points< 20) then begin
 timer1.interval:= 200 - (points*8) ;
 end else begin
   timer1.Interval:=timer1.Interval - 5;
 end;

 repeat
 begin
   randomize;
    lleft :=  randomrange(136,473);
    ttop:= randomrange(64,401);

 end;
 // to prevent the food to spawn on the eater/brick
 until ((( (lleft < (guy.Left - 4)) or (lleft > (guy.Left + 30)) ) and ( (ttop < (guy.top - 4)) or (ttop > (guy.top + 30)) ))
 and (( (lleft < (bullet.Left - 4)) or (lleft > (bullet.Left + 35)) ) and ( (ttop < (bullet.top - 4)) or (ttop > (bullet.top + 35)) )))
 ;

  if( (points mod 3) = 0 ) then begin
    repeat
    begin

    randomize;
    s_left :=  randomrange(136,465);
    s_top:= randomrange(64,401);

    end;
    until (( (s_left < (guy.Left - 4)) or (s_left > (guy.Left + 30)) ) and ( (s_top < (guy.top - 4)) or (s_top > (guy.top + 30)) )) ;
    supply.Top:= s_top;
    supply.Left:=s_left;
    supplytime;
   end;

   if( (points mod 4) = 0 ) then begin
    repeat
    begin

    randomize;
    c_left :=  randomrange(136,465);
    c_top:= randomrange(64,401);

    end;
    until (( (c_left < (guy.Left - 4)) or (c_left > (guy.Left + 30)) ) and ( (c_top < (guy.top - 4)) or (c_top > (guy.top + 30)) )) ;
    curse.Top:= c_top;
    curse.Left:=c_left;
    curse.Visible:=true;
   end;

   if( ( (points) mod 4) = 0 ) then begin
    repeat
    begin

    randomize;
    n_left :=  randomrange(136,465);
    n_top:= randomrange(64,401);

    end;
    until (( (n_left < (guy.Left - 4)) or (n_left > (guy.Left + 30)) ) and ( (n_top < (guy.top - 4)) or (n_top > (guy.top + 30)) )) ;
    nitro.Top:= n_top;
    nitro.Left:=n_left;
    nitro.Visible:=true;
   end;

   if( ( (points) mod 2) = 0 ) then begin
    repeat
    begin

    randomize;
    n_left :=  randomrange(136,450);
    n_top:= randomrange(64,390);

    end;
    until (( (n_left < (guy.Left - 4)) or (n_left > (guy.Left + 30)) ) and ( (n_top < (guy.top - 4)) or (n_top > (guy.top + 30)) )) ;
    brick.Top:= n_top;
    brick.Left:=n_left;
    brick.Visible:=true;
   end;


 food.top := ttop;
 food.Left := lleft;

 if(points=-1)
 then begin
   score.Caption := '0';
 end else begin
 score.Caption := inttostr( strtoint(score.caption)+ 1 );   end;
 points:=points+1;
 end;

procedure TForm1.supplierTimer(Sender: TObject);
begin
        supply.Top:=0 ;
        supply.Left:=0;
        supply.visible:=false;
        supplier.Enabled:=false;
end;

procedure TForm1.supplytime;
begin
  supply.Visible:=true;
  if(points < 9)  then begin
  supplier.Interval:= 15000 - (points)*1000 ; end else if(points < 15) then begin
    supplier.Interval:= 5000 ;
  end else begin
    supplier.Interval:= 2500;
  end;
  supplier.Enabled:=true;

end;

procedure TForm1.scorer;
 begin
    //if (( (lleft >= (guy.Left -30)) and (lleft <= (guy.Left + 30)) ) and ( (ttop >= (guy.top -30)) and (ttop <= (guy.top + 30)) )) then
     if
     ((food.Left) >= (guy.Left - food.Width )) and ((food.Left) <= (guy.Left + guy.width))
     and
     ((food.top) >= (guy.top - food.Width )) and ((food.top) <= (guy.top + guy.width))
     then
     begin
            putrandom;
            tagupdate;
     end;

     if
     ((supply.Left) >= (guy.Left - supply.Width )) and ((supply.Left) <= (guy.Left + guy.width))
     and
     ((supply.top) >= (guy.top - supply.Width )) and ((supply.top) <= (guy.top + guy.width))
     then
     begin
           supply.Top:=0;
           supply.Left:=0;
           supply.Visible:=false;
           score.caption:= inttostr( strtoint(score.caption) + 3 );
           supplier.Enabled:=false;
     end;

     if
     ((curse.Left) >= (guy.Left - curse.Width )) and ((curse.Left) <= (guy.Left + guy.width))
     and
     ((curse.top) >= (guy.top - curse.Width )) and ((curse.top) <= (guy.top + guy.width))
     then
     begin
          // tmp curse
           curse.Top:=0;
           curse.Left:=0;
           curse.Visible:=false;
           speed:=speed - 1;
           timer1.Interval := timer1.Interval + 15 ;
     end;

     if
     ((nitro.Left) >= (guy.Left - nitro.Width )) and ((nitro.Left) <= (guy.Left + guy.width))
     and
     ((nitro.top) >= (guy.top - nitro.Width )) and ((nitro.top) <= (guy.top + guy.width))
     then
     begin
            //tmp boost
           nitro.Top:=0;
           nitro.Left:=0;
           nitro.Visible:=false;
           timer1.Interval := timer1.Interval - 10 ;
     end;

     if
     ((brick.Left) >= (guy.Left - brick.Width )) and ((brick.Left) <= (guy.Left + guy.width))
     and
     ((brick.top) >= (guy.top - brick.Width )) and ((brick.top) <= (guy.top + guy.width))
     then
     begin
          if(l1) then
          begin
           l1:=false;
           life1.Visible:=false;
           guy_reset;
          end else if(l2)
          then begin
            l2:=false;
            life2.Visible:=false;
            guy_reset;
          end else
          begin
            life3.Visible:=false;
             gameover;
          end;
     end;

     if
     ((brick.Left) >= (bullet.Left - brick.Width )) and ((brick.Left) <= (bullet.Left + bullet.width))
     and
     ((brick.top) >= (bullet.top - brick.Width )) and ((brick.top) <= (bullet.top + bullet.width))
     then
     begin
         brick.Visible:=false;
         brick.Top:=0;
         brick.Left:=0;
         score.Caption:=inttostr( strtoint(score.caption)+1 );
     end;

 end;


procedure TForm1.shootClick(Sender: TObject);
begin
if (gameon and (ispause = false)) then
shooot;
end;

procedure TForm1.shooterTimer(Sender: TObject);
begin
  if(way=0) then begin
     bullet.Top := bullet.Top - (speed*2) ;
  end else if(way=1) then begin
     bullet.left := bullet.left + (speed*2) ;
  end else if(way=2) then begin
     bullet.Top := bullet.Top + (speed*2) ;
  end else if(way=3) then begin
     bullet.left := bullet.left - (speed*2) ;
  end;

  if (( bullet.Top > 416 )or( bullet.Top < 56 )) or (( bullet.left > 488 )or( bullet.left < 128 )) then
  begin
    bullet.Visible:=false;
    shoot.Enabled:=true;
    shooter.Enabled:=false;
  end;

end;

procedure TForm1.tagupdate;
 begin
   if (points= -1 ) then begin
   tag.Caption:= 'Good start. You might seem to go slow, eat the red cube to get a point'+sLineBreak+'And also get a boost in your speed';
   end else if (gameon and (points=1) ) then begin
   tag.Caption:= 'Good! score is shown at top left of the board'+sLineBreak+'have you noticed a boost in your speed?';
   end else if (gameon and (points=2) ) then begin
   tag.Caption:= 'Keep it up. Is it still slow? not for long....';
   end else if (points in [3,4,5] ) then begin
   tag.Caption:= 'Keep going....';
   end else if (gameon and (points>=6) ) then begin
   tag.Caption:= 'I believe it is not slow anymore, and not easy as well...';
   end else if (gameon and (points>=10) ) then begin
   tag.Caption:= 'keep destroying those stupid bricks and keep that pace';

   end;
 end;

procedure Tform1.Updatescore;
 var
 myfile,tmpfile: textfile;
 text, name: string;

 h1,h2,h3, l: byte;
 begin
   l:=0;
   //text:= inputbox('game over, score: ' + score.caption, 'enter your name to save score','enter name' );
   AssignFile(myFile, 'scores.txt');
   Reset(myFile);
   ReadLn(myFile, text);
   h1:=strtoint(text);
   ReadLn(myFile, text);
   h2:=strtoint(text);
   ReadLn(myFile, text);
   h3:=strtoint(text);
   if( strtoint(score.caption) > h1 ) then begin
   l:=1;
      name:= inputbox('game over','congrats! your score is now #1, highest among all games played so far' +slinebreak + 'enter your name to save score','enter name');
   end else  if( strtoint(score.caption) > h2 ) then begin
   l:=2;
      name:= inputbox('game over','congrats! your score is now #2, 2nd highest among all games played so far' +slinebreak + 'enter your name to save score','enter name');
   end else if( strtoint(score.caption) > h3 ) then begin
   l:=3;
      name:= inputbox('game over','congrats! your score is now #3, 3rd highest among all games played so far' +slinebreak + 'enter your name to save score','enter name');
   end else
   begin
     showmessage('GAME OVER! Well tried. Score higher to save your name and score');
   end;
    CloseFile(myFile);

   if(((l = 0) = false)or (name = 'enter name')) then begin
        reset(myfile);
        assignfile(tmpfile,'tmp.txt');
        rewrite(tmpfile);

           if(l=1) then begin writeln(tmpfile,score.Caption); // x
           end;
           (readln(myfile,text) ) ;
           writeln(tmpfile,text);  // 1
           if(l=2) then begin writeln(tmpfile,(score.Caption)); // x
           end;
           (readln(myfile,text) ) ;
           writeln(tmpfile,text);  // 2
           if(l=3) then begin writeln(tmpfile,(score.Caption)); // x
           end;

           readln(myfile,text); // skip 3

           if(l=1) then begin writeln(tmpfile,name); // px
           end;
           (readln(myfile,text)) ;
           writeln(tmpfile,text );  // p1
           if(l=2) then begin writeln(tmpfile,name); // px
           end;
           (readln(myfile,text)) ;
           writeln(tmpfile,text );  // p2
           if(l=3) then begin writeln(tmpfile,name); // px
           end;

        closefile(myfile);
        closefile(tmpfile);

        If FileExists('tmp.txt') Then
        Begin
          If CopyFile(PChar('tmp.txt'), PChar('scores.txt'), false) Then
          Else
            ShowMessage('failed to save score');
        End;

    end;
 end;

procedure tform1.shooot;
begin
    way:= dir;
    bullet.Top:= guy.Top + (12)  ;
    bullet.left:= guy.Left + (12);
    bullet.Visible:=true;
    shooter.enabled:=true;

end;

end.
