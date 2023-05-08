using Ink.Runtime;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Ink.Parsed;
using System.Linq;
using Unity.VisualScripting;
using UnityEngine.SocialPlatforms.Impl;
using UnityEngine.Audio;
using System.Collections;
using System.Text.RegularExpressions;

public class InkManager : MonoBehaviour
{ 
    [SerializeField]
    private TextAsset _inkJsonAsset;
    public Ink.Runtime.Story _story;

    [SerializeField]
    private UnityEngine.UI.Text _textField;

    [SerializeField]
    private VerticalLayoutGroup _choiceButtonContainer;
    [SerializeField]
    private Button _choiceButtonPrefab;

    [SerializeField]
    private Color _normalTextColor;
    [SerializeField]
    private Color _thoughtTextColor;


    private CharacterManager _characterManager;
    private GameStateManager _gameStateManager;
    public SoundManager _audioManager;
    public BackgroundManager _backgroundManager;

    const string kAlphaCode = "";
    public bool isTyping = false;






    private int _endingPoints;
    public int Endingpoints
    {
        get => _endingPoints;
        private set
        {
            Debug.Log($"Updating. Old value: {_endingPoints}, new value: {value}");
            _endingPoints = value;
        }
    }

    private bool _hasCheese;
    public bool ModifiedCheese { get; set; }
    public bool Hascheese
    {
        get => _hasCheese;
        private set
        {
            Debug.Log($"Updating cheese value. Old value: {_hasCheese}, new value: {value}");
            _hasCheese = value;
            ModifiedCheese = true;
        }
    }

    private bool _hasChicken;
    public bool ModifiedChicken { get; set; }
    public bool Haschicken
    {
        get => _hasChicken;
        private set
        {
            Debug.Log($"Updating chicken value. Old value: {_hasChicken}, new value: {value}");
            _hasChicken = value;
            ModifiedChicken = true;
        }
    }

    private bool _attackRobber;
    public bool ModifiedAttack { get; set; }
    public bool AttackRobber
    {
        get => _attackRobber;
        private set
        {
            Debug.Log($"Updating robber attack value. Old value: {_attackRobber}, new value: {value}");
            _attackRobber = value;
            ModifiedAttack = true;
        }
    }

    private bool _getCloser;
    public bool ModifiedCloser { get; set; }
    public bool GetCloser
    {
        get => _getCloser;
        private set
        {
            Debug.Log($"Updating go closer value. Old value: {_getCloser}, new value: {value}");
            _getCloser = value;
            ModifiedCloser = true;
        }
    }

    private bool _badEnding;
    public bool ModifiedBad { get; set; }
    public bool BadEnding
    {
        get => _badEnding;
        private set
        {
            Debug.Log($"Updating ending value. Old value: {_badEnding}, new value: {value}");
            _badEnding = value;
            ModifiedBad = true;
        }
    }

    private static string _loadedState;

    public string GetStoryState()
    {
        return _story.state.ToJson();
    }

    // Start is called before the first frame update


    void Start()
    {
        _characterManager = FindObjectOfType<CharacterManager>();


        StartStory();

        InitializeVariables();

    } 



