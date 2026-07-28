using System;
using System.Collections;
using System.Collections.Generic;
using MagicLeap.OpenXR.Features.LocalizationMaps;
using MagicLeap.OpenXR.Features.SpatialAnchors;
using MagicLeap.OpenXR.Subsystems;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.XR.ARFoundation;
using UnityEngine.XR.ARSubsystems;
using UnityEngine.XR.Management;
using UnityEngine.XR.OpenXR;
using UnityEngine.XR.OpenXR.NativeTypes;

public class SpatialAnchorsStorageExample : MonoBehaviour
{
    // Reference to the ARAnchorManager component, used for anchor creation and management.
    [SerializeField] private ARAnchorManager anchorManager;

    // The distance from the user to query the anchors.
    [SerializeField] private float queryRadius;

    // Reference to the XRController that will be used to position the Anchors
    [SerializeField] private Transform controllerTransform;

    // Input actions for capturing position, rotation, menu interaction, and the bumper press.
    [SerializeField] public InputAction menuInputAction =
        new(binding: "<XRController>/menuButton", expectedControlType: "Button");

    [SerializeField] public InputAction bumperInputAction =
        new(binding: "<XRController>/gripButton", expectedControlType: "Button");

    private MagicLeapSpatialAnchorsStorageFeature anchorStorageFeature;
    private MagicLeapLocalizationMapFeature mapFeature;

    // Active subsystem used for querying anchor confidence.
    private MLXrAnchorSubsystem activeSubsystem;

    // List of active anchors tracked by the script.
    private List<ARAnchor> activeAnchors = new();
   
    private readonly List<ARAnchor> activeAnchorsLocal = new();
    private readonly List<ARAnchor> activeAnchorsStored = new();
    private readonly List<ARAnchor> expiringAnchorsStored = new();

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

        AttachListeners();
            
