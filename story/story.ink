// external scripts
EXTERNAL ShowCharacter(characterName, position, mood)
EXTERNAL HideCharacter(characterName)
EXTERNAL ChangeMood(characterName, mood)
EXTERNAL PlayAudio(audioClipName)
EXTERNAL PlayAudio1(audioClipName)
EXTERNAL PlayAudio2(audioClipName)
EXTERNAL PlayAudio3(audioClipName)
EXTERNAL StopAudio(audioClipName)
EXTERNAL StopAudio1(audioClipName)
EXTERNAL StopAudio2(audioClipName)
EXTERNAL StopAudio3(audioClipName)
EXTERNAL StartSFX(audioClipName)
EXTERNAL ChangeBackground(backgroundName)

//Choices

// 1. scene
VAR FreedTheFox = false
VAR LeaveTheFox = false

//2. scene
VAR GoToGranny = false
VAR GetCloseToGranny = false
VAR StayAwayFromGranny = false
VAR RunFromGranny = false

//poacherscene
VAR BitePoacher = false
VAR RunFromPoacher = false

//3. scene
VAR UseForce = false
VAR GiveCheese = false
VAR DoImpression = false

//4. scene
VAR RunFromChild = false
VAR GoToChild = false
VAR LeaveChild = false
VAR HelpChild = false

//5. scene
VAR EatChicken = false
VAR ShareChicken = false

//6. scene
VAR AttackTheRobber = false
VAR LookAtTheRobbery = false
VAR RobThePurse = false

//7. scene
VAR AnswerTheDog = false
VAR IgnoreTheDog = false

//8. scene
VAR NeutralEnding = false
VAR HappyEnding = false
VAR BadEnding = false

//Items
VAR HasCheese = false
VAR HasChicken = false

//Points
VAR Points = 0




-> Dream

=== Dream ===
~ PlayAudio("ghostpiano-yetimusic")
 ~ PlayAudio1("forestsound")
 
{ChangeBackground("forest")}
Home… 
Nestled deep within a dense forest, there is a hidden grove. 
The sweet fragrance of wildflowers and pine trees. The rustling of leaves in a gentle breeze and the calming chirping of birds.
{ChangeBackground("oaktree")}
The old, majestic oak tree, its branches stretching wide and high, providing shade and shelter, birds jumping from branch to branch, singing their songs.
{ChangeBackground("forestbrook")}
Near the oak tree the sound of the babbling brook is soothing and calming, and the cool water provides a refreshing respite from the heat of the day.
{ChangeBackground("forest2")}
The forest is alive with the sounds and smells of nature.
Home. They say it’s where the heart is.

-> Furfarm_cages


=== Furfarm_cages ===
{ChangeBackground("black")}
 Me: "I want to go back home…"
~ StopAudio("ghostpiano-yetimusic")
~ StopAudio1("forestsounds")
 
 ~ PlayAudio("looming-music")
 ~ PlayAudio1("leakypipe")
 ~ PlayAudio2("furfarm_ambient")
{ChangeBackground("farmangrydream")}
{ShowCharacter("Player", "Left", "Sad")}
 Me: "That dream again..." #thought
{ShowCharacter("Fox", "Right", "Angry")}
~StartSFX ("fox")
- Fox: "You were mumbling about home again. You still think you have a chance?"
- Me: "They say hope dies last."
- Fox: "You are never getting home. None of us are. Nobody comes back behind those doors; all we can hear is screaming… and then silence."
- Me: "Don’t talk about that, please. I just want to get away for a moment, even in my dreams."
~StartSFX("fox")
- Fox: "This is the end, and you know it. You will be next with that exotic fur of yours."
{ChangeMood("Player", "Angry")}
- Me: "I don’t want to hear a word more! You are awful!"
- Fox: "And you’re delusional! We will die here!"
- Me: "I’m done with you!"
{HideCharacter("Player")}
{HideCharacter("Fox")}

~StartSFX ("growl")
As we growl to each other, a shadow man walks past our cages. He slams his lower body to my cage, letting out an agitated mumble. As he leaves I notice the latch being loose from the impact.
{ShowCharacter("Fox", "Right", "Surprised")}
~StartSFX ("fox")
- Fox: "No way! This is our chance… Hurry, open your door!"
~StartSFX("cage")
- I open the cage
{ChangeMood("Fox", "Happy")}
- Fox: "Nice job! Now get me out of here!"

Should I free him?
* Yes
~FreedTheFox = true
~Points += 2
    -> freedthefox
* No
~LeaveTheFox = true
    -> leftthefox
    
=== freedthefox ===
I can't leave him.
{ShowCharacter("Player", "Left", "Neutral")}
Me: "Wait a second…"
~StartSFX("cage")
I open the other cage.
~StartSFX ("fox")
Fox: "Thank you! I can’t believe it; I thought all hope was lost! Thank you!"
Me: "Move quickly and quietly. You don’t want to be seen."
{HideCharacter("Fox")}
{HideCharacter("Player")}

-> doorscene


=== leftthefox ===
They have some nerve to ask me that!
{ShowCharacter("Player", "Left", "Angry")}
Me: "Why would I? You called me delusional and said I would be next to go through those doors."
{ChangeMood("Fox", "Angry")}
~StartSFX ("fox")
Fox: "I did not mean it like that!"
Me: "And still you said it. Actions have consequences."
{HideCharacter("Player")}
{HideCharacter("Fox")}

-> doorscene

=== doorscene ===
~ StopAudio("looming-music")
~ StopAudio1("leakypipe")

~ PlayAudio("suspension-music")
{ChangeBackground("bigdoor")}
Before my eyes there is a huge metal door.

{ShowCharacter("Player", "Left", "Neutral")}
Me: "I remember this door; we came through that. And now it’s slightly open too. This must be my lucky day..."
As I approach the door, I sense a primal fear of danger. As I look back, I see him. A shadow figure with a bull’s skull for his face is a chilling sight.
{ShowCharacter("Poacher", "Right", "Neutral")}
His dark silhouette seems to writhe and twist, shifting and flickering in the shadows. 
The skull on his head and fur on his shoulders are a macabre touch, adding an eerie element of death to his appearance. 
His eyes glow red under the mask, as he glides towards me ready to grab my neck.
~StartSFX("poacher")
The poacher: "Who left this door open?! Come here you filthy piece of…"
{HideCharacter("Poacher")}
{ChangeMood("Player", "Afraid")}
Me: "Oh no, I have to run!"
{HideCharacter("Player")}
~ StopAudio("suspension-music")
~ StopAudio2("furfarm_ambient")
-> runningfromfarm

===runningfromfarm===
{ChangeBackground("black")}
I run as fast as I can, not looking back.
I think they stopped chasing me…
-> parkscene

===parkscene===
{ChangeBackground("park2")}
~ PlayAudio("calm-music")
 ~ PlayAudio1("parksounds")
As I stop running, the first thing that catches my attention is the water in front of me; just like home. 
The pond is surrounded by tall reeds and cattails, which sway in the gentle breeze, adding to the serene atmosphere of the park I just entered. 
Even though the park is a bit neglected, with overgrown grass and a few fallen branches scattered about, it still has a certain rustic charm. 
It is a reminder that even in the midst of urbanization and development, pockets of natural beauty can still be found. 
It’s nothing like home, but it’s a welcoming sight after the dark and scary place I escaped from.
{ShowCharacter("Player", "Left", "Tired")}
Me: "That was a close one… for a moment I thought they would catch me. I need to lie down for a while."

~StartSFX("tummygrowl")
My stomach lets out a demanding growl.
Me: "I’m starving, it hurts so bad… I need something to eat."
{ShowCharacter("OldLady", "Right", "Happy")}
{ChangeBackground("park1")}
There is a small and friendly looking person, an old lady sitting on a bench nearby. 
She has some food with her, and she is feeding some birds swimming in a pond by throwing pieces of bread into the water. 
Despite her shadowy appearance she seems to radiate warmth. 
The mask that covers her face is an old-fashioned porcelain one, painted to look like the face of an elderly woman, with delicate features and wispy white hair. 
The cracks and chips in the mask just seem to add to the charm and character of the figure.

{ChangeMood("Player", "Neutral")}
- Me: "That old lady seems friendly… Should I try my luck with her?"

* Yes
~GoToGranny = true
    -> gotogranny
* No
~RunFromGranny = true
    -> runfromgranny
    
===gotogranny===
I approach the old lady with caution.
~StartSFX("oldlady")
Old lady: "Oh hi there, little one. You are such a cutie."
Me: "I have no idea what she is saying... but she seems friendly." #thought
Old lady: "No need to be afraid, little one. I am old and weary. My best days are behind me...
    For years I have been sitting here all day, talking to the birds and myself. 
    I was a baker once, with my husband. We owned a beautiful small bakery just outside of town. 
    We had a small cottage there; my dear Reginald built it himself he did. 
    I still live there, but it has seen better days. The red paint is chipped, the garden is full of weeds and we sold our fields when we retired."
{ChangeMood("OldLady", "Sad")}
The old lady looks sad.
~StartSFX("oldlady")
Old lady: "I’m too old and weak to do all that myself and we never had any children... 
    And my dear Reginald passed away five years ago. We shared a home for 60 years we did, and one morning he just wouldn’t wake up. 
    It was the saddest day of my life... 
    Sometimes I feel so lonely. That’s why I come here every day; it makes my day that much more meaningful."
{ChangeMood("Player", "Sad")}
Me: "She looks so sad... I wish I could cheer her up, but I’m quite sad too. Can one sad make another sad feel happy?" #thought
{ChangeMood("OldLady", "Happy")}
~StartSFX("oldlady")
Old lady: "Look at me, babbling your ears off. Would you like to share my lunch with me, little one? I have some ham and cheese with me.
The old lady shows me some ham and cheese, and it makes my mouth water. Should I approach her and take them?

