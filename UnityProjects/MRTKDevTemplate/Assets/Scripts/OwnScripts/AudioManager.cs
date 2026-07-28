using UnityEngine;

public class AudioManager : MonoBehaviour
{
    private AudioSource[] audioSources;     // Audio sources in the scene

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        // Find all active AudioSource components in the scene
        audioSources = FindObjectsByType<AudioSource>(FindObjectsSortMode.None);
    }
    public void PlayMusic()
    {
        // Play all audio sources
        foreach (AudioSource source in audioSources)
        {
            if (!source.isPlaying)
                source.Play();
        }
    }

    public void PauseMusic()
    {
        // Pause all audio sources
        foreach (AudioSource source in audioSources)
        {
            if (source.isPlaying)
                source.Pause();
        }
    }
    public void StopMusic()
    {
        // Stop all audio sources
        foreach (AudioSource source in audioSources)
        {
            source.Stop();
        }
    }
}
