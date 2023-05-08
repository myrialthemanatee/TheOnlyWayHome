using Krivodeling.UI.Effects;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using UnityEngine;
using UnityEngine.UI;

public class GameStateManager : MonoBehaviour
{
    private InkManager _inkManager;
    private CharacterManager _characterManager;
    private SoundManager _audioManager;
    private BackgroundManager _backgroundManager;
    private SoundManager _soundManager;
    public GameObject pauseMenuUI;


    private void Start()
    {
        _inkManager = FindObjectOfType<InkManager>();
        _characterManager = FindObjectOfType<CharacterManager>();
        _backgroundManager = FindObjectOfType<BackgroundManager>();
        _audioManager = FindObjectOfType<SoundManager>();
    }

    public void StartGame()
    {
        UnityEngine.SceneManagement.SceneManager.LoadScene("game");
    }

    public void SaveGame()
    {
        SaveData save = CreateSaveGameObject();
        var bf = new BinaryFormatter();

        var savePath = Application.persistentDataPath + "/savedata.save";

        FileStream file = File.Create(savePath); // creates a file at the specified location

        bf.Serialize(file, save); // writes the content of SaveData object into the file

        file.Close();

        Debug.Log("Game saved");

        _backgroundManager.SaveBackground();
    }

    private SaveData CreateSaveGameObject()
    {
        return new SaveData
        {
            InkStoryState = _inkManager.GetStoryState(),
            Characters = _characterManager.GetVisibleCharacters()
        };
    }

    public void LoadGame()
        {
            var savePath = Application.persistentDataPath + "/savedata.save";

            if (File.Exists(savePath))
            {
                BinaryFormatter bf = new BinaryFormatter();

                FileStream file = File.Open(savePath, FileMode.Open);
                file.Position = 0;

                SaveData save = (SaveData)bf.Deserialize(file);

                file.Close();

                InkManager.LoadState(save.InkStoryState);
                CharacterManager.LoadState(save.Characters);

            StartGame();

            }
            else
            {
                Debug.Log("No game saved!");
            }

            _backgroundManager.LoadBackground();

    }


    public void MenuOnGame()
    {
        Update();
        pauseMenuUI.SetActive(true);
    }

    public void ExitToMenu()
    {
        SaveGame();
        UnityEngine.SceneManagement.SceneManager.LoadScene("mainmenu");
    }


    public void Update()
    {
        
    }



    public void ExitGame()
    {
        Application.Quit();
    }

}