* NO, I’m not going near her!
~StayAwayFromGranny = true
~ Points += 1
-> donottouchgranny

* Yes, I need to thank her somehow.
~GetCloseToGranny = true
~ Points += 2
->touchgranny

===donottouchgranny===
I hesitate and decide not to get any closer.
{ChangeMood("OldLady", "Sad")}
~StartSFX("oldlady")
Old Lady: "No worries, I understand you are scared. I’ll throw you some ham, is that ok, little one?"
The old lady throws some ham in front of me. I attack the ham and eat it right away.
{ChangeMood("Player", "Happy")}
- Me: "It’s delicious! Now I can keep looking for my way home with something in my stomach. Thank you old lady! #thought
I’m too scared to approach her still, but I’m thankful for this.
{HideCharacter("Player")}
{HideCharacter("OldLady")}

-> somethingtoeat

===touchgranny===
{ChangeMood("Player", "Happy")}
As the old lady kindly wants me to share her food with me, and I feel the urge to thank her in my own way. 
I approach the old lady, ja brush my fluffy body against her legs, almost like a cat. 
The old lady gives me a small pet on the back, it feels so comforting. I brush my side against her legs.
~StartSFX("oldlady")
Old lady: "Well aren’t you sweet and fluffy. Here, little one, you can have both. I have plenty at home."
The old lady offers me ham and cheese.
Me: "I’m going to eat the ham right away... #thought
//{ShowCharacter("Cheese", "Center", "Neutral")}
It’s so delicious! I should really save my cheese for later if I can’t find any food. #thought
Thank you, old lady. Even though you cannot understand me..." #thought

{HideCharacter("OldLady")}
{HideCharacter("Player")}
~HasCheese = true

-> somethingtoeat


===runfromgranny===
~StopAudio("calm-music")
~PlayAudio("running-music")
That's too dangerous.
{ChangeMood("Player", "Afraid")}
Me: "No way. I will not go near her. 
She is the same as every other person here, I’m sure of it. 
I need to move on and find some food elsewhere."
{HideCharacter("Player")}
{HideCharacter("OldLady")}
Even though the lady seems like a harmless one, I’m definitely not going to risk it. 
I find my way behind the old lady, and slowly make my way to the city before me. 
There must be some way to find food without contacting anyone.
~StopAudio("running-music")

-> somethingtoeat

===somethingtoeat===
{ChangeBackground("black")}
~StopAudio("calm-music")
 ~ StopAudio1("parksounds")
{- GoToGranny:
    I managed to get something to eat, and I have more energy now. I need to find my way through the city if I ever want to find my way home.
    - else:
    I managed to find some trash and eat a bit. I’m not sure if that moldy sandwich made my stomach happy, but I have some energy. I need to go through the city.
    }
    
-> cityarrival

===cityarrival===
~PlayAudio("eerie-music")
~PlayAudio1("city-day")
{ChangeBackground("city1")}

The city is a desolate and eerie place.
The streets seem endless and the buildings loom overhead like ominous giants, casting long shadows that stretch out across the concrete and metal landscape. 
The air is thick with the scent of exhaust and decay, and the only sounds are the distant hum of machinery and the occasional screech of car tires on asphalt.
This city is a grim and foreboding place, with no greenery or natural beauty to be found.
Everywhere I look, there are signs of neglect and decay, as if the city has been frozen in time and left to wither away into nothingness. 
Despite the occasional glimpses of humanity, there is a sense of isolation and despair that swallows the city, as if all life has been drained from its streets and buildings. 
I can't help but feel a sense of sadness and unease.
As I make my way through the streets, lurking behind everything I can find, my eyes fix on a shop window. 
-> citywindow

===citywindow===
{ChangeBackground("citywindow1")}
~StopAudio("eerie-music")
~StopAudio1("city-day")

~PlayAudio("badfeeling-music")
My stomach turns… hats, coats, belts, and shoes, all from animal fur.
This is what they wanted to do to me? 
To all of us? 
What if some of those hats were my friends?
I step a bit closer, when the door opens, and I hear a familiar, dark voice...

{ShowCharacter("Poacher", "Right", "Neutral")}
~StartSFX("poacher")
The poacher: "I will deliver the next batch tomorrow, even though I cannot guarantee you the exotic fur I promised. 
    Some idiot must have forgotten to lock the cages, there is no way an animal could open a cage. 
    I will find it; it can’t be far as the only way away from the farm is through the city."
{ShowCharacter("Player", "Left", "Afraid")}
I tremble in fear, being paralysed for a while.
-> poachersees

===poachersees===
I look around, trying to find a place to hide. And then I hear it...
~StartSFX("poacher")
The poacher: "Well well well, look what the cat dragged in..."

He stands right in front of me, his eerie presence filling the air like a thick fog.
He reaches towards me.
I have to act quick!

*Bite the poacher
{ChangeBackground("bitepoacher")}
~BitePoacher = true
~StopAudio("badfeeling-music")
-> poachergrab

*Evade the grab
~RunFromPoacher = true
-> evadeattack

===evadeattack===
~StartSFX("whimper")

I let out a small whimper, and then I see it.
-> manhole

===manhole===
{ChangeBackground("manhole")}
A manhole, that has been left opened. 
I manage to get my legs to move. I dash towards the manhole, and slide to safety just barely. 
I can feel his cold and ruthless hands get a few hairs from my tail.
{HideCharacter("Poacher")}
{HideCharacter("Player")}

-> sewerentry

===sewerentry===
{ChangeBackground("sewer1")}
~PlayAudio("sewer-music")
~PlayAudio1("sewer-ambient")
I fall all the way to the bottom of the sewer, getting myself wet in the process. At least there was some water, otherwise I could have hurt myself really badly. 
I crawl on a ledge beside the waterway, like a pavement path. I slowly make my way deeper and deeper to the sewer.
The sewer is a dank and dismal place, hidden away beneath the bustling streets of the city. 
The air is thick with the stench of rot and decay, and the sound of rushing water echoes through the narrow, winding tunnels. 
It is a place that no one wanted to be, but I had no choice.
The narrow passageways are slick with slime and algae, making every step a treacherous one. 
The dim light of flickering bulbs overhead are casting long shadows on the walls, creating a sense of unease that makes the hairs on the back of my neck stand up. 
Every sound is amplified in the enclosed space, from the drip of water to the skittering of rats along the walls.
The water that flows through the sewer is murky and dark, with an oily sheen that glistens on the surface. 
Garbage and debris litter the edges of the waterway, caught in eddies and swirls that pull everything towards a central drain.
-> ratscene

===ratscene===
{ChangeBackground("sewer5")}
After what felt like hours, something rustles before me. 
I look up and let a low growl out of my mouth. 
From the darkness of the sewer, something approaches me. 
A rat.
{ShowCharacter("Ratfather", "Right", "Neutral")}
He is twice the size of a typical city rat, with bulging muscles. His beady eyes glint with a sharp intelligence, and there is a cold, calculating air about him that makes my fur stand on end.
The pinstripe hat perched atop his head is truly a bizarre accessory for a rat, but somehow, it suits him perfectly. 
As he saunters towards me, his hat cocked at a jaunty angle, I can't help but feel a sense of unease.
It is clear from the way he carries himself that this rat is no ordinary rodent. He has a swagger and a confidence that is almost human-like, and he exudes a sense of power that seems out of place in the grungy sewer.
As he approaches, the rat fixes me with a steely gaze, sizing me up with a sharp eye. 
His voice is deep and gravelly, with a hint of a broad, lazy and dragging kind of accent that adds to his tough-guy persona.
~StartSFX("ratfather")
Rat: "Hmm, what do we have here? A little pupper trying to enter my sewers? Think again, kid."
{ShowCharacter("Player", "Left", "Sad")}
Me: "I’m sorry, but I’m looking for a way home. As I was getting through the city I almost got caught by an evil poacher, and I had to squeeze through a manhole to get away."
Rat: "Poacher, eh? You do seem to have very unusual fur. 
But this is my home, kid, and you are disturbing the peace. And that makes me very unhappy. 
One might say... furious."
Me: "I just want to pass through, no problems or anything."
~StartSFX("ratfather")
Rat: "Really now? And what’s in it for me? I’m not one to give things for free."
Me: "What do I do now…?" #thought


    *{HasCheese} Give him the cheese
    ~Points += 2
    -> givecheese
    
    * Make an impression
    ~Points += 1
    -> impress
    
    * Use force, I'm bigger than him
    -> force
    
===givecheese===
I offer the cheese to the rat.
{ChangeMood("Player", "Neutral")}
Me: "I have some cheese with me. It’s fresh and tasty. I got it just a little while ago."
{ChangeMood("Ratfather", "Surprised")}
~StartSFX("ratfather")
Rat: "HA! What a cheeky little pupper, offering a rat some cheese! 
… 
What kind of cheese? Show me."
//{HideCharacter("Cheese")}
I show him my cheese, but not letting him take it yet. The rat sniffs the air and lets out a small dreaming sigh.

~StopAudio("sewer-music")
{ChangeMood("Ratfather", "Happy")}
~StartSFX("ratfather")
Rat: "Mm... Brie, my favorite. 
~PlayAudio("sentimental-music")
{ChangeMood("Ratfather", "Neutral")}
Tell you what, kid. I get the cheese; you get to pass through. Deal?"

