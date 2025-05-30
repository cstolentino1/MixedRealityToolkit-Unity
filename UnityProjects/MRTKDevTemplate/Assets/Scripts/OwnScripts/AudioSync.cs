using UnityEngine;
using System.Collections;

public class AudioSync : MonoBehaviour
{
    private AudioSource[] audioSources; // Audio sources in the scene
    private float startAfter = 2.0f;    // Start sources after x seconds

    void Start()
    {
        // Find all active AudioSource components in the scene
        audioSources = FindObjectsOfType<AudioSource>();

        // Start coroutine to delay playback
        StartCoroutine(StartAllAudioAfterDelay(startAfter));

    }

    IEnumerator StartAllAudioAfterDelay(float delay)
    {
        // Wait for the specified delay
        yield return new WaitForSeconds(delay);

        // Start all AudioSources
        foreach (AudioSource source in audioSources)
        {
            source.Play();
        }
    }
}
