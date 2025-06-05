using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;

public class SceneSwitcher : MonoBehaviour
{
    private float delayTime = 1.5f;     // Transition to next scene after delay
    public void LoadNextScene()
    {
        StartCoroutine(LoadSceneWithDelay(delayTime));
    }

    IEnumerator LoadSceneWithDelay(float delay)
    {
        // Wait for the specified delay
        yield return new WaitForSeconds(delay);

        // Start next scene
        SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex + 1);
    }
}