I know better than to trust him, but something about his confidence and swagger is strangely alluring. 
As he offers me a knowing look, I can't help but wonder what kind of trouble I might be getting myself into. 
He would not betray me, right? I hand him the cheese, hoping I’m not wrong.
Me: "Deal." 
{ChangeMood("Ratfather", "Happy")}
The rat takes the cheese and takes a bite immediately. He is silent for a while, and I fear the worst. Then he gives me a broad smile.
~StartSFX("ratfather")
Rat: "You just made a friend, kid. Name is Anthony Ratto, but you can call me the Ratfather."
Me: "Nice to meet you, Ratfather."
Ratfather: "Alright. Now let’s get this pupper away from here."

{HideCharacter("Player")}
{HideCharacter("Ratfather")}

-> sewerdoor

===sewerdoor===
As I make my way through the grimy sewer with Mr. Ratto, I can't help but feel a sense of revulsion and despair. 
It is a place that no one should have to endure, but for these rats it is a home. Nothing like my home, but a home none the less. 
After a long walk in this never-ending maze Mr. Ratto stops and shows a door that is left sopen.
{ChangeBackground("sewerdoor")}
{ShowCharacter("Ratfather", "Right", "Neutral")}
~StartSFX("ratfather")
Ratfather: "Alright now, kid. This is where I leave you. The city is not for me, you see. You gotta watch your back in here."
{ShowCharacter("Player", "Left", "Happy")}
Me: "Thank you so much, Ratfather. I would have gotten lost here on my own."
Ratfather: "Ey, forget about it. You scratch my back, and I’ll scratch yours. Now get outta here."
Me: "Goodbye then."
{HideCharacter("Player")}
{HideCharacter("Ratfather")}

~StopAudio("sentimental-music")
~StopAudio1("sewer-ambient")

-> awayfromsewers



===impress===
~StopAudio("sewer-music")
~PlayAudio("cheeky-music")

I am growing desperate.
{ChangeMood("Player", "Neutral")}
Me: "Please let me through, I’m cold and tired and I need to get back home."
~StartSFX("ratfather")
Rat: "Tough luck, kiddo. I ain’t no saint."
Me: "Please, Mr. Is there anything I could do for such a great rat like you?"
Rat: "Great, you say? Flattering… Name is Anthony Ratto, but Mr. Ratto for you."
{ChangeMood("Player", "Happy")}
Me: "Pleasure to meet you Mr. Ratto. I’m just passing through; I mean no harm to your majestic home nor your friends."
~StartSFX("ratfather")
Mr. Ratto: "It takes a lot to keep everyone in their place, pupper. Business is booming. You really don’t have anything on you?"
{ChangeMood("Player", "Sad")}
Me: "No, Mr. Nothing. I got away from a fur farm; I was close to getting skinned. I saw fur hats and coats in a shop window. 
Surely you wouldn’t be that cruel, as you seem to be a rat of intelligence and wisdom?"
{ChangeMood("Ratfather", "Surprised")}
Mr. Ratto: "You are speaking my language, kid. 
Fine. 
Go on, find yourself out. 
I do not have time to help you, I gotta run my business you see?"
{ChangeMood("Player", "Happy")}
Me: "Thank you, Mr. Ratto! I’ll be out of your way in a moment."
{ChangeMood("Ratfather", "Neutral")}
~StartSFX("ratfather")
Mr. Ratto: Alright, now get outta here.

{HideCharacter("Player")}
{HideCharacter("Ratfather")}

I pass through Mr. Ratto, trying to find my way. 

-> deepsewers

===deepsewers===
~StopAudio("cheeky-music")
~PlayAudio("sewer-music")
{ChangeBackground("sewer2")}
The sewers are huge, and they split to different directions in every corner. 
I wish I had something to bribe the rat… The sewer pipes seem to go on for an eternity, and once in a while I find myself looking at a dead-end. 
My nails scrape against the slick concrete, sending echoes ringing through the labyrinth of pipes and passages.
As I move deeper into the maze of the sewer system, my pace slows, and my body begins to droop with exhaustion. 
But I press on, driven by a fierce determination to escape the dank and claustrophobic tunnels. 
->findsewerdoor

===findsewerdoor===
With each step, I grow more desperate, more frantic, until at last, after what seems like an eternity of wandering around the underground maze, I come across an open door. 
{ChangeBackground("sewerdoor")}
Finally!

~StopAudio("sewer-music")
~StopAudio1("sewer-ambient")

-> awayfromsewers

===force===
Is this little guy for real?
{ChangeMood("Player", "Angry")}
Me: "Look, I’m going to go through here. With your permission or without it. Move."
{ChangeMood("Ratfather", "Angry")}
~StartSFX("ratfather")
Rat: "What did you say, huh? You think you’re a big guy? Well think again!"
~StartSFX("growl")
Me: "I wasn’t asking. Move!"
{ChangeMood("Ratfather", "Surprised")}
~StartSFX("ratfather")
Rat: "Hey, wow, ok! Why you gotta be so mad? Ok, pupper. I’ll let you leave…
if you can find a way. 
There is no chance I’m gonna help you here."
Me: "I didn’t ask for your help anyway."
{ChangeMood("Ratfather", "Neutral")}
Rat: "And if you starve, you will be the star of our family dinner."
Me: "I’m going to get out. You filthy animal…"

{HideCharacter("Player")}
{HideCharacter("Ratfather")}

I show my teeth as I pass the rat. He knows he won’t win against me in a fight! 
I make my way deeper into the sewers, getting lost very soon. 
->ratattack

===ratattack===
{ChangeBackground("sewer3")}
//{- HasCheese:
  //  {HideCharacter("Cheese")}
    //I decide to eat my cheese somewhere along the way to have some more energy.
    //- else:
    //This place is a never ending maze!
    //}
I wander the grimy pipes for hours, dead-end after dead-end, growing tired and weary. I feel like I’m about to pass out when I hear rattling. 
I look back, seeing that weird rat with an army behind him. He smirks dangerously.
{ChangeBackground("ratfatherwitharmy")}
Their beady eyes gleam with a predatory glint, their whiskers twitching with anticipation. 
Their sharp teeth are bared, ready to attack at any moment. They emit low growls and high-pitched squeaks, communicating with each other to coordinate their attack.

{ShowCharacter("Ratfather", "Right", "Neutral")}
~StartSFX("ratfather")
Rat: "Nobody messes with me, pupper. Get them."
{HideCharacter("Ratfather")}

Tens and tens of rats run towards me, ready to take me down. My growls mean nothing to them, so I run. 
-> runningfromrats

===runningfromrats===
~StopAudio("sewer-music")
~PlayAudio("running-music")
{ChangeBackground("sewer4")}
The rats move quickly and with purpose, closing in on me with lightning speed. 
Their scrabbling claws and gnashing teeth are a terrifying sight, and their overwhelming numbers make it clear that they are not to be underestimated. 
I manage to run faster than them, but my energy is running low. 
I run for a good while, and just as I’m about to give up on hope, I come across a door.
{ChangeBackground("sewerdoor")}
I run through it before the rats can catch me. 
~StopAudio("running-music")
~StopAudio1("sewer-ambient")
-> awayfromsewers


===awayfromsewers===
~PlayAudio1("city-night")
{ChangeBackground("city2")}
As emerge from the dark, damp tunnels back into the moody and darkening evening of the city, I can't help but feel grateful for the small comforts of relatively clean air and open spaces. 
I stop for a moment, behind some trash cans and take a deep breath.
->childcrying

===childcrying===
~PlayAudio("sad-music")
{ShowCharacter("Halley", "Right", "Sad")}
In the dimly lit alleyway, a small child sits, tears streaming down their face. 
Their body shakes with sobs, and their hands clutch at their chest as if trying to hold themselves together. 
The darkness of the alley looms around them, casting long shadows and obscuring any path out.
The child's body is crouched with fear, scanning the alleyway for any sign of help or escape. 
Their cries echo through the empty space, bouncing off the walls like a desperate plea. Their voice is small and quivering, as if even their words are afraid to venture too far into the darkness. 
Their sobs become more and more frantic. 
Their little body trembles with each breath, and their eyes dart around in a panic. 
~StartSFX("halley")
Child: "Mommy, I’m scared. Where are you?"

{ShowCharacter("Player", "Left", "Neutral")}
I stay behind a nearby trash can.
From my hiding spot, I watch as the child's tears stream down their mask and their small frame shudders with sobs. 
The sight of their fear and helplessness is desperate to look at. 
I feel torn between the urge to rush to the child's aid and the fear of making things worse. I know that I must tread carefully, as it seems the both of us are in danger.
Me: "What should I do now..." #thought

*I should run.
~RunFromChild=true
-> runfromchild

*I should see if the child is ok.
~GoToChild=true
~Points += 1
-> checkthechild

===runfromchild===
~StopAudio("sad-music")
~PlayAudio("running-music")
{HideCharacter("Player")}
{HideCharacter("Halley")}
I break into a sprint as I rush past the child, my focus on my own safety and survival. 
My heart pounds in my chest as my paws pound against the pavement, echoing through the dark alley.
As I pass the crying child, I don't look back. 
I don't have the time nor the energy to help them, to comfort them, to offer any sort of assistance. 
I am consumed by my own fear and desperation, and the child's cries fade behind me as I continue to run. 
I know that I should feel guilty for leaving the child behind, but my own fear overrides any sense of empathy or compassion. 
I need to go home, that’s all that matters. Besides, that child could become a poacher too!
As I finally reach the end of the alley, I pause to catch my breath, my eyes scanning the area for any sign of danger. 
I am relieved to see that I have escaped unharmed, but my conscience gnaws at me. 
But I know that I couldn't have done anything differently. 
I was driven by my own fear, my own need to survive. 
And in that moment, the child was simply a casualty of my own desperate fight for survival. 
They will find their way home, after they just stop crying and start walking! Right?
-> momcrying

