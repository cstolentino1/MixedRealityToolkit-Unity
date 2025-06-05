using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.SceneManagement;
public class PoseLogger : MonoBehaviour
{
    public Transform xrCamera; // Assign XR Camera (Main Camera)
    private List<string> buffer = new List<string>();
    private string filePath;

    void OnEnable()
    {
        string fileName = System.DateTime.Now.ToString("yyyyMMdd_HHmmss") + SceneManager.GetActiveScene().name + "_UserPoseLog_" + ".csv";
        filePath = Path.Combine(Application.persistentDataPath, fileName);

        // Add CSV header
        buffer.Add("Time,PosX,PosY,PosZ,RotX,RotY,RotZ");

        Debug.Log("Logging to CSV file on exit:\n" + filePath);
    }

    void Update()
    {
        if (xrCamera == null) return;

        Vector3 pos = xrCamera.position;
        Quaternion rot = xrCamera.rotation;
        Vector3 euler = rot.eulerAngles;


        string line = string.Format("{0:F3},{1:F4},{2:F4},{3:F4},{4:F4},{5:F4},{6:F4}",
            Time.time, pos.x, pos.y, pos.z, euler.x, euler.y, euler.z);

        buffer.Add(line);

        }

    void OnDisable()
    {
        File.WriteAllLines(filePath, buffer);
    }
}