    private void StartStory()
    {

        _story = new Ink.Runtime.Story(_inkJsonAsset.text);

        if (!string.IsNullOrEmpty(_loadedState))
        {
            _story?.state?.LoadJson(_loadedState);

            _loadedState = null;
        }

        _story.BindExternalFunction("ShowCharacter", (string name, string position, string mood)
          => _characterManager.ShowCharacter(name, position, mood));

        _story.BindExternalFunction("HideCharacter", (string name)
          => _characterManager.HideCharacter(name));

        //_story.BindExternalFunction("ChangeMood", (string name, string mood)
            //=> Debug.Log($"Change mood called. {name}, {mood}"));
        _story.BindExternalFunction("ChangeMood", (string name, string mood)
            => _characterManager.ChangeMood(name, mood));

        _story.BindExternalFunction("PlayAudio", (string audioClipName) => {
            AudioClip clip = Resources.Load<AudioClip>("music/" + audioClipName);
            if (clip != null)
            {
                _audioManager.PlaySound(clip);
                Debug.Log("PlaySound called with clip name: " + audioClipName);
            }
            else
            {
                Debug.LogError("Could not find audio clip with name " + audioClipName);
            }
        });

        _story.BindExternalFunction("PlayAudio1", (string audioClipName) => {
            AudioClip clip = Resources.Load<AudioClip>("music/" + audioClipName);
            if (clip != null)
            {
                _audioManager.PlaySound1(clip);
                Debug.Log("PlaySound called with clip name: " + audioClipName);
            }
            else
            {
                Debug.LogError("Could not find audio clip with name " + audioClipName);
            }
        });

        _story.BindExternalFunction("PlayAudio2", (string audioClipName) => {
            AudioClip clip = Resources.Load<AudioClip>("music/" + audioClipName);
            if (clip != null)
            {
                _audioManager.PlaySound2(clip);
                Debug.Log("PlaySound called with clip name: " + audioClipName);
            }
            else
            {
                Debug.LogError("Could not find audio clip with name " + audioClipName);
            }
        });

        _story.BindExternalFunction("PlayAudio3", (string audioClipName) => {
            AudioClip clip = Resources.Load<AudioClip>("music/" + audioClipName);
            if (clip != null)
            {
                _audioManager.PlaySound3(clip);
                Debug.Log("PlaySound called with clip name: " + audioClipName);
            }
            else
            {
                Debug.LogError("Could not find audio clip with name " + audioClipName);
            }
        });



        _story.BindExternalFunction("StopAudio", (string audioClipName) => {
            AudioClip clip = Resources.Load<AudioClip>("music/" + audioClipName);
            if (clip != null)
            {
                _audioManager.StopSound(clip);
            }
            else
            {
                Debug.LogError("Could not find audio clip with name " + audioClipName);
            }
        });

        _story.BindExternalFunction("StopAudio1", (string audioClipName) => {
            AudioClip clip = Resources.Load<AudioClip>("music/" + audioClipName);
            if (clip != null)
            {
                _audioManager.StopSound1(clip);
            }
            else
            {
                Debug.LogError("Could not find audio clip with name " + audioClipName);
            }
        });

        _story.BindExternalFunction("StopAudio2", (string audioClipName) => {
            AudioClip clip = Resources.Load<AudioClip>("music/" + audioClipName);
            if (clip != null)
            {
                _audioManager.StopSound2(clip);
            }
            else
            {
                Debug.LogError("Could not find audio clip with name " + audioClipName);
            }
        });

        _story.BindExternalFunction("StopAudio3", (string audioClipName) => {
            AudioClip clip = Resources.Load<AudioClip>("music/" + audioClipName);
            if (clip != null)
            {
                _audioManager.StopSound3(clip);
            }
            else
            {
                Debug.LogError("Could not find audio clip with name " + audioClipName);
            }
        });

        _story.BindExternalFunction("StartSFX", (string audioClipName) => {
            AudioClip clip = Resources.Load<AudioClip>("music/" + audioClipName);
            if (clip != null)
            {
                _audioManager.StartSFX(clip);
            }
            else
            {
                Debug.LogError("Could not find audio clip with name " + audioClipName);
            }
        });

        _story.BindExternalFunction("ChangeBackground", (string backgroundName) => {
            _backgroundManager.ChangeBackground(backgroundName);
        });


        DisplayNextLine();
        RefreshChoiceView();


    }

    private void InitializeVariables()
    {
        Endingpoints = (int)_story.variablesState["Points"];
        Hascheese = (bool)_story.variablesState["HasCheese"];
        Haschicken = (bool)_story.variablesState["HasChicken"];
        AttackRobber = (bool)_story.variablesState["AttackTheRobber"];
        GetCloser = (bool)_story.variablesState["GoToGranny"];

        _story.ObserveVariable("Points", (arg, value) =>
        {
            Endingpoints = (int)value;
        });

        _story.ObserveVariable("HasChicken", (arg, value) =>
        {
            Haschicken = (bool)value;
        });

        _story.ObserveVariable("HasCheese", (arg, value) =>
        {
            Hascheese = (bool)value;
        });

        _story.ObserveVariable("AttackTheRobber", (arg, value) =>
        {
            AttackRobber = (bool)value;
        });

        _story.ObserveVariable("GoToGranny", (arg, value) =>
        {
            GetCloser = (bool)value;
        });

        _story.ObserveVariable("BadEnding", (arg, value) =>
        {
            BadEnding = (bool)value;
        });
    }