===momcrying===
~StopAudio("running-music")
~PlayAudio("sad-music")
{ChangeBackground("momcity")}
As I continue my way through the city, I come across a lady, showing a picture of her child to everyone who stops and listens. 
{ShowCharacter("Mother", "Right", "Sad")}
The mother stands in the middle of the bustling street, tears streaming down her face. 
She clutches a crumpled photograph of her child in her hand, scanning the crowd for any sign of them. Her face is twisted with anguish and despair.
With each passing moment, her cries grow louder and more desperate, as if willing her child to appear before her. 
Despite her frantic dashing from place to another, the mother can't seem to find any trace of her child. 
~StartSFX("crying")
The mother's cries are a heart-wrenching sound, a raw expression of her pain and fear. Her body shakes with sobs, and her hands clutch at her chest as if trying to hold herself together.
Mom: "Where are you, my love?! Halley, come here! Please answer me!"

{ShowCharacter("Player", "Left", "Angry")}
Me: "She is out of her right mind… she should search, not cry. I’m not going near her, no way. She should take care of her child! #thought
{HideCharacter("Player")}
{HideCharacter("Mother")}
~StopAudio("sad-music")

->homelessman

===checkthechild===
I should see if that child is ok…
I slowly approach the crying child, keeping my wits about me. 
I should be careful not to scare them or get them a chance to grab me immediately.
~StartSFX("whimper")
I make my way quietly, and after I get close enough, I let out a small whimper. 
The child raises their face, being so confused that they stop crying for a while.
I scratch my nails to the cold and hard concrete. The child lets out a small sound of confusion.

{ChangeMood("Halley", "Surprised")}
~StartSFX("halley")
Child: "You have the most beautifulest fur... but you need a bath. My mommy could help you. 
Do you know where she is? I’m lost."

The child looks at me, seeking comfort I believe. I could need that too right now. 
Slowly, I take a step forward, and then pause. 
The child doesn’t seem dangerous, but I wouldn’t know about their mother. How could I be sure?
Me: "Should I go closer and help the child?" #thought

*No, way too dangerous.
~LeaveChild = true
-> leavethechild

*Yes, the child can't survive on their own!
~HelpChild = true
~Points += 2
->helpthechild

===leavethechild===
~StopAudio("sad-music")
~PlayAudio("running-music")
{HideCharacter("Player")}
{HideCharacter("Halley")}
I decide my life is not to be played with. I just want to get back home!
I break into a sprint as I rush past the child, my focus on my own safety and survival. 
My heart pounds in my chest as my paws pound against the pavement, echoing through the dark alley.
As I pass the child, I don't look back. 
I don't have the time nor the energy to help them, to comfort them, to offer any sort of assistance. 
I am consumed by my own fear and desperation, and the child's cries fade behind me as I continue to run. 
I know that I should feel guilty for leaving the child behind, but my own fear overrides any sense of empathy or compassion. 
I need to go home, that’s all that matters. 
Besides, that child could become a poacher too!
As I finally reach the end of the alley, I pause to catch my breath, my eyes scanning the area for any sign of danger. 
I am relieved to see that I have escaped unharmed, but my conscience gnaws at me. 
But I know that I couldn't have done anything differently. I was driven by my own fear, my own need to survive. 
And in that moment, the child was simply a casualty of my own desperate fight for survival. 
They will find their way home, after they just stop crying and start walking! Right?
-> momcrying


===helpthechild===

As I draw nearer, I can feel my heart begin to ache at the sound of their sobs, 
my own instincts driving me to offer comfort and support.  
~StartSFX("whimper")
I extend my snout, gently nudging the child's arm in a gesture of reassurance. My movements are slow and deliberate, trying to avoid startling the child or causing them any more distress.
With another soft nudge of my snout, I nuzzle the child's cheek, my fur gently brushing against their skin. 
{ChangeMood("Halley", "Neutral")}
I can feel their body begin to relax, their sobs growing softer as they lean into my touch. 
In that moment, I feel a sense of connection with the child, a bond that transcends words or actions. 
I may not know the child's name, their history, or their fears, but in that moment, none of that matters. 
All that matters is offering comfort and support, being a source of solace in a time of pain and confusion.
-> childcalmsdown

===childcalmsdown===

As the child begins to calm, their breathing growing slower and more even, I remain by their side, my snout resting gently against their arm. 
~StartSFX("halley")
Child: "You are so soft. Are you lost too?"

The child reaches to pet my back, and I feel a glimpse of comfort with their small hand. I let out a sigh.
{ChangeMood("Halley", "Sad")}
Child: "I was walking home with my mommy; she got me a balloon and it went away. I ran after it, and then I couldn’t find mommy anymore. 
I don’t know where she is... I just want to find mommy."

I listen to the child, not being able to understand anything. 
But the situation is probably self-explanatory. No child should wander alone in a place like this. 
I stay still for a while, waiting for the child to stop sobbing. After a while they finally calm down and stand up.
~StopAudio("sad-music")
~PlayAudio("hopeful-music")
{ChangeMood("Halley", "Neutral")}
~StartSFX("halley")
Child: "I need to find mommy… or someone. I’m cold and tired."
-> findingmom

===findingmom===
I stand up beside them and start to follow as they make their way away from the alley. 
I stay by their side, sniffing the air around us. 
The child is slow, very slow. They must be so tired. 
As we walk the streets of the city, I suddenly smell something. 
It’s something very close to the smell of the child. 
I look up, let out a small yap to get their attention, and lower my snout to the ground. 
{HideCharacter("Halley")}
{HideCharacter("Player")}
I start to sniff around, following the weirdly similar smell. We walk for a while when I hear a pained cry of relief:
~StopAudio("hopeful-music")
~PlayAudio("happy-music")
{ShowCharacter("Mother", "Right", "Surprised")}
~StartSFX("mother")
Mom: "Halley! Oh my dear Halley!"
-> momandchild

===momandchild===
A woman runs towards us and grabs her child to a warm hug. The child begins to sob again.
{ChangeBackground("momcity")}
{ShowCharacter("Halley", "Left", "Sad")}
~StartSFX("halley")
Halley: "Mommy! Mommy, I’m sorry. I lost the balloon and you at the same time!"
{ChangeMood("Mother", "Happy")}
~StartSFX("mother")
Mom: "Do not worry about the balloon, dear. I’m so glad you are ok! 
Never ever run away like that again."
Halley: "I’m sorry… I promise."
The child looks at me, and smiles.
-> giveschicken

===giveschicken===
{ChangeMood("Halley", "Happy")}
~StartSFX("halley")
Halley: "Mommy, this little creature found me and helped me. Isn’t it beautiful, mommy?"
The mother turns towards me, her eyes glimmering with thankfulness and relief. 
{ChangeMood("Mother", "Happy")}
~StartSFX("mother")
Mom: "Did it now? That’s very kind of you, little arctic fox."
Halley: "It did! And it is so soft too!"
{HideCharacter("Halley")}
{ShowCharacter("Player", "Left", "Afraid")}
The mother leans towards me, as I take a cautious step back. 
She smiles and looks inside a basket she is holding.
After a while she raises a bag of fresh chicken legs from the basket and offers it to me. 
I can smell the fresh meat, and it makes my mouth water.
{ChangeMood("Player", "Neutral")}
~StartSFX("mother")
Mom: "There you go, little creature. I can’t thank you enough. You saved my little baby."
{HideCharacter("Mother")}
->aquirechicken


===aquirechicken===
~StartSFX("paperbag")
//{ShowCharacter("Chicken", "Center", "Neutral")}
I take the bag to my teeth, cautiously, and take a step back. 
~HasChicken = true
->childwaving

===childwaving===
As the mother turns and grabs her child’s hand, the child waves at me.
{ShowCharacter("Halley", "Right", "Happy")}
~StartSFX("halley")
Halley: "Goodbye, little creature!"
{HideCharacter("Halley")}
With nothing but smiles on their faces, they both walk away.
{HideCharacter("Player")}
~StopAudio("happy-music")

->homelessman


===homelessman===
~PlayAudio("eerie-music")
I continue my journey, making my way deeper to the darkening city. 
It’s almost nighttime, and I’m getting tired. 
I try to stay away from the main road to avoid getting detected. 
I make my way through the dark, winding alley, my nose twitches with a curious scent. 
I follow the scent, my paws padding softly against the pavement, I come upon a huddled form. 
{ChangeBackground("city5")}
{ShowCharacter("HomelessMan", "Right", "Angry")}
It's a person, wrapped in tattered blankets, their mask obscured by shadows. 
But even in the dim light, I can sense their distress, their fear and despair palpable in the air around them. 
His shoulders are hunched, as if he's trying to disappear into the shadows, to avoid drawing attention to himself. 
The only thing keeping him visible is a small fire in front of him. 
As I get closer, I can see that the man is shivering, his breath coming in ragged gasps. 
He looks up at me with hollow eyes, his gaze wary and distrustful. 
It's as if he's seen too much, experienced too much pain and disappointment, to believe in the possibility of kindness or compassion.

