classdef PhotoSession
    properties
        lh % listener handle
        Photo
    end
    methods
        function obj = PhotoSession(Camera)
            obj.lh = addlistener(Camera, 'PhotoCaptured', @PhotoSession.PhotoCapturedCallback);
        end
    end
    methods (Static)
        function PhotoCapturedCallback(Camera,Photo)
            FullPath = [pwd '\Photos\' char(Photo.FileName)];
            Camera.TransferFile(Photo.Handle, FullPath);
            winopen(FullPath);
            assignin('caller', 'LastPhoto', Photo);
        end
    end
end

