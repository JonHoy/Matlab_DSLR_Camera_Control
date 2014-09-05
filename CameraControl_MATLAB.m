% MATLAB .NET API for Digital SLR Cameras

% Step 1: Add in the API
DSLR_Namespace = NET.addAssembly([pwd '\CameraControl.Devices.dll']);
% Step 2: Open up an instance of the DeviceManager Class
DeviceManager = CameraControl.Devices.CameraDeviceManager; 
% Step 3: Connect to All Available Cameras
DeviceManager.ConnectToCamera();
% Step 4: Grab the First Available Camera
myCamera = DeviceManager.ConnectedDevices.Item(0);
% Step 5: Start Taking Photographs
FrameCount = 10;
for iFrame = 1:FrameCount
    myCamera.CapturePhoto();
    pause(2);
end