{ShowCharacter("Player", "Left", "Neutral")}
Me: "He looks suspicious… This is no place for anyone." #thought
~StartSFX("homelessman")
Homeless man: "What do you want? I have nothing for you, now shoo!"
{ChangeMood("Player", "Afraid")}
Me: "He does not trust me. I don’t blame him. Should I still try? #thought
    The fire and the blankets seem as cozy as they can be, and I’m so tired." #thought

    
{ - aquirechicken:
    I could offer him my food, maybe that would make him trust me?" #thought
    ->chickenchoice
    - else:
    I look the old man with fearful eyes, as he grabs a shoe and throws it at me.
    ~Points += 1
    ->runawayfromman
    }

===chickenchoice===
*No, eat the chicken right here and now.
~EatChicken=true
->eatchicken

*Offer my food to the man
~ShareChicken = true
~Points +=2
->sharechicken

    


===eatchicken===
~StartSFX("paperbag")
I drop my bag of chicken legs and rip the bag open. 
I grab one with my teeth, devouring it in a heartbeat. 
//{HideCharacter("Chicken")}
As I take the other leg the homeless man lets out an angry growl and grabs a shoe nearby. 
{HideCharacter("Player")}
{HideCharacter("HomelessMan")}
{ChangeBackground("throwingshoe")}
He throws the show towards me with all his strength.
~StartSFX("homelessman")
Homeless man: "Get out of here now! You filthy animal!"


->runawayfromman

===runawayfromman===
~StopAudio("eerie-music")
~PlayAudio("running-music")
~StartSFX("shoe-hit")
I feel an impact on my back, a sharp pain that jolts me out of my reverie. 
I whirl around to see the homeless man, his eyes blazing with fury, hurling a worn-out shoe in my direction. 
My heart pounds in my chest as I stumble backward, caught off guard by the sudden attack. 
I can feel the adrenaline surging through my veins, my flight response kicking in as I turn to flee. 
{ChangeBackground("city5")}
I don't look back as I sprint down the alley. 
I can hear the homeless man's angry shouts behind me, his voice rising in a crescendo of rage and frustration. 
The cool night air washes over my face. I glance over my shoulder, but the homeless man is nowhere to be seen. 
In that moment, I feel a sense of regret for my earlier thoughtfulness and empathy. 
I wonder what must have driven the homeless man to such a state of anger and despair, what must have led him to lash out in such a violent way. 
But even as these thoughts flit through my mind, I know that I can't dwell on them. 
I need to put distance between myself and the homeless man, to escape the danger and uncertainty of the dark alleyway.
->lonelynight

===lonelynight===
~StopAudio("running-music")
~PlayAudio("sad-music")
~PlayAudio2("rain")
{ChangeBackground("city4")}
I wander through the darkened streets, my eyes scanning the shadows for any sign of shelter. Somewhere in the way I feel rain dripping down on my back. 
The rain is ruthlessly cold. 
As the rain intensifies, I begin to despair. 
I have nowhere to go, no refuge from the elements. I feel like a lost soul, adrift in a sea of endless darkness.
Just as I begin to lose hope, I spot a discarded cardboard box, huddled against a wall. 
->cardboardbox

===cardboardbox===
Without hesitation, I scurry over and slip inside, and curl up into a tight ball to conserve my body heat. 
{ChangeBackground("cardboardbox")}
The box is cramped and uncomfortable, but it's dry, and that's all that matters. 
As I lie there, listening to the sound of the rain pattering against the cardboard, I feel a sense of resignation wash over me. 
This is my life now, I think. A life of endless wandering and searching, of cold nights and empty stomachs.
Despite the despair that grips me, I find myself drifting off to sleep. 
The sound of the rain is soothing, in a way, and the darkness is a welcome respite from the harshness of the world. 
For a few brief hours, I can forget my troubles. 
But even as I sleep, a part of me remains alert and aware, attuned to the dangers and uncertainties of the night. 
I know that I must remain vigilant, even in my moments of rest. 
As the sun rises, the rain stops. I hardly got any good sleep, but I know I must keep going. If I’m not getting out of here, I’m going to perish.
~StopAudio("sad-music")
~StopAudio2("rain")
~StopAudio1("city-night")
~PlayAudio("eerie-music")
-> tiredofwalking


===sharechicken===
Despite his fear and suspicion, I feel empathy for the man, a sense of connection that transcends our different circumstances and experiences. 
He may be homeless, forgotten, and alone, but in that moment, he's also a fellow creature in need of comfort and solace.
~StartSFX("whimper")
As I approach, my movements slow and deliberate, I let out a soft whine, a sound meant to convey my intentions. 
I don't want to startle or frighten the human, only to offer comfort and companionship. He looks at me, untrusting. 
~StartSFX("paperbag")
//{HideCharacter("Chicken")}
I drop the bag of chicken legs in front of him and tilt my head. The man looks at me for a while, then laughs a little.
~StopAudio("eerie-music")
~PlayAudio("gentle-music")
{ChangeMood("HomelessMan", "Surprised")}
~StartSFX("homelessman")
Homeless man: "For me? Do you want to share? I can cook these."

With a gentle nudge of my nose, I prod the human's hand. 
At first, he recoils, his movements jerky and defensive. But as he realizes I’m only a friendly animal seeking connection, his fear begins to dissipate.
{HideCharacter("HomelessMan")}
{HideCharacter("Player")}
->cooking

===cooking===
~PlayAudio1("fire")
{ChangeBackground("homelessmancooking")}
As I settle in beside them, my warmth and presence a small comfort, I can feel the human begin to relax. 
He reaches out his hand, his fingers tentative as they stroke my fur. 
It's a small gesture, but one that speaks volumes: a human in need, seeking connection and solace in the midst of despair. 
We may come from different worlds, different backgrounds, but in that moment, we are united in our shared vulnerability and need for comfort.
The man begins to cook the chicken legs on the fire, stroking my fur softly. I sit by him waiting for my dinner. 
After a while the man gives me one of the legs.
~StartSFX("homelessman")
Homeless man: "There you go. You get the other one, and I eat the other. Right? You are a soft little fellow, aren’t you?"
->sleepingwiththeman

===sleepingwiththeman===
~StopAudio1("fire")
~StopAudio2("city-night")
{ChangeBackground("momcity")}
As the night wears on, I remain by the man's side, my presence a small comfort in a world that can be cold and unforgiving. 
He lets me sleep behind him, under his weary blanket. I felt like I could sleep better, knowing I was not seen. 
Early morning, I wake up, feeling rested and energized.  
And as the first light of dawn begins to break over the horizon, I slip away, my heart full of a sense of purpose and connection. I wish I could’ve thanked the man somehow...
~StopAudio("gentle-music")
~PlayAudio("eerie-music")

->walkingforaday

===walkingforaday===
~PlayAudio1("city-day")
{ChangeBackground("city3")}
The buildings tower above me, their windows dark and uninviting, and the sounds of cars and people echo through the canyons of concrete and steel. 
As the hours wear on, and the streets grow more and more confusing, I begin to feel a sense of despair.
Each path seems to lead to a dead end or a barrier I cannot pass. 
My heart beats with fear and frustration, and my stomach grumbles with hunger. As the sun begins to set, and the shadows lengthen, I find myself growing more and more desperate. 
-> tiredofwalking

===tiredofwalking===
~StopAudio1("city-day")
~PlayAudio1("city-night")
{ChangeBackground("city4")}
As the darkness descends, I slump down against a wall, panting with exhaustion and despair. 
I feel alone and lost in this vast, unforgiving city, a small and insignificant creature in a world of giants. 
But even in my darkest moments, I know that I must keep trying, that I must never give up hope. 
So, I close my eyes and rest for a moment, gathering my strength and my courage, before setting out once more into the maze of streets and buildings.

->grannyrobbing

===grannyrobbing===
~PlayAudio("suspension-music")
After the whole day of walking I turn a corner, and see a figure up ahead, silhouetted against the streetlights. 
As I draw closer, I realize that someone is trying to rob an old lady, to snatch her purse. 
The lady from the park! 
My heart pounds with fear and anger as I watch the scene unfold, the sound of a struggle, the cries of a frightened old lady. 
For a moment, I hesitate, unsure of what to do. 
I feel a moment of hesitation as I consider the danger of the situation. 
I do not have a lot of options.
{ShowCharacter("Player", "Left", "Neutral")}
~StopAudio1("city-night")
Me: "I need to react now!" #thought

*Attack the robber.
~AttackTheRobber=true
~Points += 2
->attackrobber

*Hide and wait for it to be over.
~LookAtTheRobbery=true
~Points += 1
->hideandwait

*Snatch the purse yourself
~RobThePurse=true
->robbingthepurse

===attackrobber===
~StopAudio("suspension-music")
~PlayAudio("fight-music")
{ChangeMood("Player", "Angry")}
Without a second thought, I launch myself at the robber, my teeth bared, and my claws unsheathed. 
He turns to face me, surprise and fear etched across his face, but I do not hesitate.
~StartSFX("crashing-sound")
I lunge at him, aiming for his shoulder, but he manages to dodge at the last moment, causing me to fly past him and crash into a nearby trash can. 
I shake off the impact, feeling a twinge of pain in my side, and turn to face him again. 
I can smell the sweat and fear emanating from him, and I know that I have the advantage.
~StartSFX("growl")
With a fierce growl, I charge at him again, my teeth gnashing together. 
He backs away, tripping over a loose cobblestone and falling to the ground. 
I leap on top of him, pinning him down with my weight and snarling in his face.
He struggles and kicks, trying to break free, but I hold him fast, my grip unyielding.
->robberrunning

