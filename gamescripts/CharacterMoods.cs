using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using static CharacterEnum;

public class CharacterMoods : MonoBehaviour
{
    public CharacterName Name;
    public Sprite Neutral;
    public Sprite Sad;
    public Sprite Angry;
    public Sprite Surprised;
    public Sprite Happy;
    public Sprite Tired;
    public Sprite Afraid;

    public Sprite GetMoodSprite(CharacterMood mood)
    {

        switch (mood)
        {
            case CharacterMood.Neutral:
                return Neutral;
            case CharacterMood.Sad:
                return Sad ?? Neutral;
            case CharacterMood.Angry:
                return Angry ?? Neutral;
            case CharacterMood.Happy:
                return Happy ?? Neutral;
            case CharacterMood.Tired:
                return Tired ?? Neutral;
            case CharacterMood.Surprised:
                return Surprised ?? Neutral;
            case CharacterMood.Afraid:
                return Afraid ?? Neutral;
            default:
                Debug.Log($"Didn't find Sprite for character: {Name}, mood: {mood}");
                return Neutral;
        }
    }

}
