using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.UI;

public class BackgroundManager : MonoBehaviour
{
    
    public Image backgroundImage; // reference to the Image component on the background object


    public bool ShowingBackground = false;

    public SpriteRenderer backgroundRenderer;
    public string backgroundSaveFileName = "background.txt";



    public void ChangeBackground(string backgroundName)
    {
        // load the background sprite from the Resources folder using the provided name
        Sprite backgroundSprite = Resources.Load<Sprite>("grafiikka/" + backgroundName);

        if (backgroundSprite != null)
        {
            // set the sprite on the background Image component
            backgroundImage.sprite = backgroundSprite;
        }
        else
        {
            Debug.LogError("Could not find background sprite with name: " + backgroundName);
        }
    }



    private void Start()
    {
        LoadBackground();

        // Get the SpriteRenderer component from the GameObject
        backgroundRenderer = GetComponent<SpriteRenderer>();

        // Check if the component was found
        if (backgroundRenderer == null)
        {
            Debug.LogError("BackgroundController: SpriteRenderer component not found!");
        }
        
    }

    public void SaveBackground()
    {
        string backgroundPath = Application.persistentDataPath + "/" + backgroundSaveFileName;
        StreamWriter writer = new StreamWriter(backgroundPath);
        writer.WriteLine(backgroundRenderer.sprite.name);
        writer.Close();
    }

    public void LoadBackground()
    {
        string backgroundPath = Application.persistentDataPath + "/" + backgroundSaveFileName;
        if (File.Exists(backgroundPath))
        {
            StreamReader reader = new StreamReader(backgroundPath);
            string backgroundSpriteName = reader.ReadLine();
            reader.Close();

            Sprite[] backgroundSprites = Resources.LoadAll<Sprite>("grafiikka");
            foreach (Sprite sprite in backgroundSprites)
            {
                if (sprite.name == backgroundSpriteName)
                {
                    backgroundRenderer.sprite = sprite;
                    break;
                }
            }
        }
    }



}
 