    public void DisplayNextLine()
    {
        if (_story.canContinue)
        {
            OnDialogueOpen();
            //string text = _story.Continue(); // gets next line

            //text = text?.Trim(); // removes white space from text
            
            //_textField.text = text; // displays new text
            //OnDialogueClosed();
        }
        else if (_story.currentChoices.Count > 0)
        {
            DisplayChoices();
        }
        else
        {
            Ending();
        }

    }

    public void Ending()
    {
        if (Endingpoints <= 5 | BadEnding )
        {
            UnityEngine.SceneManagement.SceneManager.LoadScene("creditsbad");
        }
        else if (Endingpoints >= 11 & AttackRobber & GetCloser )
        {
            UnityEngine.SceneManagement.SceneManager.LoadScene("creditsgood");
        }
        else
        {
            UnityEngine.SceneManagement.SceneManager.LoadScene("creditsneutral");
        }
    }
    
    private void ApplyStyling()
    {
        if (_story.currentTags.Contains("thought"))
        {
            _textField.fontStyle = FontStyle.Italic;
        }
        else
        {
            _textField.fontStyle = FontStyle.Normal;
        }
    }

        private void DisplayChoices()
    {
        // check if choices are already being displayed
        if (_choiceButtonContainer.GetComponentsInChildren<Button>().Length > 0) return;

        for (int i = 0; i < _story.currentChoices.Count; i++)
        {
            var choice = _story.currentChoices[i];
            var button = CreateChoiceButton(choice.text);

            button.onClick.AddListener(() => OnClickChoiceButton(choice));
            
        }
    }

    Button CreateChoiceButton(string text)
    {
        // creates the button from a prefab
        var choiceButton = Instantiate(_choiceButtonPrefab);

        choiceButton.transform.SetParent(_choiceButtonContainer.transform, false);

        // sets text on the button
        var buttonText = choiceButton.GetComponentInChildren<UnityEngine.UI.Text>();
        buttonText.text = text;
      
        return choiceButton;
    }

    void OnClickChoiceButton(Ink.Runtime.Choice choice)
    {
        
        _story.ChooseChoiceIndex(choice.index);
        _story.Continue();
        RefreshChoiceView();
        DisplayNextLine();
        
    }

    // Destroys all the old content and choices.
    void RefreshChoiceView()
    {
        if (_choiceButtonContainer != null)
        {
            foreach (var button in _choiceButtonContainer.GetComponentsInChildren<Button>())
            {
                Destroy(button.gameObject);
            }
        }
    }

    private void Update()
    {

        if (Input.GetKey("escape"))
        {
            _gameStateManager.SaveGame();
            UnityEngine.SceneManagement.SceneManager.LoadScene("mainmenu");
        }
    }

    public static void LoadState(string state)
    {
        _loadedState = state;
    }

    public void OnDialogueOpen()
    {
        StartCoroutine(DisplayText());
        ApplyStyling();
    }

    public void OnDialogueFaster()
    {
        StartCoroutine(DisplayText());
    }

    public void OnDialogueClosed()
    {
        
        StopAllCoroutines();
        _textField.text = "";
    }

    private IEnumerator DisplayText()
    {
        _textField.text = "";
        string CurrentText = _story.Continue();

        //string originalText = CurrentText;
        string displayedText = "";
        int alphaIndex = 0;
        isTyping = true;

        foreach(char c in CurrentText.ToCharArray())
        {
            alphaIndex++;
            _textField.text += c;
            displayedText = _textField.text.Insert(alphaIndex, kAlphaCode);
            _textField.text = displayedText;
            CurrentText = CurrentText?.Trim(); // removes white space from text

            yield return new WaitForSecondsRealtime(0.01f);
        }
        isTyping = false;

        yield return null;
    }
}