        // Look for any existing anchors to load
        ReadAnchors(queryRadius);
    }

    // Checks if the Magic Leap Anchor Subsystem is loaded 
    private bool AreSubsystemsLoaded()
    {
        if (XRGeneralSettings.Instance == null || XRGeneralSettings.Instance.Manager == null ||
            XRGeneralSettings.Instance.Manager.activeLoader == null) return false;
        activeSubsystem =
            XRGeneralSettings.Instance.Manager.activeLoader.GetLoadedSubsystem<XRAnchorSubsystem>() as
                MLXrAnchorSubsystem;
        return activeSubsystem != null;
    }

    private void AttachListeners()
    {
        anchorStorageFeature = OpenXRSettings.Instance.GetFeature<MagicLeapSpatialAnchorsStorageFeature>();
        mapFeature = OpenXRSettings.Instance.GetFeature<MagicLeapLocalizationMapFeature>();
        mapFeature.EnableLocalizationEvents(true);

        // Anchors Created from a list of Map Location Ids from Querying Storage
        anchorStorageFeature.OnCreationCompleteFromStorage += OnAnchorCompletedCreationFromStorage;
        // Publishing a Local Anchor to Storage
        anchorStorageFeature.OnPublishComplete += OnAnchorPublishComplete;
        // Querying Storage for a list of publish Anchors
        anchorStorageFeature.OnQueryComplete += OnAnchorQueryComplete;
        // Deleting a published Anchor from Storage
        anchorStorageFeature.OnDeletedComplete += OnAnchorDeleteComplete;
        // Update a Published Anchor's Expiration time
        anchorStorageFeature.OnUpdateExpirationCompleted += OnAnchorExpireUpdateCompleted;
        
        anchorManager.anchorsChanged += OnAnchorsChanged;
    }

    // Cleanup of input actions when the GameObject is destroyed.
    void OnDestroy()
    {
        menuInputAction.Dispose();
        bumperInputAction.Dispose();
        
        anchorStorageFeature.OnCreationCompleteFromStorage -= OnAnchorCompletedCreationFromStorage;
        anchorStorageFeature.OnPublishComplete -= OnAnchorPublishComplete;
        anchorStorageFeature.OnQueryComplete -= OnAnchorQueryComplete;
        anchorStorageFeature.OnDeletedComplete -= OnAnchorDeleteComplete;
        anchorStorageFeature.OnUpdateExpirationCompleted -= OnAnchorExpireUpdateCompleted;
        
        anchorManager.anchorsChanged -= OnAnchorsChanged;
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
        StartCoroutine(CreateAnchor(newAnchorComponent));
    }

    // Callback for deleting the most recently added anchor when the menu button is pressed.
    private void OnMenu(InputAction.CallbackContext obj)
    {
        if (activeAnchorsStored.Count > 0)
        {
            anchorStorageFeature.DeleteStoredSpatialAnchors(new List<ARAnchor> { activeAnchorsStored[^1] });
        }
        else
        {
            Debug.Log("SpatialAnchorsStorageTest: No known Stored Anchors left to delete.");
        }
    }

    // Uses the anchor storage feature to persist the anchor
    private IEnumerator CreateAnchor(ARAnchor toPublish)
    {
        while (toPublish.trackingState != TrackingState.Tracking)
            yield return null;

        anchorStorageFeature.PublishSpatialAnchorsToStorage(new List<ARAnchor> {toPublish}, 0);            
    }

    // Looks for persisted anchors within a certain radius from the current controller position
    private void ReadAnchors(float radius = 1f)
    {
        anchorStorageFeature.QueryStoredSpatialAnchors(controllerTransform.transform.position, radius);
    }

    // Updates the expiration time on a persisted anchor
    private void UpdateAnchorExpiration(string anchorMapPositionID)
    {
        DateTimeOffset dto = new(DateTime.Now, TimeSpan.Zero);
        // Set to expire in 3 seconds
        ulong expireTime = (ulong)dto.ToUnixTimeSeconds() + 3u;

        anchorStorageFeature.UpdateExpirationForStoredSpatialAnchor(new List<string>{anchorMapPositionID}, expireTime);
    }

    // Uses the anchor storage feature to remove a persisted anchor
    private void DeleteAnchor(string anchorMapPositionID)
    {
        anchorStorageFeature.DeleteStoredSpatialAnchors(new List<string>{anchorMapPositionID});
    }


    #region persistence callbacks

    // All the anchor storage features are asynchronous and have callbacks for when the call is complete
    private void OnAnchorPublishComplete(ulong anchorId, string anchorMapPositionId)
    {
        Pose newAnchorPose = activeSubsystem.GetAnchorPoseFromId(anchorId);

        Debug.Log($"SpatialAnchorsStorageTest: Anchor Publish Complete hit for location: {newAnchorPose.ToString()}");
    }

    // This is where all persisted anchors found during a query will be returned.
    private void OnAnchorQueryComplete(List<string> anchorMapPositionIds)
    {
        // Remove Expired Anchors
        List<ARAnchor> ExpireCompleted = new List<ARAnchor>();
        // Find Anchors already known to Subsystem
        List<string> alreadyCreated = new List<string>();

        foreach (ARAnchor anchor in expiringAnchorsStored)
        {
            string anchorMapPositionId = activeSubsystem.GetAnchorMapPositionId(anchor);
            if (!anchorMapPositionIds.Contains(anchorMapPositionId))
            {
                ExpireCompleted.Add(anchor);
            }

            alreadyCreated.Add(anchorMapPositionId);
        }

        foreach (ARAnchor anchor in ExpireCompleted)
        {
            expiringAnchorsStored.Remove(anchor);
            Destroy(anchor.gameObject);
        }

        foreach (var storedAnchor in activeAnchorsStored)
        {
            string anchorMapPositionId = activeSubsystem.GetAnchorMapPositionId(storedAnchor);
            if (anchorMapPositionIds.Contains(anchorMapPositionId))
            {
                alreadyCreated.Add(anchorMapPositionId);
            }
        }

        // Create New Anchors
        List<string> createStoredAnchors = new List<string>();

        foreach (string storedAnchor in anchorMapPositionIds)
        {
            TrackableId subsystemId = activeSubsystem.GetTrackableIdFromMapPositionId(storedAnchor);
            ARAnchor foundAnchor = anchorManager.GetAnchor(subsystemId);
            if (!alreadyCreated.Contains(storedAnchor) && foundAnchor == null)
            {
                createStoredAnchors.Add(storedAnchor);
            }
        }

        if (createStoredAnchors.Count > 0)
        {
            bool result = anchorStorageFeature.CreateSpatialAnchorsFromStorage(createStoredAnchors);

            if (!result)
            {
                Debug.LogError("SpatialAnchorsStorageTest: Error creating Anchors from storage Id.");
            }
        }
    }

    // This is where anchors found by a query, that were not already in the scene, and were subsequently created from 
    // storage are instantiated into the unity scene.
    private void OnAnchorCompletedCreationFromStorage(Pose pose, ulong anchorId, string anchorMapPositionId,
        XrResult result)
    {
        Debug.Log($"SpatialAnchorsStorageTest: Anchor Creation from Storage Complete hit for location: {pose.ToString()} With result: {result.ToString()}");

    }

    // This is where a confirmation of deletion will happen and the current scene representation of the anchor
    // can be removed
    private void OnAnchorDeleteComplete(List<string> anchorMapPositionIds)
    {
        Debug.Log($"SpatialAnchorsStorageTest: Anchor Delete Complete hit with {anchorMapPositionIds.Count} results.");
    }
    
    // This callback lets you know which anchors were updated
    private void OnAnchorExpireUpdateCompleted(List<string> anchorMapPositionIds)
    {
        Debug.Log("Anchor Update Complete hit with " + anchorMapPositionIds.Count + " results.");
    }

    private void OnAnchorsChanged(ARAnchorsChangedEventArgs anchorsChanged)
    {
        // Check for newly added Stored Anchors this Script may not yet know about.
        foreach (ARAnchor anchor in anchorsChanged.added)
        {
            if (activeSubsystem.IsStoredAnchor(anchor))
            {
                activeAnchorsStored.Add(anchor);
            }
        }

        // Check for Local Anchors that were published to update the visuals.
        foreach (ARAnchor anchor in anchorsChanged.updated)
        {
            if (activeSubsystem.IsStoredAnchor(anchor) && activeAnchorsLocal.Contains(anchor))
            {
                activeAnchorsStored.Add(anchor);
                activeAnchorsLocal.Remove(anchor);
            }
        }

        // Check if we are still tracking a deleted anchor.
        foreach (ARAnchor anchor in anchorsChanged.removed)
        {
            if (activeAnchorsStored.Contains(anchor))
            {
                activeAnchorsStored.Remove(anchor);
            }
        }
    }
    #endregion
}