===robberrunning===
Finally, he manages to wriggle free, scrambling to his feet and taking off down the street. I watch him go, my heart pounding with triumph and satisfaction.
-> oldladythanking

===oldladythanking===
~StopAudio("fight-music")
~PlayAudio("happy-music")
{ChangeMood("Player", "Neutral")}
{ShowCharacter("OldLady", "Right", "Happy")}

Turning back to the old lady, I see that she is safe and unharmed, her purse still clutched tightly in her hands. 
She looks up at me with tears in her eyes, and I feel a sense of pride and honor welling up inside me. 
I take a step closer to the old lady, as she reaches out a shaking hand, stroking my fur gently.
~StartSFX("oldlady")
Old lady: "Thank you, little one. Thank you so much. I was about to lose all my money to that robber. You are so brave."

I nudge her cheek very gently with my nose and she lets out a gentle laugh.
~StartSFX("oldlady")
Old lady: You are such a unique little creature. I’m forever thankful, little one. Here…
-> sandwich

===sandwich===
The lady takes a wrapped sandwich out of her purse and opens it. 
She gives the sandwich to me, and I take it, eating it all. She smiles and watches, petting my back. 
I feel some sort of peace around her. It’s such a lovely feeling. 
Nevertheless, I need to get home. 
I finish the sandwich and look at the old lady. For a moment I believe she knows exactly how thankful I am.
~StartSFX("oldlady")
Old lady: "Go along now, little one. I will find my way back home and you should too. This city is no place for a beautiful creature like you."
The old lady rises from the ground slowly but surely and continues her journey. I believe she is ok now. 
{HideCharacter("OldLady")}
I need to keep on going.  
{HideCharacter("Player")}
~StopAudio("happy-music")


->nightincity

===hideandwait===
{ChangeMood("Player", "Afraid")}
I hide behind the corner and watch the situation unfold.
The robber lunges forward, grabbing at the strap of her purse with one hand. 
The old lady cries out in surprise and fear, clinging desperately to her bag as the man pulls with all his might. 
For a moment, the two struggle. 
But the robber is strong, and with a final tug, he wrenches the purse free, sending the old lady tumbling backwards onto the pavement. 
->grannyfalls

===grannyfalls===
~StartSFX("granny-scream")
She lets out a loud gasp as the robber turns and runs, his footsteps echoing down the alleyway. 
As he disappears into the darkness, the old lady lays there, her body shaking with sobs of fear and shock. 
~StopAudio("suspension-music")
~PlayAudio("sad-music")
Her purse is gone, her money and valuables stolen by a cruel and heartless thief.
I feel a surge of anger rise within me. How can someone be so cruel as to rob an innocent old lady? 
As the man disappears, I cautiously approach the woman, lying on the ground, and whimpering softly. 

{gotogranny:
    She looks at me with a mixture of surprise.
    {ShowCharacter("OldLady", "Right", "Surprised")}
    Old lady: "You are the same little one from the park."
    {HideCharacter("OldLady")}
    }

~StartSFX("whimper")
I keep my distance and let out a small whimper trying to comfort her. 
Despite my natural instincts, I knew that this lady was not going to hurt me. 
I stay with the woman but stay away from her range of touch.

{ShowCharacter("OldLady", "Right", "Sad")}
~StartSFX("oldlady")
Old lady: "He took everything… I was on my way out of the bank with my pension. Now I have nothing. How am I supposed to survive?"
{ChangeMood("Player", "Sad")}
Me: "She looks scared and sad… if I could only understand her." #thought
The old lady sits there for a while, and after a while she gets up and dusts herself clean. 
She looks at me with empty eyes, looking helpless.
~StartSFX("oldlady")
Old lady: "I need to go now, little one. I need to go home and try to figure something out. I’ll be fine… I think I will be fine."

The old lady slowly makes her way, and I won’t follow her. 
{HideCharacter("OldLady")}
She is not my responsibility after all. 
I’m glad she is ok, but I have more important things in my mind now!
{HideCharacter("Player")}
~StopAudio("sad-music")


-> nightincity

===robbingthepurse===

~StartSFX("granny-scream")
The robber snatches the purse out of her hand. The old lady stumbles and falls to the ground letting out a pained gasp. 
I freeze for a moment, unsure of what to do. 
{ChangeMood("Player", "Angry")}
But then, my instincts kick in, and I start to move towards the robber. 
I see the young man running down the street, clutching the purse in his hand. Without thinking, I dart across the pavement and start to chase after him. 
-> getthepurse

===getthepurse===
~StopAudio("suspension-music")
~PlayAudio("fight-music")
As we race down the street, I can see that the young man is starting to tire. 
I see my chance and leap towards him, knocking him off balance. 
The purse falls to the ground, and I pounce on it, eager to claim my prize. 
I can hear the young man cursing, but I don't look back. 
Instead, I grab the purse in my mouth and dart down a nearby alleyway, hoping to find a quiet place to savor my spoils. 
I can feel the weight of the purse in my jaws, and I can smell the tantalizing aroma of food inside.
->purseinalleyway

===purseinalleyway===
{ChangeBackground("alleywithpurse")}
{ChangeMood("Player", "Neutral")}
As I settle down to feast on my bounty, I can't help but feel a little guilty. 
I know that what I've done is wrong, and that I've taken something that doesn't belong to me. 
But at the same time, I can't deny the satisfaction of a successful hunt, and the fullness in my stomach as I devour the sandwich in the purse. 
I see a lot of shiny coins and papers, but I do not care about them. 

Me: "Who in their right mind even carries things like these around? #thought
    Well... should I even care? I’m full now, and I can keep going. #thought
    I must be close already; I can just feel it!" #thought
{HideCharacter("Player")}

I left the purse where it is and continue my way.
~StopAudio("fight-music")

->nightincity

===nightincity===
~PlayAudio("eerie-music")
~PlayAudio1("city-night")
{ChangeBackground("city4")}
As the sun sets over the city, I keep roaming the streets. 
I weave through the alleys and side streets, searching for a safe place to sleep.
Finally, I come across a quiet corner, nestled between two buildings. 
I sniff around, making sure there are no humans or other predators nearby, and then I curl up in a cozy spot, hidden from view. 
The concrete is cold against my fur, but I am grateful for the shelter.
->dreaming

===dreaming===
~StopAudio("eerie-music")
~PlayAudio("ghostpiano-yetimusic")
As I doze off, my mind wanders to thoughts of home. 
{ChangeBackground("oaktree")}
The lovely mossy floor of the forest, tall trees, my pond… my small nest near the big oak tree. 
Chirping of birds, jumping hares and drippling sound of the pond. 
~StopAudio1("city-night")
Hours pass, and the city gradually grows quieter. The occasional car or pedestrian passes by, but otherwise, it is peaceful. 
{ChangeBackground("forest")}
I dream of chasing rabbits through the forest, and I wake up feeling somewhat rested.
->wakeup

===wakeup===
~StopAudio("ghostpiano-yetimusic")
~PlayAudio("eerie-music")
~PlayAudio1("city-day")
{ChangeBackground("city3")}
With dawn approaching, I stretch and shake out my fur. I look up at the sky, watching as the first rays of light begin to filter through the buildings. 
It's time to start the day. 
I take a deep breath and head out into the city once more, ready to face whatever challenges and opportunities come my way.
-> olddog

===olddog===
My nose leads me down an unfamiliar alley. 
{ChangeBackground("woofeusonnewspaper")}
I follow the scent to a quiet corner, where I find an old dog lying in the sun.
He's curled up on a newspaper, his eyes closed, but he seems to sense my presence.
The old dog exudes a sense of calm and wisdom. 
Although he's clearly aged, his body is still strong and well-muscled. 
~StartSFX("dog-sniff")
His eyes are closed, but his other senses seem to be heightened - he sniffs the air with a knowing look, as if he's been around the block a few times. 
Without opening his eyes, he speaks to me in a calm, gentle voice.

{ShowCharacter("Woofeus", "Right", "Neutral")}
~StartSFX("woofeus")
Old dog: "Hello, little one, I've been expecting you. Why won’t you come closer?"

As he speaks, his voice is soothing and measured, and his words are full of insight and experience. 
He has a way of cutting through the noise and chaos of the city just by saying these few words. 
I’m not sure what to do, as I do not recognize the dog, but he seems to know who I am.
Should I…?

*Answer the dog.
~AnswerTheDog=true
~Points +=1
->answerthedog

*Not answer the dog.
~IgnoreTheDog=true
->ignorethedog

===answerthedog===
~StopAudio("eerie-music")
~PlayAudio("gentle-music")
~StopAudio1("city-day")
I take a step closer.
{ShowCharacter("Player", "Left", "Neutral")}
Me: "Um… hello? Who are you?"
~StartSFX("woofeus")
Old dog: "My name is not important now, little one. I sense a great sadness in you."
{ChangeMood("Player", "Sad")}
Me: "I was taken from my home to be skinned. 
    I managed to escape, but now I can’t find my way back home. I’ve been looking for days!"
Old dog: "Ah, yes. Forcefully taken from home, to serve as a luxury for the masked ones. There was a man, right? With bull horns."
Me: "Yes! With huge horns and a low voice, he tried to take me!"
~StartSFX("woofeus")
Old dog: "Of course. He, as we city folks know, is a predator. 
    He thrives on the skins of the innocent, 
    collecting wealth and destroying everything that is pure and good. 
    He was innocent once, you know?
    {ChangeBackground("black")}
    He and I used to play in the park."
    
