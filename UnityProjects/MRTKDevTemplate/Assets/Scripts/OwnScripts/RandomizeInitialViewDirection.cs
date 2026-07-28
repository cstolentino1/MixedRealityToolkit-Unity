using UnityEngine;

public class RandomizeInitialViewDirection : MonoBehaviour
{
    public Transform cameraOffset; // Assign this in the inspector or find it dynamically

    void Start()
    {
        if (cameraOffset == null)
        {
            Debug.LogError("Camera Offset is not assigned!");
            return;
        }

        // Random Y rotation
        float randomY = Random.Range(0f, 360f);

        // Apply rotation around Y only
        cameraOffset.localRotation = Quaternion.Euler(0f, randomY, 0f);
    }
}
