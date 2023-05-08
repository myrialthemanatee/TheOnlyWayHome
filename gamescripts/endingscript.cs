using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class endingscript : MonoBehaviour
{
    public void OnClick()
    {
        UnityEngine.SceneManagement.SceneManager.LoadScene("mainmenu");
    }
}