{HideCharacter("Player")}
{HideCharacter("Woofeus")}
~StopAudio("gentle-music")
->storyofpark

===storyofpark===
~PlayAudio("suspension-music")
{ChangeBackground("boyandpuppy")}
Old dog: "I was a mere puppy then.
    We were playing in the park, when a wild fox came around.
    {ChangeBackground("rabidfox")}
    The animal seemed out of it, drooling uncontrollably.
    He was worried and approached the fox.
    Being a wild animal, the fox should have ran, but instead..."
-> attackedmask

===attackedmask===
Old dog: "The fox attacked him. It was so violent that his mask fell off, going to a million pieces.
~StartSFX("porcelain")
{ChangeBackground("maskbreaks")}
    When the masked ones lose their face, they lose their humanity. What's underneath those masks you ask? I dare not say.
    It's something I will never describe to anyone."
->evilmaskman

===evilmaskman===
{ChangeBackground("blackwithredeyes")}
Old dog: "Without the mask he became lost. The masked ones need something to hide their face.
    But he could not return to town.
    So, he went to a nearby farm, and found a skull of a bull. But it's not the same as a mask.
{ChangeBackground("poacherindarkroom")}
    He had lost his humanity. And without humanity, there is nothing left but evil. He is beyond repair, I'm afraid."
-> backtothealley

===backtothealley===
{ChangeBackground("woofeusonnewspaper")}
~StopAudio("suspension-music")
~PlayAudio("sad-music")
I feel my heart sink a bit.
{ShowCharacter("Player", "Left", "Sad")}
Me: "That sounds horrible..."
{ShowCharacter("Woofeus", "Right", "Neutral")}
~StartSFX("woofeus")
Old dog: "It was. But the innocent child is gone now. He has nothing left."
Me: "Yes, he wanted me dead, and all the others in their cages. I was only so lucky to escape."

{Points <= 5: 
    -> haveyoubeenbad
-else: 
    -> endings
    }

===haveyoubeenbad===
~PlayAudio("badfeeling-music")
Old dog: "And have you used your second chance to be good to others too?"
->lietodog

===endings===
{Points >= 11:
 ->haveyoubeengood
 - else:
  ->trytobegood
 }
===haveyoubeengood===
Old dog: "And have you used your second chance to be good to others too?"
->ihavebeengood

===trytobegood===
Old dog: "And have you used your second chance to be good to others too?"
->triedtobegood

===lietodog===
{ChangeMood("Player", "Neutral")}
I look up and roll my eyes.
Me: "Well… I have been keeping my distance, but I have been trying to be good."
~StartSFX("woofeus")
Old dog: "Hmm… I feel you are not being honest with me."
{ChangeMood("Player", "Angry")}
Me: "I just want to go home! I have been trying to find my way out of here! This whole place is rotten!"
Old dog: "You have given me the information I need. I’m sorry, but I can’t help you."
Me: "What do you mean you can’t help me?"
Old dog: "You have been using your second chance to harm others. And now you are asking for help thinking you will have it."
Me: "You are making me angry!"
~StartSFX("woofeus")
Old dog: "So be it. You may leave now."

{HideCharacter("Player")}
{HideCharacter("Woofeus")}
~StartSFX("growl")
I growl at the old dog and turn away. Fine! I can find my way out!
~StopAudio("badfeeling-music")
->badending

===triedtobegood===
I look down, as I feel a bit guilty.
{ChangeMood("Player", "Sad")}
Me: "Well… I have been keeping my distance, but I have been trying to be good."
~StartSFX("woofeus")
Old dog: "I see… You have been trying, I can see it. But sometimes fear is tricking us from seeing the good in front of us."
{ChangeMood("Player", "Afraid")}
Me: "Yes… I have been so scared. This place is so scary and big, and I can’t find my way out of here. I’m so hungry and tired."
Old dog: "I see your pain, little one. And I will guide you to where you want to go. But remember, if you want to receive help, you must also give it."
{ChangeMood("Player", "Neutral")}
~StopAudio("sad-music")
~PlayAudio("hopeful-music")
Me: "I will remember that. Thank you, mister…?"
~StartSFX("woofeus")
Old dog: "You can call me Woofeus."
Me: "Thank you, Mr. Woofeus."
->wayout

===ihavebeengood===
~StopAudio("sad-music")
~PlayAudio("gentle-music")
I feel like I have been good.
{ChangeMood("Player", "Happy")}
Me: "I have been as good as I can be. It was scary sometimes, but I got to help."
{ChangeMood("Woofeus", "Happy")}
~StartSFX("woofeus")
Old dog: "I see… You truly have been good. You have helped so many, making so many good choices. I’m proud of you, little one." 
Me: "Thank you so much, mister…?"
Old dog: "You can call me Woofeus."
Me: "Thank you, Mr. Woofeus. I have been trying my best."
~StartSFX("woofeus")
Woofeus: "And that does not go in vain. I will help you get home, little one. 
    I know my way around the city, and I can take you away from here."
~StopAudio("gentle-music")
~PlayAudio("hopeful-music")
Me: "You can? Thank you so much Mr. Woofeus!”

->wayout


//ENDINGS

===ignorethedog===
As I approach the old dog, I can't help but feel skeptical of his intentions. 
His words and demeanor seem kind, but something about the situation feels off to me.
When he poses a question, I hesitate for a moment before ultimately deciding to keep my thoughts to myself. 
I don't owe this dog an explanation, and I'm not about to engage in a conversation that could potentially be a waste of my time. 
~StopAudio("eerie-music")
~PlayAudio("badfeeling-music")
I take a step back and turn away from the old dog. I can't shake the feeling of unease that has settled over me.
~StartSFX("woofeus")
Old dog: "You are making a mistake, little one."
As I run away, I keep thinking… 
{HideCharacter("Woofeus")}
Was I too quick to dismiss the old dog's words? 
Could there have been some wisdom in his question that I missed out on? 
Despite my doubts, I push them aside and continue my way. 
There are other things to focus on, other concerns that demand my attention in this unpredictable city.
{ShowCharacter("Player", "Left", "Angry")}
Me: "How could a blind dog know anything anyway? He wouldn’t know how to take me home!" #thought
{HideCharacter("Player")}
~StopAudio("badfeeling-music")
-> badending


===badending===
~PlayAudio("eerie-music")
~PlayAudio1("city-day")
{ChangeBackground("city3")}
I’m wandering the dirty city streets alone, I feel lost. 
The towering buildings loom above me, casting long shadows on the cracked pavement. 
I keep moving, trying to find a way out of this maze of concrete and steel. But every turn I take seems to lead me deeper into this labyrinth. 
I try to stay alert for any danger lurking in the shadows. 
The rustling of trash cans and the distant sound of footsteps make me jump and send my heart racing.
{ChangeBackground("city2")}
~StopAudio1("city-day")
~PlayAudio1("city-night")
Despite my growing fatigue, I press on, determined to find a way out of this maze. 
But as the night grows darker, and the streets emptier, I begin to fear that I may never find my way out of this concrete jungle.

{ShowCharacter("Player", "Left", "Tired")}
Me: "I must keep going… I cannot get lost here. I wish I knew where to go!"
{HideCharacter("Player")}
-> slumpagainstwall

===slumpagainstwall===
I've been wandering these streets for hours, trying to find my way out of this maze. My paws ache with every step, and my fur is matted and dirty from the grime of the city. 
As I continue my search, my body begins to feel heavier and heavier, and my eyes start to droop with exhaustion. 
I push myself to keep moving, but my legs are like lead and my energy is dwindling.
Finally, I can't go on any longer. 
~StopAudio("eerie-music")
I slump down against a grimy brick wall, panting heavily. My heart races as I try to catch my breath, and my eyes close involuntarily. 
~StopAudio1("city-night")
I'm too tired to move, too tired to care about the dangers of sleeping in the open like this. The sounds of the city fade into the background, and I drift off into a deep, dreamless slumber.
->poachergrab

===poachergrab===
~BadEnding=true
~PlayAudio("badfeeling-music")
{ShowCharacter("Poacher", "Right", "Neutral")}
{ShowCharacter("Player", "Left", "Afraid")}
Suddenly, I feel a strong grip on the back of my neck, and I turn to see the man with the bull mask looming over me. 
My heart pounds in my chest as I struggle to break free from the grasp, but the masked figure is too strong. 
I let out a loud cry, trying to break free as he raises me from the ground.
~StartSFX("poacher")
Poacher: "There you are. Did you have fun with your little adventure? 
    Now then, I won’t let you escape this time."
{HideCharacter("Poacher")}
{HideCharacter("Player")}
-> indarkness

===indarkness===
~StartSFX("burlapbag")
{ChangeBackground("black")}
The man takes a burlap bag and shoves me into it. I try to break free, try to bite him, try to claw my way out. 
But it’s in vain. I feel my weak body losing its last will to fight back, as the bag covers my head. I feel my mind shutting down, my body going limb.
~StopAudio("badfeeling-music")
-> backtocage

===backtocage===
~ PlayAudio("looming-music")
 ~ PlayAudio1("leakypipe")
 ~ PlayAudio2("furfarm_ambient")
 {ChangeBackground("farmangrydream")}
