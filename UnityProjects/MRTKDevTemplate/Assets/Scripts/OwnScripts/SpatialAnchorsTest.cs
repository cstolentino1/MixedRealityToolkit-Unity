using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.XR.ARFoundation;
using UnityEngine.XR.ARSubsystems;
using UnityEngine.XR.Management;
using MagicLeap.OpenXR.Subsystems;

public class SpatialAnchorsTest : MonoBehaviour
{
    // Reference to the ARAnchorManager component, used for anchor creation and management.
    [SerializeField]
    private ARAnchorManager anchorManager;

    // Reference to the XRController that will be used to position the Anchors
    [SerializeField]
    private Transform controllerTransform;

    // Input actions for capturing position, rotation, menu interaction, and the bumper press.
    [SerializeField]
    public InputAction menuInputAction = new InputAction(binding: "<XRController>/menuButton", expectedControlType: "Button");
    [SerializeField]
    public InputAction bumperInputAction = new InputAction(binding: "<XRController>/gripButton", expectedControlType: "Button");

    // Active subsystem used for querying anchor confidence.
    private MLXrAnchorSubsystem activeSubsystem;

    // List of active anchors tracked by the script.
    private List<ARAnchor> activeAnchors = new List<ARAnchor>();

    // Coroutine started on MonoBehaviour Start to ensure subsystems are loaded before enabling input actions.
    private IEnumerator Start()
    {
        // Waits until AR subsystems are loaded before proceeding.
        yield return new WaitUntil(AreSubsystemsLoaded);

        // Enabling input actions.
        menuInputAction.Enable();
        bumperInputAction.Enable();

        // Registering input action callbacks.
        menuInputAction.performed += OnMenu;
        bumperInputAction.performed += OnBumper;
    }

    // Cleanup of input actions when the GameObject is destroyed.
    void OnDestroy()
    {
        menuInputAction.Dispose();
        bumperInputAction.Dispose();
    }

    // Update loop to log the status of active anchors every frame.
    void Update()
    {
        string anchorsStatusText = "Anchor Position | Tracking State | Confidence";

        // Iterating through active anchors to log their position, tracking state, and confidence.
        foreach (ARAnchor anchor in activeAnchors)
        {
            MLXrAnchorSubsystem.AnchorConfidence anchorCon = MLXrAnchorSubsystem.AnchorConfidence.NotFound;
            if (anchor.trackingState == TrackingState.Tracking && activeSubsystem != null)
            {
                anchorCon = activeSubsystem.GetAnchorConfidence(anchor);
            }
            anchorsStatusText += $"{anchor.gameObject.transform.position} - {anchor.trackingState} - {anchorCon}\n";
        }

        // Only log the status of anchors if there is at least 1 active anchor.
        if (activeAnchors.Count > 0)
        {
            Debug.Log(anchorsStatusText);
        }
    }

    // Checks if the Magic Leap Anchor Subsystem is loaded 
    private bool AreSubsystemsLoaded()
    {
        if (XRGeneralSettings.Instance == null || XRGeneralSettings.Instance.Manager == null || XRGeneralSettings.Instance.Manager.activeLoader == null) return false;
        activeSubsystem = XRGeneralSettings.Instance.Manager.activeLoader.GetLoadedSubsystem<XRAnchorSubsystem>() as MLXrAnchorSubsystem;
        return activeSubsystem != null;
    }

    // Callback for creating a new anchor when the bumper button is pressed.
    private void OnBumper(InputAction.CallbackContext obj)
    {
        // Reading the current position and rotation from the input actions.
        Pose currentPose = new Pose(controllerTransform.position, controllerTransform.rotation);

        Debug.Log("SpatialAnchorsTest: Bumper hit, creating Anchor at " + currentPose);

        // Instantiating a new anchor at the current pose and adding it to the list of active anchors.
        GameObject newAnchor = Instantiate(anchorManager.anchorPrefab, currentPose.position, currentPose.rotation);
        ARAnchor newAnchorComponent = newAnchor.AddComponent<ARAnchor>();
        activeAnchors.Add(newAnchorComponent);
    }

    // Callback for deleting the most recently added anchor when the menu button is pressed.
    private void OnMenu(InputAction.CallbackContext obj)
    {
        if (activeAnchors.Count > 0)
        {
            Debug.Log("SpatialAnchorsTest: Menu hit, Deleting Anchor at " + activeAnchors[activeAnchors.Count - 1].transform.position);

            // Removing the last anchor from the scene and the list of active anchors.
            Destroy(activeAnchors[activeAnchors.Count - 1].gameObject);
            activeAnchors.RemoveAt(activeAnchors.Count - 1);
        }
    }
}