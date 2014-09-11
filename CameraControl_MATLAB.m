% MATLAB .NET API for Digital SLR Cameras

% Step 1: Add in the API
DSLR_Namespace = NET.addAssembly([pwd '\CameraControl.Devices.dll']);
% Step 2: Open up an instance of the DeviceManager Class
DeviceManager = CameraControl.Devices.CameraDeviceManager; 
% Step 3: Connect to Available Cameras
DeviceManager.ConnectToCamera();
% Step 4: Grab the First Available Camera
myCamera = DeviceManager.ConnectedDevices.Item(0);
% Step 5: Add Listener Class for the photo captured event so that we can update
myPhotoSession = PhotoSession(myCamera);

% Step 6: Start Taking Photographs (Call this in a loop or when a certain
% condition is reached)

FrameCount = 5; % Number of pictures to take

for iFrame = 1:FrameCount
    myCamera.CapturePhoto();
    pause(3); % Give the program time to take the photograph and copy over the data
    Data.(['Frame' int2str(iFrame)]) = imread([pwd '\Photos\' char(LastPhoto.FileName)]); % Grab the data from the jpg photograph
    pause(2); 
end

