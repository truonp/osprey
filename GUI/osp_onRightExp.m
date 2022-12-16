function osp_onRightExp( ~, ~ ,gui)
%% osp_onRightX
%   Callback function on process click on left x voxel direction button.
%
%
%   USAGE:
%       osp_onRightX( ~, ~ ,gui);
%
%   INPUT:      gui      = gui class containing all handles and the MRSCont 
%
%   OUTPUT:     Changes in gui parameters and MRSCont are written into the
%               gui class
%
%
%   AUTHORS:
%       Dr. Helge Zoellner (Johns Hopkins University, 2020-01-16)
%       hzoelln2@jhmi.edu
%
%   CREDITS:
%       This code is based on numerous functions from the FID-A toolbox by
%       Dr. Jamie Near (McGill University)
%       https://github.com/CIC-methods/FID-A
%       Simpson et al., Magn Reson Med 77:23-33 (2017)
%
%   HISTORY:
%       2021-01-21: First version of the code.
%%% 1. INITIALIZE %%%
    MRSCont = getappdata(gui.figure,'MRSCont');  % Get MRSCont from hidden container in gui class 
    selectedTab = get(gui.layout.tabs, 'Selection');

    % User wants to process the data
%%% 2. UPDATEWINDOW %%%    

    if gui.controls.act_Exp < gui.info.nExperiments
        gui.controls.act_Exp = gui.controls.act_Exp + 1;
        set(gui.controls.text_act_Exp,'String',num2str(gui.controls.act_Exp));
        switch selectedTab %Which tab?
            case 1 %Load tab?
                osp_updateLoadWindow(gui);
            case 2 %Process tab?
%                 gui.InfoText.pro = gui.layout.(gui.layout.proTabhandles{gui.process.Selected});
                % Grid for Plot and Data control sliders
                gui.Plot.pro = gui.layout.(gui.layout.proTabhandles{gui.process.Selected});
                osp_updateProWindow(gui);
            case 3 %Fit tab?
                osp_updateFitWindow(gui);
            case 4 %Coreg tab?
                osp_updateCoregWindow(gui);
            case 5 %Quantify tab?
                osp_updateQuantifyWindow(gui);
            case 6 %Overview tab?
            selectedOvTab = get(gui.layout.overviewTab,'Selection');
            switch selectedOvTab % Wihich overview tab?
                case 1 %Iindiv spec
                    osp_updateSpecsOvWindow(gui);
                case 2 %Mean spec
                    osp_updatemeanOvWindow(gui);
                case 3 %Quant table
                    osp_updatequantOvWindow(gui); 
                case 4 %Raincloud
                    osp_updatedistrOvWindow(gui); 
                case 5 %Correlation
                    osp_updatecorrOvWindow(gui); 
            end
        end
    end
end % osp_onRightX