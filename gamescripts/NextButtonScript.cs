using UnityEngine;
using UnityEngine.UI;

public class NextButtonScript : MonoBehaviour
{
    private InkManager _inkManager;
    private Button _button;

    void Start()
    {
        _inkManager = FindObjectOfType<InkManager>();

        if (_inkManager == null)
        {
            Debug.LogError("Ink Manager was not found!");
        }
    }



    public void OnClick()
    { 
        while (_inkManager.isTyping)
        {
            _button.enabled = false;
        }
            _inkManager?.DisplayNextLine();
    }

}