I slowly open my eyes, blinking as my vision adjusts to the dim light. 
I try to stand up, but my head hits something hard above me. That's when I realize that I'm back in a cage. 
{ShowCharacter("Player", "Left", "Afraid")}
Panic starts to set in as I look around, trying to find a way out. But there's no way out.
The cage is small, barely big enough for me to move around. 
I can see other cages around me, filled with other animals. Some of them are whimpering or snarling, but most of them are silent, resigned to their fate. 
I try to push against the bars, hoping that they will give way, but they're too strong. 
My thoughts race as I try to piece together what's happening. 
I remember the poacher with the bull mask, grabbing my neck. I remember struggling, trying to get away. 
But then everything went black. 
And now I'm here, in this cage.
{ChangeMood("Player", "Tired")}
I start to feel the weight of my exhaustion, my body aching from the cramped space and lack of movement. 
{HideCharacter("Player")}
I curl up into a ball, my tail tucked around my nose, trying to find some comfort. 
But there's no comfort here. 
Just the cold metal bars and the sound of other animals breathing. I'm trapped, and I don't have a way out.

~StopAudio("looming-music")
{ShowCharacter("Poacher", "Right", "Neutral")}
~StartSFX("poacher")
Poacher: "Let’s get this done with before someone lets that animal loose again."
{HideCharacter("Poacher")}
->cagelift

===cagelift===
~StartSFX("cage")
~StopAudio1("leakypipe")
I feel my cage being lifted and open my eyes. Just as I start to get ahold of the direction I’m being carried in, I see the door. 
~StopAudio2("furfarm_ambient")

-> thedoor

===thedoor===
{ChangeBackground("deathdoor")}
There is no going back.
~StartSFX("door-closing")
-> END


===wayout===
The old dog gets up and moves closer to me.
~StartSFX("woofeus")
Woofeus: "Come along now, little one."
{HideCharacter("Woofeus")}
{HideCharacter("Player")}

~PlayAudio1("city-day")
{ChangeBackground("city3")}
I follow the old dog through the dark and dirty alleys of the city. 
I struggle to keep up with his long, loping strides, but I am determined to see where he will take me.
->underthehill

===underthehill===
~StopAudio1("city-day")
~ PlayAudio1("parksounds")
As we walk, the sounds of the city grow fainter and the air fresher. 
Eventually, we reach the outskirts of town, where the buildings are replaced by fields and a green hill. 
{ChangeBackground("underthehill")}
Mr. Woofeus pauses and turns to me, his eyes kind and wise.

{ShowCharacter("Woofeus", "Right", "Neutral")}
~StartSFX("woofeus")
Woofeus: "This is the way out. Just on top of that hill, you will see your home."

I look around in wonder, taking in the beauty of the more natural world around me. 
I feel the freedom of the wide-open spaces and breathe in the clean air. 
For the first time in days, I feel truly alive.

{ShowCharacter("Player", "Left", "Happy")}
Me: "Thank you, Mr. Woofeus. I’m so grateful. Thank you!"
~StartSFX("woofeus")
Woofeus: "This is where I leave you, little one. Go now and be free."
{HideCharacter("Woofeus")}


->sprintuphill

===sprintuphill===
~StopAudio("hopeful-music")
~PlayAudio("cantwait-music")
{ChangeMood("Player", "Neutral")}
I sprint up the hill with all my might, my legs pumping furiously beneath me. 
Each stride brings me closer to the peak, and I feel the cool breeze rushing against my fur. 
My heart is pounding in my chest, but I refuse to slow down.
I am determined to reach the top. 
I push through my exhaustion and keep my eyes fixed on the crest of the hill.
{ChangeMood("Player", "Surprised")}
{ChangeBackground("playerontop")}
Finally, after what feels like an eternity of running, I make it to the top. 
I collapse onto the grassy summit, panting heavily. 
I look up, my eyes widening in terror.
->rundownforest

===rundownforest===
~StopAudio("cantwait-music")
~StopAudio1("parksounds")

~PlayAudio("desperate-music")
~PlayAudio1("construction")
~PlayAudio2("strong-ambient")
{ChangeBackground("rundownforest1")}
The forest that once stood here is now a barren wasteland, the trees that once soared towards the sky have been torn down and piled up in heaps. 
The air is thick with the smell of oil and exhaust fumes, and the sounds of machinery fill my ears. 
Huge bulldozers and cranes loom over the wreckage, their metal arms tearing and shredding through the remnants of the forest. 
The roar of their engines echoes through the ruins, drowning out any other sounds.
{ChangeBackground("rundownforest2")}
I can see the remains of my old den, a pile of rubble and broken branches. 
The trees that once surrounded it are now gone, leaving it exposed and vulnerable. Even the huge oak tree is barely a memory. 
The streams that once ran through this forest have been dammed and rerouted, leaving my pond dry and lifeless.
{ChangeMood("Player", "Sad")}
As I lay there, I feel a sense of sadness and anger wash over me. 
This was my home, and now it's gone forever. 
I can't help but wonder where I'll go now, and if I'll ever find a place that feels as safe and familiar as this forest once did. 
I stay there for a good while, just looking at the remains of my home.

{triedtobegood: ->neutralending}
{ihavebeengood: ->goodending}

===neutralending===
For a moment, I close my eyes, let out a deep sigh, and get up. I need to keep on going.
{ChangeMood("Player", "Neutral")}
~StopAudio("desperate-music")
~StopAudio1("construction")
~StopAudio2("strong-ambient")
{HideCharacter("Player")}
I need to find myself a new home.
->END


===goodending===
{ChangeMood("Player", "Neutral")}
For a moment, I close my eyes, let out a deep sigh, and get up. I need to keep on going.
~StopAudio("desperate-music")
~StopAudio1("construction")
~StopAudio2("strong-ambient")
I need to find myself a new home.
{gotogranny && attackrobber:
 ->grannytakesyouhome
 - else:
 ->END
 }

===grannytakesyouhome===
~StartSFX("steps")
{ChangeBackground("playerontop")}
My ears perk up at the sound of approaching steps.
{ShowCharacter("OldLady", "Right", "Happy")}
~PlayAudio("gentle-music")
I turn around and see the kind-hearted old lady standing there, watching me with a gentle smile.  
I pause for a moment, studying her, trying to decide whether I should approach or flee. 
But something about her calm demeanor puts me at ease, and I slowly make my way over to her.
->grannypets

===grannypets===
As I get closer, she kneels and extends a hand towards me.
I hesitate for just a moment before nuzzling my nose into her palm, feeling a sense of comfort wash over me. 
The old lady starts to pet me, her touch gentle and reassuring. 

{ChangeMood("OldLady", "Sad")}
~StartSFX("oldlady")
Old lady: "Did you lose your home, little one? I’m so sorry…"

Her calm voice is making me relax a bit more, as I try to figure out what to do. 
I have no home. 
For this whole time, I battled my way through the city… 
For nothing.

{ChangeMood("OldLady", "Happy")}
~StartSFX("oldlady")
Old lady: "Why wouldn’t you come with me, little one? 
    I have a place for a sweet little arctic fox like you. 
    After Reginald passed our home has been so empty. 
We could keep each other company."
{HideCharacter("OldLady")}
{HideCharacter("Player")}
->grannygetsup

===grannygetsup===
The old lady gets up and looks down at me. She waves me to follow her and makes her way down the hill and towards the fields. 
I stand up and follow her all the way back to a small house in the middle of the fields.
->grannyshouseoutside

===grannyshouseoutside===
~StopAudio("gentle-music")
~PlayAudio("ghostpiano-yetimusic")
~ PlayAudio1("parksounds")
{ChangeBackground("grannyshouseoutside")}
As I approach the small house, I am struck by its charming and quaint appearance. 
A small porch stretches across the front of the house, with a rocking chair and a small table set out, as if inviting visitors to sit and enjoy the peaceful surroundings.
The house is surrounded by lush green fields that stretch out as far as the eye can see. 
The grass is tall and wild, swaying gently in the breeze, and wildflowers dot the landscape in every color of the rainbow. 
A small dirt road leads up to the house, flanked by rows of trees and bushes that provide a sense of privacy and seclusion. 
As I approach the house, I can smell the fresh scent of the fields. The only sounds are the chirping of birds and the gentle rustling of the wind through the vegetation. 
It is a tranquil and serene setting, and I feel a sense of peace wash over me as I take it all in.
->houseinside

===houseinside===
~StopAudio1("parksounds")
{ChangeBackground("grannyhouseinside2")}
She lets me in, and as I step inside the small house, I am welcomed by a warm and cozy atmosphere. 
The room feels bright and inviting. 
The floorboards creak slightly beneath my paws, adding to the rustic charm of the place. 
The kitchen table is set with a checkered tablecloth, and a vase of wildflowers sits in the center emitting their sweet ja refreshing fragrance. 
{ChangeBackground("grannyshouseinside")}
On the opposite side of the room, there is a comfortable-looking armchair next to a bookshelf filled with a variety of old books and an invitingly warm fireplace. 
A patchwork quilt is draped over the back of the chair, and a matching cushion invites me to curl up and fall asleep.
The house is so welcoming and serene after the dark city.
->theloft

===theloft===
{ChangeBackground("grannyshouseloft")}
The loft is just big enough for a cozy bed, and a window lets in the soft light of the setting sun. 
The bed is adorned with another patchwork quilt, and a few handmade pillows. 
It looks like the perfect place to curl up for a good night's sleep after a long day exploring the fields surrounding the house. 
Overall, the house feels like a peaceful and welcoming haven.
->grannysmiling

===grannysmiling===
~StopAudio("ghostpiano-yetimusic")
{ShowCharacter("OldLady", "Right", "Happy")}
Old lady: "Here we go… Welcome home."
{HideCharacter("OldLady")}

->END


