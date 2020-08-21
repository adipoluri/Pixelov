using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using UnityEngine.SceneManagement;

public class LoadingScreen : MonoBehaviour
{
    
    private string map;
    public TMP_Text timer;
    private int i = 0;
    private int counter = 50;
    private int milliseconds = 0;
    private int seconds = 15;
    private int loadTime = 750;

    // Update is called once per frame
    void FixedUpdate() {
        if(counter == 50) {
            seconds--;
            counter = 0;
            milliseconds = 60;
        }
        if (i > loadTime) {
            timer.text = "00:00:00";
            if (i > 850) {
                SceneManager.LoadScene(map);
            }
        } else {
            if(seconds >= 10) {
                timer.text = "00:" + seconds.ToString() + ":" + milliseconds.ToString();
            } else {
                timer.text = "00:0" + seconds.ToString() + ":" + milliseconds.ToString();
            }
        }
        i++;
        counter++;
        milliseconds--;  
    }

    public void setDestination(string str) {
        this.map = str;
    }
}
